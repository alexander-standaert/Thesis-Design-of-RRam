package be.kuleuven.micas.signalStorage;

import java.io.IOException;

import be.kuleuven.micas.signalStorage.formats.UWI.SimulationCompressedUWI;
import be.kuleuven.micas.signalStorage.formats.UWI.SimulationNonCompressedUWI;
import be.kuleuven.micas.signalStorage.formats.psfAscii.SimulationPsfAscii;
import be.kuleuven.micas.signalStorage.formats.psfAscii.SimulationPsfAsciiDC;
import be.kuleuven.micas.signalStorage.formats.spice.SimulationHSpiceCSDF;
import be.kuleuven.micas.signalStorage.interfaces.SignalDatabase;

/**
 * A helper class that tries to load a simulation.
 * The file type is guessed from the extension 
 * 
 * @author: Stefan Cosemans
 *  last modified: Sep 3, 2010
 *
 */
public class SimulationLoader {

	/**
	 * Try to find a simulation reader that can open the given file. 
	 * 
	 * reads the signals whose name matches exactly with one of the entries in exactMatches, or that match filter
	 * 
	 * @param filename
	 * @param filter
	 * @param exactNames
	 * @return
	 * @throws IOException
	 * @throws IOException
	 */
	public static SignalDatabase loadSimulation( String filename, String filter, String[] exactNames ) throws IOException, IllegalArgumentException {
		
		if( SimulationCompressedUWI.filetypeSupported( filename ) ){
			return SimulationCompressedUWI.read( filename );
		}
		if( SimulationNonCompressedUWI.filetypeSupported( filename ) ){
			return SimulationNonCompressedUWI.read( filename );
		}
		if( filename.endsWith(".dc") ) {			
			try {
				return SimulationPsfAscii.read(filename, filter, exactNames);
			} catch( Exception e) {
				// try something else
			}
			try {
				return SimulationPsfAsciiDC.read( filename ); // notice: selective loading not supported
			} catch( Exception e) {
				// try something else
			}			
		}
		if( filename.endsWith(".tran") ) {			
			try {
				return SimulationPsfAscii.read(filename, filter, exactNames);
			} catch( Exception e) {
				// try something else
			}			
		}
		if( filename.contains("csdf") ) {			
			try {
				return SimulationHSpiceCSDF.read(filename, filter, exactNames);
			} catch( Exception e) {
				// try something else
			}			
		}
		if( filename.contains(".sw") ) {			
			try {
				return SimulationHSpiceCSDF.read(filename, filter, exactNames);
			} catch( Exception e) {
				// try something else
			}			
		}
		if( filename.contains(".tr") ) {			
			try {
				return SimulationHSpiceCSDF.read(filename, filter, exactNames);
			} catch( Exception e) {
				// try something else
			}			
		}
		
		throw new IllegalArgumentException( "no loader registered for file "+filename );		
	}
		
	/**
	 * 
	 * Try to find a simulation reader that can open the given file. 
	 * 
	 * reads the signals whose name matches exactly with one of the entries in exactMatches
	 * 
	 * @param filename
	 * @param exactNames
	 * @return
	 * @throws IOException
	 */
	public static SignalDatabase loadSimulation( String filename, String[] exactNames ) throws IOException {		
		return loadSimulation( filename, "", exactNames );				
	}
	
	/**
	 * Try to find a simulation reader that can open the given file. 
	 * 
	 * reads the signals whose names match the given java regexp filter
	 * 
	 * @param filename
	 * @param filter
	 * @return
	 * @throws IOException
	 */
	public static SignalDatabase loadSimulation( String filename, String filter ) throws IOException {	
		return loadSimulation( filename, filter, new String[0] );				
	}
	
	/**
	 * reads all signals
	 * 
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static SignalDatabase loadSimulation( String filename ) throws IOException {			
		return loadSimulation( filename, ".*", new String[0] );		
	}
	
	
	/**
	 * Check whether we know of a Simulation reader that could accept the provided filename
	 * 
	 *  (hardcoded list)
	 * 
	 * @param filename
	 * @return
	 */
	public static boolean isPotentiallyKnownFormat( String filename ) {	
		if( filename.endsWith( ".dc")   ||
				filename.endsWith( ".tran") ||
				filename.contains( "csdf")  ||
				filename.endsWith( ".sw" )  ||
				filename.endsWith( ".tr" )  ||
				filename.endsWith( ".COD") || filename.endsWith( ".COF") || filename.endsWith( ".COH") || filename.endsWith( ".COA") ||
				filename.endsWith( ".NCD") || filename.endsWith( ".NCF") || filename.endsWith( ".NCH") || filename.endsWith( ".NCA") ) {
			return true;
		} else {
			return false;
		}
	}	
	
	
}
