package be.kuleuven.micas.signalStorage.simulationBrowser;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;


import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JPopupMenu;
import javax.swing.JTree;
import javax.swing.KeyStroke;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreePath;

//import com.mathworks.jmi.Matlab;

import be.kuleuven.micas.matlabcontrol.MatlabControl;
import be.kuleuven.micas.matlabcontrol.MatlabSynchronizedExecutor;
import be.kuleuven.micas.signalStorage.interfaces.SignalDatabase;
import be.kuleuven.micas.signalStorage.simulationBrowser.SimulationBrowser.Node;
import be.kuleuven.micas.signals.Signal;

public class TreePopup extends JPopupMenu implements ActionListener {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	JTree parent;
	SignalDatabase simulation;
//	MatlabControl mc;
	MatlabSynchronizedExecutor MatExec;

	public TreePopup(JTree parent , SignalDatabase simulation, MatlabSynchronizedExecutor MatExec) {
		this();
		//System.out.println("I am called!!!!");
		this.parent = parent;
		this.simulation = simulation;
		//mc = new MatlabControl();
		this.MatExec = MatExec;
	}

	public TreePopup() {
		this("truc");
	}

	JMenuItem plot;
	JMenuItem printName;
	JMenuItem getWave;
	JMenuItem setLabel;
	JMenuItem holdAll;
	JMenuItem holdOff;
	JMenuItem grid;
	JMenuItem strip;
	JMenuItem options;

	public TreePopup(String label) {
		super(label);
		//a group of JMenuItems
		plot = new JMenuItem("plot",
				KeyEvent.VK_T);
		plot.setAccelerator(KeyStroke.getKeyStroke(
				KeyEvent.VK_1, ActionEvent.ALT_MASK));
		plot.getAccessibleContext().setAccessibleDescription(
				"plot a graph of the selected signal");
		plot.addActionListener(this);
		this.add(plot);

		printName = new JMenuItem("print name",
				KeyEvent.VK_T);
		printName.setAccelerator(KeyStroke.getKeyStroke(
				KeyEvent.VK_2, ActionEvent.ALT_MASK));
		printName.getAccessibleContext().setAccessibleDescription(
		"print the name of the selected signal");
		printName.addActionListener(this);
		this.add(printName);

		getWave = new JMenuItem("get Wave object",
				KeyEvent.VK_T);
		getWave.setAccelerator(KeyStroke.getKeyStroke(
				KeyEvent.VK_3, ActionEvent.ALT_MASK));
		getWave.getAccessibleContext().setAccessibleDescription(
		"get the waveform a a separate matlab object");
		getWave.addActionListener(this);
		this.add(getWave);
		
		options = new JMenu("options");
		
		setLabel = new JMenuItem("update legend",
				KeyEvent.VK_T);
		setLabel.setAccelerator(KeyStroke.getKeyStroke(
				KeyEvent.VK_4, ActionEvent.ALT_MASK));
		setLabel.getAccessibleContext().setAccessibleDescription(
		"switch the legend on or off");
		setLabel.addActionListener(this);
		options.add(setLabel);
		
		holdAll = new JMenuItem("hold all",
				KeyEvent.VK_T);
		holdAll.setAccelerator(KeyStroke.getKeyStroke(
				KeyEvent.VK_4, ActionEvent.ALT_MASK));
		holdAll.getAccessibleContext().setAccessibleDescription(
		"after next plot, hold all");
		holdAll.addActionListener(this);
		options.add(holdAll);
		
		holdOff = new JMenuItem("hold off",
				KeyEvent.VK_T);
		holdOff.setAccelerator(KeyStroke.getKeyStroke(
				KeyEvent.VK_5, ActionEvent.ALT_MASK));
		holdOff.getAccessibleContext().setAccessibleDescription(
		"stop holding anything");
		holdOff.addActionListener(this);
		options.add(holdOff);
		
		strip = new JMenuItem("switch stripPlot on/off",
				KeyEvent.VK_T);
		strip.setAccelerator(KeyStroke.getKeyStroke(
				KeyEvent.VK_6, ActionEvent.ALT_MASK));
		strip.getAccessibleContext().setAccessibleDescription(
		"switch stripped plotting");
		strip.addActionListener(this);
		options.add(strip);
		
		grid = new JMenuItem("switch Grid on/off",
				KeyEvent.VK_T);
		grid.setAccelerator(KeyStroke.getKeyStroke(
				KeyEvent.VK_6, ActionEvent.ALT_MASK));
		grid.getAccessibleContext().setAccessibleDescription(
		"switch stripped plotting");
		grid.addActionListener(this);
		options.add(grid);
		
		//TODO: clean up better :^)
//		this.add(options);

	}

