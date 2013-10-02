package be.kuleuven.micas.signalStorage.headerHierarchy;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Pattern;

import be.kuleuven.micas.helpers.TicToc;
import be.kuleuven.micas.helpers.WrapperStringInt;
import be.kuleuven.micas.signalStorage.CompressedNamesIndex;
import be.kuleuven.micas.signalStorage.formats.UWI.ReaderHDR;
import be.kuleuven.micas.signalStorage.interfaces.exceptions.SignalDoesNotExistException;



/**
 * 
 *  HeaderHierarchy is a data structure that represents the hierarchy   
 *  of the names of the waves in the output of a simulation, and that associates
 *  a unique index with each signal name.
 *  
 *  There are two constructors for this class, one with compressedNames and 
 *  subsets (for the compressed UWI header), and one degenerated case with
 *  just a flat list of names, which is simply implemented by keeping the subsets
 *  empty.
 *  
 *  In case the construction is performed from a compressed header, care is taken
 *  not to expand the names to a full tree, as that could require a lot of memory.
 *  Rather, the same subHeaderHierarchy is used each time, just with a different
 *  <code>baseIndex</code>.  
 *  
 *  In case an entry contains "."s, the name is further subdivided in a hierarchy
 *  with empty baseIndex and the subvalue in the leaf node itself.
 *  
 *  
 *  Assumptions made:  in the strings in names and sets, subsetting is indicated with ...#index at the end
 *  the first subset index in the strings is 1, not 0
 *  expanded names must end on  ' unit' (space) (unit), eg ' A'
 *  
 */

public class HeaderHierarchy implements Serializable {

	private static final long serialVersionUID = 1L;

	private static boolean verbose=false;
	
	private static String hierarchyToken = ".";  // NOTE: updated afterwards, might not be used everywhere
	
	protected Map<String, HeaderEntry> entries;
	protected Map<String, HeaderHierarchyPlus> subsets;
	
	/**
	 * numberOfTotalEntries
	 * the total number of leaf nodes inside and below this set
	 * class invariant, satisfied always after construction completes
	 */
	protected int numberOfTotalEntries;
	

	// ----------------------------------------------------------
	// public functions
	// ----------------------------------------------------------
	

	
	/**	
	 * constructs a Headerhierarchy based on the given entries and subsets.
	 * @param entries	A Map that contains (name:headerEntry) mappings.  name 
	 */
	public HeaderHierarchy( Map<String, HeaderEntry> entries, 
						    Map<String, HeaderHierarchyPlus> subsets ) {
		super();
		this.entries  = entries;
		this.subsets  = subsets;
		
		// count total number of elements
		Collection<HeaderHierarchyPlus> subsetsValues = subsets.values();
		int subcount = 0;
	    for ( HeaderHierarchyPlus subsetPlus : subsetsValues ) {
	    	subcount = subcount + subsetPlus.getSubset().getNumberOfTotalEntries();
        }		
		numberOfTotalEntries = entries.size() + subcount;
	}
		
	/* createTreeFromNamesWithSubsets( names, sets )
	 * 
	 * entries in sets.get(i) should only refer to sets with lower index
	 * 
	 * This maintains the hierarchy present in <names, sets>, it does not
	 * look for other hierarchy 
	 */
	public static HeaderHierarchy 
	createTreeFromNamesWithSubsets( List<String> names, List<List<String>> sets ) {
		
		// create the tree for sets
		if( verbose ) {
			System.out.println("expand the subsets");
		}
		List<HeaderHierarchy> expandedSets = expandSets( sets );

		// expand the names
		if( verbose ) {
			System.out.println("expand the names");		
		}
		HeaderHierarchy top = expandSet( names, expandedSets );
		
		return top;	
	}
	

	/*  numberOfTotalEntries = getNumberOfTotalEntries()
	 * 
	 */	
	public int getNumberOfTotalEntries() {
		return numberOfTotalEntries;
	}
	
