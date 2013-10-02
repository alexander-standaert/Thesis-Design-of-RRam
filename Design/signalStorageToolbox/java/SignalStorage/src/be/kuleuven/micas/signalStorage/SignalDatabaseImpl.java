package be.kuleuven.micas.signalStorage;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.regex.Pattern;

import be.kuleuven.micas.helpers.MetaInfo;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.SignalDatabase;
import be.kuleuven.micas.signalStorage.interfaces.IndexedSignals;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;
import be.kuleuven.micas.signalStorage.interfaces.exceptions.SignalDoesNotExistException;
import be.kuleuven.micas.signalStorage.interfaces.exceptions.SignalNotAvailableException;
import be.kuleuven.micas.signals.Signal;


/** 
 * stores waveform names and signals, typically as loaded from a file.
 * 
 * <p>
 * 	<code>header</code> must store the names in the same order
 *  as they are stored in <code>body</code>.
 *  
 *  All interaction with <code>body</code> happens based on the signal index,  
 *  while <code>header</code> allows to lookup signal indices by name
 * </p>
 * 

 *  <p>
 *  The default implementation of <code>loadSignal</code> checks which
 *  of the requested signals are not yet available.  If at least one is not
 *  available, it creates a set with all requested signalIndices 
 *  ( new and previously loaded signals ) and will call 
 *  <code>reloadEntirely( signalIndices )</code>.
 *  This method should be implemented in the subclass.
 *  </p>
 *  <p>
 * 	Subclasses that can provide an efficient reload scheme should overload
 *  the <code>loadSignal</code> methods directly
 *  </p>
 *  
 *  TODO: this class was not serializable.  Is there a reason for this ?  I don't think so
 * 
 */
public class SignalDatabaseImpl implements SignalDatabase, Serializable {

	private static final long serialVersionUID = 1L;
	protected static boolean verbose = false;
	
	protected NamesIndex 		header;
	protected IndexedSignals   	body;
	
	protected boolean firstSignalNameCaseSwapWarningGiven = false;
		
	// ------------------------------------------------------------------------------------------
	// constructor
	// ------------------------------------------------------------------------------------------	
	public SignalDatabaseImpl( NamesIndex header, IndexedSignals body ) {
		this.header = header;
		this.body = body;		
	}	
	
	
	protected SignalDatabaseImpl( ) {
		this.header = null;
		this.body   = null;		
	}	

	// ------------------------------------------------------------------------------------------
	// public methods to interact with results
	// ------------------------------------------------------------------------------------------	

	public NamesIndex getHeader() {
		return header;
	}

	public IndexedSignals getBody() {
		return body;
	}
	
	// ---------------------------------------------------
	// SimulationBody methods
	// ---------------------------------------------------
	
	public Signal getSignal( String name ) {
		int index;		
		try {			
			index = header.getIndex( name );
		} catch( SignalDoesNotExistException e ) {
			if(!firstSignalNameCaseSwapWarningGiven) {
				System.out.println(  "WARNING: the requested signal '"+name+"' does not exist");
			}
			HeaderEntry entry = findMatch( name );			
			if( entry==null ) {
				throw( e );
			}
			String usedName = entry.getName();
			index    = entry.getIndex();
			
			if(!firstSignalNameCaseSwapWarningGiven) {				
				System.out.println( "		  returning '" + usedName + "' instead" );
				System.out.println( "		  Future warnings of this kind will be suppressed"  );
				firstSignalNameCaseSwapWarningGiven = true;
			}
		}
		
		try {
			return body.getSignal(index);
		} catch( SignalNotAvailableException e ) {
			throw new SignalNotAvailableException( "Signal '"+name+"' is not available in memory." );
		}
	}

	/**
	 * Try to find a signal name that might match the provided name
	 * Tries to provide some support for cross-simulator naming, but very limited 
	 */
	protected HeaderEntry findMatch( String name ) {		
		
		
		// in some other casing?
		String literalName = Pattern.quote( name );
		HeaderEntry[] entries = header.getEntriesForFilter( "(?i)"+literalName );
		
		if( entries.length > 0 ) {
			return entries[0];
		}
		
		if( name.toUpperCase().startsWith("I") ) {
			String testName = "I1"+ name.substring(1);
			literalName = Pattern.quote( testName );
			entries = header.getEntriesForFilter( "(?i)"+literalName );
		}		
		if( entries.length > 0 ) {
			return entries[0];
		}
		return null;
		
	}
	
	public Signal[] getSignals( String[] names ) {
		int[] indices = header.getIndices( names );
		int L=names.length;
		Signal[] signals = new Signal[ L ];
		for( int i=0 ; i<L ; i++ ) {
			signals[i]=getSignal( indices[i] );
		} 	
		return signals;
	}
	
	public Signal[] getSignalsForFilter( String filter ) throws IOException {
		int[] indices = header.getIndicesForFilter(filter, null );		
		int L=indices.length;
		Signal[] signals = new Signal[ L ];
		for( int i=0 ; i<L ; i++ ) {			
			signals[i]=getSignal( indices[i] );
		} 	
		return signals;
	}

	public String[] getLoadedSignalNames() {
		return body.getLoadedSignalNames();
	}
	
	// ------------------------------------------------
	// SimulationBody functions
	// ------------------------------------------------
	
	public void addSignal(int index, Signal signal) {
		body.addSignal(index, signal);
	}