	@Override
	public void actionPerformed(ActionEvent e) {

		TreePath[] nodes = 
			parent.getSelectionPaths();
		for ( TreePath raw_node : nodes ) {
			if (raw_node == null)
				//Nothing is selected.	
				return;

			DefaultMutableTreeNode node = (DefaultMutableTreeNode)  raw_node.getLastPathComponent();

			if(node.isLeaf()){
				final SimulationBrowser.Node n = (Node) node.getUserObject();
				//System.out.println(n.getName());

				//
				// creates an executor, to make sure the matlab calls are placed in the right order... 
				//
				//Executor matlab_exec = Executors.newSingleThreadExecutor();

				if ( e.getSource() == plot ){
					plotSelected(n);
				}

				if ( e.getSource() == printName ){
					printSelected(n);
				}

				if ( e.getSource() == getWave ){
					//getSelected(mc,n);
					//matlab_exec.execute( new SelectCaller(mc,n));
					//(new SelectCaller( n)).run();
					selectCaller(n);
				}
				
				/*
				if ( e.getSource() == setLabel ){
					//getSelected(mc,n);
					//matlab_exec.execute( new SelectCaller(mc,n));
					SwitchLegend(mc);
				}
				
				if ( e.getSource() == holdAll ){
					//getSelected(mc,n);
					//matlab_exec.execute( new SelectCaller(mc,n));
					holdAll(mc);
				}
				
				if ( e.getSource() == holdOff ){
					//getSelected(mc,n);
					//matlab_exec.execute( new SelectCaller(mc,n));
					holdOff(mc);
				}
				
				if ( e.getSource() == grid ){
					//getSelected(mc,n);
					//matlab_exec.execute( new SelectCaller(mc,n));
					grid(mc);
				}
				
				if ( e.getSource() == strip ){
					//getSelected(mc,n);
					//matlab_exec.execute( new SelectCaller(mc,n));
					strip(mc);
				}
				*/
			}
		}
	}
	/*
	private void getSelected(final MatlabControl mc ,SimulationTree.Node n_arg ){
		if (n_arg == null)
			//Nothing is selected.	
			return;

			final Node n = n_arg; 
			//System.out.println("Selectitude");
			//final MatlabControl mc = new MatlabControl();

			class Caller extends Thread{
			  public synchronized void run(){
			       try{
			    	   Object[] args = new Object[3];
			    	   Object[] rets = new Object[1];


			    	   //System.out.println("Selectitude  " + args[1]);


			      	Signal sig = simulation.getSignal(n.getName());
			      	 args[0] = "base";
			      	 //args[1] = 
			      	 args[1] = "lastArg";
			      	 args[2] = sig;

			           //args[0] = "base";
			          rets[0] =  mc.blockingFeval("assignin", args);

			          Object[] existArg = { "signalArray" };
			    	   rets[0] = mc.blockingFeval("exist",existArg);

			    	   Object ret = rets[0];

			    	 //  System.out.println("rets0 is a " + ret.getClass().getCanonicalName() );
			    	   double[] retA = (double[]) ret;
			    	  // System.out.println("retA is a " + retA.getClass().getCanonicalName() );
			    	   Double retDoub = retA[0];
			    	  // System.out.print("retDoub is a " + retDoub.getClass().getCanonicalName() );
			    	  // System.out.println(", value " +  retDoub );
			    	   //Integer exist =  Integer.valueOf((String) rets[0]);
			    	   //System.out.println("exist: " + exist);
			    	   String cmd;
			    	   if(retDoub == 0) {
			    		   cmd = "signalArray{1} = lastArg";
			    	   } else
			    	   {
			    		   cmd = "signalArray{end+1} = lastArg";
			    	   }
			          mc.eval(cmd);
			           //mc.eval("signalArray");
			          //mc.feval(new String("disp"),rets );
			          // mc.setReturnVal(sig);


			       } catch(Exception e){
			   }
			  }

			}
			Caller c = new Caller();
			c.start();
			try {
				c.join();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			}


	 */

	
	void selectCaller(SimulationBrowser.Node n){
		try{

			Object[] args = new Object[3];
			Object[] rets = new Object[1];

			Signal sig = simulation.getSignal(n.getName());
			args[0] = "base";
			//args[1] = 
			args[1] = "lastArg";
			args[2] = sig;

			//args[0] = "base";
			//rets[0] =  mc.blockingFeval("assignin", args);
			rets[0] =  MatExec.execBlockingFeval("assignin", args);

			Object[] existArg = { "signalArray" };
			rets[0] =  MatExec.execBlockingFeval("exist",existArg);

			Object ret = rets[0];

			//  System.out.println("rets0 is a " + ret.getClass().getCanonicalName() );
			double[] retA = (double[]) ret;
			// System.out.println("retA is a " + retA.getClass().getCanonicalName() );
			Double retDoub = retA[0];
			// System.out.print("retDoub is a " + retDoub.getClass().getCanonicalName() );
			// System.out.println(", value " +  retDoub );
			//Integer exist =  Integer.valueOf((String) rets[0]);
			//System.out.println("exist: " + exist);
			String cmd;
			if(retDoub == 0) {
				cmd = "signalArray{1} = lastArg";
			} else
			{
				cmd = "signalArray{end+1} = lastArg";
			}
			MatExec.eval(cmd);
			//mc.eval("signalArray");
			//mc.feval(new String("disp"),rets );
			// mc.setReturnVal(sig)
			//      System.out.println("stop running for node: " + n.getShortName()+ ", status: " + Thread.currentThread().getId());;     
		} catch(Exception e){
		}
	}
	
/*
	class  SelectCaller implements Runnable{
		SimulationBrowser.Node n;
		MatlabControl mc;

		SelectCaller( MatlabControl mc, SimulationBrowser.Node n ) {
			//	System.out.println("create caller for node: " + n.getShortName()+ ", status: " + Thread.currentThread().getId());
			this.n = n;
			this.mc = mc;
		}

		public void  run(){

			synchronized(mc) {
				try{
					//  mc.setEchoEval(true);
					//  	   System.out.println("start running for node: " + n.getShortName()+ ", status: " + Thread.currentThread().getId());



					Object[] args = new Object[3];
					Object[] rets = new Object[1];


					//System.out.println("Selectitude  " + args[1]);


					Signal sig = simulation.getSignal(n.getName());
					args[0] = "base";
					//args[1] = 
					args[1] = "lastArg";
					args[2] = sig;

					//args[0] = "base";
					rets[0] =  mc.blockingFeval("assignin", args);

					Object[] existArg = { "signalArray" };
					rets[0] = mc.blockingFeval("exist",existArg);

					Object ret = rets[0];

					//  System.out.println("rets0 is a " + ret.getClass().getCanonicalName() );
					double[] retA = (double[]) ret;
					// System.out.println("retA is a " + retA.getClass().getCanonicalName() );
					Double retDoub = retA[0];
					// System.out.print("retDoub is a " + retDoub.getClass().getCanonicalName() );
					// System.out.println(", value " +  retDoub );
					//Integer exist =  Integer.valueOf((String) rets[0]);
					//System.out.println("exist: " + exist);
					String cmd;
					if(retDoub == 0) {
						cmd = "signalArray{1} = lastArg";
					} else
					{
						cmd = "signalArray{end+1} = lastArg";
					}
					mc.eval(cmd);
					//mc.eval("signalArray");
					//mc.feval(new String("disp"),rets );
					// mc.setReturnVal(sig)
					//      System.out.println("stop running for node: " + n.getShortName()+ ", status: " + Thread.currentThread().getId());;     
				} catch(Exception e){
				}
			}
		}

	}
*/
	private void plotSelected(SimulationBrowser.Node n_arg ){
		if (n_arg == null)
			//Nothing is selected.	
			return;

		final Node n = n_arg; 
		//System.out.println(n.getName());
		//final MatlabControl mc = new MatlabControl();
/*
		class Caller extends Thread{
			public void run(){
				try{*/
					Object[] args = new Object[2];
					args[0] = 1;
					args[1] = n.getName() + "\n";
					Object rets[] = new Object[1];
					args[0] = simulation;
					args[1] = n.getName();
					rets[0] = MatExec.execBlockingFeval("plotSignalFromName",args);
					//rets[0] = mc.blockingFeval("plotSignalFromName",args);
					//mc.feval(new String("disp"),rets );
				//	MatExec.execFeval("disp",rets );
	/*		
	} catch(Exception e){
					e.printStackTrace();
				}*/
//			}
//
//		}
//		Caller c = new Caller();
//		c.start();
	}