	/* printTree()
	 * 
	 * print the contents of the tree to the standard output
	 */
	public void printTree(  ) {
		printTree( "", 0 );
	}
	
	
	/* headerEntry = getEntry( name )
	 * 
	 * get the entry corresponding to name, or null if no such entry exists
	 * <name> should not include a unit, 
	 * the first match on <name> is returned, indepent of it's unit 
	 */
	public HeaderEntry getEntry( String name ) {
		return getEntry( "", name, 0 );
	}
	
	
	/**
	 * gets the HeaderEntry for the given flat index.
	 * 
	 * @param index		the flat index 
	 * @return	the headerEntry, or null if no such index was registered
	 */
	public HeaderEntry getEntry( int index ) {
		return getEntry( index, 0, "" );
	}
	

	/**
	 * gets the HeaderEntry for the given flat index.  This assumes that the first node of this
	 * sub-part of the hierarchy has flat index value <code>baseIndex</code>
	 * 
	 * @param index			the flat index 
	 * @param baseIndex		the flat index of the first node in this branch of the hierarchy
	 * @param prefix		the name that should be prefixed to the entries in this branch
	 * @return	the headerEntry, or null if no such index was registered
	 */
	private HeaderEntry getEntry( long indexToSearch, long baseIndex, String prefix ) {
		// check entriesMap;
		for( Map.Entry<String, HeaderEntry> entry : entries.entrySet() ) {
			long testindex  = entry.getValue().getIndex() + baseIndex ;
			if( testindex==indexToSearch ) {
				// we have a match
				String key = entry.getKey();
				HeaderEntry result = new HeaderEntry( (int) indexToSearch, prefix+key, entry.getValue().getUnit() );
				return result;
			}						
		}	
		
		// check children
		for( Map.Entry<String, HeaderHierarchyPlus> entry : subsets.entrySet() ) {
			HeaderHierarchyPlus childPlus = entry.getValue();
			HeaderHierarchy child = childPlus.getSubset();
			
			long minIndexInBranch = childPlus.getBaseIndex()+baseIndex ;
			long maxIndexInBranch = minIndexInBranch + childPlus.getSubset().getNumberOfTotalEntries() - 1;  
			
			if( (indexToSearch>=minIndexInBranch) && (indexToSearch<=maxIndexInBranch) ) {
				String key = entry.getKey();
				//System.out.println("Looking for index"+indexToSearch+", descending into branch with minIndex="+minIndexInBranch+" maxIndex="+maxIndexInBranch );				
				return child.getEntry(indexToSearch, minIndexInBranch, prefix+key );
			}			
		}		
		
		// no match found
		throw new SignalDoesNotExistException( "No signal with flat index '"+indexToSearch+"'" );
		
	}
	
	/*
	 *  
	 */
	public void printRawData() {
		printTree();
	}
	
	// ----------------------------------------------------------
	// private functions
	// ----------------------------------------------------------
		
	
	private HeaderEntry getEntry( String prefix, String name, int baseIndex ) throws SignalDoesNotExistException {

		
		//System.out.println( "entering 'getEntry'" ) ;
		//System.out.println( "prefix="+ prefix+ ",  name="+name+", baseIndex="+baseIndex ) ;
		
		// check whether there is an exact match in the entries map
		String fullName = prefix+name;
		if( entries.containsKey( name ) ) {
			HeaderEntry entry = entries.get( name );
			HeaderEntry newEntry = new HeaderEntry( entry.getIndex()+baseIndex, fullName, entry.getUnit() );
			return newEntry;
		}
		
		// check whether (any part of the name is inside this entry map)
		String longestSubstring = longestSubstringInSubsets( name );
		if( longestSubstring!=null ) {
			HeaderHierarchyPlus subsetPlus = subsets.get( longestSubstring );
			int additionalIndex = subsetPlus.getBaseIndex();
			HeaderHierarchy subset = subsetPlus.getSubset();
			String remainingName = name.substring( longestSubstring.length() ); 
			return subset.getEntry( prefix+longestSubstring, remainingName, baseIndex+additionalIndex );
		}		
		
		throw new SignalDoesNotExistException( "No signal with prefix='"+prefix+"', name='"+name+"'" );
	
		
	}
	
