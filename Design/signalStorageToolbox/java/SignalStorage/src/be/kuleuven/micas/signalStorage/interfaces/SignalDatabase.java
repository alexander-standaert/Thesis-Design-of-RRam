package be.kuleuven.micas.signalStorage.interfaces;

import java.io.IOException;
import java.io.Serializable;

import be.kuleuven.micas.signals.Signal;


/**
 * <code>SimulationOutput</code> stores raw simulation output data, these are waveforms (signals) 
 * which can be accessed by their name or by their index.
 * 
 * note: is it a good idea to make the interface serializable ?  e.g. will all implementations be serializable
 * 
 * @author scoseman
 *
 */
public interface SignalDatabase extends Serializable, IndexedSignals, NamesIndex {
	
	// ------------------------------------------------
	// MetaInfo functions
	// ------------------------------------------------	
		
	// ------------------------------------------------
	// SimulationOutputBody functions: get/set signals by index
	// ------------------------------------------------
	
	// ------------------------------------------------
	// SimulationOutputHeader functions: get indices/entries based on name
	// ------------------------------------------------
	
	// ------------------------------------------------
	// get signals by name 
	//    can, but doesn't have to attempt to load unavailable signals
	//    should never throw exceptions for unavailable signals, just return null
	// ------------------------------------------------	
	
	/**
	 * gets the signal that exactly matches the given name
	 * 
	 * @param name	the name of the signal to return
	 * @return		the matched signal, 
	 * 
	 * @throws		SignalNotAvailableException if signal name exists, but the wave was not loaded from the file
	 *              SignalDoesNotExist if there is no such name
	 */
	public Signal getSignal( String name );
	
	/**
	 * gets the signals that exactly matches the given names
	 * 
	 * @param names		The names of the signals to return
	 * @return			A Signal array s with same length as names and
	 * 					s[i]==getSignal( names[i] ) 
	 */
	public Signal[] getSignals( String[] names );

	/**
	 * gets the signals that match the given regular expression
	 * 
	 * @param filter	The filter to be matched
	 * @return			A Signal array s, which contains all the signals that
	 * 					match the given filter.  This list can contain null values
	 * 					if not all matched signals are available
	 * 
	 * @throws IOException if files can no be loaded from database [ evil mix-up between normal and loadable database ] 
	 */	
	public Signal[] getSignalsForFilter( String filter ) throws IOException;
	
	
	/**
	 * check whether the signal with the given name is loaded in memory ("available")
	 * 
	 * @return  true if the signal for index is loaded
	 * 			false otherwise 
	 */
	public boolean isSignalLoaded( String name );
	
}
