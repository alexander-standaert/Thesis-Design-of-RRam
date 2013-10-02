package be.kuleuven.micas.signalStorage;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

import be.kuleuven.micas.helpers.CollectionHelper;
import be.kuleuven.micas.helpers.MetaInfo;
import be.kuleuven.micas.helpers.MetaInfoImplementation;
import be.kuleuven.micas.helpers.TicToc;
import be.kuleuven.micas.signalStorage.formats.UWI.ReaderHDR;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderHierarchy;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;
import be.kuleuven.micas.signalStorage.interfaces.exceptions.SignalDoesNotExistException;


/**
 *  a Header instance stores the names of the waves in a file, in the order in which their wave data is stored.
 *  
 *  You can use the methods from {@link NamesIndex}	to access the names.
 *  The normal use of this header is to request signal indices by name,
 *  and to list all signal names that match a certain pattern.
 *  
 *  When writing a header-file-reader, you can use either *  
 *  <ul>
 *  	<li> CompressedNamesIndex( List<String> compressedNames, List<List<String>> sets ) </li>
 *      <li> CompressedNamesIndex( List<String> flatNames )</li>  
 *  </ul>   
 *  
 *  To read a header from a file, use a separate reader file.  
 *  <ul>
 *  	<li>For HDR, @see {@link ReaderHDR}</li>
 *  	<li>Define similar classes for other header files</li>
 *  	<li>You can pass additional information between headerReader and bodyReader through the metaInfo</li>
 *  </ul>  
 *      	
 *   For debugging only , you can also use the following methods that provide access to the raw data   
 *   	getNumberOfRawSets()
 *   	getRawSet( i )
 *   	getRawCompressedNames()
 *   	printRawData()
 *	
 *   TODO: this class was not serializable.  Is there a reason for this ?  I don't think so
 *   
 */

public class CompressedNamesIndex implements NamesIndex, Serializable {

	private static final long serialVersionUID = 1L;

	private List<String> compressedNames;  	// raw data -- for debugging only
	private List<List<String>> sets;		// raw data	-- for debugging only
	
	
	
	/**
	 *  top is the top of the tree which represents the yNames hierarchically
	 *  	it's Siblings are the sub folders
	 *  	it's userObject is a HashMap with the names at that level, 
	 *  	and the values Integers pointing to the index in yNames 
	 *  	(when added to the baseIndex of that folder);
	 */
	private HeaderHierarchy top; 
	
	/**
	 * metaInfo stores additional information about the simulation, such as title or date
	 */
	private MetaInfoImplementation metaInfo;  // contains "title", "date", ...
	
	// ----------------------------------------------------------
	// constructors
	// ----------------------------------------------------------

	/**
	 * create a SimulationHeader based on a list of compressed names and sets.  
	 * Entries that end on #i are replaced with sets{i}.  
	 * 
	 * <p>
	 * Only forward references are allowed inside sets, e.g. entries in 
	 * sets{3} can include #1, but entries in sets{1} cannot include #3
	 * </p>
	 * 
	 * 
	 * @param compressedNames	top-level names, potenially including #, and including units
	 * @param sets				sets for substitution
	 */
	public CompressedNamesIndex( List<String> compressedNames, List<List<String>> sets ) {
		super();
		this.compressedNames = compressedNames;
		this.sets    = sets;
		this.createTree();
		metaInfo = new MetaInfoImplementation();
	}
	
	/**
	 * create a SimulationHeader based on a list of compressed names (including units)
	 * @param flatNames  		A flat list of names
	 */
	public CompressedNamesIndex( List<String> flatNames ) {
		super();
		this.compressedNames = flatNames;
		this.sets    = new ArrayList<List<String>>();
		this.createTree(); // could switch to a method that actually creates hierarchy from the given flat name
		metaInfo = new MetaInfoImplementation();
	}
	
//	/**
//	 * create an empty SimulationHeader.  The resulting object is not usable yet.
//	 * 	- Add the signal names with addFlatName( )
//	 *  - when done, call construct()
//	 * @param flatNames  		A flat list of names
//	 */
//	public SimulationHeader( ) {
//		super();
//		this.compressedNames = new ArrayList<String>();
//		this.sets   		 = new ArrayList<List<String>>();
//		this.createTree(); // could switch to a method that actually creates hierarchy from the given flat name
//		metaInfo = new MetaInfoImplementation();
//	}
	
	// ---------------------------------------------
	// MetaInfo methods
	// ---------------------------------------------

	public String getMetaInfo(String field) {
		return metaInfo.getMetaInfo(field);
	}

	public String[] getMetaInfoFields() {
		return metaInfo.getMetaInfoFields();
	}

	public void setMetaInfo(String field, String value) {
		metaInfo.setMetaInfo(field, value);		
	}

	public void addMetaInfoFields(MetaInfo metaInfo) {
		this.metaInfo.addMetaInfoFields(metaInfo);
	}
	
	public void printMetaInfo( ) {
		metaInfo.printMetaInfo();
	}
	
