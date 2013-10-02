package be.kuleuven.micas.signalStorage.simulationBrowser;


	import java.awt.BorderLayout;
	import java.awt.Dimension;
	import java.awt.event.ActionEvent;
	import java.awt.event.ActionListener;


	import javax.swing.JButton;
	import javax.swing.JFrame;
	import javax.swing.JPanel;
	import javax.swing.JToolBar;

import be.kuleuven.micas.matlabcontrol.MatlabControl;
import be.kuleuven.micas.matlabcontrol.MatlabSynchronizedExecutor;

	public class TreeToolbar extends JToolBar implements ActionListener {
	  /**
		 * 
		 */
		private static final long serialVersionUID = 1L;



	  protected String newline = "\n";

	//  MatlabControl mc;
	  MatlabSynchronizedExecutor MatExec ;
	  static final private String GRID = "grid";
	  static final private String LEGEND = "legend";
	  static final private String STRIP = "strip";
	  static final private String HOLD = "hold";
	  static final private String REFRESH = "refresh";
	  
	  JButton legendB;
	  JButton gridB;
	  JButton stripB;
	  JButton refreshB;
	  JButton holdB;
	  
	  public TreeToolbar(String text,MatlabSynchronizedExecutor MatExec) {
	    //super(new BorderLayout());
		  super("text");
	    //Create the toolbar.
	    //JToolBar toolBar = new JToolBar(text);
		//MatlabControl mc = new MatlabControl();
		//MatExec = new MatlabSynchronizedExecutor(mc);
		//MatExec.outputMatlab("started Matlab Executor");
		  this.MatExec = MatExec;
	    addButtons();
	    
	    //Create the text area used for output. Request
	    //enough space for 5 rows and 30 columns.
	    

	  }
	  
	  protected void addButtons() {

	    gridB = makeNavigationButton( GRID, "grid on/off",
	        "Grid");
	    add(gridB);
	    
	    legendB = makeNavigationButton(LEGEND,
		        "update legend on/off", "legend on/off");
		 add(legendB);
		 
		 stripB = makeNavigationButton(STRIP,
			        "stripped plotting on/off", "stripPlot on/off");
			    add(stripB);
			    
	    holdB = makeNavigationButton(HOLD,
				        "hold on/off", "hold on/off");
				    add(holdB);    
		    
		refreshB = makeNavigationButton(REFRESH,
			    "refresh the graph" , "Refresh");
			    add(refreshB);
			    
			    updateButtons();
	    
	  }
	  
	  protected  void updateButtons() {
		  //update legend button
			if (MatExec.getGlobal( "updateLegend")) {
				  legendB.setText("legend ON");
			  } else {
				  legendB.setText("legend OFF");
			  }
	
		  
		  if (MatExec.getGlobal( "gridOn")) {
			  gridB.setText("grid ON");
		  } else {
			  gridB.setText("grid OFF");
		  }
	  
	  
		  if (MatExec.getGlobal( "useNewStrip")) {
			  stripB.setText("newStrip ON");
		  } else {
			  stripB.setText("newStrip OFF");
		  }
	  
		  if (MatExec.getGlobal( "holdAll")) {
			  holdB.setText("hold ALL");
		  } else {
			  holdB.setText("hold OFF");
		  }
	  
	  
	  }
	  

	  protected JButton makeNavigationButton(
	      String actionCommand, String toolTipText, String altText) {
	    //Look for the image.
//	    String imgLocation = "ressources/" + imageName
//	        + ".gif";
//	    URL imageURL = TreeToolbar.class.getResource(imgLocation);

	    //Create and initialize the button.
	    JButton button = new JButton();
	    button.setActionCommand(actionCommand);
	    button.setToolTipText(toolTipText);
	    button.addActionListener(this);

//	    if (imageURL != null) { //image found
//	      button.setIcon(new ImageIcon(imageURL, altText));
	      
//	    } else { //no image found
	      button.setText(altText);
//	      System.err.println("Resource not found: " + imgLocation);
//	    }
	    return button;
	  }

	  public void actionPerformed(ActionEvent e) {
	    String cmd = e.getActionCommand();
	    
       // MatExec.outputMatlab(cmd);
	    // Handle each button.
	    if (LEGEND.equals(cmd)) { //first button clicked
	      SwitchLegend();
	    } else if (GRID.equals(cmd)) { // second button clicked
			grid();
	    } else if (STRIP.equals(cmd)) { // third button clicked
	      strip();
	    } else if (HOLD.equals(cmd)) {
	    	hold();
	    } else if ( REFRESH.equals(cmd)) {
	    	refreshPlot();
	    }
	    updateButtons();

	  }			
		
	
	  
	  private void refreshPlot() {
		Object[] args = new Object[0];
		//MatExec.execBlockingFeval("refreshPlot", args);
		MatExec.execFeval("refreshPlot", args);
		
	}

	private void SwitchLegend( ){
						Object[] args = new Object[2];
						args[0] = "updateLegend";
						args[1] = "switch";
						Object rets[] = new Object[1];

						//try {
							rets[0] = MatExec.execBlockingFeval("setGlobal",args);
//						} catch (TimeoutException e) {
//							MatExec.outputMatlab("lost the server while updating the legend...");
//							e.printStackTrace();
//						}
						//mc.feval(new String("disp"),rets );
						Object[] arg_leg = new Object[1];
						arg_leg[0] = "off";
						MatExec.execFeval("legend",arg_leg );
						if(MatExec.getGlobal( "updateLegend")) {
							arg_leg[0] = "show";
							MatExec.execFeval("legend",arg_leg );
						}
					} 
		
		
		
		private void hold(){
						//System.out.println("I'm called!!!");
						Object[] args = new Object[2];
						args[0] = "holdAll";
						args[1] = "switch";
						Object rets[] = new Object[1];
//						try {
							rets[0] = MatExec.execBlockingFeval("setGlobal",args);
//						} catch (TimeoutException e) {
//							MatExec.outputMatlab("lost the server while updating hold");
//							e.printStackTrace();
//						}
						Object[] arg_leg = new Object[1];
						if(MatExec.getGlobal("holdAll")) {
							arg_leg[0] = "all";
						} else {
							arg_leg[0] = "off";
						}
						MatExec.execFeval("hold",arg_leg );
						
		
		}
		
		private void grid( ) {
						Object[] args = new Object[2];
						args[0] = "gridOn";
						args[1] = "switch";
						Object rets[] = new Object[1];
//						try {
							rets[0] = MatExec.execBlockingFeval("setGlobal",args);
//						} catch (TimeoutException e) {
//							MatExec.outputMatlab("lost the server while updating the grid");
//							e.printStackTrace();
//						}
						Object[] arg_hold = new Object[1];
						arg_hold[0] = "off";
						if (MatExec.getGlobal( "gridOn")) 
							arg_hold[0] = "on";
						MatExec.execFeval("grid",arg_hold );
					} 
				

			
			
		
		
		private void strip( ){
						Object[] args = new Object[2];
						args[0] = "useNewStrip";
						args[1] = "switch";
						Object rets[] = new Object[1];
						//try {
							rets[0] = MatExec.execBlockingFeval("setGlobal",args);
						//} 
						//catch (TimeoutException e) {
						//	MatExec.outputMatlab("lost the server while updating the strip");
						//	e.printStackTrace();
						//};
		}
		


	/**
	   * Create the GUI and show it. For thread safety, this method should be
	   * invoked from the event-dispatching thread.
	   */
	  private static void createAndShowGUI() {
		  
	    //Make sure we have nice window decorations.
	    JFrame.setDefaultLookAndFeelDecorated(true);

	    //Create and set up the window.
	    JFrame frame = new JFrame("SwingToolBarDemo");
	    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	  //Create the toolbar.
	    TreeToolbar toolBar = new TreeToolbar("Still draggable",new MatlabSynchronizedExecutor(new MatlabControl()));
	   // addButtons(toolBar);
	  //  JTextArea textArea = toolBar.getTextArea();
	    //Create the text area used for output. Request
	    //enough space for 5 rows and 30 columns.
	    //textArea.setEditable(false);
	    //JScrollPane scrollPane = new JScrollPane(textArea);
	  //  scrollPane.add(textArea);
	    //Lay out the main panel.
	    JPanel newContentPane = new JPanel();
	    newContentPane.setPreferredSize(new Dimension(450, 130));
	    newContentPane.add(toolBar, BorderLayout.PAGE_START);
	   // newContentPane.add(textArea);
	    //newContentPane.add(scrollPane, BorderLayout.CENTER);
	    
	    //Create and set up the content pane.
	   // 
	    newContentPane.setOpaque(true); //content panes must be opaque
	    frame.setContentPane(newContentPane);

	    //Display the window.
	    frame.pack();
	    frame.setVisible(true);
	  }

	  public static void main(String[] args) {
	    //Schedule a job for the event-dispatching thread:
	    //creating and showing this application's GUI.
		  
	    javax.swing.SwingUtilities.invokeLater(new Runnable() {
	      public void run() {
	        createAndShowGUI();
	      }
	    });
	  }
	}


