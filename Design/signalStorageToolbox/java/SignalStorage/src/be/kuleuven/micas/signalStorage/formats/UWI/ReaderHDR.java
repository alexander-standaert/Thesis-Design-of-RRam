package be.kuleuven.micas.signalStorage.formats.UWI;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import be.kuleuven.micas.signalStorage.CompressedNamesIndex;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;


/**
 * read a .HDR file and construct a corresponding SimulationOutputHeader 
 * 
 * <p>
 * A .HDR file always has the following form:
 * 		title
 * 		[	
 * 		list of ynames
 * 		]
 * 
 *  list of ynames can be a flat list, e.g.
 *  	0 Xmemory.n1 V
 *  	1 Xmemory.It1 A
 *      ...
 *      
 *  or ynames can be a "compressed" list, first defining sets of "postfixes", then using these in following sets and in the final yNames... e.g.
 *  	#1 .dd_en A, .ss_en A
 *      #2 .Xinv#1, .n4 V
 *      0 Va0:p A
 *      1 Xtest#2
 *      2 Xinv#1
 *      
 *  notice: all whitespaces are single spaces, not tabs    
 * 
 * 
 * </p>
 * 
 * @author scoseman 
 */
public class ReaderHDR {

	
	/**
	 * read a HDR file from the given filename
	 *   
	 * @param		filename	the file to read
	 * @return		a SimulationHeader which contains all data from the HDR file 
	 * @throws 		IOException	
	 * @throws		IllegalArgumentException	if the file can not be parsed correctly
	 * load the data from filename into the instance values
	 * title, yNamesC and sets.  ( creates new Lists )
	 */
	public static NamesIndex readFileHDR( String filename ) throws IOException {
				
		BufferedReader bf = new BufferedReader( new FileReader( filename ) );	

		String title = bf.readLine();
		
		//skip the opening bracket		
		String line = bf.readLine();

		ArrayList<String> yNamesC= new ArrayList<String>();
		ArrayList<List<String>> sets= new ArrayList<List<String>>();

		while(true) {
			line = bf.readLine();
			if( line==null ) {
				new IllegalArgumentException( "unexpected end of file in '"+filename+"'" );
			}
			if( line.startsWith("]")) {
				break; // the end of the header has been reached
			}
			if( line.startsWith("#")) {
				// it's a set definition
				int firstSpaceIndex = line.indexOf(' ', 1 );
				int index = Integer.parseInt( line.substring( 1, firstSpaceIndex ) ); // from, to; to is exclusive, skip the # at the start 		         
				if( index!= (sets.size()+1) ) {
					new IllegalArgumentException( "unexpected value for setId: "+index+", expected "+ (sets.size()+1) );
				}					
				String restline = line.substring( firstSpaceIndex+1 );
				String[] segments = restline.split(",");
				ArrayList<String> set = new ArrayList<String>(); 
				for( int i=0 ; i<segments.length ; i++ ) { 
					set.add( segments[i].trim() );
				}
				sets.add(set);				 
			} else {
				int firstSpaceIndex = line.indexOf(' ', 1 );
				int index = Integer.parseInt( line.substring( 0, firstSpaceIndex ) ); // from, to; to is exclusive		         
				if( index!= (yNamesC.size()) ) {
					new IllegalArgumentException( "unexpected value for waveId: "+index+", expected "+ (yNamesC.size()) );
				}				
				String restline = line.substring( firstSpaceIndex+1 );
				yNamesC.add( restline.trim() );				           
			}
		}

		CompressedNamesIndex header = new CompressedNamesIndex( yNamesC, sets );
		header.setMetaInfo("title", title);
		
		header.setMetaInfo("xName", "time" );
		header.setMetaInfo("xUnit", "s" );
		
		bf.close(); // NEW
		
		return header;
	}
	
//	/* construct a new Header object and populate it with the data from the 
//	 * self-defined format (.HDR, used for e.g. our spectre UWI plugins )
//	 * 
//	 */
//	public static SimulationHeader readHeaderFromHDR( String filename ) throws IOException {		
//		SimulationHeader newHeader = new SimulationHeader();		
//		newHeader.readFileHDR( filename );
//		
//		// output read values
//		if( verbose ) {
//			System.out.println( newHeader.printRawData() );
//			System.out.println("number of sets read: "+ newHeader.getNumberOfRawSets() );
//			System.out.println("number of yNames read (before expansion): "+ newHeader.getRawCompressedNames().length );			
//		}
//
//		newHeader.createTree();
//
//		if( verbose ) {
//			System.out.println("java ReadCompressedHeader completed");
//		}
//		
//		return newHeader;		
//	}
	
}