	 /**  	
	  * gets the title of this simulation as stored in the metaInfo field "title"
	  * @return 	the title of this simulation
	  */
	public String getTitle() {
		return metaInfo.getMetaInfo("title");
	}
		
	

	// ----------------------------------------------------------
	// SimulationOutputHeader methods
	// ----------------------------------------------------------
		
	public int getIndex( String name ) throws SignalDoesNotExistException {
		HeaderEntry entry = top.getEntry( name );
		return entry.getIndex();
	}
		
	public int[] getIndices( String[] names ) throws SignalDoesNotExistException {
		int[] results = new int[ names.length ];		
		for( int i=0 ; i<names.length ; i++ ) {
			results[i] = getIndex( names[i] );			
		}
		return results;
	}

	public HeaderEntry getEntry( String name ) throws SignalDoesNotExistException {
		HeaderEntry entry = top.getEntry( name );
		return entry;
		
	}
		
	public HeaderEntry[] getEntries( String[] names ) throws SignalDoesNotExistException {		
		HeaderEntry[] results = new HeaderEntry[ names.length ];		
		for( int i=0 ; i<names.length ; i++ ) {
			results[i] = top.getEntry( names[i] );			
		}
		return results;
	}
	
	public HeaderEntry[] getEntriesForFilter( String filter, String[] exactNames ) throws SignalDoesNotExistException {
		List<HeaderEntry> list = top.getFlatList( filter, exactNames );
		HeaderEntry[] result = new HeaderEntry[ list.size() ];
		for( int i=0 ; i<list.size() ; i++ ) {
			result[i]=list.get(i);
		}		
		return result;
	}
	
	public int[] getIndicesForFilter( String filter, String[] exactNames ) throws SignalDoesNotExistException {
		List<HeaderEntry> list = top.getFlatList( filter, exactNames );
		int[] result = new int[ list.size() ];
		for( int i=0 ; i<list.size() ; i++ ) {
			result[i]=list.get(i).getIndex();
		}		
		return result;
	}
	
	public int[] getIndicesForFilter(String filter) {
		return getIndicesForFilter(filter, new String[0]);
	}
			
	public HeaderEntry[] getEntriesForFilter(String filter) {
		return getEntriesForFilter(filter, new String[0]);
	}
	
	public HeaderEntry getEntry( int index )  throws SignalDoesNotExistException {
		return top.getEntry(index);
	}

	public HeaderEntry[] getEntries( int[] indices )  throws SignalDoesNotExistException {
		int L = indices.length;
		HeaderEntry[] entries = new HeaderEntry[ L ];
		for( int i=0 ; i<L ; i++ ) {
			entries[i] = getEntry( indices[i] );
		}
		return entries;
	}
	
	public String getName( int index )  throws SignalDoesNotExistException {
		return getEntry(index).getName();
	}

	public String[] getNames( int[] indices ) throws SignalDoesNotExistException {
		int L = indices.length;
		String[] result = new String[L]; 
		for( int i=0 ; i<L ; i++ ) {
			result[i] = getEntry( indices[i] ).getName();
		}
		return result;
	}
		
	/**
	 * 
	 */
	public int getNumberOfSignalNames() {
		return top.getNumberOfTotalEntries();
	}
	
	public String[] getAllNames() {
		return getNamesForFilter(".*");
	}

	public String[] getNamesForFilter( String filter ) {
		List<HeaderEntry> list = top.getFlatList( filter );
		String[] result = new String[ list.size() ];
		for( int i=0 ; i<list.size() ; i++ ) {
			result[i]=list.get(i).getName();
		}		
		return result;
	}
	
	/**
	 * @overrides 
	 * 
	 * crappy but functional implementation 
	 */
	public boolean doesSignalExist( String name ) {
		try { 
			getEntry( name );
			return true;			
		} catch( SignalDoesNotExistException e ) {
			return false;
		}		
	}
	
	
	// -----------------------------------------------------------------------------
	// folder-based browsing - a folder is basically a fully specified subcircuit 
	// -----------------------------------------------------------------------------
	// TODO: implement in a more efficient fashion
	
	public String[] getChildFolderNames( Folder folder ) {

		// get all the signals that are underneath this folder -- searches entire hierarchy
		String[] allNames;
		if( folder==null ) {
			allNames = getAllNames();			
		} else {
			allNames = getNamesForFilter( folder.getRegExpForFolderContents() );
		}
		
		// filter out the sub folders, and  only store the direct subfolders
		HashSet<String> uniqueDirectChildFolders = new HashSet<String>();
		for( int i=0 ; i<allNames.length ; i++ ) {
			String signalName = allNames[i];
			String childFolder;
			if( folder==null ) {
				childFolder = Folder.getTopSubcircuit( signalName );
			} else {
				childFolder = folder.getNextSubcircuitLevel( signalName );						
			}
			if( childFolder!=null ) {
				uniqueDirectChildFolders.add( childFolder ); // removes duplicates in an efficient way
			}
		}		
		
		//alphabetize --> ArrayList
		ArrayList<String> list = new ArrayList<String>( uniqueDirectChildFolders );
		for( int i=0 ; i<list.size();i++ ) {
			String item = list.get(i);
			//System.out.println( "list item "+i+":"+item );
		}
		Collections.sort(list);
		
		return CollectionHelper.toArray(list);		
	}
		
