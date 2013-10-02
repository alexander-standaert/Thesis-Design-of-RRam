package be.kuleuven.micas.signalStorage.formats;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;


/**
 * helper class that allows to read ascii-files line-by-line
 * 
 * It remembers the last line that was read, and the absolute position of its
 * cursor, so you can jump to it later
 * 
 * @author Stefan Cosemans
 */
public class GenericLineReader {
	
	private final int  newLineTokenLength = 1; // LINUX 
	private int currentPosition;
	private BufferedReader b; 
		
	private String previouslyReadLine; // null on construction
	
	
	public int getCurrentPosition() {
		return currentPosition;
	}

	/**
	 * create a new LineReader that reads from the file with the given filename
	 * 
	 * @param filename
	 * @throws IOException
	 */
	public GenericLineReader( String filename ) throws IOException {
		b = new BufferedReader( new FileReader( filename ) );
		currentPosition = 0;
	}
		
	public void close( ) throws IOException {
		b.close();
	}
		
	/**
	 * gets the next line (starting from currentPosition till first newline)
	 * from a BufferedReader.  The newline token is not included in the returned
	 * string
	 * 
	 * This method updates the positionCounter
	 */
	public String readLine( ) throws IOException {
		
		String line = b.readLine();
			
		if( line==null ) {
			//throw new IllegalArgumentException("illegal file format");
			return line;
		}
			
		currentPosition = currentPosition+line.length() + newLineTokenLength;		
		
		previouslyReadLine = line;
		
		//System.out.println("read line: '"+line+"'");
		
		return line;
	}
	

	
		
	/**
	 * return the line that was most recently read.
	 * 
	 * @return
	 */
	public String getPreviouslyReadLine() {
		return previouslyReadLine; 
	}
	
	/**
	 * skip the indicated number of tokens from the file.
	 * 
	 * If you close a file and open it again and want to continue from the
	 * previous cursor location:
	 *   use  x=getCurrentPosititon() before closing the file
	 *   use  skip( x ) directly after opening the file
	 * 
	 * @param tokensToSkip
	 * @throws IOException
	 */
	public void skip( int tokensToSkip) throws IOException {
		b.skip( tokensToSkip );
		currentPosition = currentPosition+tokensToSkip;
	}
	
}
