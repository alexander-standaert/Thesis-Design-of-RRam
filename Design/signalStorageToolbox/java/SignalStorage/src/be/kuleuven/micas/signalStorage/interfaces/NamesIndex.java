package be.kuleuven.micas.signalStorage.interfaces;

import be.kuleuven.micas.helpers.MetaInfo;
import be.kuleuven.micas.signalStorage.Folder;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.exceptions.SignalDoesNotExistException;

/**
 * SimulationOutputHeader provides a view on the names and units that exist in
 * a simulation output file.  Each signal is associated with a unique index,
 * which should be matched with the index in SimulationOutputBody (and in the
 * file itself ).
 *   
 * 
 * @author scoseman
 */
public interface NamesIndex extends MetaInfo {
	
	// -------------------------------------------------------------------------------------------
	// retrieve signal index based on exactNames or regexp filter
	// -------------------------------------------------------------------------------------------
	/** 
	 * gets the index for the given exact name 
	 * 
	 * @param	name	the exact signal name for which to retrieve the index
	 * @return 			-1 if name is not an entry, 
	 * 					otherwise the index of the requested signal
	 * @throws SignalDoesNotExistException  if there is no signal with the given name
	 */
	public int getIndex( String name ) throws SignalDoesNotExistException; 
	
	/** 
	 * gets the indices for the given exact names 
	 * 
	 * @param	exactNames		the exact signal names for which to retrieve the indices
	 * @return			int[] v; with v.length == names.length, 
	 * 					and v[i]=getIndex( names[i] )
	 * @throws SignalDoesNotExistException  if any of the exactNames does not exist
	 */
	public int[] getIndices( String[] exactNames ) throws SignalDoesNotExistException;
	
	/**
	 * gets all indices whose associated name matches the given regular expression <code>filter</code>
	 * 
	 * @param	filter	a java regular expression
	 * @return	a int[] containing all indices of which the associated name matches the given regular expression 
	 */
	public int[] getIndicesForFilter( String filter );

	/**
	 * gets all indices whose associated name matches the given 
	 * regular expression <code>filter</code> or any of the exactNames
	 * 
	 * @param	filter	a java regular expression
	 * @return	a int[] containing all matching indices
	 * @throws SignalDoesNotExistException  if any of the exactNames does not exist
	 * 
	 */
	public int[] getIndicesForFilter( String filter, String[] exactNames ) throws SignalDoesNotExistException;
	
	
	// -------------------------------------------------------------------------------------------
	// retrieve signal headerEntries by exact name or by regexp filter
	// -------------------------------------------------------------------------------------------	
	/**
	 * 	gets the HeaderEntry for the given exact name.  A HeaderEntry contains index, name and unit of the signal 
	 * 
	 * 	@param	name	the exact signal name for which to retrieve the index
	 * 	@return 		null if name is not an entry, otherwise the requested entry
	 * @throws SignalDoesNotExistException  if name does not exist
	 */
	public HeaderEntry getEntry( String name ) throws SignalDoesNotExistException;
		
	/** 
	 * gets the entries for the given exact names 
	 * 
	 * @param	exactNames		the exact signal names for which to retrieve the indices
	 * @return					HeaderEntry[] v; with v.length == names.length, 
	 * 							and v[i]=getIndex( names[i] )
	 * @throws SignalDoesNotExistException  if any of the exactNames does not exist
	 */
	public HeaderEntry[] getEntries( String[] exactNames ) throws SignalDoesNotExistException;

	/**
	 * gets all entries that match the given regular expression <code>filter</code>
	 * 
	 * @param	filter	a java regular expression
	 * @return	a HeaderEntry[] containing all entries that match the given regular expression 
	 */
	public HeaderEntry[] getEntriesForFilter( String filter );
		
	/**
	 * gets all entries that match the given regular expression <code>filter</code> or one of the given exactNames.
	 * 
	 * @param	filter		a java regular expression
	 * @param	exactNames	names to match exactly 
	 * @return	a HeaderEntry[] containing all entries that match the given regular expression or one of the exactNames
	 * throws SignalDoesNotExistException 	if any of the exactNames does not exist 
	 */
	public HeaderEntry[] getEntriesForFilter( String filter, String[] exactNames ) throws SignalDoesNotExistException;
	
