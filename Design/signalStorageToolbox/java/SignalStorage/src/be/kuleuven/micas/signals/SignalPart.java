package be.kuleuven.micas.signals;

import java.io.Serializable;

/*
 * signalPart takes ownership of the double array passed to its constructor
 */
public class SignalPart implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private final double[] values;
	private final String name;
	private final String unit;
	
	/**
	 * create a new SignalPart with the given values, name and unit.
	 * 
	 * At this moment, a copy of the values array is stored.  
	 * An immutable wrapper class around the array might be a better idea.
	 * 
	 * This would also avoid the need to always make copies of the values array
	 * 
	 * @param values
	 * @param name
	 * @param unit
	 */
	public SignalPart( double[] values, String name, String unit ) {
		super();
		
		this.values = values.clone();
		//this.values = values;
		this.name   = name;
		this.unit   = unit;				
	}
	
	/**
	 * return a copy of the values array
	 * 
	 * @return
	 */
	public double[] getValues() {
		return values.clone();
	}
	
	/**
	 * return a reference to the values array. This array should never be modified! 
	 * (package-accessible)
	 * 
	 * @return
	 */
	double[] getValuesNoClone() {
		return values;
	}
	
	/**
	 * return a reference to the name
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * return a reference to the unit
	 * @return
	 */
	public String getUnit() {
		return unit;
	}
	
	public int length() {
		return values.length;
	}
	
}