	private void printSelected(SimulationBrowser.Node n ){
		System.out.println(n.getName());

	}
	
	private void SwitchLegend(final MatlabControl mc  ){
		//if (n_arg == null)
			//Nothing is selected.	
			//return;

		//final Node n = n_arg; 
		//System.out.println(n.getName());
		//final MatlabControl mc = new MatlabControl();

		class Caller extends Thread{
			public void run(){
				try{
					//System.out.println("I'm called!!!");
					Object[] args = new Object[2];
					args[0] = "updateLegend";
					args[1] = "switch";
					Object rets[] = new Object[1];
				//	args[0] = simulation;
				//	args[1] = n.getName();
					rets[0] = mc.blockingFeval("setGlobal",args);
					//mc.feval(new String("disp"),rets );
					Object[] arg_leg = new Object[1];
					arg_leg[0] = "show";
					mc.blockingFeval("legend",arg_leg );
				} catch(Exception e){
				}
			}

		}
		Caller c = new Caller();
		c.start();
	}
	
	private void holdAll(final MatlabControl mc  ){

		class Caller extends Thread{
			public void run(){
				try{
					//System.out.println("I'm called!!!");
					Object[] args = new Object[2];
					args[0] = "holdAll";
					args[1] = 1;
					Object rets[] = new Object[1];
				//	args[0] = simulation;
				//	args[1] = n.getName();
					rets[0] = mc.blockingFeval("setGlobal",args);
					//mc.feval(new String("disp"),rets );
					Object[] arg_leg = new Object[1];
					arg_leg[0] = "all";
					mc.blockingFeval("hold",arg_leg );
				} catch(Exception e){
				}
			}

		}
		Caller c = new Caller();
		c.start();
	}
	
