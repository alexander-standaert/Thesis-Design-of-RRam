package be.kuleuven.micas.signalStorage.formats.psfAscii;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import be.kuleuven.micas.helpers.MetaInfoImplementation;
import be.kuleuven.micas.signalStorage.CompressedNamesIndex;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;


/**
 * A helper class to read the header of a HSPICE Ascii file and construct
 * a corresponding SimulationOutputHeader
 * 
 * startOfData indicates the value of the first data-point, so little time is lost
 * by splitting the reading procedure in two parts
 * 
 * To output this file format in spectre, add these lines to the spice netlist:
 * option1 options rawfmt = psfascii
 * 
 * ("option1" is the name of the simulation and can be anything you like)
 */
public class HeaderPsfAscii {
	
	private int startOfData;
	private NamesIndex header;
	
	public int getStartOfData() {
		return startOfData;
	}
	public NamesIndex getHeader() {
		return header;
	}

	public HeaderPsfAscii( String filename ) throws IOException{
		super();
		header = readHeaderInternal(filename);		
	}
	
	public static NamesIndex readHeader( String filename ) throws IOException {
		HeaderPsfAscii headerReader = new HeaderPsfAscii( filename );
		return headerReader.getHeader();
	}
		
	public NamesIndex readHeaderInternal( String filename ) throws IOException {
		
		PsfAsciiLineReader lr = new PsfAsciiLineReader( filename );
		
		//Simulations simulations = new Simulations();
		
		MetaInfoImplementation meta = new MetaInfoImplementation();
				
		meta.setMetaInfo( "header"      , lr.readLine() );
		meta.setMetaInfo( "psfVersion"  , lr.readLine() );
		meta.setMetaInfo( "simulator"   , lr.readLine() );
		meta.setMetaInfo( "version"     , lr.readLine() );
		meta.setMetaInfo( "date"        , lr.readLine() );
		meta.setMetaInfo( "design"      , lr.readLine() );
		meta.setMetaInfo( "analysisType", lr.readLine() );
		meta.setMetaInfo( "analysisName", lr.readLine() );
		meta.setMetaInfo( "analysisDesc", lr.readLine() );
		
		while( true ) {
			String skipLine = lr.readLine();
			if( skipLine==null ) {
				lr.close();
				throw new IllegalArgumentException("HeaderPsfAscii: input file terminated unexpectedly while scanning for 'SWEEP'");				
			}
			if( skipLine.trim().equalsIgnoreCase("SWEEP") ) {
				break;
			}
		}

		NamesIndex header = readOneSimulationHeader( lr );		
		
		startOfData = lr.getCurrentPosition();
		header.setMetaInfo("startOfData", ""+startOfData );
		
		lr.close();
		
		header.addMetaInfoFields( meta );
		return header;
	}	
		
	private NamesIndex readOneSimulationHeader( PsfAsciiLineReader lr ) throws IOException {
		
		String sweep = lr.readLine();
		
		if( sweep==null ) {
			return null;
		}
		
		String[] tokens = sweep.split(" ");
//			  tokens = tokenizeString( SWEEP );		
		
		String xName = tokens[0] + " " +tokens[1];
		String xUnit = stripBrackets( tokens[7].trim() );
//			  simulation.xUnit = simulation.xUnit(2:end-1) ;

		String trace = lr.readLine();  
		
		List<String> yNamesUnits = new ArrayList<String>();
		
		while( true ) {
			String line = lr.readLine();
			if( line.startsWith("\"") ) {
				tokens = line.split(" ");
				String name = stripBrackets( tokens[0] );
				String unit = stripBrackets( tokens[1] );
				yNamesUnits.add( name+" "+unit  );						
			} else {
				break;
			}
		}		

		CompressedNamesIndex header = new CompressedNamesIndex( yNamesUnits );
		
		header.setMetaInfo("xName", xName );
		header.setMetaInfo("xUnit", xUnit );
		header.setMetaInfo("trace", trace );
		
		return header;
		
	}

	
	private static String stripBrackets( String in ) {
		String s = in.trim();
		return s.substring( 1, s.length()-1 );			
	}
	
	
}