	public int[] getAvailableSignalIndices() {
		return body.getAvailableSignalIndices();
	}

	public boolean isSignalLoaded( int index ) {
		return( body.isSignalLoaded(index) );		
	}
	public boolean isSignalLoaded( String name ) {
		return( body.isSignalLoaded( header.getIndex(name)) );
	}
	
	public Signal getSignal(int index) {
		try { 
			return body.getSignal(index);			
		} catch( SignalNotAvailableException e ) {
			throw e;
		}
		
	}

	public Signal[] getSignals(int[] indices) {
		try {
			return body.getSignals(indices);
		} catch( SignalNotAvailableException e ) {
			throw e;
		}
	}

	public void removeSignal(int index) {
		body.removeSignal( index );
	}
	
	public void removeAllSignals() {
		body.removeAllSignals();
	}
	
	// -----------------------------------------------------
	// SimulationOutputHeader methods
	// -----------------------------------------------------
	
	public String[] getAllNames() {
		return header.getAllNames();
	}

	public HeaderEntry[] getEntries(String[] exactNames) {
		return header.getEntries(exactNames);
	}

	public HeaderEntry[] getEntriesForFilter(String filter) {
		return header.getEntriesForFilter(filter, new String[0] );
	}

	public HeaderEntry[] getEntriesForFilter(String filter, String[] exactNames) {
		return header.getEntriesForFilter(filter, exactNames );
	}

	public HeaderEntry getEntry(String name) {
		return header.getEntry(name);
	}

	public int getIndex(String name) {
		return header.getIndex(name);
	}

	public int[] getIndices(String[] exactNames) {
		return header.getIndices( exactNames );
	}

	public int[] getIndicesForFilter(String filter) {
		return header.getIndicesForFilter(filter, new String[0] );
	}
	
	public int[] getIndicesForFilter(String filter, String[] exactNames ) {
		return header.getIndicesForFilter(filter, exactNames );
	}

	public String[] getNamesForFilter(String regexpFilter) {
		return header.getNamesForFilter(regexpFilter);
	}
	
	public int getNumberOfSignalNames() {
		return header.getNumberOfSignalNames();
	}

	public HeaderEntry[] getEntries(int[] indices) {
		return header.getEntries(indices);
	}
	
	public HeaderEntry getEntry(int index) {
		return header.getEntry(index);
	}
	
	public String getName(int index) {
		return header.getName(index);
	}

	public String[] getNames(int[] indices) {
		return header.getNames(indices);
	}

	public boolean doesSignalExist( String name ) {
		return header.doesSignalExist( name );
	}

	public String[] getChildFolderNames(Folder folder) {
		return header.getChildFolderNames(folder);
	}

	public Folder getParentFolder(Folder folder) {
		return header.getParentFolder(folder);
	}

	public HeaderEntry[] getSignalEntriesInFolder(Folder folder, String unitRegExp) {
		return header.getSignalEntriesInFolder(folder, unitRegExp);		
	}

	public HeaderEntry[] getSignalEntriesInFolder(Folder folder) {
		return header.getSignalEntriesInFolder(folder);		
	}
	
	// ---------------------------------------------
	// MetaInfo methods
	// ---------------------------------------------

	public String getMetaInfo(String field) {
		return header.getMetaInfo(field);
	}

	public String[] getMetaInfoFields() {
		return header.getMetaInfoFields();
	}

	public void setMetaInfo(String field, String value) {
		header.setMetaInfo(field, value);		
	}
	
	public void addMetaInfoFields(MetaInfo metaInfo) {
		header.addMetaInfoFields(metaInfo);
	}

	public void printMetaInfo( ) {
		header.printMetaInfo();
	}
	
	
	
	// --------------------------------------------------------
	// Additional methods
	// --------------------------------------------------------
	
	/**
	 * Returns the names of the loaded signals that go both below <thresholdLow> and above <thresholdHigh> and that
	 * match <nameFilter> and <unitFilter>
	 * 
	 * <p>
	 * To be replaced with a more general filter framework in the future, that can also be applied on
	 * the fly to selectively store signals while loading
	 * </p> 
	 * @throws IOException 
	 */
	public String[] getNamesOfSignalsThatCross( double thresholdLow, double thresholdHigh, String nameFilter, String unitFilter ) throws IOException {
		// filter on name
		Signal[] signals = getSignalsForFilter( nameFilter );
		
		//filter on unit
		ArrayList<Signal> unitSignals = new ArrayList<Signal>();
		for( int i=0 ; i<signals.length ; i++ ) {
			Signal signal = signals[i];
			if( (signal!=null) && signal.getYUnit().matches( unitFilter ) ) {
				unitSignals.add( signal );
			}
		}
		
		// filter on threshold crossing
		ArrayList<Signal> crossingSignals = new ArrayList<Signal>();
		for( int i=0 ; i<unitSignals.size() ; i++ ) {
			Signal signal = unitSignals.get(i);
			if( signal.lowerAndHigherThan( thresholdLow, thresholdHigh) ) {
				crossingSignals.add( signal );
			}
		}
		
		String[] results = new String[ crossingSignals.size() ];
		for( int i=0 ; i<results.length ; i++ ) {
			results[i] = crossingSignals.get(i).getYName(); 
		}
		return results;		
		
	}





	
	
	

	
	
}
