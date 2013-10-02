package be.kuleuven.micas.signalStorage.simulationBrowser;

import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.MutableTreeNode;

import be.kuleuven.micas.signalStorage.SignalDatabaseImpl;

public class LazyLoadingTreeNode extends com.thierry.lazy.LazyLoadingTreeNode {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public LazyLoadingTreeNode(SimulationBrowser parent , DefaultMutableTreeNode parentNode , SignalDatabaseImpl simulation , Object userObject, DefaultTreeModel model) {
		super(userObject, model);
		
		// TODO Auto-generated constructor stub
	}

	@Override
	public MutableTreeNode[] loadChildren(DefaultTreeModel model) {
		// TODO Auto-generated method stub
		return null;
	}

}
