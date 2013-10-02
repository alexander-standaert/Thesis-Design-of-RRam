package be.kuleuven.micas.signalStorage.interfaces.exceptions;


/**
 * An exception of this type is thrown when a signal is requested by name or index,
 * and this name exists, but the corresponding signal is not available in memory
 * 
 */
public class SignalNotAvailableException extends IllegalArgumentException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SignalNotAvailableException( String s ) {
		super(s);
	}
	
	public SignalNotAvailableException( ) {
		super();
	}

	
	
}
