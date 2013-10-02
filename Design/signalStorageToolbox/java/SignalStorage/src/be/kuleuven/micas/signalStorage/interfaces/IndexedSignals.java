package be.kuleuven.micas.signalStorage.interfaces;

import be.kuleuven.micas.signalStorage.interfaces.exceptions.SignalNotAvailableException;
import be.kuleuven.micas.signals.Signal;
public interface IndexedSignals {
	
	// ------------------------------------------------
	// add/get signals by index
	// ------------------------------------------------
	
	/**
	 * 	adds <code>signal</code> to this SimulationOutput.
	 * 	If there already was a signal with this index, the new
	 *  signal takes its place.
	 * 
	 *  @param	index	index by which this signal will be retrievable
	 *  @param  signal  the signal to be stored.
	 *  
	 *  @throws   IllegalArgumentException	if signal==null
	 */
	public void addSignal( int index, Signal signal );
		
	/**
	 * 	removes <code>signal</code> from this SimulationOutput.  
	 *  If the signal index is not bound, nothing happens
	 * 
	 *  @param	index	index of the signal to be removed
	 */
	public void removeSignal( int index );
	
	/**
	 * gets the signal stored at the given index
	 * 
	 * @param 	index	the index of the signal to retrieve
	 * @return			the signal stored at the given index,
	 * 					null if no signal is stored at that index
	 * 
	 * @throws SignalNotAvailableException   if signal is not available
	 * 
	 */
	public Signal getSignal( int index ) throws SignalNotAvailableException;
	
	/** 
	 * gets the signals at the given indices
	 * 
	 * @param indices	the indices of the signals to be retrieved
	 * @return			a Signal[] s, with s.length==indices.length,
	 * 					and s[i]==getSignal( indices[i] )
	 * @throws SignalNotAvailableException   if any of the requested signals is not loaded
	 */
	public Signal[] getSignals( int[] indices ) throws SignalNotAvailableException;
	

	/**
	 * gets a sorted list of available signal indices
	 * 
	 * @return  int[] v, where v contains all indices
	 * 			for which getSignal( v[i] ) != null,
	 * 			and v sorted ascending 
	 */
	public int[] getAvailableSignalIndices( );
	
	/**
	 * check whether the signal with the given index is loaded in memory
	 * 
	 * @return  true if the signal for index is loaded in memory
	 * 			false if the signal for index is not loaded in memory
	 */
	public boolean isSignalLoaded( int index );
	
	
	
	
	/**
	 * removes all signals from the SimulationOutputBody
	 */
	public void removeAllSignals();
	
	
	/**
	 * gets a String[] with the (y)names of all the signals that are available
	 * 
	 * @return 
	 */
	public String[] getLoadedSignalNames() ;
	
	
	
}