	private void holdOff(final MatlabControl mc  ){

		class Caller extends Thread{
			public void run(){
				try{
					//System.out.println("hold off called!!!");
					Object[] args = new Object[2];
					args[0] = "holdAll";
					args[1] = 0;
					Object rets[] = new Object[1];
				//	args[0] = simulation;
				//	args[1] = n.getName();
					rets[0] = mc.blockingFeval("setGlobal",args);
					//mc.feval(new String("disp"),rets );
					Object[] arg_hold = new Object[1];
					arg_hold[0] = "off";
					mc.blockingFeval("hold",arg_hold );
				} catch(Exception e){
				}
			}

		}
		Caller c = new Caller();
		c.start();
	}
	
	private void grid(final MatlabControl mc  ){

		class Caller extends Thread{
			public void run(){
				try{
					//System.out.println("I'm called!!!");
					Object[] args = new Object[2];
					args[0] = "gridOn";
					args[1] = "switch";
					Object rets[] = new Object[1];
				//	args[0] = simulation;
				//	args[1] = n.getName();
					rets[0] = mc.blockingFeval("setGlobal",args);
					Object[] arg_hold = new Object[0];
					//arg_hold[0] = "on";
					mc.blockingFeval("grid",arg_hold );
				} catch(Exception e){
				}
			}

		}
		Caller c = new Caller();
		c.start();
	}
	
	private void strip(final MatlabControl mc  ){

		class Caller extends Thread{
			public void run(){
				try{
					//System.out.println("I'm called!!!");
					Object[] args = new Object[2];
					args[0] = "useNewStrip";
					args[1] = "switch";
					Object rets[] = new Object[1];
				//	args[0] = simulation;
				//	args[1] = n.getName();
					rets[0] = mc.blockingFeval("setGlobal",args);;
				} catch(Exception e){
				}
			}

		}
		Caller c = new Caller();
		c.start();
	}
	
	
	private boolean getGlobal(final MatlabControl mc ,final String varname ){
		//if (n_arg == null)
			//Nothing is selected.	
			//return;

		//final Node n = n_arg; 
		//System.out.println(n.getName());
		//final MatlabControl mc = new MatlabControl();

		class Caller extends Thread{
			private boolean value;

			public void run(){
				try{
					//System.out.println("I'm called!!!");
					Object[] args = new Object[2];
					args[0] = varname;
					args[1] = "keep";
					Object rets[] = new Object[1];
				//	args[0] = simulation;
				//	args[1] = n.getName();
					rets[0] = mc.blockingFeval("setGlobal",args);
					
					double val_ret0 = (Double) rets[0];
					System.out.println(rets[0]);
					System.out.println(val_ret0);
					value = val_ret0 == 1;
					
					//this.value = (boolean) rets[0];
					//mc.feval(new String("disp"),rets );
					//mc.feval(new String("legend show"),rets );
				} catch(Exception e){
				}
			}

		}
		Caller c = new Caller();
		c.start();
		return c.value;
	}

}
