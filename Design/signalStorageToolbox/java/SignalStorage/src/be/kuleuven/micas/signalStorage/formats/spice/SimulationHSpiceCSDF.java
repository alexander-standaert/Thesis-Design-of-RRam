package be.kuleuven.micas.signalStorage.formats.spice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import be.kuleuven.micas.helpers.MatrixHelper;
import be.kuleuven.micas.helpers.TickTock;
import be.kuleuven.micas.signalStorage.IndexedSignalsImpl;
import be.kuleuven.micas.signalStorage.LoadableSignalDatabaseImpl;
import be.kuleuven.micas.signalStorage.formats.GenericLineReader;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;
import be.kuleuven.micas.signals.Signal;

/**
 * @see HeaderHSpiceAscii
 * 
 * note: this implementation reads all signals but only stores the requested
 *       at this moment this does not safe time during load compared
 *       to loading everything
 *       
 * note: reading the data seems abnormally slow: 15 seconds for 3.7M
 *       reference: UWI noncompressed ASCII, 1M = 3 seconds ==> x4 : not that bad      
 *       
 * @author: Stefan Cosemans
 *  last modified: Jul 14, 2010
 *
 */
public class SimulationHSpiceCSDF extends LoadableSignalDatabaseImpl {
	private static final long serialVersionUID = 1L;

	private int startOfData;  // amount of chars to jump to skip header
	
	// ======================================================
	// readHeader
	// ======================================================	
	@Override
	protected NamesIndex readHeader( String filename ) throws IOException {

		HeaderHSpiceCSDF headerReader = new HeaderHSpiceCSDF( filename );
				
		NamesIndex header = headerReader.getHeader();		
		startOfData = headerReader.getStartOfData();
		
		return header;
	}	
	
			
	// ======================================================
	// readBody
	// ======================================================
	@Override
	protected void readFileBody() throws IOException {
		
		GenericLineReader lr = new GenericLineReader( getBodyFilename() );
		lr.skip( startOfData );
		
		
		//Map<Integer, HeaderEntry> rse = getRequestedSignalEntries();		
		//int yVars = header.getNumberOfSignalNames();				
		
		// ==============================		
		List<Double> xValues = new ArrayList<Double>();
		Map<Integer,List<Double>> yValues = new HashMap<Integer,List<Double>>();		
		int[] requestedIndices = getRequestedSignalIndices() ;
		int maxIndex = 0;
		for( int i : requestedIndices ) {
			yValues.put( i, new ArrayList<Double>() );
			maxIndex = Math.max( i, maxIndex );
		}
		
		String overflowLine=null;
		while( true ) {
			// concatenate lineread 
			String fullLine = readOneFullLine( overflowLine, lr );
			overflowLine=lr.getPreviouslyReadLine();
			//System.out.println( "fullLine: '"+fullLine+"'" );
			
			fullLine = fullLine.substring( 2 ).trim(); // skip #C[space]
			String[] fullLineParts = fullLine.split("\\s+");
//			for( int i=0 ; i<fullLineParts.length ; i++ ) {
//				System.out.println( "part "+i+": '"+fullLineParts[i]+"'" );
//			}
						
			double xPoint = Double.parseDouble( fullLineParts[0] );
			xValues.add(xPoint);
			//System.out.println( "xPoint: '"+xPoint+"'" );
			//int numberOfValues =  Integer.parseInteger( fullLineParts[1] );
			
			for( int i=0 ; i<=maxIndex ; i++ ) {
				if( isSignalRequested(i) ) {
					double yval = Double.parseDouble( fullLineParts[2+i] ); //0.764 sec !!!					
					yValues.get(i).add(yval);
				}
//				} else {
//					tokenize.next();
//				}
			}
			
			
//			Scanner tokenize=new Scanner( fullLine );
//			double xPoint = tokenize.nextDouble();
//			//System.out.println( "xPoint: '"+xPoint+"'" );
//			xValues.add(xPoint);
//			//int numberOfValues = ... 
//			tokenize.nextInt();
//			
//			for( int i=0 ; i<=maxIndex ; i++ ) {
//				if( isSignalRequested(i) ) {
//					double yval = tokenize.nextDouble(); //10.5 sec					
//					yValues.get(i).add(yval);
//					//tokenize.next();                   // also 15 sec
//					//yValues.get(i).add(10.0);
//				} else {
//					tokenize.next();
//				}
//			}			
			if( overflowLine.startsWith("#;") ) { //EOF
				break;
			}
		}
		
		String xName = header.getMetaInfo("xName");
		String xUnit = header.getMetaInfo("xUnit");
		
		double[] xV = MatrixHelper.toArray( xValues );
		
		// add the newly loaded signals
		Map<Integer,HeaderEntry> requestedEntries = getRequestedSignalEntries();
		for( Entry<Integer,HeaderEntry> entry : requestedEntries.entrySet() ) {
			int i=entry.getKey();
			HeaderEntry header = entry.getValue();
			
			String yName = header.getName();
			String yUnit = header.getUnit();
			double[] yV = MatrixHelper.toArray( yValues.get(i) );
			
			Signal signal = new Signal(xV, xName, xUnit, yV, yName, yUnit );		
			this.addSignal(i, signal);
		}
		
		lr.close();
		
	}
	
