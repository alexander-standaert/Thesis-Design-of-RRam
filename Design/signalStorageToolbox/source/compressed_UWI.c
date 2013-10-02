/*****************************************************************
 *  main file for spectre/ultrasim compressed UWI plugin 
 *  ( COA, COD, COF, COH )
 *
 *  Author: Stefan Cosemans ( stefan.cosemans@gmail.com )
 *  last modified: 2010-07-14
 *
 ******************************************************************/


#include <stdio.h>
#include <sys/stat.h>
#include <string.h>
#include <stdlib.h>
#include "uwi.h"

#include "ieeehalfprecision.c"

#include <cmath>
#include <vector>
#include <string>

#include <iostream>

#include "ticToc.cpp"
#include "Header.cpp"

using namespace std;

#define PRINT_NO_HEADER         0
#define PRINT_PLAIN_HEADER      1
#define PRINT_COMPRESSED_HEADER 2

#define FORMAT_COA 1
#define FORMAT_COD 2
#define FORMAT_COF 3
#define FORMAT_COH 4

int debugUWI=0;

// all vectors over signals are indixed with simulatorIndices (starts at 0).
// This means that it is possible that there are duplicate signals
// signals will be written in the order indicated by header
//   this order skips the duplicates
typedef struct wfFormat
{
	int dummy;
  FILE* fp;			                  /* Defines output stream                 */
  string netlistName;
  string outputHeaderName;
//	vector<string> sigNames; 	      /* Stores the name of the signals        */
//	vector<string> sigUnits; 	      /* Stores the units of the signals        */
  Header header;                  /* handles names and units of the signals */
	vector<double> xValues;         /* Stores X-values */
  vector<vector<double> > signalsY; /* Stores the signals' yValues    */
  vector<vector<unsigned long> > signalsX; /* Stores the signals' xValues (index in xValues)   */
	
  vector<double> storedX;         /* Stores X-values (0 if nothing stored)*/
  vector<double> storedY;         /* Stores Y-values (0 if nothing stored)*/
  bool headerAlreadySaved;
  int printHeader;                /* one of PRINT_..._HEADER */
  int fileformat;                 /* one of FORMAT_... */
  string outputMap;               /* folder in which to safe output files */
  string formatName;
  string filePostfix;             
  double vstep ;
  double istep ;
  double tstep ;
} wfFormat;

//struct wfFormat format;  /* Creates static instance of struct to store */
struct wfFormat format;  /* Creates static instance of struct to store */


// addPoint: if change with previous value is large enough: add to signal
static void addPoint( unsigned long index, double time, double val );
static int yThresholdExceeded( unsigned long index, double val );
static int xThresholdExceeded( unsigned long index );
static unsigned long retrieveTimeIndex( double time );

//extern void writeTime( FILE* fp, double time );
//extern void writePoint( FILE* fp, double val );
static void initializeUWI();

static void writeHeader();
static void writeAll();
static void writeTime( double time );
static void writeNewline( );
static void writeValue( double val );
static void writeIndex( unsigned long index );
static void writeTimeIndex( bool use4ByteTimeIndex, unsigned long timeIndex );


//char formatName[100] = "COA";
//char filePostfix[100] = "COA";





// ------------------------------------ OPEN {{{1
uwi_StreamHandle openSAF(const struct uwi_Setup* setup)
{
  if( debugUWI ) { 
    cout << "open UWI" << std::endl;     
    cout << "netlistName (should be empty): " << format.netlistName << endl; 
  }

  format.headerAlreadySaved=false;

	format.fp         = NULL;
  format.netlistName = "";
  format.netlistName.append( setup->fileName );

  //create output directory ...  TODO: use default access rights
  mkdir( format.outputMap.c_str(), S_IRWXU );

	/* create a unique file name depending upon the analysis type */			
  string namex = format.outputMap; //  "UWI/";
	namex.append( format.netlistName );
  if(setup->analysis == UWI_DC) {
		namex.append( "_DC." );
  }	else if(setup->analysis == UWI_TRAN) {
		namex.append( "." );
  }	else if(setup->analysis == UWI_NOISE) {
		namex.append( "_NOISE." );
  }	else if(setup->analysis == UWI_AC) {
		namex.append( "_AC." );
  }

  format.outputHeaderName="";
  format.outputHeaderName.append( namex );
  format.outputHeaderName.append( "HDR" );
	namex.append( format.filePostfix );
	
  format.fp = fopen( namex.c_str(), "w+b");

  //consecutive simulations don't reinitialise these structures ...
  format.signalsY.clear();
  format.signalsX.clear();
  //format.header = new Header();
  format.header.clear();


  if( debugUWI ) { 
    std::cout << "done open SAF" << std::endl;      
  }

	return format.fp;
}
// ------------------------------------ OPEN }}}1

