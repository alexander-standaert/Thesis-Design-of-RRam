package be.kuleuven.micas.signalStorage;

import java.io.Serializable;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import be.kuleuven.micas.signalStorage.interfaces.IndexedSignals;
import be.kuleuven.micas.signalStorage.interfaces.exceptions.SignalNotAvailableException;
import be.kuleuven.micas.signals.Signal;




/**
 * 
 * An instance of SimulationBody stores a list of signals.  
 * 
 * <p>
 * For size efficiency in case of very sparsely loaded datafiles, all
 * data is stored in indexed HashMaps instead of in an Array or a Vector  
 * </p>
 * 
 * TODO: this class was not serializable.  Is there a reason for this ?  I don't think so
 * 
 * @author scoseman
 */
public class IndexedSignalsImpl implements IndexedSignals, Serializable {
	

	private static final long serialVersionUID = 1L;
	private static boolean verbose = false;
	
	Map<Integer, Signal> signals;	
	//private double[] allXValues;  // temporarily hack: must be set separately by user ...  
	
	public IndexedSignalsImpl() {
		signals = new HashMap<Integer, Signal>();
	}
	
	public IndexedSignalsImpl( int initialCapacity ) {
		signals = new HashMap<Integer, Signal>( initialCapacity );
	}
	
	/* store the given signal under the given index
	 */
	public void   addSignal( int index, Signal signal ) {
		Integer i = new Integer(index);
		if( signals.containsKey( i ) ) {
			Signal oldSignal = signals.get( i );
			if( verbose ) {
				System.out.println("Warning: SimulationBody.addSignal(): overwriting signal "+ 
						oldSignal.getYName()+" with index ("+index+") with signal "+
						signal.getYName() );
			}
		}
		signals.put( new Integer(index), signal);
	}
		
	/* return the signal with given index
	 * return null if no signal is stored for the given index
	 */
	public Signal getSignal( int index ) throws SignalNotAvailableException {
		Signal s = signals.get( new Integer( index ) );
		if(s==null) {
			throw new SignalNotAvailableException("signal with index "+index+" is not available in memory." );
		}
		return s;
	}
	
	/* return the signals with the given indices
	 * if an the signal with index=indices[i] is not available, 
	 * signals[i] will be null
	 */
	public Signal[] getSignals( int[] indices ) throws SignalNotAvailableException {
		int L=indices.length;
		Signal[] signals = new Signal[ L ];
		for( int i=0 ; i<L ; i++ ) {
			signals[i] = getSignal( indices[i] );
		}
		return signals;
	}
	
	
	public void removeSignal( int index ) {
		signals.remove(index);
	}
	
	public void removeAllSignals() {
		//allXValues = new double[0];
		signals.clear();
	}
	

	
	/**
	 * gets a String[] with the (y)names of all the signals that are available
	 * 
	 * @return 
	 */
	public String[] getLoadedSignalNames() {
		int L = signals.size();
		String[] result = new String[ L ];
		int i=0;
		for( Signal s : signals.values() ) {
			result[i]=s.getYName();
			i=i+1;
		}
		return result;
	}
	
	/**
	 * 
	 * 
	 * @return
	 * 
	 * @see IndexedSignals#getAvailableSignalIndices()
	 */
	public int[] getAvailableSignalIndices( ) {
		Set<Integer> keys = signals.keySet();
		Iterator<Integer> keysIterator = keys.iterator();
		int[] result = new int[ keys.size() ];
		for( int i=0; i<result.length ; i++ ) {
			result[i] = keysIterator.next();
		}
		Arrays.sort( result );
		
		return result;
	}	

	public boolean isSignalLoaded( int index ) {
		return( signals.containsKey(index) );		
	}
	

}


///* double[] getAllXValues()
//* 
//* returns a vector with all x-values that occur in any of the signals
//*/
//public double[] getAllXValues() {
//	return allXValues;
//}
//
///*
//* should change this ...
//*/
//public void setAllXValues( double[] values ) {
//	allXValues = values;
//}