package be.kuleuven.micas.signalStorage.interfaces;

import java.io.IOException;
import java.util.ConcurrentModificationException;

import be.kuleuven.micas.signalStorage.interfaces.exceptions.SignalDoesNotExistException;

/**
 * ReloadableSimulationOutput is an interface that indicates that a SimulationOutput can be loaded.
 * 
 * <p>
 * All SimulationOutput files that can be loaded from disk should implement this interface
 * </p>
 * 
 * <p>
 * There are two sets of load commands: incrementalLoad and load.
 * </p>
 * <p>
 * <code>incrementalLoad</code> tries to load only the requested signals (in addition
 * to the already loaded signals).  If a change in timestamp of the file is
 * detected, the entire file will be reloaded (all loaded signals).  
 * For many filetypes, incrementalLoad will not be much faster than a normal load.
 * </p>
 * <p>
 * <code>load</code> tries to load the data file from scratch.  
 * Normally, the header will be re-read. However, in situations where the header can 
 * not necessarily be derived from the filename (header is not part of file itself), 
 * and where the header information was handed as an object to the constructor of 
 * the class, this header is not reloaded, only the data file.
 * </p> 
 * 
 * <p>
 * All load methods happen on the originally provided filenames (header en body)
 * </p>
 * 
 * <p>
 * 	The load methods should be updated to allow selective reading based on SignalFilters
 * </p>
 * @author scoseman
 *
 */
public interface LoadableSignalDatabase extends SignalDatabase {


	// -----------------------------------------------------------------
	// load 
	// -----------------------------------------------------------------

	/**
	 * Loads the indicated signals from the body source file (as set by getBodyFilename).
	 * 
	 * Based on regular expression and list of exactNames
	 * 
	 * @param regexpFilter
	 * @param exactNames
	 * @throws IOException							if the body file cannot be parsed
	 * @throws ConcurrentModificationException		if the file body has changed since the last reload (best effort detection)
	 * @throws SignalDoesNotExistException			if one of the exactNames does not provide a match
	 */
	public void load( String regexpFilter, String[] exactNames ) throws IOException, ConcurrentModificationException, SignalDoesNotExistException;
	
	/**
	 * load the indicated signals from the body source file (as set by getBodyFilename)
	 * 
	 * based on list of exactNames
	 * 
	 * notice: a matlab call with { 'singleName' } will be interpreted as a String instead of a String[]
	 * it is hence better to call loadName() / loadNames()
	 * 
	 * @param exactNames
	 * @throws IOException
	 * @throws ConcurrentModificationException
	 * @throws SignalDoesNotExistException
	 */
	public void load( String[] exactNames  ) throws IOException, ConcurrentModificationException, SignalDoesNotExistException;
	
	/**
	 * load the indicated signals from the body source file (as set by getBodyFilename)
	 * 
	 * based on regular expression
	 * 
	 * @param regexpFilter
	 * @throws IOException
	 * @throws ConcurrentModificationException
	 */
	public void load( String regexpFilter ) throws IOException, ConcurrentModificationException;
	
	/**
	 * load a signal by its exactName
	 * 
	 * @param exactame
	 * @throws IOException
	 * @throws ConcurrentModificationException
	 */
	public void loadByName( String exactName ) throws IOException, ConcurrentModificationException;
	
	/**
	 * load signals identified by their exactNames
	 * 
	 * @param exactNames
	 * @throws IOException
	 * @throws ConcurrentModificationException
	 */
	public void loadByNames( String[] exactNames ) throws IOException, ConcurrentModificationException;
	
	
	
	/**
	 * Reload the file.  Update all signals that were previously available.  Only if the 
	 * body file has been updated, an actual reload is performed (checked by timestamp). 
	 * 
	 * If the header was provided as a filename, it will also be reloaded if it has changed.
	 * 
	 * @throws IOException		if the body file or the header file cannot be read correctly
	 */
	public void reload() throws IOException;
	
	/**
	 * check whether the backing database file has been changed since last reload operation
	 * 
	 * @return    true if changed, false if not changed
	 */
	public boolean isFileUpdated();
	
	// -----------------------------------------------------------------
	// fileInfo 
	// -----------------------------------------------------------------

	/**
	 * Return a String that provides information about the file by which this database is backed up.
	 * Load signals will retrieve data from this source.
	 * 
	 *  <p>
	 *  For most readers, this call should simply return the filename of
	 *  the file that has been read. 
	 *  </p>
	 *  <p>
	 *  For readers with a separate header and body, it should provide both, separated with a "; "
	 *  </p>
	 *  <p>
	 *  Code should not depend on the exact form of this field
	 *  </p>
	 */
	public String getSourceDescription();
	
	
	
}