// --------------------- define waveform {{{1
uwi_WfHandle defineWfSAF(uwi_StreamHandle strHandle, const struct 
												uwi_WfDefinition* wfDef) {

  int simulatorIndex = format.signalsY.size(); 
  
  if( debugUWI ) { // {{{2 
    std::cout << "define WF "<< simulatorIndex << " '" << wfDef->wfName << "'" << std::endl;
  } // }}}2

  if( format.headerAlreadySaved )  { // {{{2
    std::cout << "ERROR: header already saved when adding '" << wfDef->wfName << "'" << std::endl;     
    format.headerAlreadySaved = false;  
    // write it again, but this should never happen ... 
  } // }}}2

  // construct the full name {{{2
  int i=0;
  string fullName="";
  if( wfDef->scopeName!=NULL ) {
    while( wfDef->scopeName[i]!=NULL ) {
      if( i!=0 ) {
        fullName.append( "." );
      }
      fullName.append( wfDef->scopeName[i] );
      i=i+1;
    }
  }

  string units = wfDef->units;
  if( i>0 ) {
    if( units.compare( "A" )==0 ) {
      fullName.append( ":" );
    } else if( units.compare("V")==0 ) {
      fullName.append( "." );
    } 
  }
  fullName.append( wfDef->wfName );
  
  if( debugUWI ) { // {{{3 
    std::cout << "fullname: '" << fullName << "'" << std::endl;     
    std::cout << "units: '" << units << "'" << std::endl;     
  } // }}}3
  // }}}2

  // store new signal  {{{2
  string name = fullName;
  format.header.addSignal( simulatorIndex, fullName, units );

  vector<double> s;
  vector<unsigned long> sl;
  format.signalsY.push_back( s );
  format.signalsX.push_back( sl );
  format.storedX.push_back( 0 );
  format.storedY.push_back( 0 );
  // }}}2

  if( debugUWI ) { // {{{2 
    cout << "defineWfSAF done" << endl;      
  } // }}}2

	/* Return the index as Waveform Handle */
	return (uwi_WfHandle) (simulatorIndex+1); 
  //WARNING: for ultrasim, you are not allowed to return 0 !!!
}
// --------------------- define waveform }}}1

// -------------------------------- flush {{{1
int flushSAF(uwi_StreamHandle stream)
{
  if( debugUWI ) {
    cout << endl << " ------- compressed UWI output ignores flushes " << endl;
  }
  return 0;
}
// -------------------------------- flush }}}1

// ------------------------------- close {{{1
int closeSAF(uwi_StreamHandle stream) {
  if( debugUWI ) { cout << "closeSAF" << endl; }

  writeAll();
  fclose( format.fp );

  // clear all data
  for( unsigned long si=0 ; si<format.signalsY.size(); si++ ) {
    format.signalsY.at(si).clear();
    format.signalsX.at(si).clear();
  }
  format.xValues.clear();
  format.signalsY.clear();
  format.signalsX.clear();
  format.header.clear();
  //delete format.header;
  
  if( debugUWI ) { cout << "closeSAF done" << endl; }

	return 0;
}
// ------------------------------- close }}}1

// ------------------------------- add digital point {{{1
int addDWfPointSAF(uwi_StreamHandle stream, uwi_WfHandle wfHandle, 
												enum uwi_Logic val, double t)
{
  cout << "WARNING: digital data not yet supported" << t << endl;
  return 0;
}
// ------------------------------- add digital point }}}1

