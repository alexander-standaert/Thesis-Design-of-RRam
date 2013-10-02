package be.kuleuven.micas.signalStorage.formats.psfAscii;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import be.kuleuven.micas.helpers.MetaInfoImplementation;
import be.kuleuven.micas.signalStorage.CompressedNamesIndex;
import be.kuleuven.micas.signalStorage.IndexedSignalsImpl;
import be.kuleuven.micas.signalStorage.SignalDatabaseImpl;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;
import be.kuleuven.micas.signals.Signal;
import be.kuleuven.micas.signals.SignalPart;


/**
 * psfAscii for a file with a single DC point instead of tran / dc sweep
 * 
 * example format:
 * 
 * VALUE
 *  "in" "V" 0.150000
 *  "out" "V" 0.00498712
 *  "Vin:p" "I" -2.91363e-12
 *  "Vvdd:p" "I" -1.62174e-08
 *  "Vvss:p" "I" 1.62204e-08
 *  "vdd" "V" 0.150000
 *  "vss" "V" 0.00000 
 */
public class SimulationPsfAsciiDC extends SignalDatabaseImpl {

	private static final long serialVersionUID = 1L;

	// ======================================================
	// readFile
	// ======================================================	
	private NamesIndex readFile( String filename ) throws IOException {
		
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
			if( skipLine.trim().equalsIgnoreCase("VALUE") ) {
				break;
			}
		}

		List<String> yNamesUnits = new ArrayList<String>();
		List<Double> yValues     = new ArrayList<Double>();
		
		String xName="xName";
		String xUnit="xUnit";		
		double xValue=Double.NaN;
		
		boolean first=true;
		while( true ) {
			String line = lr.readLine();
			if( line.startsWith("\"") ) {
				String[] tokens = line.split(" ");
				String name = stripBrackets( tokens[0] );				
				String unit = stripBrackets( tokens[1] );
				//String valueString = tokens[2];
				String valueString = tokens[2].replace('"', ' ');
				double value = Double.valueOf( valueString );				
				if( first ) {
					xUnit = unit;
					xName = name;
					xValue=value;
				}								
				yNamesUnits.add( name+" "+unit  );				
				yValues.add( value ); 
			} else {
				break;
			}
		}
		
		this.header = new CompressedNamesIndex( yNamesUnits );				
		header.addMetaInfoFields( meta );
		
		double[] xValues = new double[1];
		xValues[0] = xValue;
		
		SignalPart x = new SignalPart( xValues, xName, xUnit );
		
		for( int i=0 ; i<yValues.size() ; i++ ) {
			HeaderEntry entry = header.getEntry(i);
			double[] yv = new double[1];
			yv[0] = yValues.get(i);			
			SignalPart y = new SignalPart( yv, entry.getName(), entry.getUnit() );
			Signal signal = new Signal( x, y );
			this.addSignal(i, signal);
		}			
		return header;		
	}
	
	// ======================================================
	// factory method to load a new simulation
	// ======================================================	
	public static SimulationPsfAsciiDC read( String filename ) throws IOException {		
		SimulationPsfAsciiDC simulation = new SimulationPsfAsciiDC( filename );	
		return simulation;
	}
	
		
	// ======================================================
	// constructor
	// ======================================================
	private SimulationPsfAsciiDC( String filename  ) throws IOException {		
		super( );
		this.body = new IndexedSignalsImpl();
		readFile( filename );		
	}
			
	private static String stripBrackets( String in ) {
		String s = in.trim();
		return s.substring( 1, s.length()-1 );			
	}
		
	
}
