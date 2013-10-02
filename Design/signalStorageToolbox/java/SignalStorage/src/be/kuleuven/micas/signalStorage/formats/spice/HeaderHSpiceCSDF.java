package be.kuleuven.micas.signalStorage.formats.spice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import be.kuleuven.micas.helpers.MetaInfoImplementation;
import be.kuleuven.micas.signalStorage.CompressedNamesIndex;
import be.kuleuven.micas.signalStorage.formats.GenericLineReader;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;


/**
 * A helper class to read the header of a hspice ASCII CSDF file and construct
 * a corresponding SimulationOutputHeader
 * 
 * startOfData indicates the value of the first data-point, so little time is lost
 * by splitting the reading procedure in two parts
 * 
 * To output this file format in hspice, add these lines to the spice netlist:
 * .OPTION CSDF
 * 
 * Output is then dumped in netlistName.tr0 for transient
 *                          netlistName.sw0 for dc sweep
 * 
 *  
 * 
 */
public class HeaderHSpiceCSDF {
	
	
	
	private int startOfData;
	private NamesIndex header;
	private boolean skipSignal0=false;  // true if signal 0 ="0" - otherwise problem with tree construction

	public int getStartOfData() {
		return startOfData;
	}
	public NamesIndex getHeader() {
		return header;
	}
	public boolean getSkipSignal0() {
		return skipSignal0;
	}

	public HeaderHSpiceCSDF( String filename ) throws IOException {
		super();
		header = readHeaderInternal(filename);		
	}

	public static NamesIndex readHeader( String filename ) throws IOException {
		HeaderHSpiceCSDF headerReader = new HeaderHSpiceCSDF( filename );
		return headerReader.getHeader();
	}