// ------------------------------- add analog (=normal) point {{{1
int addAWfPointSAF(uwi_StreamHandle stream, uwi_WfHandle wfHandle, double val, double t) {
  
  unsigned long simulatorIndex = ( (unsigned long)(wfHandle) - 1);
  

  if( debugUWI ) { // {{{2
    cout << "about to add point to signal '" 
         << format.header.getSignalNameForSimulatorIndex( simulatorIndex ) 
         << "' : (" << t << ", " << val << ")" << endl;    
  } // }}}2

  // save header if this has not yet been done {{{2
  if( ! format.headerAlreadySaved ) {
    writeHeader();
  } // }}}2

  // add point (if it exceeds threshold {{{2
  if( format.signalsY.at( simulatorIndex ).size()==0 ) {
    addPoint( simulatorIndex, t, val );
  } else if( yThresholdExceeded( simulatorIndex, val ) ) {

    // first check whether the previously stored point should also be kept
    if( xThresholdExceeded( simulatorIndex ) ) {
      double xStored= format.storedX.at( simulatorIndex );
      double yStored= format.storedY.at( simulatorIndex );
      // add previous point
      addPoint( simulatorIndex, xStored, yStored );
      // add new point
      addPoint( simulatorIndex, t, val );    
      // no running point left
      format.storedX.at( simulatorIndex )=0;
      format.storedY.at( simulatorIndex )=0;
    } else {
      // add new point
      addPoint( simulatorIndex, t, val );    
      // no running point left
      format.storedX.at( simulatorIndex )=0;
      format.storedY.at( simulatorIndex )=0;
    }
  } else {
    //reservate a time simulatorIndex in case we need it later on..
//    unsigned long dummyIndex = 
    retrieveTimeIndex(t); 
    format.storedX.at( simulatorIndex )=t;
    format.storedY.at( simulatorIndex )=val;
  } // }}}2

  if( debugUWI ) { // {{{2
    cout << "added point to signal '" 
         << format.header.getSignalNameForSimulatorIndex( simulatorIndex )
         << "' : (" << t << ", " << val << ")" << endl;    
  } // }}}2
	return 0;
}
// ------------------------------- add analog (=normal) point }}}1




/* Finally register all the functions defined above with uwi_register() API */
extern "C" {

struct uwi_WfIntDef wfIntDef;

// -------------------------------------- register all UWI functions {{{1
extern struct uwi_WfIntDef* uwi_register()
{

  if( debugUWI ) { cout << "uwi_register" << endl; }
  
  initializeUWI(); 

	/* Assigns all the user defined functions to the members of the waveform *
	 * interface object */
	wfIntDef.open        = openSAF;
	wfIntDef.defineWf    = defineWfSAF;
  //wfIntDef.addDWfPoint = addDWf
	wfIntDef.addDWfPoint = NULL;
	wfIntDef.addAWfPoint = addAWfPointSAF;
	wfIntDef.flush       = flushSAF;
	wfIntDef.close       = closeSAF;
	wfIntDef.getErrMsg   = NULL;
	wfIntDef.resetXCoord = NULL;

	// the format is set in initializeUWI
  // the user needs specify the same format in the 
	//  - netlist (for ultrasim) 
  //  - the command-line command (spectre)
  int L = format.formatName.size();
  char *name = new char[ L+1 ];
  memset( name, '\0', L+1 );
	format.formatName.copy( name, L );
  wfIntDef.format = name;


  std::cout << "registered registration " << wfIntDef.format << std::endl;

  if( debugUWI ) {
    std::cout << "done with UWI registration" << std::endl;      
  }

  if( debugUWI ) { cout << "uwi_register done" << endl; }
	return &wfIntDef;
	//return wfIntDef;
}
// -------------------------------------- register all UWI functions }}}1

}


/* initializeUWI() -- process environment variables {{{1
 *
 */
