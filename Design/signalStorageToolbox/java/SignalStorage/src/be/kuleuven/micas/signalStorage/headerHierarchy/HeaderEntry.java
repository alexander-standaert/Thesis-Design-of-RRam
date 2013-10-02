package be.kuleuven.micas.signalStorage.headerHierarchy;

import java.io.Serializable;

/**
 * HeaderEntry is an immutable class that stores an index, name and unit 
 * 
 * @author scoseman
 *
 */
public final class  HeaderEntry implements Serializable, Comparable<HeaderEntry> {
	
	private static final long serialVersionUID = 1L;
	
	private final int index;
	private final String name;
	private final String unit;
	
	public HeaderEntry( int index, String name, String unit ) {
		this.index = index;
		this.name = name;
		this.unit = unit;
	}
	
	/* headerEntry = makeEntryFromNameUnit( index, nameUnit )
	 * 
	 * split nameUnit = "tadaa.tad Amp" into name="tadaa.tad" and unit="Amp"
	 * unit can not contain a space
	 */
	public static HeaderEntry makeEntryFromNameUnit( int index, String nameUnit) {
		int spaceIndex = nameUnit.lastIndexOf(' ');			
		String name = nameUnit.substring(0, spaceIndex);
		String unit = nameUnit.substring( spaceIndex+1 );		
		return new HeaderEntry( index, name, unit);
	}
	
	public int getIndex() {
		return index;
	}
	
	public String getName() {
		return name;
	}
	
	public String getUnit() {
		return unit;
	}
	
	public String toString() {
		return "headerEntry( '"+name+"', '"+unit+"', "+ index+" )" ;
	}

	/**
	 * first sorts by unit, then sorts by name 
	 */
	public int compareTo(HeaderEntry o) {
		
		String unitO = o.getUnit();
		String unitT = this.getUnit();
		
		if( unitT.equals( unitO ) ) {
			// they have the same unit, sort by name
			String nameO = o.getName();
			String nameT = this.getName();
			
			return nameT.compareTo( nameO );
		} else {
			// they have different units, sort by unit
			return unitT.compareTo( unitO );
		}		
	}
}
