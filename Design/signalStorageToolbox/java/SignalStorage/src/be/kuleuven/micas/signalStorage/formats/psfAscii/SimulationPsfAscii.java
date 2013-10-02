package be.kuleuven.micas.signalStorage.formats.psfAscii;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import be.kuleuven.micas.helpers.Helper;
import be.kuleuven.micas.signalStorage.IndexedSignalsImpl;
import be.kuleuven.micas.signalStorage.LoadableSignalDatabaseImpl;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;
import be.kuleuven.micas.signals.Signal;
import be.kuleuven.micas.signals.SignalPart;



public class SimulationPsfAscii extends LoadableSignalDatabaseImpl {

	private static final long serialVersionUID = 1L;

	private int startOfData;  // amount of chars to jump to skip header
	
	
	// ======================================================
	// readHeader
	// ======================================================	
	@Override
	protected NamesIndex readHeader( String filename ) throws IOException {

		HeaderPsfAscii headerReader = new HeaderPsfAscii( filename );
				
		NamesIndex header = headerReader.getHeader();		
		startOfData = headerReader.getStartOfData();
		
		return header;
	}	
	
			
	// ======================================================
	// readBody
	// ======================================================
	@Override
	protected void readFileBody() throws IOException {
		
		PsfAsciiLineReader lr = new PsfAsciiLineReader( getBodyFilename() );
		lr.skip( startOfData );
		
		Map<Integer, HeaderEntry> rse = getRequestedSignalEntries();
		
		int yVars = header.getNumberOfSignalNames();
		
		
		List< List<Double> > yValues = new ArrayList< List<Double> >(  );
		for( int i=0 ; i<yVars ; i++ ) {
			yValues.add( i, new ArrayList<Double>(  ) );
		}
		
		
		List<Double> xValues = new ArrayList<Double>(  ); 
		
		String[] tokens;
		
		while( true ) {
			String line = lr.readLine( );
			if( line.startsWith("\"") ) {
				tokens = line.split(" ");
				double value = Double.valueOf( tokens[1] );
				xValues.add( value ) ;
				for( int i=0 ; i<yVars ; i++ ) {
					line = lr.readLine( );
					if( isSignalRequested(i) ) {
						tokens = line.split(" ");
						value = Double.valueOf( tokens[1] );					
						yValues.get(i).add( value ) ;
					}
				}
			} else {
				break;
			}		
		}
		lr.close();
		
		String xName = this.getMetaInfo("xName");
		String xUnit = this.getMetaInfo("xUnit");		
		
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
	public static SimulationPsfAscii read( String filename, String filter, String[] exactNames ) throws IOException {
		
		if( exactNames == null ) {
			exactNames = new String[0];
		}
		
		SimulationPsfAscii simulation = new SimulationPsfAscii( filename, filter, exactNames );	
		return simulation;
	}
	
	public static SimulationPsfAscii read( String filename, String[] exactNames ) throws IOException {
		return read( filename, "", exactNames );
	}
	
	public static SimulationPsfAscii read( String filename, String filter ) throws IOException {
		return read( filename, filter, new String[0] );
	}
	
	public static SimulationPsfAscii read( String filename ) throws IOException {
		return read( filename, ".*", new String[0] );
	}
	
	// ======================================================
	// constructor
	// ======================================================
	/** 
	 *  Construct a new simulationPsfAscii object from the given <code>header</code>
	 *  and <code>body</code>.  
	 */
	private SimulationPsfAscii( String filename, String filter, String[] exactNames  ) throws IOException {		
		super( );		
		setBodyFilename(filename); // leave headerFilename empty				
		header = readHeader( filename );
//		String[] names = header.getAllNames();
//		for( String name : names ) {
//			System.out.println( "signal: "+name );
//		}
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

}