static void initializeUWI( ) {
  std::cout << "====== starting compressed UWI output" << std::endl;     

  const char* vstepString = getenv( "UWI_VSTEP" );
  const char* istepString = getenv( "UWI_ISTEP" );
  const char* tstepString = getenv( "UWI_TSTEP" );
  const char* headerString = getenv( "UWI_HEADER" );
  const char* formatString = getenv( "UWI_FORMAT" );
  const char* outputMapString = getenv( "UWI_OUTPUT_MAP" );

  if( vstepString==NULL ) {
    cout << "WARNING: UWI_VSTEP not set, using default 10mV" << endl;
    format.vstep = 0.01;
  } else {
    format.vstep=strtod(vstepString, NULL );
    cout << "         UWI_VSTEP set to " << format.vstep << "V" << endl;
  }

  if( istepString==NULL ) {
    cout << "WARNING: UWI_ISTEP not set, using default 10uA" << endl;
    format.istep = 10e-6;
  } else {
    format.istep=strtod(istepString, NULL );
    cout << "         UWI_ISTEP set to " << format.istep << "A" <<endl;
  }
  
  if( tstepString==NULL ) {
    cout << "WARNING: UWI_TSTEP not set, using default 1ps" << endl;
    format.tstep = 1e-12;
  } else {
    format.tstep=strtod(tstepString, NULL );
    cout << "         UWI_TSTEP set to " << format.tstep << "s" <<endl;
  }
  
  if( headerString==NULL ) {
    cout << "WARNING: UWI_HEADER not set, using default 'H'" << endl;
    format.printHeader=PRINT_PLAIN_HEADER;
  } else if( strcmp( headerString, "H" )==0 ) {
      cout << "plain header will be written" << endl;
      format.printHeader=PRINT_PLAIN_HEADER;
  } else if( strcmp(  headerString, "NH" )==0 ) {
      cout << "header will not be written" << endl;
      format.printHeader=PRINT_NO_HEADER;
  } else if( strcmp(  headerString, "CH" )==0 ) {
      cout << "compressed header will be written" << endl;
      format.printHeader=PRINT_COMPRESSED_HEADER;
  } else {
      cout << "WARNING: unsupported value for UWI_HEADER (" << headerString <<
              "), use 'H', 'CH' or 'NH' - writing default 'H'" << endl;
      format.printHeader=PRINT_PLAIN_HEADER;
  }
  
  if( formatString==NULL ) {
    cout << "WARNING: UWI_FORMAT not set, using default 'COA'" << endl;
    formatString="COA";
    format.fileformat = FORMAT_COA;
  } else if( strcmp( formatString, "COA" )==0 ) {
    cout << "         using 'COA' format" << endl;
    format.fileformat = FORMAT_COA;
  } else if( strcmp( formatString, "COD" )==0 ) {
    cout << "         using 'COD' format" << endl;
    format.fileformat = FORMAT_COD;
  } else if( strcmp( formatString, "COF" )==0 ) {
    cout << "         using 'COF' format" << endl;
    format.fileformat = FORMAT_COF;
  } else if( strcmp( formatString, "COH" )==0 ) {
    cout << "         using 'COH' format" << endl;
    format.fileformat = FORMAT_COH;
  } else {
    cout << "WARNING: UWI_FORMAT (" << formatString << 
            ")unknown, using default 'COA'" << endl;
    formatString="COA";
    format.fileformat = FORMAT_COA;
  }
  format.formatName = formatString;
  format.filePostfix = formatString;

  if( outputMapString==NULL ) {
    cout << "UWI_OUTPUT_MAP not set, using default 'UWI/'" << endl;
    format.outputMap = "UWI/";
  } else {
    format.outputMap = outputMapString;
  }
  cout << "using UWI_OUTPUT_MAP = '" << format.outputMap.c_str() << endl;

}
// initializeUWI }}}1


static int yThresholdExceeded( unsigned long simulatorIndex, double val ) { // {{{1
    
  //cout <<"yThreshold enter" << endl;

  unsigned long s = format.signalsY.at( simulatorIndex ).size();
  double prevValue = format.signalsY.at( simulatorIndex ).at( s-1 );
//  unsigned long prevTimeIndex=  format.signalsX.at( index ).at( s-1 );

//  double prevTime = format.xValues.at( prevTimeIndex );

  double DY = fabs( val-prevValue );
//  double DX = fabs( time-prevTime );

  string unit = format.header.getSignalUnitForSimulatorIndex( simulatorIndex );
  if( unit.compare("A" )==0 ) {
      return (DY>=format.istep); 
  } else if ( unit.compare("V" )==0 ) {
      return (DY>=format.vstep); 
  } else if ( unit.compare("" )==0 ) {
    //cout << "empty unit '" << unit << "'"  << endl;
    return 0;
  } else {          
    cout << "unknown unit '" << unit << "'"  << endl;
    return 1;
  }
  
} // }}}1

