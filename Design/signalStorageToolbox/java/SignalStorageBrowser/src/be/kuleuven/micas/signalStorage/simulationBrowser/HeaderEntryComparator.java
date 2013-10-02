package be.kuleuven.micas.signalStorage.simulationBrowser;


import java.util.Comparator;

import be.kuleuven.micas.signalStorage.AlphanumComparator;
import be.kuleuven.micas.signalStorage.headerHierarchy.*;


public class HeaderEntryComparator implements Comparator< HeaderEntry> {
	static final AlphanumComparator stringComparator = new AlphanumComparator();

	//public HeaderEntryComparator()
	
	
	@Override
	public int compare(HeaderEntry o1, HeaderEntry o2) {
		return stringComparator.compare(o1.getName(), o2.getName()) ;
	}
	

}
