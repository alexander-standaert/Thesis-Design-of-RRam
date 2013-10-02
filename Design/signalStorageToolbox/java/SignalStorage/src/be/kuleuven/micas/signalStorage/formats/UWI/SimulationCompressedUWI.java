package be.kuleuven.micas.signalStorage.formats.UWI;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Map.Entry;


import be.kuleuven.micas.helpers.FileName;
import be.kuleuven.micas.helpers.HalfPrecision;
import be.kuleuven.micas.helpers.MatrixHelper;
import be.kuleuven.micas.helpers.TicToc;
import be.kuleuven.micas.signalStorage.LoadableSignalDatabaseImpl;
import be.kuleuven.micas.signalStorage.IndexedSignalsImpl;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.IndexedSignals;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;
import be.kuleuven.micas.signals.Signal;

import com.mindprod.ledatastream.LEDataInputStream;

public final class SimulationCompressedUWI extends LoadableSignalDatabaseImpl {

	private static final long serialVersionUID = 1L;

	private static boolean verbose = false;
	
	

	// ------------------------------------------------------------------------
	// helper variables for the load phase.
	// These variables have no meaning in between two loads
	//
	// lists of previously loaded data should be obtained from Header and Body
	// instead 
	//
	// ( format dependent )
	// ------------------------------------------------------------------------
	
	/**
	 *	startIndices: flat signal index ==> position in file [ number of (T,V) pairs ]
	 */
	private Map<Integer, Long> startIndices; 

	/**
	 * signalLengths: flat signal index ==> number of (T,V) pairs
	 */
	private Map<Integer, Integer> signalLengths; 
	
	/**
	 * numberOfTimePoints
	 */
	private int numberOfTimePoints;

	/**
	 * timePoints: the unique list of x-values.  time values in the fileformat are stored as indices in this vector
	 */
	private double[] timePoints;

	
	
	// ------------------------------------------------------------------------------------------
	// factory methods -- load from file
	// ------------------------------------------------------------------------------------------			

	/**
	 * constructs a compressed UWI format (.COA, .COD, .COF, .COH) from the provided file.  
	 * 
	 *  <p>
	 *  The header filename is derived from <code>filename</code> by changing its extension to .HDR
	 *  </p>
	 *  
	 *   @param filename	filename from which to read the body.
	 *   @param filter		java regular expression.  Signals whose name match the expression are loaded. 
	 *   					Use ".*" to load all, use "" to load only the requested exactNames  
	 *   @param exactNames	String[] of names.  Signals whose name exactly match one of the entries are loaded.
	 *   					Pass new String[0] to match none
	 *   @return	the requested simulation data
	 *   @throws IOException
	 */
	public static SimulationCompressedUWI read( String filename, String filter, String[] exactNames ) throws IOException {		
		String headerFilename = FileName.changeExtension( filename, "HDR" );
		return readFromFileAndHeader( filename, headerFilename, filter, exactNames );				
	}
		
	/**
	 * reads the signals whose name matches exactly with one of the entries in exactMatches
	 * 
	 * @param filename
	 * @param exactNames
	 * @return
	 * @throws IOException
	 */
	public static SimulationCompressedUWI read( String filename, String[] exactNames ) throws IOException {		
		return read( filename, "", exactNames );				
	}
	
	/**
	 * reads the signals whose names match the given java regexp filter
	 * 
	 * @param filename
	 * @param filter
	 * @return
	 * @throws IOException
	 */
	public static SimulationCompressedUWI read( String filename, String filter ) throws IOException {	
		return read( filename, filter, new String[0] );				
	}
	