	/*
	 * only consider subnames for which the next token is hierarchyToken ('.')
	 */
	private String longestSubstringInSubsets( String name ) {
		String substring = name;
		
		while( true ) {
			if( subsets.containsKey( substring ) ){
				return substring;
			}
			int index = substring.lastIndexOf( hierarchyToken );
			if( index==-1 ) {
				break;
			}
			substring = name.substring(0, index);			
		}		
		return null;		
	}
	
	
	/* expandedSets = expandSets( sets )
	 * 
	 */	
	private static List<HeaderHierarchy> expandSets( List<List<String>> sets ) {
		ArrayList<HeaderHierarchy> expandedSets=new ArrayList<HeaderHierarchy>();
		for( int i=0 ; i<sets.size() ; i++ ) {
			HeaderHierarchy expandedSubset = expandSet( sets.get(i), expandedSets );
			expandedSets.add( expandedSubset );
		}
		return expandedSets;
	}
	
	/* expandedSet = expandSet( set, expandedSets )
	 * 
	 * (expandedSet is not immediately added to expandedSets to allow reuse of this method to expand yNamesC as well)
	 */
	private static HeaderHierarchy expandSet( List<String> set, List<HeaderHierarchy> expandedSets ) {
		
		HashMap<String, HeaderEntry> entries = new HashMap<String, HeaderEntry>();
		HashMap<String, HeaderHierarchyPlus> subsets = new HashMap<String, HeaderHierarchyPlus>();
			
		int baseIndex = 0;
		for( int i=0 ; i<set.size() ; i++ ) {
			String entry=set.get(i);
			int elementCount = expandAndAddEntry( entry, expandedSets, entries, subsets, baseIndex );
			baseIndex=baseIndex+elementCount;
		}
		
		HeaderHierarchy expandedSubset = new HeaderHierarchy( entries, subsets );
		return expandedSubset;
	}
	
	
	/* numberOfEntriesAdded = expandAndAddEntry( entry, expandedSets, entries, subsets, baseIndex ) 
	 * 
	 * returns the number of entries added (as seen in the linear list indices)
	 */
	private static int
	expandAndAddEntry(	String entry, 
						List<HeaderHierarchy> expandedSets,
						Map<String, HeaderEntry> entries,
						Map<String, HeaderHierarchyPlus> subsets,
						int baseIndex ) {
		
		WrapperStringInt prefixIndex = splitSharp(entry);
		int subsetIndex = prefixIndex.intValue;
		String prefix = prefixIndex.stringValue;
		if( subsetIndex==-1 ) {						
			HeaderEntry headerEntry = HeaderEntry.makeEntryFromNameUnit( baseIndex, entry );
			entries.put( headerEntry.getName(), headerEntry );
			return 1;
		}
		
		if( subsetIndex > expandedSets.size() ) {
			throw new IllegalArgumentException( "Index in entry '"+entry+"' was not yet decompressed" );
		}
		
		HeaderHierarchy set = expandedSets.get( (subsetIndex-1) );	//first subsetIndex is 1...
		HeaderHierarchyPlus setPlusIndex = new HeaderHierarchyPlus( set, baseIndex );
		subsets.put( prefix, setPlusIndex );
		return set.getNumberOfTotalEntries();		
	}
	
	
	/* [ prefix subsetIndex ] = splitSharp( entry )
	 * 
	 * split "preFix#number" into prefix="preFix" and subsetIndex = int( subsetIndex )
	 * the last occurence of "#" in the string is used
	 *  
	 * if there is no "#", subsetIndex = -1 is returned
	 */
	static WrapperStringInt splitSharp( String entry ) {

			WrapperStringInt result = new WrapperStringInt();
		
		    int sharpIndex = entry.lastIndexOf("#");
		    
		    if( sharpIndex==-1 ) {
		    	result.stringValue = entry;
		       	result.intValue = -1;
		    } else {		       
		    	result.stringValue = entry.substring( 0, sharpIndex ); // does not include sharp but does include first character
		    	result.intValue    = Integer.parseInt( entry.substring( sharpIndex+1 ) );		              
		    }
		    return result;
	}
	

