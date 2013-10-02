package be.kuleuven.micas.signalStorage.formats.UWI;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;

import be.kuleuven.micas.helpers.FileName;
import be.kuleuven.micas.helpers.HalfPrecision;
import be.kuleuven.micas.helpers.MatrixHelper;
import be.kuleuven.micas.helpers.TicToc;
import be.kuleuven.micas.signalStorage.IndexedSignalsImpl;
import be.kuleuven.micas.signalStorage.LoadableSignalDatabaseImpl;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.IndexedSignals;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;
import be.kuleuven.micas.signals.Signal;

import com.mindprod.ledatastream.LEDataInputStream;

public final class SimulationNonCompressedUWI extends LoadableSignalDatabaseImpl {

	private static final long serialVersionUID = 1L;

	private static boolean verbose = false;
	
	// ------------------------------------------------------------------------------------------
	// factory methods -- load from file
	// ------------------------------------------------------------------------------------------			

	/**
	 * constructs a noncompressed UWI database (.NCA, .NCD, .NCF, .NCH) from the provided file.  
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
	public static SimulationNonCompressedUWI read( String filename, String filter, String[] exactNames ) throws IOException {		
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
	public static SimulationNonCompressedUWI read( String filename, String[] exactNames ) throws IOException {		
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
	public static SimulationNonCompressedUWI read( String filename, String filter ) throws IOException {	
		return read( filename, filter, new String[0] );				
	}
	
	/**
	 * reads all signals
	 * 
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static SimulationNonCompressedUWI read( String filename ) throws IOException {			
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
	public static SimulationNonCompressedUWI readFromFileAndHeader( String filename, String headerFilename, String filter, String[] exactNames ) throws IOException {
	
		if( !SimulationNonCompressedUWI.filetypeSupported( filename ) ) {
			throw new IllegalArgumentException( "fileType not supported by NonCompressedUWI: '"+filename+"'" );
		}
				
		NamesIndex header = ReaderHDR.readFileHDR( headerFilename );
		long headerTimeStamp = new File( headerFilename ).lastModified();
		
		SimulationNonCompressedUWI sim = readFromFileAndHeader(filename, header, filter, exactNames );
		
		sim.setHeaderFilename(headerFilename);
		sim.setLoadedHeaderVersion( headerTimeStamp );
		return sim;
	}
	
	public static SimulationNonCompressedUWI readFromFileAndHeader( String filename, String headerFilename, String filter ) throws IOException {		
		return readFromFileAndHeader( filename, headerFilename, filter, new String[0] );
	}
	
	public static SimulationNonCompressedUWI readFromFileAndHeader( String filename, String headerFilename, String[] exactNames ) throws IOException {
		return readFromFileAndHeader( filename, headerFilename, "", exactNames );
	}

	public static SimulationNonCompressedUWI readFromFileAndHeader( String filename, String headerFilename ) throws IOException {
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
	public static SimulationNonCompressedUWI readFromFileAndHeader( String filename, NamesIndex header, String filter, String[] exactNames ) throws IOException {
		
		if( exactNames == null ) {
			exactNames = new String[0];
		}
		
		if( !SimulationNonCompressedUWI.filetypeSupported(filename) ) {
			throw new IllegalArgumentException( "fileType not supported by CompressedUWI: '"+filename+"'" );
		}
		IndexedSignalsImpl emptyBody = new IndexedSignalsImpl( header.getNumberOfSignalNames());
		
		// this is where the Simulation object is created
		SimulationNonCompressedUWI simulation = new SimulationNonCompressedUWI( filename, header, emptyBody, filter, exactNames );
		
		return simulation;
	}
	
	public static SimulationNonCompressedUWI readFromFileAndHeader( String filename, NamesIndex header, String[] exactNames ) throws IOException {
		return readFromFileAndHeader( filename, header, "", exactNames );
	}
	
	public static SimulationNonCompressedUWI readFromFileAndHeader( String filename, NamesIndex header, String filter ) throws IOException {
		return readFromFileAndHeader( filename, header, filter, new String[0] );
	}
	
	public static SimulationNonCompressedUWI readFromFileAndHeader( String filename, NamesIndex header ) throws IOException {
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
	private SimulationNonCompressedUWI( String filename, NamesIndex header, IndexedSignals emptyBody, String filter, String[] exactNames ) throws IOException {
		
		super( header, emptyBody  );		
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
		if( "NCA".matches( extension ) ) {
			readAscii( filename );
		} else {			
			readBinary( filename, extension );
		}		
		TicToc.tocP( verbose, start, "readAscii/readBinary" );
		
		//body.setAllXValues( timePoints );	
	}
	
	/**
	 * read a NCA file, store results in the signalDatabase
	 */
	private void readAscii( String filename ) throws IOException {
		
		BufferedReader bf = new BufferedReader( new InputStreamReader( new FileInputStream(filename)) );
						
		List<Double> xValues = new ArrayList<Double>();
		Map<Integer,List<Double>> yValues = new HashMap<Integer,List<Double>>();		
		int[] requestedIndices = getRequestedSignalIndices() ;
		int maxIndex = 0;
		for( int i : requestedIndices ) {
			yValues.put( i, new ArrayList<Double>() );
			maxIndex = Math.max( i, maxIndex );
		}
				
		// read each line into xValues and yValues(i), with i in the set of requested signals		
		while( true ) {
			String oneLine = bf.readLine();
			if( oneLine==null ) { //EOF
				break;
			}
			Scanner tokenize=new Scanner( oneLine );
			double timePoint = tokenize.nextDouble();
			xValues.add(timePoint);
			for( int i=0 ; i<=maxIndex ; i++ ) {
				if( isSignalRequested(i) ) {
					double yval = tokenize.nextDouble();
					yValues.get(i).add(yval);
				} else {
					tokenize.next();
				}
			}			
		}
		
		String xName = "time";
		String xUnit = "s";
		
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
				
		bf.close();
	}

