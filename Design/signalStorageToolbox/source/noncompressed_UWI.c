/*****************************************************************
 *  main file for spectre non-compressed UWI plugin 
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

#include <vector>
#include <string>

#include <iostream>

#include "ticToc.cpp"
#include "Header.cpp"


using namespace std;

//static char test; //needed to avoid segmentation error ... evil ...

typedef struct wfFormat // {{{1
{
	int dummy;
  FILE* fp;			                  /* Defines output stream                 */
  string netlistName;
  string outputHeaderName;
	Header header;
  vector<double> xValues;         /* Stores X-values that have not been flushed yet */
	vector<vector<double> > signalsY; /* Stores the signals' yValues    */
  int sigCount;
  vector<double> oldYs; // last values in signals
  bool headerAlreadySaved;
  int printHeader;                /* one of PRINT_..._HEADER */
  int fileformat;                 /* one of FORMAT_... */
  string outputMap;               /* folder in which to safe output files */
  string formatName;
  string filePostfix;             
} wfFormat;

struct wfFormat format;  /* Creates static instance of struct to store */
// }}}1


int verboseUWI=0;
int debugUWI=0;

extern void appendAllWaves();
extern void writeHeader();
extern void initializeUWI();

extern void writeTime( double time );
extern void writePoint( double val );


#define PRINT_NO_HEADER         0
#define PRINT_PLAIN_HEADER      1
#define PRINT_COMPRESSED_HEADER 2

#define FORMAT_NCA 1
#define FORMAT_NCD 2
#define FORMAT_NCF 3
#define FORMAT_NCH 4



// OPEN SAF{{{1
uwi_StreamHandle openSAF(const struct uwi_Setup* setup)
{
  if( debugUWI ) { 
    cout << "open UWI" << std::endl;     
    cout << "netlistName (should be empty): " << format.netlistName << endl; 
  }
//  test=5;   //needed to avoid segmentation error ... evil hack ...

//  format = new wfFormat;

  format.headerAlreadySaved=false;

	format.fp         = NULL;
  format.netlistName = "";
  format.netlistName.append( setup->fileName );

  //create output directory ...
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

  format.signalsY.clear();
  format.header.clear();
  //consecutive simulations don't reinitialise these structures ...

//  if( printHeader ) {
//  	fprintf( format.fp, "non-compressed output for netlist '%s'\n", format.netlistName.c_str() );
//    fprintf( format.fp, "[\n" );
//  }

  if( debugUWI ) { 
    std::cout << "done open SAF" << std::endl;      
  }

	return format.fp;
}
// ------------------------------------ OPEN }}}1

// define waveform {{{1
uwi_WfHandle defineWfSAF(uwi_StreamHandle strHandle, const struct 
												uwi_WfDefinition* wfDef)
{
	
  int simulatorIndex = format.signalsY.size();

  if( debugUWI ) { 
    std::cout << "define WF SAF '" << wfDef->wfName << "'" << std::endl;     
  }

  if( format.headerAlreadySaved )  {
    std::cout << "ERROR: header already saved when adding '" << wfDef->wfName << "'" << std::endl;     
    format.headerAlreadySaved = false;  
    // write it again, but this should never happen ... 
  }


  // construct the full name {{{3
  
  // glue the path together, e.g. Xmain.Xand.Xinv
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

  // add . in case of voltages, : in case of currents
  string units = wfDef->units;
  if( i>0 ) {
    if( units.compare( "A" )==0 ) {
      fullName.append( ":" );
    } else if( units.compare("V")==0 ) {
      fullName.append( "." );
    } 
  }
  fullName.append( wfDef->wfName );
  
  if( debugUWI ) { 
    std::cout << "fullname: '" << fullName << "'" << std::endl;     
    std::cout << "units: '" << units << "'" << std::endl;     
  }
  // }}}3


  // store fullname
  string name = fullName;
  format.header.addSignal( simulatorIndex, name, units );
  
  vector<double> s;
  format.signalsY.push_back( s );

  if( debugUWI ) { 
    cout << endl << "end define WF" << endl;
  }

	/* Return the index as Waveform Handle */
	return (uwi_WfHandle)(simulatorIndex+1);
  //WARNING: for ultrasim, you are not allowed to return 0 !!!
}
// --------------------- define waveform }}}1

