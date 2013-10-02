package be.kuleuven.micas.helpers;

public class TickTock {

	private long previousMillis;	
	private final String name;
	
	private int period;
	
	public TickTock( String name ) {
		this.name = name;
		previousMillis = System.currentTimeMillis();
		period=1;
	}
	
	//returns time passed in seconds
	public double tock() {
		long p = previousMillis;
		long n = System.currentTimeMillis();
		
		long time = n-p;
		long seconds = time/1000;
		long millis  = time-seconds*1000;
		System.out.println("tock ("+period+")"+name+": "+seconds+"s"+millis+"m" );
		period=period+1;
		//long previousMillis = n;
		
		return time/1000.0;
	}
}