	/**
	 * read a NCD, NCF or NCH file, store result in the signalDatabase
	 */
	private void readBinary( String filename, String extension ) throws IOException {
		
		int valueSize=0;
		if( "NCD".matches(extension) ) {
			valueSize = 8;
		}
		if( "NCF".matches(extension) ) {
			valueSize = 4;
		}
		if( "NCH".matches(extension) ) {
			valueSize = 2;
		}
		
		LEDataInputStream bf = new LEDataInputStream( new BufferedInputStream( new FileInputStream(filename) ) );
						
		List<Double> xValues = new ArrayList<Double>();
		Map<Integer,List<Double>> yValues = new HashMap<Integer,List<Double>>();		
		int[] requestedIndices = getRequestedSignalIndices() ;
		int maxIndex = 0;
		for( int i : requestedIndices ) {
			yValues.put( i, new ArrayList<Double>() );
			maxIndex = Math.max( i, maxIndex );
		}
				
		// read each line into xValues and yValues(i), with i in the set of requested signals		
		while( true ) {			
			// read time value
			try {
				double timePoint = bf.readDouble();
				//System.out.println( "t="+timePoint );
				xValues.add(timePoint);
			} catch( IOException e ) {
				// should be EOF
				break;
			}		
			// read yValues for the current time value
			for( int i=0 ; i<getNumberOfSignalNames() ; i++ ) {				
				double yval = readValueB( bf, valueSize );
				if( isSignalRequested(i) ) {
					yValues.get(i).add(yval);
				} 
			}			
		}
		
		String xName = "time";
		String xUnit = "s";
		
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
				
		bf.close();
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
	
		System.out.println( "getRequestedSignalIndices()..." );
		if( getRequestedSignalIndices()!=null ) {
			for( int i=0 ; i<getRequestedSignalIndices().length ; i++ ) {
				System.out.println("  "+i+". "+getRequestedSignalIndices()[i] );
			}
		}
		
	}

	
	/**
	 *  checks whether <code>filename</code> represents a known fileformat 
	 * 
	 */
	public static boolean filetypeSupported( String filename ) {
		
		String extension = FileName.getExtension( filename );
		if( extension.matches("NCA") || extension.matches("NCD") ||
			extension.matches("NCF") || extension.matches("NCH")	 ) {
				// OK
			return true;
		}
		return false;
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
		//SimulationNonCompressedUWI sim = SimulationNonCompressedUWI.read("/users/micas/scoseman/projects/spectreBinaryWaves/examples/spectreNonCompressed/UWI/tran1.tran.NCA");
		SimulationNonCompressedUWI sim = SimulationNonCompressedUWI.read("/users/micas/scoseman/projects/spectreBinaryWaves/examples/spectreNonCompressed/UWI/tran1.tran.NCF");
		
		int L = sim.getHeader().getNumberOfSignalNames();
		for( int i=0 ; i<L ; i++ ) {
			System.out.println( "signal "+i+": "+sim.getHeader().getName(i) );
		}
		
	}
	
	
}