	// ======================================================
	// helper methods
	// ======================================================
	/**
	 *  read lines from the file, until the last read line starts with #
	 *  All lines except this last line are concatenated
	 *  To access the last line, use lr.getPreviouslyReadLine()
	 *  
	 *  overflowLine is the last line that has been previewed to find the end of the previous
	 *  set of values.  The very first time it is null
	 *  
	 * @throws IOException 
	 */
	private String readOneFullLine( String overflowLine, GenericLineReader lr ) throws IOException {
		StringBuffer fullLine;
		
		if( overflowLine==null ) {
			fullLine=new StringBuffer( lr.readLine() );
		} else {
			fullLine=new StringBuffer( overflowLine );
		}
		while( true ) {
			String nextLine = lr.readLine();		
			if( nextLine.startsWith("#") ) {
				//System.out.println("break on: '"+nextLine+"'");
				break;
			}
			fullLine.append( nextLine );
		}
		//System.out.println("readOneFullLine: '"+fullLine.toString()+"'");
		return fullLine.toString();
	}
	
	
	// ======================================================
	// factory methods to load a new simulation
	// ======================================================
	// ======================================================
	// factory methods
	// ======================================================
	public static SimulationHSpiceCSDF read( String filename, String filter, String[] exactNames ) throws IOException {
		
		if( exactNames == null ) {
			exactNames = new String[0];
		}
		
		SimulationHSpiceCSDF simulation = new SimulationHSpiceCSDF( filename, filter, exactNames );	
		return simulation;
	}
	
	public static SimulationHSpiceCSDF read( String filename, String[] exactNames ) throws IOException {
		return read( filename, "", exactNames );
	}
	
	public static SimulationHSpiceCSDF read( String filename, String filter ) throws IOException {
		return read( filename, filter, new String[0] );
	}
	
	public static SimulationHSpiceCSDF read( String filename ) throws IOException {
		return read( filename, ".*", new String[0] );
	}
	
	// ======================================================
	// constructor
	// ======================================================
	/** 
	 *  Construct a new simulationPsfAscii object from the given <code>header</code>
	 *  and <code>body</code>.  
	 */
	private SimulationHSpiceCSDF( String filename, String filter, String[] exactNames  ) throws IOException {		
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
		TickTock ticktock = new TickTock("simulation loader");		
		//SimulationHSpiceCSDF sim = SimulationHSpiceCSDF.read("/users/micas/scoseman/projects/spectreBinaryWaves/examples/hspiceCSDF/RC.tr0");
		SimulationHSpiceCSDF sim = SimulationHSpiceCSDF.read("/users/micas/scoseman/imec/memories/RRAM/framework/verilogModel/netlists/setDC.tr0");
		//SimulationHSpiceCSDF sim = SimulationHSpiceCSDF.read("/users/micas/scoseman/imec/memories/RRAM/framework/verilogModel/netlists/setDC.tr0");
		ticktock.tock();
		
		int L = sim.getHeader().getNumberOfSignalNames();
		for( int i=0 ; i<L ; i++ ) {
			System.out.println( "signal "+i+": "+sim.getHeader().getName(i) );
		}
		
		sim.getSignal( "V(in1)");
		sim.getSignal( "I(vin1)");
		sim.getSignal( "I1(vin1)");
		
	}
	
}
