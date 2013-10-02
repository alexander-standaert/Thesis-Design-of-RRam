package be.kuleuven.micas.signalStorage.interfaces.exceptions;

/**
 * This exception is thrown when a signal is requested by name, but there
 * is no signal with the given name...
 */
public class SignalDoesNotExistException extends IllegalArgumentException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SignalDoesNotExistException() {
		super();
	}

	public SignalDoesNotExistException(String s) {
		super(s);
	}

	
	
}