	/**
	 * reads all signals
	 * 
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static SimulationCompressedUWI read( String filename ) throws IOException {			
		return read( filename, ".*", new String[0] );		
	}
	
		
	/**
	 *	constructs a compressed UWI format (.COA, .COD, .COF, .COH) from the provided file.  
	 *	Reads the header from the provided headerfile
	 *
	 * @param filename				filename from which to read the body
	 * @param headerFilename		filename from which to read the header
	 * @param filter
	 * @param exactNames
	 * @return	the requested simulation data
	 * @throws IOException
	 */
	public static SimulationCompressedUWI readFromFileAndHeader( String filename, String headerFilename, String filter, String[] exactNames ) throws IOException {
	
		if( !SimulationCompressedUWI.filetypeSupported( filename ) ) {
			throw new IllegalArgumentException( "fileType not supported by CompressedUWI: '"+filename+"'" );
		}
				
		NamesIndex header = ReaderHDR.readFileHDR( headerFilename );
		long headerTimeStamp = new File( headerFilename ).lastModified();
		
		SimulationCompressedUWI sim = readFromFileAndHeader(filename, header, filter, exactNames );
		
		sim.setHeaderFilename(headerFilename);
		sim.setLoadedHeaderVersion( headerTimeStamp );
		return sim;
	}
	
	public static SimulationCompressedUWI readFromFileAndHeader( String filename, String headerFilename, String filter ) throws IOException {		
		return readFromFileAndHeader( filename, headerFilename, filter, new String[0] );
	}
	
	public static SimulationCompressedUWI readFromFileAndHeader( String filename, String headerFilename, String[] exactNames ) throws IOException {
		return readFromFileAndHeader( filename, headerFilename, "", exactNames );
	}

	public static SimulationCompressedUWI readFromFileAndHeader( String filename, String headerFilename ) throws IOException {
		return readFromFileAndHeader( filename, headerFilename, ".*", new String[0]  );		
	}
		
	/**
	 * reads a simulation from the given <code>filename</code>, assuming that the provided <code>header</code> applies to this file.
	 * 
	 * @param filename
	 * @param header
	 * @param filter
	 * @param exactNames
	 * @return
	 * @throws IOException
	 */
	public static SimulationCompressedUWI readFromFileAndHeader( String filename, NamesIndex header, String filter, String[] exactNames ) throws IOException {
		
		if( !SimulationCompressedUWI.filetypeSupported(filename) ) {
			throw new IllegalArgumentException( "fileType not supported by CompressedUWI: '"+filename+"'" );
		}
		
		if( exactNames == null ) {
			exactNames = new String[0];
		}
		
		IndexedSignalsImpl emptyBody = new IndexedSignalsImpl( header.getNumberOfSignalNames());
				
		// this is where the Simulation object is created
		SimulationCompressedUWI simulation = new SimulationCompressedUWI( filename, header, emptyBody, filter, exactNames );
		
		return simulation;
	}
	
	public static SimulationCompressedUWI readFromFileAndHeader( String filename, NamesIndex header, String[] exactNames ) throws IOException {
		return readFromFileAndHeader( filename, header, "", exactNames );
	}
	
	public static SimulationCompressedUWI readFromFileAndHeader( String filename, NamesIndex header, String filter ) throws IOException {
		return readFromFileAndHeader( filename, header, filter, new String[0] );
	}
	
	public static SimulationCompressedUWI readFromFileAndHeader( String filename, NamesIndex header ) throws IOException {
		return readFromFileAndHeader( filename, header, ".*", new String[0] );
	}
	
	
	/** 
	 *  Construct a new simulationCompressedUWI object by reading data from the given <code>filename</code>. 
	 *  The provided <code>header</code> is used.
	 *
	 *  Only signals whose name matches either the regular expression <code>filter</code> or one of
	 *  the entries in <code>exactNames</code> are loaded
	 * 
	 * 	The constructed object (this) implements the SimulationOutput interface, so all
	 *  these methods are available to access the data.
	 */
	private SimulationCompressedUWI( String filename, NamesIndex header, IndexedSignals emptyBody, String filter, String[] exactNames ) throws IOException {
		
		super( header, emptyBody  );	
		
		startIndices  = new HashMap<Integer, Long   >();
		signalLengths = new HashMap<Integer, Integer>();		
		setBodyFilename(filename);
			
		loadTheseSignals( filter, exactNames );				
	}
	
	// --------------------------------------------------------------------------
	// Code to actually read the file body -- specific to this format
	// --------------------------------------------------------------------------	

	protected NamesIndex readHeader( String headerFilename ) throws IOException {
		return ReaderHDR.readFileHDR( headerFilename );
	}
	
