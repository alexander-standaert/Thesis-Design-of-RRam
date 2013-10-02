package be.kuleuven.micas.signalStorage.simulationBrowser;

import javax.swing.JTree;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultMutableTreeNode;

import be.kuleuven.micas.matlabcontrol.MatlabControl;
import be.kuleuven.micas.signalStorage.SignalDatabaseImpl;
import be.kuleuven.micas.signalStorage.simulationBrowser.SimulationBrowser.Node;

public class TreeSelectListener implements TreeSelectionListener {
	private JTree parent;
	private SignalDatabaseImpl simulation;
	
	public TreeSelectListener(JTree parent , SignalDatabaseImpl simulation){
		super();
		this.parent = parent;
		this.simulation = simulation;
	}
	
	@Override
	public void valueChanged(TreeSelectionEvent e) {
		
	    final DefaultMutableTreeNode node = (DefaultMutableTreeNode)
        parent.getLastSelectedPathComponent();
	    

if (node == null)
//Nothing is selected.	
return;

if(node.isLeaf()){
final SimulationBrowser.Node n = (Node) node.getUserObject();
//System.out.println(n.getName());
final MatlabControl mc = new MatlabControl();

class Caller extends Thread{
    public void run(){
         try{
        	 Object[] args = new Object[2];
        	 args[0] = 1;
        	 args[1] = n.getName() + "\n";
        	 Object rets[] = new Object[1];
             //rets[0] =  mc.blockingFeval("fprintf", args);
        	 //args[0] = "uuuu\n";
        	 rets[0] =  mc.blockingFeval("fprintf", args);
              mc.feval(new String("disp"),rets );
             args[0] = simulation;
             args[1] = n.getName();
             rets[0] = mc.blockingFeval("plotSignalFromTree",args);
             mc.feval(new String("disp"),rets );
         } catch(Exception e){
     }
    }
    
}
Caller c = new Caller();

c.start();

}
			

	}

}