// flush SAF {{{1
int flushSAF(uwi_StreamHandle stream)
{
  
  if( debugUWI ) {
    cout << endl << "flushNC ------- " << endl;
    cout << endl << "total number of timesteps: " << format.xValues.size() << endl;
    cout << endl << "total number of signals: " << format.signalsY.size() << endl;
  }

  if( !format.headerAlreadySaved ) {
    writeHeader();
  }

  unsigned int L=format.xValues.size();

  if( L>0 ) {  //only flush if new data is available
    //cout << "appendAllWaves from flush" << endl;
    appendAllWaves();
    //cout << "appendAllWaves from flush done" << endl;
    
    unsigned long NW = format.header.getNumberOfOutputSignals();

    // write all time points {{{2
    for( unsigned long ti=0 ; ti<format.xValues.size() ; ++ti ) {
	    double time = format.xValues.at(ti);
      writeTime( time );      

      // write values at this time point for all signals {{{3
      for( unsigned long outputIndex=0 ; outputIndex<NW ; outputIndex++ ) {
        unsigned long simulatorIndex = 
                format.header.getSimulatorIndexFromOrder( outputIndex );
        writePoint( format.signalsY.at(simulatorIndex).at(ti) );
    	}  // }}}3

    } // }}}2

    // remove all data that has been written. {{{2
    // put a temporary backup of the yValues at the last timepoint in oldYs
    format.oldYs.clear();
    for( unsigned long si=0 ; si<format.signalsY.size() ; si++ ) {
      format.oldYs.push_back( format.signalsY.at(si).at( L-1 ) );
      format.signalsY.at(si).clear();
    }
    format.xValues.clear(); 
    // }}}2

  }

  if( debugUWI ) {
    cout << endl << "--------------- flushNC " << endl;
  }

  return 0;
}
// -------------------------------- flush }}}1

// close SAF {{{1
int closeSAF(uwi_StreamHandle stream)
{
  // ASSUMPTION: flushSAF is called before closeSAF
  unsigned int L=format.xValues.size();
  if( L>0 ) {
    cout << "WARNING: flushSAF was not executed properly before closeSAF" << endl;
    cout << "calling flushSAF manually" << endl;
    closeSAF( stream );
  }

  //	clean up all data if needed
  fclose( format.fp );
 
  unsigned long NW = format.signalsY.size(); 
  // clear all data
  for( unsigned long si=0 ; si<NW ; si++ ) {
    format.signalsY.at(si).clear();
  }
  format.xValues.clear();
  format.signalsY.clear();
  format.oldYs.clear();
  format.header.clear();

	return 0;
}
// ------------------------------- close }}}1

// ------------------------------- add digital point {{{1
int addDWfPointSAF(uwi_StreamHandle stream, uwi_WfHandle wfHandle, 
												enum uwi_Logic val, double t) {
  cout << "WARNING: digital data not yet supported" << t << endl;
  return 0;
}
// ------------------------------- add digital point }}}1

// add analog (=normal) point {{{1
int addAWfPointSAF(uwi_StreamHandle stream, uwi_WfHandle wfHandle, double val, double t) {
  
  unsigned long simulatorIndex = ((unsigned long)(wfHandle))-1 ;
  
  if( debugUWI ) {
//    cout << "about to add point to signal '" 
//         << format.header.getSignalNameForSimulatorIndex( simulatorIndex ) 
//         << "' : (" << t << ", " << val << ")" << endl;    
  }

  if( !format.headerAlreadySaved ) {
    writeHeader();
  }

  if( format.xValues.size()==0 ) {
      format.xValues.push_back( t );
  } else if( t!=format.xValues.at( format.xValues.size()-1 ) ) {
      //cout << "appendAllWaves from addPoint" << endl;
      appendAllWaves();
      //cout << "appendAllWaves from addPoint done" << endl;
      format.xValues.push_back( t );  
  } 
  format.signalsY.at( simulatorIndex ).push_back( val );

  if( debugUWI ) {
//    cout << "added point to signal '" 
//         << format.header.getSignalNameForSimulatorIndex( simulatorIndex ) 
//         << "' : (" << t << ", " << val << ")" << endl;    
  }
	return 0;
}
// ------------------------------- add analog (=normal) point }}}1