	/**
	 * Read the requested signals from the file body
	 * 
	 * <p>
	 * Before this method is called, 
	 * - the header has been loaded/set
	 * - getRequestedSignalEntries() and getRequestedSignalIndices() has been set
	 * - signalLengths and startIndices have been created
	 * </p>
	 * 
	 * After successful completion of this method, the requested signals
	 * have been added to <code>this</code> Simulation 
	 */
	protected void readFileBody(  ) throws IOException {
		
		String filename = getBodyFilename();
		String extension = FileName.getExtension( filename );
		
		long start = TicToc.tic( verbose );		
		if( "COA".matches( extension ) ) {
			readAscii( filename );
		} else {			
			readBinary( filename, extension );
		}		
		TicToc.tocP( verbose, start, "readAscii/readBinary" );
		
		//body.setAllXValues( timePoints );	
	}
	
	/**
	 * read a COA file, store result in the signalDatabase
	 */
	private void readAscii( String filename ) throws IOException {
		
		BufferedReader bf = new BufferedReader( new InputStreamReader( new FileInputStream(filename)) );

		
		//read "number of time points"
		String numberOfTimePointsLine = bf.readLine();
		numberOfTimePoints = Integer.valueOf( numberOfTimePointsLine.trim() );
		System.out.println( "numberOfTimePoints="+numberOfTimePoints);		
		timePoints=new double[ numberOfTimePoints ];
		
		// read "starting index of each waveform"
		String startPositionsLine = bf.readLine();		
		Scanner tokenize=new Scanner( startPositionsLine );
		int i=0;
		long previousStartPos = 0;
		boolean mustUpdateLength = false;
		while( tokenize.hasNext()) {			
			long startPos = tokenize.nextLong();			
			if( mustUpdateLength ) {
				signalLengths.put( new Integer(i-1), new Integer( (int) (startPos - previousStartPos) ) ); 
				mustUpdateLength=false;
			}			
			if( isSignalRequested(i) ) {
				startIndices.put( new Integer(i), new Long( startPos ) );
				//requestedSignalLengths.put( new Integer(i), new Integer( Integer.MAX_VALUE) ); // ensures last one is also ok
				mustUpdateLength=true;
			}
			previousStartPos = startPos;
			i=i+1;
		}
		
		// read "time points"
		String timePointsLine = bf.readLine();		
		tokenize=new Scanner( timePointsLine );
		i=0;
		while( tokenize.hasNext()) {
			timePoints[i] = tokenize.nextDouble();
			i=i+1;
		}		
					
		// read all requested signals		
		  //long basePosition = bf.getFilePointer(); // start of signal 0		
		//int[] readIndices = header.getReadIndices();
		
	    int timeIndexSize = 6;
	    int valueSize = 14;
	    int newlineSize=1;  // 1 for linux systems...
		
		int previousSignalIndex=-1;
		
		long currentPosition=0; // in bytes
		
		//System.out.println("number of readIndices: "+readIndices.length );
		
		List<Double> xV = new ArrayList<Double>();
		List<Double> yV = new ArrayList<Double>();
		String xName = "time";
		String xUnit = "s";
		
		//printInfo();
		
		for( int j=0 ; j<getRequestedSignalIndices().length ; j++ ) {			
			int thisSignalIndex = getRequestedSignalIndices()[j];			
			long startIndex=startIndices.get( new Integer(thisSignalIndex) );
						
			if( previousSignalIndex!=( thisSignalIndex-1) ) {
				long startPosition = startIndex * (timeIndexSize+valueSize) + thisSignalIndex*newlineSize;
				long jump = startPosition - currentPosition;
				//System.out.println("about to skip "+jump+" characters.");
				bf.skip(jump);
				currentPosition=startPosition;
			}
						
			xV.clear();
			yV.clear();
			
			String line = bf.readLine();
			Scanner tokenizer = new Scanner( line );
			while( tokenizer.hasNext() ) {
				int xIndex = tokenizer.nextInt();
				double yValue = tokenizer.nextDouble();
				double xValue = timePoints[xIndex];
				xV.add(xValue);
				yV.add(yValue);				
			}				
			double[] xValues = MatrixHelper.toArray( xV );
			double[] yValues = MatrixHelper.toArray( yV );
			HeaderEntry entry = getRequestedSignalEntries().get(new Integer( thisSignalIndex ) );;
			String yName = entry.getName();
			String yUnit = entry.getUnit();
						
			Signal signal = new Signal(xValues, xName, xUnit, yValues, yName, yUnit );
			
			this.addSignal(thisSignalIndex, signal);
			
			currentPosition = currentPosition + line.length() + newlineSize;
			previousSignalIndex = thisSignalIndex;
		}
		
		bf.close();
	}

