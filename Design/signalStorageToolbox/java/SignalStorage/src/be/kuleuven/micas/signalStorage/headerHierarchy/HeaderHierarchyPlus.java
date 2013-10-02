package be.kuleuven.micas.signalStorage.headerHierarchy;

import java.io.Serializable;

/*	HeaderHierarchyPlus
 * 
 *  a wrapper object that contains a HeaderHierarchy and the baseIndex
 *  that must be added to entries inside this sub-hierarchy 
 */

public class HeaderHierarchyPlus implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private HeaderHierarchy subset;
	private int baseIndex;
		
	public HeaderHierarchyPlus( HeaderHierarchy subset, int baseIndex ) {
		this.baseIndex = baseIndex;
		this.subset = subset;
	}

	public HeaderHierarchy getSubset() {
		return subset;
	}

	public int getBaseIndex() {
		return baseIndex;
	}
}