static int xThresholdExceeded( unsigned long simulatorIndex ) { // {{{1
    double xStored= format.storedX.at( simulatorIndex );
    if( xStored==0 ) {
      return 0;
    }
    //double yStored= format.storeY.at( index-1 );
    unsigned long s = format.signalsX.at( simulatorIndex ).size();
    double xPrev = format.signalsX.at( simulatorIndex ).at( s-1 ); 

    double DX = xStored-xPrev;
    //cout << "DX = " << DX << " ( " << xStored << "-" << xPrev << endl;
    return (DX>=format.tstep); 
} // }}}1

static void addPoint( unsigned long simulatorIndex, double time, double val ) { // {{{1
  unsigned long ti = retrieveTimeIndex( time );
  format.signalsY.at( simulatorIndex ).push_back( val );
  format.signalsX.at( simulatorIndex ).push_back( ti );
} // }}}1

static unsigned long retrieveTimeIndex( double time ) { // {{{1
// if time is already in the xValues vector: return that index
// otherwise: add it to the xValues vector and return that index
// for now: we assume that requests to this function are strictly monotonous...
  //cout << "retreiveTimeIndex enter" << endl;
  unsigned long s = format.xValues.size();
  if( s>0 ) {
    double lastTime = format.xValues.at( s-1 );
    if( lastTime==time ) {
      return s-1;
    } else if( time<lastTime ) {
      for( long i=s-1 ; i>=0 ; i-- ) {
        double thatTime = format.xValues.at( i );
        if( thatTime==time ) {
          return i;
        }
      }      
      cout << "WARNING: in compressed UWI output: time is not monotonous!" << endl;   
    }
  }
  format.xValues.push_back( time );
  return s;
} // }}}1

static void writeHeader() { // {{{1
      
  cout << "enter writeHeader" << endl;
  //unsigned long NW = format.sigNames.size();

  string title = "output for simulation '";
  title.append( format.netlistName );
  title.append("'");

  if( format.printHeader==PRINT_PLAIN_HEADER ) {
    cout << "printing flat header" <<endl;
    format.header.writeFlatHeader( format.outputHeaderName, title );
  } else if( format.printHeader==PRINT_COMPRESSED_HEADER ) {
    cout << "printing compressed header" <<endl;
    clock_t start = tic();
    format.header.writeCompressedHeader( format.outputHeaderName, title );
    double time = toc( start );
    cout << "time elapsed to compress header: " << time << "s" <<endl;
  } else {
    // we must write the signals in the same order as it would happen if a flat header was written
    format.header.updateOrderForFlatHeader();
  }

  format.headerAlreadySaved=true;

} // }}}1


static void writeAll() { // {{{1
  cout << "enter writeAll" << endl;
  
  unsigned long NT = format.xValues.size();

  if( !format.headerAlreadySaved ) {
    writeHeader();
  }

  // print the number of timepoints
  writeIndex( NT );
  writeNewline();

  // print for each signal the starting position
  unsigned long cumsum=0;
  unsigned long NW = format.header.getNumberOfOutputSignals();
  for( unsigned long outputIndex=0 ; outputIndex<NW ; outputIndex++ ) {
    unsigned long simulatorIndex = format.header.getSimulatorIndexFromOrder( outputIndex ); 
    writeIndex( cumsum );
    cumsum = cumsum + format.signalsY.at( simulatorIndex ).size();
  }
  writeIndex( cumsum ); //write 1 entry more to be able to calculate size of last signal
  writeNewline();

  // print the time values
  for( unsigned long i=0 ; i<NT ; i++ ) {
    writeTime( format.xValues.at(i) );
  }
  writeNewline();
 
  bool use4ByteTimeIndex = ( NT>65535 );
  // for each signal: write all ( timeIndex value ) 
  for( unsigned long outputIndex=0 ; outputIndex<NW ; outputIndex++ ) {
    unsigned long simulatorIndex = format.header.getSimulatorIndexFromOrder( outputIndex );       
    unsigned long NP = format.signalsY.at(simulatorIndex).size();
    for( unsigned long ti=0 ; ti<NP ; ti++ ) {
      unsigned long timeIndex = format.signalsX.at(simulatorIndex).at(ti);
      double val = format.signalsY.at(simulatorIndex).at(ti);
      writeTimeIndex( use4ByteTimeIndex, timeIndex );
      writeValue( val );                      
    }
    writeNewline();
  }
  cout << "exit writeAll" << endl;
  return;
} // }}}1


