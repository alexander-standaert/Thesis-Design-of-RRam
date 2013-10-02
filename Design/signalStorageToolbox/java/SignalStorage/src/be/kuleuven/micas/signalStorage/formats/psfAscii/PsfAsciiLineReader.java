package be.kuleuven.micas.signalStorage.formats.psfAscii;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;


/**
 * helper class that allows to read ascii-files line-by-line
 * 
 * It is specifically meant for reading psfAscii files as it treats
 * PROP( ..... ) as a single line
 * 
 * @author Stefan Cosemans
 */
public class PsfAsciiLineReader {
	
	private final int  newLineTokenLength = 1; // LINUX 
	private int currentPosition;
	private BufferedReader b; 
		
	private String previouslyReadLine;
	
	
	public int getCurrentPosition() {
		return currentPosition;
	}

	/**
	 * create a new LineReader that reads from the file with the given filename
	 * 
	 * @param filename
	 * @throws IOException
	 */
	public PsfAsciiLineReader( String filename ) throws IOException {
		b = new BufferedReader( new FileReader( filename ) );
		currentPosition = 0;
	}
		
	public void close( ) throws IOException {
		b.close();
	}
		
	/**
	 * gets a line from a BufferedReader.  Lines that end on "PROP(" 
	 * are completed with the next lines until the closing bracket
	 * is encountered  
	 * 
	 * Updates positionCounter
	 */
	public String readLine( ) throws IOException {
		
		String line = b.readLine();
			
		if( line==null ) {
			//throw new IllegalArgumentException("illegal file format");
			return line;
		}
			
		currentPosition = currentPosition+line.length() + newLineTokenLength;
			
		if( line.trim().endsWith( "PROP(" ) ) {
			while( true ) {
				String addLine = b.readLine();
				if( addLine==null ) {
					throw new IllegalArgumentException("illegal file format");
				}
				currentPosition = currentPosition+addLine.length() + newLineTokenLength;
				line = line + " " +addLine;
				if( addLine.trim().startsWith( ")" ) ) {
					break;
				}
			}
		}
		//System.out.println("line: "+line);
		
		previouslyReadLine = line;
		return line;
	}
		
	public String getPreviouslyReadLine() {
		return previouslyReadLine; 
	}
	
	
	public void skip( int tokensToSkip) throws IOException {
		b.skip( tokensToSkip );
		currentPosition = currentPosition+tokensToSkip;
	}
	
}