	/**
	 * read a COD, COF or COH file, store result in the signalDatabase
	 * 
	 * Notice: this method must support duplicate signal names.  With selective reading, only the
	 * first one is read.
	 */	
	private void readBinary( String filename, String extension ) throws IOException {
		
		LEDataInputStream bf = new LEDataInputStream( new BufferedInputStream( new FileInputStream(filename) ) );
		
		// read "number of time points" 
		numberOfTimePoints = bf.readInt();
		System.out.println( "numberOfTimePoints="+numberOfTimePoints);		
		timePoints=new double[ numberOfTimePoints ];
		
		
		// read "starting index of each waveform"		
		int L = header.getNumberOfSignalNames();
		long previousStartPos = 0;
		boolean mustUpdateLength = false;
		for( int i=0 ; i<(L+1) ; i++ ){
			long startPos = bf.readInt(); // integer ... in file format...  limited to 4G (time-value pairs, with a twist to 4G per signal)
			if( mustUpdateLength) {
				signalLengths.put( new Integer(i-1), new Integer( (int) (startPos - previousStartPos) ) ); 
				mustUpdateLength=false;
			}			
			if( isSignalRequested(i) ) {
				startIndices.put( new Integer(i), new Long( startPos ) );				
				//requestedSignalLengths.put( new Integer(i), new Integer( Integer.MAX_VALUE ) ); 
				mustUpdateLength=true;
			}
			previousStartPos = startPos;
		}
		
				
		// read "time points"
		for( int i=0 ; i<numberOfTimePoints ; i++ ) {
			timePoints[i] = bf.readDouble();
		}
					
		// read all requested signals		
		//long basePosition = bf.getFilePointer(); // start of signal 0		
		//int[] readIndices = header.getReadIndices();
		
		int timeIndexSize = 2;
		int newlineSize=0;
		if( numberOfTimePoints>65535 ) {
			timeIndexSize = 4;
		}		
		int valueSize = 8;
	    
		if( "COD".matches(extension) ) {
			valueSize = 8;
		}
		if( "COF".matches(extension) ) {
			valueSize = 4;
		}
		if( "COH".matches(extension) ) {
			valueSize = 2;
		}
				
		int previousSignalIndex=-1;
		long currentPosition=0;
		
//		List<Double> xV = new ArrayList<Double>();
//		List<Double> yV = new ArrayList<Double>();
		String xName = "time";
		String xUnit = "s";
		
		//printInfo();
		
		for( int j=0 ; j<getRequestedSignalIndices().length ; j++ ) {			
			int thisSignalIndex = getRequestedSignalIndices()[j];			
			long startIndex=startIndices.get( new Integer(thisSignalIndex) );
			
			if( previousSignalIndex!=( thisSignalIndex-1) ) {
				long startPosition = startIndex * (timeIndexSize+valueSize) + thisSignalIndex*newlineSize;				
				long jump = startPosition - currentPosition;
				bf.skipBytes( (int) jump );
				currentPosition=startPosition;
			}
					
//			xV.clear();
//			yV.clear();
			int valuesToRead = signalLengths.get( thisSignalIndex ).intValue();		    
			
			double[] xV = new double[ valuesToRead ];
			double[] yV = new double[ valuesToRead ];
			
			//int bytesToRead = valuesToRead * (timeIndexSize+valueSize);			
			//byte[] buffer = new byte[ bytesToRead ];			
			//bf.readFully(buffer, 0, bytesToRead );
			
			getSignalBinary( xV, yV, valuesToRead, bf, timeIndexSize, valueSize );	
					
//			double[] xValues = MatrixHelper.toArray( xV );
//			double[] yValues = MatrixHelper.toArray( yV );
			HeaderEntry entry = getRequestedSignalEntries().get(new Integer( thisSignalIndex ) );;
			//HeaderEntry entry = header.getEntry(new Integer( thisSignalIndex ) ); // this is several times slower!
			
			String yName = entry.getName();
			String yUnit = entry.getUnit();
						
			Signal signal = new Signal(xV, xName, xUnit, yV, yName, yUnit );
			
			this.addSignal(thisSignalIndex, signal);
			
			currentPosition = currentPosition + valuesToRead*(timeIndexSize+valueSize)+newlineSize; 
			previousSignalIndex=thisSignalIndex;	
			
		}
		bf.close();
	}

	
	/*
	 * store result in xv, yv ; read N values (or until end of file) ;  
	 */
	private void getSignalBinary( double[] xV, double[] yV, long N, LEDataInputStream bf, int timeIndexSize, int valueBytes ) throws IOException {
				
		int tIndex;
		double yValue;
		
//		if( timeIndexSize==2 ) {			
//			if( valueBytes==2 ) {
//				
//			}
//		}
		
//		try {
		for( int i=0 ; i<N ; i++ ) {	
			tIndex = readIndexB( bf, timeIndexSize );			
			yValue = readValueB( bf, valueBytes );			
			xV[i] = timePoints[tIndex];
			yV[i] = yValue;
		}
//		} catch( EOFException e ) {
//			//done
//		}
			
		
	}
	
