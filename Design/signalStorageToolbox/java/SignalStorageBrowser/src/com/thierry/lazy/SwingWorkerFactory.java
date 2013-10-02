package com.thierry.lazy;

public interface SwingWorkerFactory<T, V> {
	
	//public org.jdesktop.swingworker.SwingWorker<T, V> getInstance(final IWorker<T> worker);
	public javax.swing.SwingWorker<T, V> getInstance(final IWorker<T> worker);;

}