	public Folder getParentFolder( Folder folder ) {
		if( folder== null ) {
			throw new IllegalArgumentException( "folder==null specifies top folder, no parent exists" );
		}
		return folder.getParent();
	}
	
	
	public HeaderEntry[] getSignalEntriesInFolder( Folder folder, String unitRegExp ) {

		// get all the signals that are underneath this folder -- searches entire hierarchy
		HeaderEntry[] allEntries;
		if( folder==null ) {
			allEntries = getEntriesForFilter( ".*");			
		} else {
			allEntries = getEntriesForFilter( folder.getRegExpForFolderContents() );
		}

		// store only the direct subsignals 
		ArrayList<HeaderEntry> directSubSignals = new ArrayList<HeaderEntry>();
		for( int i=0 ; i<allEntries.length ; i++ ) {
			HeaderEntry entry = allEntries[i];
			if( entry.getUnit().matches( unitRegExp ) ) {
				if( folder==null ) {
					if( Folder.isTopLevelSignal( entry.getName() ) )  {
						directSubSignals.add( entry );
					}
				} else {
					if( folder.isSignalNameInFolder(entry.getName())) {
						directSubSignals.add( entry );
					}	
				}
					
				
			}
		}

		//alphabetize --> ArrayList
		Collections.sort( directSubSignals );				
		return toArray( directSubSignals );		

	}
	
	public HeaderEntry[] getSignalEntriesInFolder( Folder folder ) {
		return getSignalEntriesInFolder(folder, ".*" );
	}
	
	
	// ------------------------------------------------------
	// helper methods for building a tree from compressed headers 
	// ------------------------------------------------------	
	
	// ----------------------------------------------------------
	// private functions
	// ----------------------------------------------------------
		
	/**	createTree( ) 
	 * 
	 *  create a 'tree' based on the values in yNamesC and sets
	 */
	private void createTree() {
		top = HeaderHierarchy.createTreeFromNamesWithSubsets( compressedNames, sets );		
	}
	
		

	// ----------------------------------------------------------
	// debug functions
	// ----------------------------------------------------------
			
	public String[] getRawCompressedNames() {
		String[] result = new String[ compressedNames.size() ];
		for( int i=0 ; i<result.length ; i++ ) {
			result[i] = compressedNames.get(i);
		}
		return result;
	}

	public List<List<String>> getRawSets() {
		return sets;
	}
	
	public int getNumberOfRawSets( ) {
		return sets.size();
	}
	
	public String[] getRawSet( int index ) {
		List<String> set = sets.get(index);
		String[] result = new String[ set.size() ];
		for( int i=0 ; i<result.length ; i++ ) {
			result[i] = set.get(i);
		}
		return result;
	}
	
	
	/**
	 * return a string representing the raw data (sets and yNamesC)
	 */
	public String printRawData( ) {
		StringBuffer result=new StringBuffer( "" );
		for( int i=0 ; i<sets.size() ; i++ ) {
			result.append( "set "+(i+1)+":\n" );
			List<String> set = sets.get(i);
			for( int j=0; j<set.size() ; j++ ) {
				result.append( ">>"+set.get(j)+"\n" );
			}
		}
		for( int i=0 ; i<compressedNames.size() ; i++ ) {
			result.append( ".."+(i)+": "+compressedNames.get(i)+"\n" );			
		}
		return result.toString();
	}
	


	// ------------------------------------------------------
	// helper methods 
	// ------------------------------------------------------	
	private static HeaderEntry[] toArray( List<HeaderEntry> entries ) {
		HeaderEntry[] array = new HeaderEntry[ entries.size() ];
		for( int i=0 ; i<entries.size() ; i++ ) {
			array[i] = entries.get(i);
		}
		return array;
	}
	
	
	// ----------------------------------------------------------
	// main 
	// ----------------------------------------------------------	
 	public static void main( String[] args ) throws IOException {
		System.out.println( "Header main()" );
		
		long t1 = TicToc.tic();		
		System.out.println("constructing header");
		CompressedNamesIndex header = (CompressedNamesIndex) ReaderHDR.readFileHDR("/users/micas/scoseman/projects/spectreBinaryWaves/development/compressedHeader.HDR");		
		System.out.println("done constructing header.  Number of entries = "+header.getNumberOfSignalNames() );
		TicToc.tocP(t1);
			
	}

}


//public HeaderHierarchy getTreeTop( ) {
//	return top;
//}


//// ----------------------------------------------------------
//// functions to dynamically build a header.
//// (use default constructor, then add,add,add, then createTree
//// ----------------------------------------------------------	
///**
// * add the given name to the flat list of signals	
// * 
// * Changes in those fields are only available after calling 
// */
//public void addName( String name, String unit ) {
//	compressedNames.add( name+" "+unit );
//}
//
///**
// * construct: construct the interactive view of this data.
// * Only allowed to be used with the empty constructor
// */
//public void construct() {
//	createTree();
//}
