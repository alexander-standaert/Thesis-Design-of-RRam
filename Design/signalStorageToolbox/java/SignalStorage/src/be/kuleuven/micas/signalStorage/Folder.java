package be.kuleuven.micas.signalStorage;


/**
 * A Folder is basically a wrapper for a fully specified subcircuit name, to enable folder-based browsing.
 * 
 * It is identified with a full path  "Xtest.Xlevel2.Xinv"
 * A signal in this path with name "n1" is "Xtest.Xlevel2.Xinv.n1"
 * 
 * A folder name should never contain a "." at the end
 * 
 * 
 * @author: Stefan Cosemans
 *  last modified: Feb 27, 2011
 *
 */
/**
 * @author: Stefan Cosemans
 *  last modified: Feb 27, 2011
 *
 */
public class Folder {


	// ---------------------------------------------------
	// fields
	// ---------------------------------------------------
	private String fullName;

	// ---------------------------------------------------
	// constructor
	// ---------------------------------------------------
	/**
	 * construct a Folder with the given full folder name
	 */
	public Folder( String fullName ) {
		setFullName(fullName);
	}
	
	// ---------------------------------------------------
	// static factories
	// ---------------------------------------------------
	/**
	 * static helper method that create the folder that contains the fully qualified signal name
	 * e.g. "Xtop.Xinv.n1" --> "Xtop.Xinv"
	 * @param fullSignalName
	 */
	public static Folder getFolderOfSignal( String fullSignalName ) {
		int lastDotIndex = fullSignalName.lastIndexOf(".");		
		String parentName = fullSignalName.substring( 0, lastDotIndex ); // drops the "." at the end
		System.out.println( "fullSignalName=" + fullSignalName + "; " + "parentName = " + parentName );
		return new Folder( parentName );
	}
	
	// ---------------------------------------------------
	// varia
	// ---------------------------------------------------
	
	/**
	 * get the parent folder of this folder
	 * 
	 * @return
	 */
	public Folder getParent() {
		
		int lastDotIndex = fullName.lastIndexOf(".");
		
		String parentName = fullName.substring( 0, lastDotIndex ); // drops the "." at the end
		return new Folder( parentName );
	}
	
	/**
	 * get The instanceName of a Folder, e.g. "Xtop.Xinv" --> "Xinv"
	 * 
	 * @return
	 */
	public String getInstanceName() {
		int lastDotIndex = fullName.lastIndexOf(".");				
		String instanceName = fullName.substring( (lastDotIndex+1) );
		return instanceName;
	}
	
	/**
	 * static helper method that gets the signal-name-part of a fully qualified signal name
	 * e.g. "Xtop.Xinv.n1" --> "n1"
	 * @param fullSignalName
	 */
	public static String getLocalSignalName( String fullSignalName ) {
		int lastDotIndex = fullSignalName.lastIndexOf(".");		
		String localSignalName = fullSignalName.substring( lastDotIndex+1 ); // drops the "." at the start
		return localSignalName;
	}
	
	/**
	 * method that gets the full signal name of a signal with given localSignalName inside this folder
	 * 
	 * @param fullSignalName
	 */
	public String getFullSignalName( String localSignalName ) {
		return this.getFullName() + "." + localSignalName;
	}
	

	
	/**
	 * get a regular expression that matches all sub-contents of this folder, down to the lowest hierarchy
	 * 
	 * if this folder is "Xtop.XbufferedNand"
	 * getRegExpForFolderContents( ) returns
	 * 	Xtop\\.XbufferedNand\\..*
	 * 
	 * --> hence it will match all sub-content, whether are not it is in the direct next level of the hierarchy
	 * 	
	 * @return the regular expression
	 */
	public String getRegExpForFolderContents() {		
		String regexp = getFullName().replaceAll("\\.", "\\."); // it's a bit weird, but it does replace "." --> "\."
		regexp = regexp + "\\." + ".*";
		return regexp;
	}
	
	/**
	 * check whether the given signal name is direct content of this folder
	 * 
	 * @param fullSignalName
	 * @return
	 */
	public boolean isSignalNameInFolder( String fullSignalName ) {		
		Folder folderOfSignal     = getFolderOfSignal( fullSignalName );
		String folderNameOfSignal = folderOfSignal.getFullName();
		return folderNameOfSignal.equals( getFullName() );		
	}
	