	public NamesIndex readHeaderInternal( String filename ) throws IOException {

		//System.out.println("version 2011-11-26 A" );
		
		GenericLineReader lr = new GenericLineReader( filename );

		MetaInfoImplementation meta = new MetaInfoImplementation();

		/* ------------------------- example header code:
		#H
		SOURCE='HSPICE' VERSION='C-2009.09 32-BIT'
		TITLE='this is my rather long title ==================================='
		SERIALNO='09.09'
		TIME='21:22:01' DATE='07/21/2010'
		ANALYSIS='DC' TEMPERATURE=' 2.50000E+01' SWEEPVAR='VOLTS'
		SWEEPMODE='VAR_STEP' COMPLEXVALUES='NO' FORMAT='1 VOLTSorAMPS;EFLOAT'
		XBEGIN=' 0.00000E+00' XEND=' 1.00000E+00'
		NODES='     7'
		#N 'V(n1)' 'V(n2)' 'V(n3)' 'V(n4)' 'V(n5)' 'V(px)' 'I(vin)' 
		*/

//		meta.setMetaInfo( "firstLine" , lr.readLine() ); // #H
//		meta.setMetaInfo( "secondLine", lr.readLine() ); // SOURCE='HSPICE' VERSION='C-2009.09 32-BIT'
//		String titleLine = lr.readLine();                // TITLE='this is my rather long title ==================================='
//		meta.setMetaInfo( "titleLine" , titleLine ); 
//		String title = extractSinglePart( titleLine );
//		meta.setMetaInfo( "title"     , title );
//		meta.setMetaInfo( "serialNo"  , lr.readLine() ); // SERIALNO='09.09'
//		meta.setMetaInfo( "TimeDate"  , lr.readLine() ); // TIME='21:22:01' DATE='07/21/2010'
//		
//		String analysisLine = lr.readLine();             //ANALYSIS='DC' TEMPERATURE=' 2.50000E+01' SWEEPVAR='VOLTS'
//		List<String> parts = getParts( analysisLine );
//		String analysis = parts.get(0);
//		meta.setMetaInfo( "analysis", analysis );		
//		meta.setMetaInfo( "temperature", parts.get(1) );
//		String sweepvar = parts.get(2);		
//		meta.setMetaInfo( "sweepvar", sweepvar );
//		
//		if( analysis.equalsIgnoreCase("TR") ) {		
//			meta.setMetaInfo("xName", "TIME");
//			meta.setMetaInfo("xUnit", "s"   );				
//		} else {
//			meta.setMetaInfo("xName", analysis );
//			meta.setMetaInfo("xUnit", sweepvar.substring(0,1)   );
//		}
//		lr.readLine();                                   // SWEEPMODE='VAR_STEP' COMPLEXVALUES='NO' FORMAT='1 VOLTSorAMPS;EFLOAT'
//		lr.readLine();                                   // XBEGIN=' 0.00000E+00' XEND=' 1.00000E+00'
//		String nodesLine = lr.readLine();                // NODES='     7'
//		String nodesString = extractSinglePart( nodesLine );
//		int numberOfNodes = Integer.parseInt( nodesString.trim() );
//		meta.setMetaInfo( "numberOfNodes", nodesString );
		

		
				
		// ------------------------------- read #H header information
		String line = lr.readLine();
		if( ! line.trim().equals("#H") ) {
			lr.close();
			throw new IllegalArgumentException( "CSDF file does not start with a #H line" );
		}
		
		line = lr.readLine();
		StringBuffer buffer = new StringBuffer();
		// glue lines together until next # line
		while( true ) {			
			buffer.append( line );
			
			line= lr.readLine();
			if( line.startsWith("#") ) {			
				break;	// will be processed by "read signal names"
			}
		}	
		extractMetaInformation( meta, buffer.toString() );
		String nodes = meta.getMetaInfo("NODES");		
		//System.out.println( "NODES: '"+ nodes + "'" );
		int numberOfNodes = Integer.parseInt( nodes.trim() );
		
		// ------------------------------- read signal names
		//#N 'V(n1)' 'V(n2)' 'V(n3)' 'V(n4)' 'V(n5)' 'V(px)' 'I(vin)' (can run over multiple lines)
		List<String> yNamesUnits = new ArrayList<String>();
		int position;
		//line = lr.readLine();		
		while( true ) {
			
			position=lr.getCurrentPosition();
			
			List<String> names = getParts( line );
			for( int i=0 ; i<names.size() ; i++ ) {
				String name = names.get(i);
				String unit = "?";
				//signalNames.add( name );
				if( name.startsWith("I") ) {
					unit="A";					
				}
				if ( name.startsWith("V") ) {
					unit="V";
				}	
				yNamesUnits.add( name + " " + unit );
				//System.out.println( "added : "+ name + " " + unit );
			}			
			
			line= lr.readLine();
			if( line.startsWith("#") ) {
				// don't move currentPosition to next line
				break;
			}
		}
		//System.out.println( "position="+position );
		
		if( yNamesUnits.size() != numberOfNodes ) {
			String text = "number of nodes in file ("+yNamesUnits.size()+")"+
                    	  "does not match the specified number of nodes ("+numberOfNodes+")";
			System.out.println( text );
			//throw new IllegalArgumentException(text);
		}
		
		// ------------------------------- header read	
		
		CompressedNamesIndex header = new CompressedNamesIndex( yNamesUnits );
				
		startOfData = position; // should be at the first #C of the file
		meta.setMetaInfo("startOfData", ""+startOfData );
		lr.close();
		
		header.addMetaInfoFields( meta );
		
		return header;
	}	

	/**
	 * Fill out the meta information based on a string containing p1='p1'  p2='p2' ...
	 * 
	 */
	private void extractMetaInformation( MetaInfoImplementation meta, String lineIn ) {
		String line = lineIn;
		while( line.trim().length()>0 ) {
			// fetch first string, up to first "="
			String[] property_rest = line.split("=", 2);
			String property = property_rest[0].trim();
			String rest = property_rest[1].trim();
			String[] empty_value_rest = rest.split("'", 3);
			String value = 	empty_value_rest[1];
			//System.out.println( "property:: "+property );
			//System.out.println( "value:: "+value );			
			//System.out.println( "rest:: "+rest );
			line = empty_value_rest[2].trim();
			meta.setMetaInfo(property, value);			
		}
		//meta.printMetaInfo();
	}
	
	/**
	 * from // TITLE='this is my rather long title ===================================', get
	 * "this is my rather long title ==================================="
	 * @param line
	 * @return
	 */
	private String extractSinglePart( String line ) {
		List<String> parts = getParts( line );
		return parts.get(0);
	}
	