// register all the functions defined above with uwi_register() API {{{1
extern "C" {

struct uwi_WfIntDef wfIntDef;

// register all UWI functions {{{2
struct uwi_WfIntDef* uwi_register()
{

  initializeUWI(); 
  
//  wfIntDef = new uwi_WfIntDef;  

  /* Defines a static struct of the waveform interface definition */
	//static struct uwi_WfIntDef wfIntDef;

	/* Assigns all the user defined functions to the members of the waveform *
	 * interface object */
	wfIntDef.open        = openSAF;
	wfIntDef.defineWf    = defineWfSAF;
	wfIntDef.addDWfPoint = addDWfPointSAF;
	wfIntDef.addAWfPoint = addAWfPointSAF;
	wfIntDef.flush       = flushSAF;
	wfIntDef.close       = closeSAF;
	wfIntDef.getErrMsg   = NULL;
	wfIntDef.resetXCoord = NULL;

	// the format is set below
  // the user needs specify the same format in the 
	//  - netlist (for ultrasim) 
  //  - the command-line command (spectre) 
  int L = format.formatName.size();
  char *name = new char[ L+1 ];
  memset( name, '\0', L+1 );
	format.formatName.copy( name,L );
  wfIntDef.format = name;

  std::cout << "registered registration " << wfIntDef.format << std::endl;  

  if( debugUWI ) {
    std::cout << "done with UWI registration" << std::endl;      
  }

	return &wfIntDef;
	//return wfIntDef;
}
// -------------------------------------- register all UWI functions }}}2

} // }}}1