	/**
	 * if this folder=="Xtop.Xand" and signalName=="Xtop.Xand.Xbuffer.Xbuffer1.n1", the method returns "Xtop.Xand.Xbuffer".
	 * Used in the context of folder-based browsing
	 * 
	 * If the given signal name is not in a subfolder of this folder, null is returned. 
	 * This includes signal names that are direct content of this folder 
	 * 
	 * @param signalName
	 * @return
	 */
	public String getNextSubcircuitLevel( String signalName ) {
		if( !signalName.startsWith(getFullName()) ) {
			return null;
		}
		String remainder = signalName.substring( getFullName().length()+1 ); //skips the first next dot 
		// "Xbuffer.Xbuffer1.n1"		
		
		int firstDotIndex = remainder.indexOf( "." ); 
		if( firstDotIndex==-1 ) {
			return null; // signal is directly contained in this folder
		}
				
		String localName = remainder.substring( 0, firstDotIndex ); // skips the next dot
		// "Xbuffer"		
				
		return getFullName() + "." + localName;
	}
	
	
	/**
	 * if signalName=="Xtop.Xand.Xbuffer.Xbuffer1.n1", the method returns "Xtop".
	 * Used in the context of folder-based browsing
	 * 
	 * If the given signal name is a top-level signal, null is returned
	 * 
	 * @param signalName
	 * @return
	 */
	public static String getTopSubcircuit( String signalName ) {
		
		int firstDotIndex = signalName.indexOf( "." ); 
		if( firstDotIndex==-1 ) {
			return null; // signal is directly contained in this folder
		}
				
		String topSubcircuit = signalName.substring( 0, firstDotIndex ); // skips the next dot
		// "Xtop"		
				
		return topSubcircuit;
	}
	
	/**
	 * return true if the signal is a top-level signal (not contained in subcircuits/folders)
	 * That is: if there is no dot in the name
	 * 
	 * @param signalName
	 * @return
	 */
	public static boolean isTopLevelSignal( String signalName ) {
		int firstDotIndex = signalName.indexOf( "." ); 
		if( firstDotIndex==-1 ) {
			return true; // no dot: top-level signal 
		} else {
			return false;
		}
		
	}
		
	// ---------------------------------------------------
	// getters and setters
	// ---------------------------------------------------
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	
	// ---------------------------------------------------
	// test code
	// ---------------------------------------------------
	
	public static void main( String[] arg ) {
		// if this folder=="Xtop.Xand" and signalName=="Xtop.Xand.Xbuffer.Xbuffer1.n1", the method returns "Xtop.Xand.Xbuffer".
		
		Folder folder = new Folder( "Xtop.Xand" );
		String signalName = "Xtop.Xand.Xbuffer.Xbuffer1.n1";
		String childFolder = folder.getNextSubcircuitLevel(signalName);
		System.out.println( "1. should be " + "Xtop.Xand.Xbuffer" );
		System.out.println( "1.        is " + childFolder );
		
		
		signalName = "Xtop2.Xand.Xbuffer.Xbuffer1.n1";
		childFolder = folder.getNextSubcircuitLevel(signalName);
		System.out.println( "2. should be " + "null" );
		System.out.println( "2.        is " + childFolder );
		
		signalName = "Xtop2.Xand.n1";
		childFolder = folder.getNextSubcircuitLevel(signalName);
		System.out.println( "3. should be " + "null" );
		System.out.println( "3.        is " + childFolder );
		
		System.out.println( "===============================" );
		System.out.println( "regexp for folder subcontent = '" + folder.getRegExpForFolderContents() + "'" );
		
		System.out.println( "===============================" );
		System.out.println( "Xtop.Xand.n1 is subsignal?      [true ]: " + folder.isSignalNameInFolder( "Xtop.Xand.n1" ) );
		System.out.println( "Xtop.Xand.Xinv.n1 is subsignal? [false]: " + folder.isSignalNameInFolder( "Xtop.Xand.Xinv.n1" ) );
		System.out.println( "Xtop2.Xand.n1 is subsignal?     [false]: " + folder.isSignalNameInFolder( "Xtop2.Xand.n1" ) );
	}
	
}


// -------------- code not tested
///**
//* get a regular expression that matches all sub-contents of this folder, but not hierarchically
//* 
//* e.g. in the following structure:
//* 	Xtop.XbufferedNand.o1 
//* 	Xtop.XbufferedNand.Xnand
//* 	Xtop.XbufferedNand.Xnand.n1
//* 	Xtop.XbufferedNand.Xinv1
//* 	Xtop.XbufferedNand.Xinv2
//* if this folder is "Xtop.XbufferedNand")
//* getRegExpForFolderContents( ) returns
//* 	Xtop\\.XbufferedNand\\.[^\.]*\z
//* --> \. is a literal dot
//* --> [^\.] means match any character except for literal dots
//* --> [^\.]* means to match it zero or more times - it eats all remaining characters
//* --> \z is the end of input
//* --> hence it matches all subcontents that does not have any more dots in it
//* 	
//* 
//* @return the regular expression
//*/
//public String getRegExpForFolderContents() {
//	
//	String regexp = getFullName().replaceAll("\\.", "\\."); // it's a bit weird, but it does replace "." --> "\."
//	regexp = regexp + "\\." + ".*" +  
//}