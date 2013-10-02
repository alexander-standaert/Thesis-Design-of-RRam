package be.kuleuven.micas.signalStorage;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.ConcurrentModificationException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import be.kuleuven.micas.helpers.TicToc;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.IndexedSignals;
import be.kuleuven.micas.signalStorage.interfaces.LoadableSignalDatabase;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;
import be.kuleuven.micas.signalStorage.interfaces.exceptions.SignalDoesNotExistException;
import be.kuleuven.micas.signals.Signal;

/**
 * A loadable signal database is a signal database that is backed up by an external storage.  This allows
 * to load additional signals on the fly and to refresh the data if the external storage is updated. 
 *  
 *  TODO: this class was not serializable.  Is there a reason for this ?  I don't think so
 * 
 * @author scoseman
 *
 */
public abstract class LoadableSignalDatabaseImpl extends SignalDatabaseImpl implements LoadableSignalDatabase, Serializable {

	private static final long serialVersionUID = 1L;

	// ===================================================
	// helper variables to indicate which signals to read
	// ===================================================	
	
	/**
	 * requestedSignalEntries: flat signal index ==> headerEntry
	 * 
	 * these keys are also used to check whether a signal was requested 
	 */
	private Map<Integer, HeaderEntry> requestedSignalEntries;
 
	/**
	 * requestedSignalsIndices is used to loop over the requested signals in linear order
	 * 
	 * It contains only the requestedSignalIndices, in ascending order
	 * 
	 * Which signals should be loaded is based on the header, combined with the 
	 * provided regexpFilter,  exactNames and indicesToLoad ( and, if it is an update-load,
	 * the list of previously loaded signals which must be refreshed )
	 */
	private int[] requestedSignalIndices; 
	
	
	protected int[] getRequestedSignalIndices() {
		return requestedSignalIndices;
	}
	
	protected Map<Integer, HeaderEntry> getRequestedSignalEntries() {
		return requestedSignalEntries;
	}
	
	// ------------------------------------------------------------------------
	// filenames to remember where it came from
	// ------------------------------------------------------------------------	
	private String bodyFilename;
	private long   loadedBodyVersion;	// timestamp of the version of the body file when it was last loaded
	private String headerFilename;		// will be null if constructed with a Header Object instead of from a header file
	private long   loadedHeaderVersion;	// timestamp of the version of the header file when it was last loaded (invalid if headerFilename==null)
	
	// ------------------------------------------------------------------------------------------
	// constructor
	// ------------------------------------------------------------------------------------------	
	protected LoadableSignalDatabaseImpl( NamesIndex header, IndexedSignals body ) {
		super( header, body );		
	}	
	
	protected LoadableSignalDatabaseImpl( ) {
		super();
	}	
		
	// ------------------------------------------------------------------------------------------
	// Overrided functions
	// ------------------------------------------------------------------------------------------
	@Override
	public Signal[] getSignalsForFilter( String filter ) throws IOException {
		load( filter ); // should be implemented more efficiently 
		int[] indices = header.getIndicesForFilter(filter, null );		
		int L=indices.length;
		Signal[] signals = new Signal[ L ];
		for( int i=0 ; i<L ; i++ ) {			
			signals[i]=getSignal( indices[i] );
		} 	
		return signals;
	}
	
	// -------------------------------------------------------
	// methods to define which signals to load
	// -------------------------------------------------------
	