	/*
	 * indexSize must be 2 or 4
	 */
	private final int readIndexB( LEDataInputStream bf, int indexSize ) throws IOException {
		if( indexSize==2 ) {
			return bf.readUnsignedShort( );
		} else {
			return bf.readInt( );
		}
	}

	
	/*
	 * support for valueSize=2 (half precision, with self-defined pre-scaling ),
	 *             valueSize=4 (single precision),
	 *             valueSize=8 (double precision) 
	 */
	private final double readValueB( LEDataInputStream bf, int valueSize ) throws IOException {
		int bits;
		switch( valueSize) {
		case 8:	return bf.readDouble();
		case 4:	bits = bf.readInt( );
				return Float.intBitsToFloat( bits );
		case 2:	bits = bf.readUnsignedShort();			 
				return HalfPrecision.HPFtoFloat( bits ) / 1024;         
		default:throw new IllegalArgumentException("wrong valueSize");
		}
		
	}
	
	// -------------------------------------------------------------------------
	// Auxiliary methods
	// -------------------------------------------------------------------------
	
	/**
	 * debug method - print all information of what has been loaded
	 *
	 * @deprecated
	 */
	public void printInfo( ) {
		
		System.out.println( "numberOfTimePoints="+numberOfTimePoints);
		
		System.out.println( "startIndices..." );
		if( startIndices!=null ) {
			for( Entry<Integer,Long> entry : startIndices.entrySet() ) {
				System.out.println( "  key="+entry.getKey()+", value="+entry.getValue() );
			}
		}
		
		System.out.println( "requestedSignalLengths..." );
		if( startIndices!=null ) {
			for( Entry<Integer,Integer> entry : signalLengths.entrySet() ) {
				System.out.println( "  key="+entry.getKey()+", value="+entry.getValue() );
			}
		}		
		
		System.out.println( "headerEntries..." );
		if( startIndices!=null ) {
			for( Entry<Integer,HeaderEntry> entry : getRequestedSignalEntries().entrySet() ) {
				System.out.println( "  key="+entry.getKey()+", value="+entry.getValue() );
			}
		}
		
		System.out.println( "getRequestedSignalIndices()..." );
		if( getRequestedSignalIndices()!=null ) {
			for( int i=0 ; i<getRequestedSignalIndices().length ; i++ ) {
				System.out.println("  "+i+". "+getRequestedSignalIndices()[i] );
			}
		}
		
		System.out.println("number of time points: "+numberOfTimePoints );
		
		System.out.println( "timePoints..." );
		if( timePoints!=null ) {
			for( int i=0 ; i<timePoints.length ; i++ ) {
				System.out.println("  "+i+". "+timePoints[i] );
			}
		}
		
	}

	
	/**
	 *  checks whether <code>filename</code> represents a known fileformat 
	 * 
	 */
	public static boolean filetypeSupported( String filename ) {
		
		String extension = FileName.getExtension( filename );
		if( extension.matches("COA") || extension.matches("COD") ||
			extension.matches("COF") || extension.matches("COH")	 ) {
				// OK
			return true;
		}
		return false;
	}
	