//void writeTime( FILE* fp, double time ) {
//  fwrite( &time, 1, sizeof(time), fp ); 
//}
//
//void writePoint( FILE* fp, double val ) {
//  fwrite( &val, 1, sizeof(val), fp );
//}

static void writeTime( double time ) {  // {{{1
  switch( format.fileformat ) {
          case FORMAT_COA: 
              fprintf( format.fp, "%-14.6e", time ); 
              // left justified, always at least 14 spaces; 
              // default 6-precision number should always fit in this range
              break;
          case FORMAT_COD:
          case FORMAT_COF:
          case FORMAT_COH:
              fwrite( &time, 1, sizeof(time), format.fp ); 
              break;
  }  
} // }}}1

static void writeNewline( ) { // {{{1
  switch( format.fileformat ) {
          case FORMAT_COA: 
              fprintf( format.fp, "\n" );
              break;
          case FORMAT_COD:
          case FORMAT_COF:
          case FORMAT_COH:
              break;
  }  
} // }}}1

static void writeValue( double val ) {  // {{{1
  float fval;
  UINT16_TYPE valueH;
  double val1024;
  switch( format.fileformat ) {
          case FORMAT_COA: 
              fprintf( format.fp, "%-14.6e", val ); 
              break;
          case FORMAT_COD:
              fwrite( &val, 1, sizeof(val), format.fp ); 
              break;
          case FORMAT_COF:
              fval = (float) val;
              //fwrite( &fval, 1, sizeof(fval), format.fp );
              fwrite( &fval, 1, sizeof(fval), format.fp );
              break;
          case FORMAT_COH:
              valueH=0;
              val1024 = val*1024;
              doubles2halfp( &valueH, &val1024, 1 );
              //fwrite( &valueH, 1, sizeof(valueH), format.fp );
              fwrite( &valueH, 1, 2, format.fp );
              break;
  }  
} // }}}1

void writeTimeIndex( bool use4ByteTimeIndex, unsigned long timeIndex ) { // {{{1
  if( format.fileformat == FORMAT_COA ) {
    if( use4ByteTimeIndex ) {
      fprintf( format.fp, "%-10d", (int) timeIndex );
    } else {
      fprintf( format.fp, "%-6d", (int) timeIndex );
    }
  } else {
    if( use4ByteTimeIndex ) {
      UINT32_TYPE value32=(UINT32_TYPE) timeIndex;
      //fwrite( &value32, 1, sizeof(value32), format.fp ); 
      fwrite( &value32, 1, 4, format.fp );
    } else {
      UINT16_TYPE value16=(UINT16_TYPE) timeIndex;
      //fwrite( &value16, 1, sizeof(value16), format.fp );
      fwrite( &value16, 1, 2, format.fp );
    }
  }
} // }}}1

void writeIndex( unsigned long index ) { // {{{1
// always 4 bytes
  if( format.fileformat == FORMAT_COA ) {
    fprintf( format.fp, "%-12d", (int) index );
  } else {
      UINT32_TYPE value32=(UINT32_TYPE) index;
//      fwrite( &value32, 1, sizeof(value32), format.fp ); // gives 8-byte value on 64 bit machines ...
      fwrite( &value32, 1, 4, format.fp );
      
  }
} // }}}1
