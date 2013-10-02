package be.kuleuven.micas.helpers;

import java.io.File;


/**
 * 
 * some helper methods to manage filenames: path, shortName, extension, ..
 * 
 * todo: there is something wrong with File.pathSeparator, it returns ":" ???
 * 
 * @author: Stefan Cosemans
 *  last modified: Feb 26, 2011
 *
 */
public class FileName {

	

	/** newName = changeExtension( filename, newExtension )
	 * 
	 * e.g. 
	 * changeExtension( "path/this.is.a.test", "HDR" )
	 * returns          "path/this.is.a.HDR"
	 * 
	 * If there is no dot after 
	 */
	public static String changeExtension( String filename, String newExtension ) {
		
		int lastDotIndex = filename.lastIndexOf(".");		
		int lastSeparatorIndex = filename.lastIndexOf( File.pathSeparator );
		
		if( lastSeparatorIndex>=lastDotIndex ) {
			return filename + "." + newExtension;
		} else {
			String basename = filename.substring( 0,(lastDotIndex+1) );
			return basename + newExtension;
		}		
	}
	
	/** String getExtension( String filename )
	 * 
	 * if there is at least one dot after the last path separator, return the text after the last dot
	 * Otherwise, return "";
	 */
	public static String getExtension( String filename ) {
		int lastDotIndex = filename.lastIndexOf(".");
		int lastSeparatorIndex = filename.lastIndexOf( File.pathSeparator );
		
		if( lastSeparatorIndex>=lastDotIndex ) {
			return "";			
		}
		String extension = filename.substring( (lastDotIndex+1) );
		return extension;
		
		
	}
	
	
	/**
	 * ~/homes/test.jpg --> test.jpg
	 * 
	 * @param filename
	 * @return
	 */
	public static String getShortName( String filename ) {
		
		String pathSeparator = "/";
		//String pathSeparator = File.pathSeparator;  // this is ":" ???
		
		int lastSeparatorIndex = filename.lastIndexOf( pathSeparator );
		String shortName = filename.substring( (lastSeparatorIndex+1) );
		
		//System.out.println( shortName + " -- index="+lastSeparatorIndex+" -- separator="+pathSeparator);
		
		return shortName;
	}
	
}