	/**
	 * from //ANALYSIS='DC' TEMPERATURE=' 2.50000E+01' SWEEPVAR='VOLTS', get 
	 * [ "DC" " 2.50000E+01" "VOLTS" ]
	 * @param titleLine
	 * @return
	 */
	private List<String> getParts( String line ) {
	     Pattern p = Pattern.compile("'.*?'");
	     Matcher m = p.matcher( line );
	     
	     ArrayList<String> parts = new ArrayList<String>();
	     
	     int start=0;
	     while( m.find( start ) ) {
	    	 String quoted = m.group();
	    	 String part = quoted.substring( 1, m.end()-m.start()-1 );
	    	 parts.add( part );
	    	 start = m.end();
	     }
	     return parts;
	}

	
	public static void main( String[] args ) throws IOException {
		System.out.println("started" );
		HeaderHSpiceCSDF header = new HeaderHSpiceCSDF("/users/micas/scoseman/projects/spectreBinaryWaves/signalStorageToolbox/examples/hspiceCSDF/RC.tr0");
		
		int L = header.getHeader().getNumberOfSignalNames();
		for( int i=0 ; i<L ; i++ ) {
			//String name=header.getHeader().getName(i);
			HeaderEntry entry=header.getHeader().getEntry(i);			
			System.out.println( "'"+entry.getName()+"' "+entry.getUnit()+"'" );
		}		
	}
	
	
	
	/* --- example format
	#H
	SOURCE='HSPICE' VERSION='C-2009.09 32-BIT'
	TITLE='this is my rather long title ==================================='
	SERIALNO='09.09'
	TIME='21:22:01' DATE='07/21/2010'
	ANALYSIS='DC' TEMPERATURE=' 2.50000E+01' SWEEPVAR='VOLTS'
	SWEEPMODE='VAR_STEP' COMPLEXVALUES='NO' FORMAT='1 VOLTSorAMPS;EFLOAT'
	XBEGIN=' 0.00000E+00' XEND=' 1.00000E+00'
	NODES='     7'
	#N 'V(n1)' 'V(n2)' 'V(n3)' 'V(n4)' 'V(n5)' 'V(px)' 'I(vin)' 
	#C  0.00000e+00    7   0.00000e+00  0.00000e+00  0.00000e+00  0.00000e+00 
	 0.00000e+00  0.00000e+00  0.00000e+00 
	#C  1.00000e-01    7   1.00000e-01  1.00000e-01  1.00000e-01  1.00000e-01 
	 1.00000e-01  1.00000e-01  0.00000e+00 
	#C  2.00000e-01    7   2.00000e-01  2.00000e-01  2.00000e-01  2.00000e-01 
	 2.00000e-01  2.00000e-01  0.00000e+00 
	#C  3.00000e-01    7   3.00000e-01  3.00000e-01  3.00000e-01  3.00000e-01 
	 3.00000e-01  3.00000e-01  0.00000e+00 
	#C  4.00000e-01    7   4.00000e-01  4.00000e-01  4.00000e-01  4.00000e-01 
	 4.00000e-01  4.00000e-01  0.00000e+00 
	#C  5.00000e-01    7   5.00000e-01  5.00000e-01  5.00000e-01  5.00000e-01 
	 5.00000e-01  5.00000e-01  0.00000e+00 
	#C  6.00000e-01    7   6.00000e-01  6.00000e-01  6.00000e-01  6.00000e-01 
	 6.00000e-01  6.00000e-01  0.00000e+00 
	#C  7.00000e-01    7   7.00000e-01  7.00000e-01  7.00000e-01  7.00000e-01 
	 7.00000e-01  7.00000e-01  0.00000e+00 
	#C  8.00000e-01    7   8.00000e-01  8.00000e-01  8.00000e-01  8.00000e-01 
	 8.00000e-01  8.00000e-01  0.00000e+00 
	#C  9.00000e-01    7   9.00000e-01  9.00000e-01  9.00000e-01  9.00000e-01 
	 9.00000e-01  9.00000e-01  0.00000e+00 
	#C  1.00000e+00    7   1.00000e+00  1.00000e+00  1.00000e+00  1.00000e+00 
	 1.00000e+00  1.00000e+00  0.00000e+00 
	#
	*/
	
}