// initializeUWI {{{1
void initializeUWI( ) {
  std::cout << "====== starting non-compressed UWI output" << std::endl;     

  const char* headerString = getenv( "UWI_HEADER" );
  const char* formatString = getenv( "UWI_FORMAT" );
  const char* outputMapString = getenv( "UWI_OUTPUT_MAP" );
 
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
    cout << "WARNING: UWI_FORMAT not set, using default 'NCA'" << endl;
    formatString="NCA";
    format.fileformat = FORMAT_NCA;
  } else if( strcmp( formatString, "NCA" )==0 ) {
    cout << "         using 'NCA' format" << endl;
    format.fileformat = FORMAT_NCA;
  } else if( strcmp( formatString, "NCD" )==0 ) {
    cout << "         using 'NCD' format" << endl;
    format.fileformat = FORMAT_NCD;
  } else if( strcmp( formatString, "NCF" )==0 ) {
    cout << "         using 'NCF' format" << endl;
    format.fileformat = FORMAT_NCF;
  } else if( strcmp( formatString, "NCH" )==0 ) {
    cout << "         using 'NCH' format" << endl;
    format.fileformat = FORMAT_NCH;
  } else {
    cout << "WARNING: UWI_FORMAT (" << formatString << 
            ")unknown, using default 'NCA'" << endl;
    formatString="NCA";
    format.fileformat = FORMAT_NCA;
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

void writeHeader() { // {{{1
      
  cout << "enter writeHeader" << endl;
  //unsigned long NW = format.sigNames.size();

  string title = "output for simulation '";
  title.append( format.netlistName );
  title.append("'");

  if( format.printHeader==PRINT_PLAIN_HEADER ) {
    cout << "writing flat header" <<endl;
    format.header.writeFlatHeader( format.outputHeaderName, title );
    cout << "flat header written" <<endl;
  } else if( format.printHeader==PRINT_COMPRESSED_HEADER ) {
    cout << "printing compressed header" <<endl;
    clock_t start = tic();
    format.header.writeCompressedHeader( format.outputHeaderName, title );
    double time = toc( start );
    cout << "time elapsed to write compressed header: " << time << "s" <<endl;
  } else {
    // we must write the signals in the same order as it would happen if a flat header was written
    format.header.updateOrderForFlatHeader();
  }

  format.headerAlreadySaved=true;

} // }}}1

// appendAllWaves {{{1
void appendAllWaves( ) {
  // in ultrasim, not all points are always added at each time vector
  // add skipped values here ...
  //
  // Ofcourse, you shouldn't use NC with ultrasim ...
  // so we might be able to drop all oldY-stuff ...
  // 
  // oldY is set after the first cal4 to appendAllWaves is skipped

  if( debugUWI ) { cout << "appendAllWaves entered" << endl; }

  unsigned int L=format.xValues.size();
  for( unsigned int i=0 ; i<format.signalsY.size() ; i++ ) {
    if( format.signalsY.at(i).size()<L ) {
       cout << "signal " << i << endl;
       cout << "size: " << format.signalsY.size() << endl;
       cout << "L: " << L << endl;
       if( L==1 ) {
         cout << "aAW 1" << endl;
         if( i>= format.oldYs.size() ) {
           format.signalsY.at(i).push_back( 0 );
         } else {
           format.signalsY.at(i).push_back( format.oldYs.at(i) );
         }
         cout << "aAW 2" << endl;
       } else {
         cout << "aAW 3" << endl;
         format.signalsY.at(i).push_back( format.signalsY.at(i).at( L-2 ) );
         cout << "aAW 4" << endl;
       }
    }
  }
  if( debugUWI ) { cout << "appendAllWaves exited" << endl; }
  return;
}

// ------------------------------- appendAllWaves }}}1

// write methods {{{1
// -- ascii
int firstTimepoint=1;

void writeTimeA( FILE* fp, double time ) {
  if( firstTimepoint ) {
    firstTimepoint=0;
  } else {    
    fprintf( fp, "\n" ); 
  }
  fprintf( fp, "%g ", time ); 
}

void writePointA( FILE* fp, double val ) {
  fprintf( fp, "%g ", val ); 
}

// -- double
void writeTimeD( FILE* fp, double time ) {
  fwrite( &time, 1, sizeof(time), fp ); 
}

void writePointD( FILE* fp, double val ) {
  fwrite( &val, 1, sizeof(val), fp );
}


// -- single
void writeTimeF( FILE* fp, double time ) {
  // notice: time is still written as double to avoid issues!
  fwrite( &time, 1, sizeof(time), fp ); 
}

void writePointF( FILE* fp, double val ) {
  float fval = (float) val;
  fwrite( &fval, 1, sizeof(fval), fp );
}


// -- halfprecision
void writeTimeH( FILE* fp, double time ) {
  // notice: time is still written as double to avoid issues!
  fwrite( &time, 1, sizeof(time), fp ); 
}

void writePointH( FILE* fp, double val ) {
  UINT16_TYPE value=0;
  double val1024 = val*1024;
  doubles2halfp( &value, &val1024, 1 );
  fwrite( &value, 1, sizeof(value), fp );
}

void writePoint( double val ) {
  switch( format.fileformat ) {
    case FORMAT_NCA: writePointA( format.fp, val ); break;
    case FORMAT_NCD: writePointD( format.fp, val ); break;
    case FORMAT_NCF: writePointF( format.fp, val ); break;
    case FORMAT_NCH: writePointH( format.fp, val ); break;
  }
}

void writeTime( double time ) {
  switch( format.fileformat ) {
    case FORMAT_NCA: writeTimeA( format.fp, time ); break;
    case FORMAT_NCD: writeTimeD( format.fp, time ); break;
    case FORMAT_NCF: writeTimeF( format.fp, time ); break;
    case FORMAT_NCH: writeTimeH( format.fp, time ); break;
  }
}

// write methods }}}1