	/**
	 * Sets which signals are requested.  This method is used both during construction and during reloads.
	 * Signals are loaded in any of the following cases:
	 * 
	 * their index is in indices
	 * 
	 * This method
	 * - creates requestedSignalEntries (vfor filter and exactNames )
	 * - updates the timestamp of the loadedBodyVersion
	 * - calls the custom method readFileBody( ); 	
	 * 
	 * @param header
	 * @param filter
	 * @param exactNames
	 * @param indices
	 */
	protected void setRequestedSignals( String filter, String[] exactNames ) throws SignalDoesNotExistException {
		
		int numberOfSignals = header.getNumberOfSignalNames();		
				
		HeaderEntry[] requestedNameEntries;
				
		long start = TicToc.tic( verbose );
		// get the names that match the given request
		if( filter==null || filter.length()==0 ) { 
			requestedNameEntries = header.getEntries(exactNames); // can be much faster ...
		} else {
			requestedNameEntries = header.getEntriesForFilter(filter, exactNames );  
		}
		TicToc.tocP( verbose, start, "retrieving requestedNameEntries");
			
		start = TicToc.tic( verbose );
		// add the matches to filter or exactNames to requestedSignalEntries
		int L = requestedNameEntries.length;
		int initialCapacity = (int) ( Math.sqrt(L) * Math.sqrt(numberOfSignals) ); //geometrical average		
		
		requestedSignalEntries = new HashMap<Integer, HeaderEntry>( initialCapacity );		
		
		for( int i=0 ; i<L; i++ ) {	
			if( requestedNameEntries[i] == null ) {
				// don't put anything
			} else {
				requestedSignalEntries.put( requestedNameEntries[i].getIndex(), requestedNameEntries[i] );
			}
		}
		TicToc.tocP( verbose, start, "put name matches in requestedSignalEntries");
		
//		start = TicToc.tic( verbose );
//		// add the given indices to requestedSignalEntries ( if not already added )
//		for( int i=0 ; i<indices.length ; i++ ) {
//			int index = indices[ i ];
//			if( requestedSignalEntries.containsKey( index ) ) {
//				//it was already in there ... do nothing
//			} else {
//				HeaderEntry entry = header.getEntry( index );
//				requestedSignalEntries.put( index, entry );
//			}
//		}		
//		TicToc.tocP( verbose, start, "put indices into requestedSignalEntries");
		
		start = TicToc.tic( verbose );
						
		// remove all signals that have already been loaded
		List<Integer> indicesToRemove = new ArrayList<Integer>();
		for( HeaderEntry entry :  requestedSignalEntries.values() ) {			
			int index = entry.getIndex();			
			if( getBody().isSignalLoaded(index) ) {
				indicesToRemove.add(index);
			}
		}		
		for( int index : indicesToRemove ) {		
				requestedSignalEntries.remove(index);
		}		
		
		//requestedSignalEntries = new HashMap<Integer, HeaderEntry>( initialCapacity );
		L = requestedSignalEntries.size();		
		setRequestedSignalIndices(new int[ L ]);
				
		if(verbose) { System.out.println( "Number of requested entries "+requestedSignalEntries.size() ); }
		
		int i=0;
		for( HeaderEntry entry : requestedSignalEntries.values() ) {			
			getRequestedSignalIndices()[i] = entry.getIndex();
			i=i+1;
			//System.out.println( "requested entry: "+entry.getName()+" (" + entry.getIndex()+")" );
		}
		TicToc.tocP( verbose, start, "Make requestedSignalIndices");
		
		
		// sort requestedSignalIndices for monotonic sweep through file
		start = TicToc.tic( verbose );
		Arrays.sort( requestedSignalIndices ); 
		TicToc.tocP( verbose, start, "Sort requestedSignalIndices");
		//body = new SimulationBody( initialCapacity );



		
	}
		
	protected void loadTheseSignals( String filter, String[] exactNames ) throws IOException, SignalDoesNotExistException {
		
		long start = TicToc.tic( verbose );			
		setRequestedSignals(filter, exactNames );		
		TicToc.tocP( verbose, start, "setRequestedSignals" );		
			
		String filename = getBodyFilename();		
		long stamp = new File( filename ).lastModified();  // better capture it too early than too late		
		setLoadedBodyVersion( stamp );
		
		if( getRequestedSignalEntries().size()==0 ) {
			if( verbose ) {
				System.out.println("no new signals to be loaded");
			}
			//throw new IllegalArgumentException(); // temporary solution to find print flooding
			return; 
		}
		
		readFileBody( );
		
	}
	
	
	// -------------------------------------------------------
	// source control
	// -------------------------------------------------------
	
	/**
	 * Return the name of the loaded file.  
	 * (This can also be a 'localizer', but it should identify the simulation that has been loaded).
	 */

	
	/**
	 *	Return the name of the header that has been loaded, null if 
	 *	the header was provided as an object rather than as a file.
	 *
	 *	<p>
	 *  For many file types, getHeaderFilename will be
	 *  equal to getBodyFilename()
	 *  </p>
	 */

	
	public String getBodyFilename() {
		return bodyFilename;
	}

	public String getHeaderFilename() {
		return headerFilename;
	}

	protected void setBodyFilename( String bodyFilename ) {
		this.bodyFilename = bodyFilename;
	}

	protected void setHeaderFilename( String headerFilename ) {
		this.headerFilename = headerFilename;
	}
	
	protected long getLoadedBodyVersion() {
		return loadedBodyVersion;
	}

	protected void setLoadedBodyVersion(long loadedBodyVersion) {
		this.loadedBodyVersion = loadedBodyVersion;
	}

	protected long getLoadedHeaderVersion() {
		return loadedHeaderVersion;
	}

	protected void setLoadedHeaderVersion(long loadedHeaderVersion) {
		this.loadedHeaderVersion = loadedHeaderVersion;
	}
	
