package com.thierry.lazy;

public interface IWorker<T> {

	public void done(T result);
	
	public T doInBackground();
	
}
