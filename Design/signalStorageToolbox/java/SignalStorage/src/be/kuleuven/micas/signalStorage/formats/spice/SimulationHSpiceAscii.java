package be.kuleuven.micas.signalStorage.formats.spice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import be.kuleuven.micas.helpers.Helper;
import be.kuleuven.micas.signalStorage.IndexedSignalsImpl;
import be.kuleuven.micas.signalStorage.LoadableSignalDatabaseImpl;
import be.kuleuven.micas.signalStorage.formats.GenericLineReader;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;
import be.kuleuven.micas.signals.Signal;
import be.kuleuven.micas.signals.SignalPart;

/**
 * @see HeaderHSpiceAscii
 * @deprecated
 * 
 * note: this implementation reads all signals but only stores the requested
 *       at this moment this does not safe time or speed during load compared
 *       to loading everything
 *       
 * @author: Stefan Cosemans
 *  last modified: Jul 14, 2010
 *
 */
public class SimulationHSpiceAscii extends LoadableSignalDatabaseImpl {
	private static final long serialVersionUID = 1L;

	private int startOfData;  // amount of chars to jump to skip header
	private boolean skipSignal0; // true if first signal name is 0.
	// this signal name is dropped from the list, but this also means we
	// must prevent loading the signal values (skip them as well)
	
	// ======================================================
	// readHeader
	// ======================================================	
	@Override
	protected NamesIndex readHeader( String filename ) throws IOException {

		HeaderHSpiceAscii headerReader = new HeaderHSpiceAscii( filename );
				
		NamesIndex header = headerReader.getHeader();		
		startOfData = headerReader.getStartOfData();
		skipSignal0 = headerReader.getSkipSignal0();
		return header;
	}	
	
			
	// ======================================================
	// readBody
	// ======================================================
	@Override
	protected void readFileBody() throws IOException {
		
		GenericLineReader lr = new GenericLineReader( getBodyFilename() );
		lr.skip( startOfData );
		
		Map<Integer, HeaderEntry> rse = getRequestedSignalEntries();
		
		int yVars = header.getNumberOfSignalNames();
		
		
		List< List<Double> > yValues = new ArrayList< List<Double> >(  );
		for( int i=0 ; i<yVars ; i++ ) {
			yValues.add( i, new ArrayList<Double>(  ) );
		}		
		
		List<Double> xValues = new ArrayList<Double>(  ); 
		
		int shift=0;
		if( skipSignal0 ) {  // skip values for signal "0" if necessary
			shift=1;
		}
		
		// numbers just keep running, 11 chars per value
		int nextIndex=-1;  //xValue

		while( true ) {
			String line = lr.readLine( );
			if( line==null ) {
				break;
			}
			int nValues = line.length()/11;
			
		    //System.out.println( "skipSignal0:" +skipSignal0 );
			
			
			//System.out.println("values on line: " + nValues );
			for( int i=0 ; i<nValues ; i++ ) {				
				String valueString = line.substring(i*11, i*11+11 );
				
				// sometimes: "0..984E-101" 
				// seems to mean that one additional digit is used for the exponent
				// why this is done? no clue ...  
				// Anyway, these values are probably never significant
				valueString = valueString.replace("..", ".");
				double value;				
				try {
				value = Double.parseDouble( valueString );
				} catch( NumberFormatException e ) {
					System.out.println( valueString );
					throw( e );
				}
				if( nextIndex==-1 ) {
					if( value < 1e20 ) {						
						xValues.add( value );  // this is not the closing value
					}
					//System.out.println( "TIME: "+value );
				} else if( skipSignal0 && nextIndex==0 ) {
					// skip this
				} else {
					yValues.get(nextIndex-shift).add( value );
					//System.out.println( header.getName( nextIndex-shift )+":"+value );
				} 
				nextIndex++;
				if( nextIndex==(yVars+shift) ) {
					nextIndex=-1;
				}
			}
		}
		lr.close();
		
		String xName = this.getMetaInfo("xName");
		String xUnit = this.getMetaInfo("xUnit");	
		
		//String[] fields = header.getMetaInfoFields();
		//for( String key : fields ) {
		//	String value = header.getMetaInfo( key);
		//	System.out.println( "("+key+"::"+value+")" );
		//}

		
		//System.out.println( "xName="+xName);
		//System.out.println( "xUnit="+xUnit);
		
		SignalPart x = new SignalPart( Helper.ListToDoubleArray( xValues ), xName, xUnit );
		
		for( int i : getRequestedSignalIndices() ) {
			HeaderEntry entry = rse.get(i);
			double [] yv = Helper.ListToDoubleArray( yValues.get(i) );
			SignalPart y = new SignalPart( yv, entry.getName(), entry.getUnit() );
			Signal signal = new Signal( x, y );
			this.addSignal(i, signal);
		}
		
	}
	
	// ======================================================
	// factory methods to load a new simulation
	// ======================================================
	// ======================================================
	// factory methods
	// ======================================================
	public static SimulationHSpiceAscii read( String filename, String filter, String[] exactNames ) throws IOException {
		
		if( exactNames == null ) {
			exactNames = new String[0];
		}
		
		SimulationHSpiceAscii simulation = new SimulationHSpiceAscii( filename, filter, exactNames );	
		return simulation;
	}
	
	public static SimulationHSpiceAscii read( String filename, String[] exactNames ) throws IOException {
		return read( filename, "", exactNames );
	}
	
	public static SimulationHSpiceAscii read( String filename, String filter ) throws IOException {
		return read( filename, filter, new String[0] );
	}
	
	public static SimulationHSpiceAscii read( String filename ) throws IOException {
		return read( filename, ".*", new String[0] );
	}
	
	// ======================================================
	// constructor
	// ======================================================
	/** 
	 *  Construct a new simulationPsfAscii object from the given <code>header</code>
	 *  and <code>body</code>.  
	 */
	private SimulationHSpiceAscii( String filename, String filter, String[] exactNames  ) throws IOException {		
		super( );		
		setBodyFilename(filename); // leave headerFilename empty				
		header = readHeader( filename );
		body = new IndexedSignalsImpl();
		loadTheseSignals( filter, exactNames );
	}


	public String getSourceDescription() {
		String description = "no filename";
		if( getBodyFilename()!=null ) {
			description = "<"+getBodyFilename();
			if( getHeaderFilename()!=null ) {
				description = description+", "+getHeaderFilename();
			}
		}
		description=description+">";
		return description;
	}	
	
	
	public static void main( String[] args ) throws IOException {
		SimulationHSpiceAscii sim = SimulationHSpiceAscii.read("/users/micas/scoseman/projects/spectreBinaryWaves/examples/hspiceAscii/RC.tr0");
		
		int L = sim.getHeader().getNumberOfSignalNames();
		for( int i=0 ; i<L ; i++ ) {
			System.out.println( "signal "+i+": "+sim.getHeader().getName(i) );
		}
		
	}
	
}