	/**
	 * check whether the timestamp of the data file has been changed 
	 * 
	 * @return	true if the filestamp of the body file has been changed, false otherwise
	 */
	protected boolean isBodyUpdated( ) {
		File file = new File( getBodyFilename() );
		long newVersion = file.lastModified();
		if( loadedBodyVersion==newVersion ) {
			return false;
		} else {
			return true;
		}		
	}
	
	/**
	 * check whether the timestamp of the header file has been changed 
	 * 
	 * @return	true if the filestamp of the header file has been changed, false otherwise
	 */
	protected boolean isHeaderUpdated( ) {
		if( getHeaderFilename()==null ) {
			return false;
		}
		
		File file = new File( getHeaderFilename() );
		long newVersion = file.lastModified();
		if( loadedBodyVersion==newVersion ) {
			return false;
		} else {
			return true;
		}		
	}
	
	/**
	 * Checks whether the signal with the provided <code>index</code> should be loaded.
	 * 
	 * if this is true, the signal will be reloaded.  Signals that have been loaded
	 * previously, will be maintained, even if this method returns false
	 * 
	 * @param index
	 * @return
	 */
	protected boolean isSignalRequested( int index ) {
		if( requestedSignalEntries.containsKey( new Integer( index) ) ) {
			return true;
		} else {
			return false;
		}	
	}
	
	// -------------------------------------------------------
	// load
	// -------------------------------------------------------
	
	public void load( String regexpFilter,	String[] exactNames ) throws IOException, SignalDoesNotExistException {			
		if( isBodyUpdated() ) {
			throw new ConcurrentModificationException("File '"+getBodyFilename()+"'was changed on disk.  Please use reload() first.");
		}					
		loadTheseSignals( regexpFilter, exactNames );			
	}
	
	/**
	 * load a list of signals as identified by the exactNames
	 * 
	 * notice: a matlab call with { 'singleName' } will be interpreted as a String instead of a String[]
	 * it is hence better to call loadName() / loadNames()
	 */
	public void load( String[] exactNames) throws IOException, SignalDoesNotExistException {
		load( "", exactNames );		
	}

	public void load(String regexpFilter) throws IOException {
		load( regexpFilter, new String[0] );		
	}
	

	public void loadByName( String exactName ) throws IOException, SignalDoesNotExistException {
		String[] exactNames = new String[1];
		exactNames[0]=exactName;
		load( "", exactNames );		
	}

	public void loadByNames( String[] exactNames) throws IOException, SignalDoesNotExistException {
		load( "", exactNames );		
	}
	
	// ----------------------------------------------------------
	// reload
	// ----------------------------------------------------------
	
	/**
	 * reload the requested signals
	 * 
	 * <p>
	 * If the data file has not been updated (based on timestamp check), only
	 * newly requested signals are loaded.  The header is not revisited
	 * </p>
	 * <p>
	 * It the data file has changed, the headerfile (if available) is checked
	 * and reloaded if needed.
	 * All requested signals are reloaded, even if they were previously available 
	 * </p>
	 * 
	 * @throws IOException 
	 */
	public void reload( ) throws IOException {		
		
		long start = TicToc.tic( verbose );
		
		String[] previouslyLoadedNames;
			
		if( isBodyUpdated() ) {
			if(verbose) { System.out.println("body file was updated"); }			
			previouslyLoadedNames = this.getLoadedSignalNames();

			getBody().removeAllSignals(); // must start from scratch when body is updated
			
			if( isHeaderUpdated() ) {				
				long start2 = TicToc.tic( verbose );					
				long stamp = new File( getHeaderFilename() ).lastModified();
				header = readHeader( getHeaderFilename() );
				setLoadedHeaderVersion( stamp );				
				TicToc.tocP( verbose, start2, "Reading header" );						
			} else { // body was not updated				
				if(verbose) { System.out.println("body file was not updated"); }				
			}
		} else {
			previouslyLoadedNames = new String[0];
		}
		TicToc.tocP( verbose, start, "reload: Fetch signal names to reload");
		loadTheseSignals( "", previouslyLoadedNames );				
	}	
	
	/**
	 * check whether the backing database file has been changed since last reload operation
	 * 
	 * @return    true if changed, false if not changed
	 */
	public boolean isFileUpdated() {
		if( isHeaderUpdated() || isBodyUpdated() ) {
			return true;
		} else {
			return false;
		}
	}
	

	private void setRequestedSignalIndices(int[] requestedSignalIndices) {
		this.requestedSignalIndices = requestedSignalIndices;
	}
	
	// =========================================================
	// Methods that should be overloaded
	// =========================================================
	
	/**
	 * 
	 */
	protected abstract void readFileBody() throws IOException;
	
	/**
	 * 
	 */
	protected abstract NamesIndex readHeader( String headerFilename ) throws IOException;


}