	// -------------------------------------------------------------------------------------------
	// retrieve signal names by regexp filter
	// -------------------------------------------------------------------------------------------	
	/**
	 * gets all the names of the signals that are defined in the header.  This includes signals
	 * that have not been loaded or set.
	 * 
	 * @return  a String[] that contains all signal Names
	 */
	public String[] getAllNames();
	
	/**
	 * gets all the names of the signals that are defined in the header and that match the given regular expression.  
	 * This includes signals that have not been loaded or set.
	 * 
	 * @param regexpFilter	A java regular expression
	 * @return  a String[] that contains all signal Names that match the regexpFilter
	 */
	public String[] getNamesForFilter( String regexpFilter );
	
	
	// -------------------------------------------------------------------------------------------
	// retrieve signal names/headerEntries by index
	// -------------------------------------------------------------------------------------------
	
	/**
	 * gets the entry for the given flat signal index
	 * 
	 * @param index		the flat signal index
	 * @return	the HeaderEntry that corresponds to index
	 * @throws SignalDoesNotExistException if the requested signal index does not exist
	 */
	public HeaderEntry getEntry( int index ) throws SignalDoesNotExistException;
	
	/**
	 * gets the entries for the given flat signal indices
	 * 
	 * @param indices		array of flat signal indices
	 * @return	HeaderEntry[] h, same length as indices, h[i] corresponds to getEntry(i)
	 * @throws SignalDoesNotExistException if any of the requested signal indices does not exist
	 */
	public HeaderEntry[] getEntries( int[] indices ) throws SignalDoesNotExistException;
	
	/**
	 * gets the signal name for the given flat signal index
	 * 
	 * @param index		the flat signal index
	 * @return	the HeaderEntry that corresponds to index
	 * @throws 	SignalDoesNotExistException
	 */
	public String getName( int index ) throws SignalDoesNotExistException;
	
	/**
	 * gets the signal names for the given flat signal indices
	 * 
	 * @param indices		array of flat signal indices
	 * @return	String[] h, same length as indices, h[i] corresponds to getName(i)
	 * @throws SignalDoesNotExistException if any of the requested signal indices does not exist
	 */
	public String[] getNames( int[] indices ) throws SignalDoesNotExistException;
	
	
	// -------------------------------------------------------------------------------------------
	// varia
	// -------------------------------------------------------------------------------------------
	/**	
	 *  gets the numbers of signals that are defined in the header.  This is equal to getAllNames.length();
	 *	
	 *	@return 	the number of signals that are defined in the header.
	 *				This includes signals which have not been loaded or set. 
	 */
	public int getNumberOfSignalNames();
		
	/**
	 * check whether a signal with the given name exists in the header.  It does not check whether the signal has been loaded into memory
	 * 
	 * @param name 
	 * @return
	 */
	public boolean doesSignalExist( String name );
	
	
	// -----------------------------------------------------------------------------
	// folder-based browsing - a folder is basically a fully specified subcircuit 
	// -----------------------------------------------------------------------------

	/**
	 * return the names of the direct child folders in folder in alphabetical order
	 * 
	 *  if folder==null,we look for top-level instances
	 */
	public String[] getChildFolderNames( Folder folder );
	
	/**
	 * return the parent folder of the provided folder
	 * @param folder
	 * @return
	 */
	public Folder   getParentFolder( Folder folder );
	
	/**
	 * get the list of signal header entries in the given folder
	 * signals are sorted first on unit and then sorted alphabetically by name
	 * You can request a subset of units with unitRegExp ( try "A", "V", "[^AV]*" )
	 *
	 * @param folder
	 * @return
	 */
	public HeaderEntry[] getSignalEntriesInFolder( Folder folder, String unitRegExp );
	
	/**
	 * get the list of signal header entries in the given folder
	 * 
	 * signals are sorted first on unit and then sorted alphabetically by name
	 *
	 * if folder==null,we look for top-level signals
	 * 
	 * @param folder
	 * @return
	 */
	public HeaderEntry[] getSignalEntriesInFolder( Folder folder );
		
}