	/* printTree( prefix )
	 */
	private void printTree( String prefix ) {
		printTree( prefix, 0 );
	}
	
	/* printTree( prefix, baseIndex ) 
	 */
		
	private void printTree( String prefix, long baseIndex ) {
		
		// print entriesMap;
		for( Map.Entry<String, HeaderEntry> entry : entries.entrySet() ) {
			long index  = entry.getValue().getIndex();
			String key = entry.getKey();
			System.out.println( prefix + key + "("+ (index+baseIndex) + ") ("+index+")" );			
		}	
		
		// print children
		for( Map.Entry<String, HeaderHierarchyPlus> entry : subsets.entrySet() ) {
			HeaderHierarchyPlus childPlus = entry.getValue();
			HeaderHierarchy child = childPlus.getSubset();
			long additionalBaseIndex = childPlus.getBaseIndex();
			String key = entry.getKey();
			System.out.println( prefix + ">>>>>  child: '"+key+"'; baseIndex="+(baseIndex+additionalBaseIndex) );
			child.printTree( prefix+key, baseIndex+additionalBaseIndex );			
		}		
	}
		
	public List<HeaderEntry> getFlatList( ) {
		return getFlatList( ".*", null  );
	}
		
	public List<HeaderEntry> getFlatList( String filter ) {		
		return getFlatList( filter, null );
	}
	
	public List<HeaderEntry> getFlatList( String[] exactNames ) {
		return getFlatList( "", exactNames );
	}
		
	public List<HeaderEntry> getFlatList( String filter, String[] exactNames ) {
		
		int L=0;
		if( exactNames!=null) {
			L=exactNames.length;
		}
		
		HashMap<String,String> exactNamesMap = new HashMap<String,String>( L );
		
		for( int i=0 ; i<L ; i++ ) {
			exactNamesMap.put( exactNames[i], exactNames[i] );
		}
		
		List<HeaderEntry> result = new ArrayList<HeaderEntry>();
		Pattern pattern = Pattern.compile(filter);
		appendToFlatList( "", pattern, exactNamesMap, result, 0 );
		
		return result;
	}
	
	
	/*	appendToFlatList( prefix, pattern, result, baseIndex )
	 * 
	 * 	add the entries of this level and of its children to the list of <results>, using the <prefix> and <baseIndex> 
	 * 
	 */
	private void appendToFlatList( String prefix, Pattern pattern, Map<String,String> exactNamesMap, List<HeaderEntry> result, int baseIndex ) {
		
		// append entriesMap;
		for( Map.Entry<String, HeaderEntry> entry : entries.entrySet() ) {
			HeaderEntry headerEntry = entry.getValue();
			int index  = headerEntry.getIndex();
			String key = entry.getKey();
			String fullName = prefix+key;
			if( pattern.matcher( fullName ).matches() || exactNamesMap.containsKey( fullName ) ) {
				HeaderEntry newEntry = new HeaderEntry( index+baseIndex, fullName, headerEntry.getUnit() );
				result.add( newEntry );
			} 			
		}	
		
		// print children
		for( Map.Entry<String, HeaderHierarchyPlus> entry : subsets.entrySet() ) {
			HeaderHierarchyPlus childPlus = entry.getValue();
			HeaderHierarchy child = childPlus.getSubset();
			int additionalBaseIndex = childPlus.getBaseIndex();
			String key = entry.getKey();
			//System.out.println( prefix + ">>>>>  child: '"+key+"'" );
			//child.printTree( prefix+key, baseIndex+additionalBaseIndex );
			child.appendToFlatList(prefix+key, pattern, exactNamesMap, result, baseIndex+additionalBaseIndex );
		}		
	}

	
	/**
	 * Gets signal entries at this level 
	 */
	public List<HeaderEntry> getEntriesAtThisLevel( int baseIndex ) {
		List<HeaderEntry> result = new ArrayList<HeaderEntry>();
		for( HeaderEntry entry : entries.values() ) {
			HeaderEntry entryOut = new HeaderEntry( entry.getIndex()+baseIndex, entry.getName(), entry.getUnit() );
			result.add( entryOut );
		}
		return result;
	}

	
	/**
	 * Gets subHierarchies of this level
	 * 
	 * @param args
	 * @throws IOException
	 */
//	public Map<Integer,HeaderHierarchyPlus> getSubfolders() {
//		
//	}