	// ----------------------------------------------------------
	// main 
	// ----------------------------------------------------------	
	public static void main( String[] args ) throws IOException {
		
		System.out.println( "Header main()" );
		
		//String filename = "/users/micas/scoseman/projects/spectreBinaryWaves/examples/UWI_CO_H/tran1.tran.COF";
		String filename = "/users/micas/scoseman/projects/spectreBinaryWaves/exampleUltrasim/entireMemory/UWI_ultrasim/top.COF";
		//String filename = "/volume1/users/scoseman/dataUWI/top.COF";
		

		//SimulationOutput sim = read(filename, ".*" );
		
		long t1 = TicToc.tic( verbose );	
		//SimulationCompressedUWI sim = read( filename );
		SimulationCompressedUWI sim = read( filename, "V.*" );
		TicToc.tocP( t1, "done reading file ('.*' )" );
			
		System.out.println("signalNames   : "+sim.getNumberOfSignalNames() );
		System.out.println("signals loaded: "+sim.getAvailableSignalIndices().length );
		
		new File( filename ).setLastModified( new Date().getTime() );
		
		t1 = TicToc.tic( verbose );
		String[] exactNames = sim.getNamesForFilter( "d.*" );
		TicToc.tocP( t1, "sim.getNamesForFilter( 'd.*' )" );
		t1 = TicToc.tic( verbose );		
		try {
			sim.load( exactNames );
		} catch( ConcurrentModificationException e ) {
			sim.reload();
			sim.load( exactNames );
		}
		
		TicToc.tocP( t1, "loading "+ exactNames.length +" additional signals" );
		System.out.println("signalNames   : "+sim.getNumberOfSignalNames() );
		System.out.println("signals loaded: "+sim.getAvailableSignalIndices().length );		
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

///*	body = getSimulationBody()
//* 
//*/
//public SimulationBody getSimulationBody() {
//	return body;
//}

//List<List<Double>> getyValues() {
//	return yValues;
//}
//
//List<List<Double>> getxValues() {
//	return xValues;
//}

//private final int readIndexB2( LEDataInputStream bf ) throws IOException {
//return bf.readUnsignedShort( );
//}
//private final int readIndexB4( LEDataInputStream bf ) throws IOException {
//return bf.readInt( );
//}


//private void reload( boolean keepPreviousSignals, String filter, String[] exactNames ) throws IOException {		
//	
//	int[] indices;
//	
//	long start = TicToc.tic( verbose );
//	if( keepPreviousSignals ) {
//		if( isBodyUpdated() ) {
//			if(verbose) { System.out.println("body file was updated"); }
//			indices = this.getBody().getAvailableSignalIndices(); // reload the previously available signals				
//			
//			if( isHeaderUpdated() ) {
//				if(verbose) { System.out.println("header file was updated"); }
//				// note: when the header changes, it is not certain that indices 
//				//will stay correct, so go to names first
//				long start2 = TicToc.tic( verbose );
//				//String[] tempExactNames = this.getNames(indices); // takes very much time ...
//				String[] tempExactNames = this.getLoadedSignalNames();
//				TicToc.tocP( verbose, start2, "obtaining names from indices"); 
//				exactNames = ArrayMerger.mergeSets( exactNames, tempExactNames );
//				indices=new int[0];
//				
//				long stamp = new File( getHeaderFilename() ).lastModified();
//				header = ReaderHDR.readFileHDR( getHeaderFilename() );
//				setLoadedHeaderVersion( stamp );
//				
//			}
//			getBody().removeAllSignals(); // must start from scratch when body is updated
//			
//		} else { // body was not updated				
//			if(verbose) { System.out.println("body file was not updated"); }
//			indices=new int[0]; // no need to reload the previously available signals
//		}
//	} else { // do not keep previous signals
//		indices = new int[0];
//		this.getBody().removeAllSignals();
//		//TODO: do not remove the signals that are requested again (performance tweak)
//	}
//	TicToc.tocP( verbose, start, "reload: precombine selected signals");
//			
//	loadTheseSignals( filter, exactNames, indices );
//			
//}


///**
// * Sets which signals are requested.  This method is used both during construction and during reloads.
// * Signals are loaded in any of the following cases:
// * 
// * their index is in indices
// * 
// * 
// * @param header
// * @param filter
// * @param exactNames
// * @param indices
// */
//private void setRequestedSignals( String filter, String[] exactNames, int[] indices ) {
//	
//	int numberOfSignals = header.getNumberOfSignalNames();		
//			
//	HeaderEntry[] requestedNameEntries;
//	
//	
//	long start = TicToc.tic( verbose );
//	// get the names that match the given request
//	if( filter==null || filter.length()==0 ) { 
//		requestedNameEntries = header.getEntries(exactNames); // can be much faster ...
//	} else {
//		requestedNameEntries = header.getEntriesForFilter(filter, exactNames );  
//	}
//	TicToc.tocP( verbose, start, "header.getEntries/getEntriesForFilter");
//		
//	start = TicToc.tic( verbose );
//	// add the matches to filter or exactNames to getRequestedSignalEntries()
//	int L = requestedNameEntries.length;
//	int initialCapacity = (int) ( Math.sqrt(L) * Math.sqrt(numberOfSignals) ); //geometrical average		
//	getRequestedSignalEntries() = new HashMap<Integer, HeaderEntry>( initialCapacity );		
//	for( int i=0 ; i<L; i++ ) {
//		getRequestedSignalEntries().put( requestedNameEntries[i].getIndex(), requestedNameEntries[i] );		
//	}
//	TicToc.tocP( verbose, start, "put name matches in getRequestedSignalEntries()");
//	
//	start = TicToc.tic( verbose );
//	// add the given indices to getRequestedSignalEntries() ( if not already added )
//	for( int i=0 ; i<indices.length ; i++ ) {
//		int index = indices[ i ];
//		if( getRequestedSignalEntries().containsKey( index ) ) {
//			//it was already in there ... do nothing
//		} else {
//			HeaderEntry entry = header.getEntry( index );
//			getRequestedSignalEntries().put( index, entry );
//		}
//	}		
//	TicToc.tocP( verbose, start, "put indices into getRequestedSignalEntries()");
//	
//	start = TicToc.tic( verbose );
//	
//	//getRequestedSignalEntries() = new HashMap<Integer, HeaderEntry>( initialCapacity );
//	L = getRequestedSignalEntries().size();		
//	
//	startIndices  = new HashMap<Integer, Long   >(initialCapacity);
//	signalLengths = new HashMap<Integer, Integer>(initialCapacity);
//	getRequestedSignalIndices() = new int[ L ];
//			
//	if(verbose) { System.out.println( "Number of requested entries "+getRequestedSignalEntries().size() ); }
//	
//	int i=0;
//	for( HeaderEntry entry : getRequestedSignalEntries().values() ) {			
//		getRequestedSignalIndices()[i] = entry.getIndex();
//		i=i+1;
//		//System.out.println( "requested entry: "+entry.getName()+" (" + entry.getIndex()+")" );
//	}
//	TicToc.tocP( verbose, start, "Make getRequestedSignalIndices()");
//	
//	start = TicToc.tic( verbose );
//	Arrays.sort( getRequestedSignalIndices() ); // must be sorted for monotonic sweep through file
//	TicToc.tocP( verbose, start, "Sort getRequestedSignalIndices()");
//	//body = new SimulationBody( initialCapacity );
//	
//}