	/**
	 * 
	 */
	public HeaderHierarchy getSeparatedTreeView( String separationToken, int index ) {
		
		Map<String,HeaderHierarchyPlus> newSubsets=new HashMap<String, HeaderHierarchyPlus>();
		Map<String,HeaderEntry> newEntries=new HashMap<String, HeaderEntry>();
		
		// add entries
		for( Entry<String, HeaderEntry> mapEntry : entries.entrySet() ) {
			String name = mapEntry.getKey();
			HeaderEntry entry = mapEntry.getValue();
		}
			
		HeaderHierarchy newNode = new HeaderHierarchy( newEntries, newSubsets );
		return newNode;
	}
	
	//TODO
	private static void addEntry( HeaderEntry entry, Map<String,HeaderEntry> entries, Map<String,HeaderHierarchyPlus> subsets ) {
		String name = entry.getName();
		//if( name.contains( ".") ) {
		if( name.contains( hierarchyToken ) ) {
			
		}
	}
	
	
	
	// ----------------------------------------------------------
	// main 
	// ----------------------------------------------------------	
	
	public static void main( String[] args ) throws IOException {
		

		System.out.println( "SubsetHierarchyIndexed main()" );
		System.out.println("reading file");
		CompressedNamesIndex header = (CompressedNamesIndex) ReaderHDR.readFileHDR("/users/micas/scoseman/projects/spectreBinaryWaves/development/compressedHeader.HDR");
		
		String[] yNamesC = header.getRawCompressedNames();
		List<List<String>> sets = header.getRawSets();		
		
		System.out.println("done reading file");
		
		long t1 = TicToc.tic();
		ArrayList<String> compressedNames = new ArrayList<String>();
		for( String name : yNamesC) { compressedNames.add( name ); }
		HeaderHierarchy top = HeaderHierarchy.createTreeFromNamesWithSubsets( compressedNames, sets );		
		TicToc.tocP(t1);
		
		System.out.println("going once through all nodes");	
		
		long t2 = TicToc.tic();
		String[] allNames = header.getNamesForFilter("V.*");
		//List<HeaderEntry> list = top.getFlatList(".*");
		TicToc.tocP( t2 );
		System.out.println( "number of entries: "+allNames.length );	
		
		t2 = TicToc.tic();
		//list = top.getFlatList();
		allNames = header.getAllNames();
		TicToc.tocP( t2 );
		System.out.println("number of entries: "+allNames.length );	
		
		System.out.println( "done." );
		
		
		// =========== time: 36 seconds for 680000 entries : 52us per lookup
		System.out.println("Checking getEntry(index)..." );
		t2 = TicToc.tic();
		for( int i=0 ; i<top.getNumberOfTotalEntries() ; i++ ) {
			HeaderEntry entry = top.getEntry( i );			
			if( entry==null ) {
				System.out.println( "signal for index i="+i+" was not found" );
				return;
			} else {
				String retrievedName = entry.getName();
				int correctIndex = top.getEntry(retrievedName).getIndex();
				if( correctIndex == i ) {
					//ok
					if( (i%1000)==0 ) {
						System.out.println("progress: "+i+"/"+allNames.length );
					}
				} else {					
					System.out.println( "error for retreiving index="+i+" (returned: "+retrievedName+", which maps onto index "+correctIndex+")"  );					
				}
			}
		}
		System.out.println("Checked all entries: all OK." );
		TicToc.tocP( t2 );
		
		return;
		
	}
	
	
	
	/*
	 * Added for SignalStorageBrowser...
	 * Stefan 2011/10/02
	 */
	public Map<String, HeaderHierarchyPlus> getSubsets() {
		
		return this.subsets;
	}
}
