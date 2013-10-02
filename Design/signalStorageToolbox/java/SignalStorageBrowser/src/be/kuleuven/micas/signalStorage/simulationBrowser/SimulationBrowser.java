package be.kuleuven.micas.signalStorage.simulationBrowser;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTree;
import javax.swing.SwingUtilities;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreePath;

import be.kuleuven.micas.helpers.TicToc;
import be.kuleuven.micas.matlabcontrol.MatlabControl;
import be.kuleuven.micas.matlabcontrol.MatlabSynchronizedExecutor;
import be.kuleuven.micas.signalStorage.AlphanumComparator;
import be.kuleuven.micas.signalStorage.CompressedNamesIndex;
import be.kuleuven.micas.signalStorage.SignalDatabaseImpl;
import be.kuleuven.micas.signalStorage.SimulationLoader;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderHierarchy;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderHierarchyPlus;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;
import be.kuleuven.micas.signalStorage.interfaces.SignalDatabase;
import be.kuleuven.micas.signals.Signal;


public class SimulationBrowser extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static void main(String[] args) {
		//SimuFile sim = new SimuFile();	
		//new SimulationTree(sim.simu);
		new SimulationBrowser();
	}

	private SignalDatabaseImpl simulation;
	private HashSet<TreePath> previouslySelected;
	@SuppressWarnings("unused")
	private JTree tree;
	
	public SimulationBrowser() {
		super("Simulation browser");

		SimuFile sim = new SimuFile();	

		this.simulation = sim.simu;
		this.previouslySelected = new HashSet<TreePath>();
		SwingCaller c = new SwingCaller(this , sim.simu );
		SwingUtilities.invokeLater(c);
	}

	public SimulationBrowser(SignalDatabaseImpl simulation) {
		super("Simulation browser");

		this.simulation = simulation;
		this.previouslySelected = new HashSet<TreePath>();
		SwingCaller c = new SwingCaller(this , simulation);
		SwingUtilities.invokeLater(c);
	}
	
	public SimulationBrowser( String Path ) {
		super("Simulation browser");

		SimuFile sim = new SimuFile(Path);	
		this.simulation = sim.simu;
		this.previouslySelected = new HashSet<TreePath>();
		SwingCaller c = new SwingCaller(this , sim.simu );
		SwingUtilities.invokeLater(c);
	}


	class SwingCaller extends Thread{
		private SignalDatabaseImpl simulation;
		private SimulationBrowser tree;
		private DefaultTreeModel model;
		private MatlabSynchronizedExecutor MatExec;
		public SwingCaller(SimulationBrowser tree ,  SignalDatabaseImpl simulation){
			super();
			this.tree = tree;
			this.simulation = simulation;
		}

		@Override
		public void run(){
			try{
			//	long tic = TicToc.tic();
				MatExec = new MatlabSynchronizedExecutor(new MatlabControl()); 
				Object[] args = {"UWIViewerObject" , simulation};
				MatExec.execFeval("setGlobal", args);
				//WindowUtilities.setNativeLookAndFeel();
				// addWindowListener(new ExitListener());
				Container content = getContentPane();
				//Object[] hierarchy = SimulationTree.buildList(simulation,null);
				
				DefaultMutableTreeNode root = new DefaultMutableTreeNode(simulation.getMetaInfo("title"));
				this.model = new DefaultTreeModel(root);
				
				
				//DefaultMutableTreeNode root = tree.processHierarchy(SimulationTree.buildList(simulation,null));
				//root.add(tree.processHierarchy(SimulationBrowser.buildList(simulation,null),model));
				//System.out.println("nb signals: "+ simulation.getNumberOfSignalNames());
				Vector<DefaultMutableTreeNode> NodeList = tree.processHierarchy(simulation,model);
				for (DefaultMutableTreeNode i : NodeList)
					root.add(i);
				JTree tree = new JTree(root);
				// ok, so... isn't that ugly ?
				this.tree.tree = tree;
				//tree.setSelectionModel(selectionModel)
				//(TreeSelectionModel.SINGLE_TREE_SELECTION);
				//Selection listener
				//tree.addTreeSelectionListener(new TreeSelectListener(tree,simulation));

				
				TreePopup menuBar = new TreePopup(tree,simulation,MatExec);
//				TreePopup menuBar = new TreePopup(tree,simulation);
				tree.add(menuBar);
				
				TreeToolbar toolBar = new TreeToolbar("some kind of name",MatExec);
				toolBar.setOpaque(true); //content panes must be opaque
			    //setContentPane(toolBar);
			    //tree.add(toolBar);
			    content.add(toolBar, BorderLayout.PAGE_START);
			    
				//Add listener to components that can bring up popup menus.
				MouseListener popupListener = new PopupListener(tree , menuBar,MatExec);
				tree.addMouseListener(popupListener);
				menuBar.addMouseListener(popupListener);

				content.add(new JScrollPane(tree), BorderLayout.CENTER);
				setSize(400, 500);
				tree.revalidate();
				setVisible(true);  
				
				//TicToc.tocP(true,tic);
				//TicToc.
			} catch(Exception e){
				//                System.out.println(e.toString());
			}
		}
	}

	class PopupListener extends MouseAdapter {
		private JPopupMenu popup;
		private JTree parent;
		private MatlabSynchronizedExecutor MatExec;
		public PopupListener(JTree parent , JPopupMenu popup,MatlabSynchronizedExecutor MatExec){
			super();
			this.parent = parent;
			this.popup = popup;
			this.MatExec = MatExec;
		}


		@Override
		public void mousePressed(MouseEvent e) {
			TreePath[] selection  = parent.getSelectionPaths();

			TreePath underMouse = parent.getPathForLocation(e.getX(), e.getY());
			if(underMouse != null)
				if ( selection == null || Arrays.asList(selection).indexOf(underMouse) == -1 ) {
					parent.clearSelection();
					//TreePath newSelection = parent.getPathForLocation(e.getX(), e.getY());
					parent.addSelectionPath(underMouse);
				}
		//	System.out.println("mouse pressed, ID: " + e.getID());
			maybeShowPopup(e);
		}

		@Override
		public void mouseReleased(MouseEvent e) {
		//	System.out.println("mouse released, ID:" + e.getID());
			maybeShowPopup(e);
		}

		private void maybeShowPopup(MouseEvent e) {
			final DefaultMutableTreeNode node = (DefaultMutableTreeNode) parent.getLastSelectedPathComponent();
			
			if (node != null) {
				if ( e.getID() == MouseEvent.MOUSE_RELEASED ) {
	//
					//System.out.println("nb clicks: " + e.getClickCount());
				if(e.getClickCount() == 2) {
					addNodeToTheList(parent.getSelectionPath());
					myDoubleClick(node,MatExec);
				}
				}
			}
			if (e.isPopupTrigger()) {
				addNodesToTheList(parent.getSelectionPaths());
				popup.show(e.getComponent(),
						e.getX(), e.getY());
			}

		}
	}
	
	private void addNodesToTheList(TreePath[] selected){
		previouslySelected.addAll(Arrays.asList(selected));
	}
	
	private Vector<DefaultMutableTreeNode>  processHierarchy(SignalDatabaseImpl simulation2,
			DefaultTreeModel model) {
		
		//System.out.println("build list");
		HeaderHierarchy header;
		NamesIndex generic_header = simulation.getHeader();
		//System.out.println(generic_header.getClass().getName());
		CompressedNamesIndex index = (CompressedNamesIndex) generic_header;
		String[] yNamesC = index.getRawCompressedNames();
		List<List<String>> sets = index.getRawSets();		
		ArrayList<String> compressedNames = new ArrayList<String>();
		for( String name : yNamesC) { compressedNames.add( name ); }
		header = HeaderHierarchy.createTreeFromNamesWithSubsets( compressedNames, sets );		
		//System.out.println("converting list");
		
		Vector<DefaultMutableTreeNode> NodeList = new Vector<DefaultMutableTreeNode>();
		//DefaultMutableTreeNode node = new DefaultMutableTreeNode(index.getTitle());
		DefaultMutableTreeNode child;
		//header.printTree();
		List<HeaderEntry>  root_nodes = header.getEntriesAtThisLevel(0);
		//for (HeaderEntry j : root_nodes ){
		//	System.out.println(j.getName());
		//}
		Collections.sort(root_nodes);
		
		Set<String> subcktSet = header.getSubsets().keySet();
		List<String> subcktList = new ArrayList<String>(subcktSet);
		Collections.sort(subcktList,new AlphanumComparator());
		 for ( String subckt : subcktList){
			 	//node.add(buildTreeLeaf(header,subckt));
			 	NodeList.add(buildTreeLeaf(header,subckt,subckt));
		 }
		
		
		for (HeaderEntry i : root_nodes) {
			//make leaf , add them to the tree... 
			String nodeName = i.getName();
			Node n = new SimulationBrowser.Node(nodeName , nodeName);
			child = new DefaultMutableTreeNode(n); // Ie Leaf
			NodeList.add(child);
			//node.add(child);
		}
		
		
		//for (HeaderEntry i : header.subsets)
		
		 /*
		Map<String, HeaderHierarchyPlus> subsets = header.getSubsets();
		list.add(buildSubcktSet(subsets));
		
		for(int i=1; i<hierarchy.length; i++) {
			Object nodeSpecifier = hierarchy[i];
			if (nodeSpecifier instanceof Object[]) {  // Ie node with children
				child = processHierarchy((Object[])nodeSpecifier,model);
				//child = new LazyLoadingTreeNode(this,node,simulation,(Object[])nodeSpecifier,model);
			} else {
				child = new DefaultMutableTreeNode(nodeSpecifier); // Ie Leaf
			}
			node.add(child);
		}
		*/
		 
		 //DefaultMutableTreeNode[] array = null;
		 //array = NodeList.toArray(array);
		return NodeList;
		 //return (DefaultMutableTreeNode[]) NodeList.toArray();
		
	}

	private DefaultMutableTreeNode buildTreeLeaf(HeaderHierarchy header , String subckt ,String subcktFullName) {
		
		//System.out.println("subckt "+subcktFullName);
		HeaderHierarchyPlus subcktDesc = header.getSubsets().get(subckt);
		HeaderHierarchy subcktHH = subcktDesc.getSubset();
		
		DefaultMutableTreeNode node = new DefaultMutableTreeNode(subckt);
		DefaultMutableTreeNode child;
		
		Set<String> subcktSet = subcktHH.getSubsets().keySet();
		List<String> subcktList = new ArrayList<String>(subcktSet);
		Collections.sort(subcktList,new AlphanumComparator());
		 for ( String subsubckt : subcktList){
			 	node.add(buildTreeLeaf(subcktHH, subsubckt ,subcktFullName + subsubckt ));
		 }
		
		List<HeaderEntry>  root_nodes = subcktHH.getEntriesAtThisLevel(subcktDesc.getBaseIndex());
	
		
		Collections.sort(root_nodes);
		
		for (HeaderEntry i : root_nodes) {
			//make leaf , add them to the tree... 
			String nodeName = i.getName();
			//System.out.println("subcktFullName: " + subcktFullName + ", nodeName: " + nodeName);
			Node n = new SimulationBrowser.Node(subcktFullName+nodeName , nodeName.substring(1));
			child = new DefaultMutableTreeNode(n); // Ie Leaf
			node.add(child);
		}
		
		
		 return node;
	}

	private void addNodeToTheList(TreePath node) {
		previouslySelected.add(node);
	}

	public Signal[] getOpenedSignals()  {
		HashSet<Signal> Signals = new HashSet<Signal>();
		for ( TreePath path : previouslySelected ) {
			
			DefaultMutableTreeNode treeNode = (DefaultMutableTreeNode) path.getLastPathComponent();
			Node node = (Node) treeNode.getUserObject();
			Signals.add(simulation.getSignal(node.getName()));
		}
		return Signals.toArray(new Signal[0]);
	}
	
	public SignalDatabase getSimulationObject(){
		return simulation;
	}


	public void myDoubleClick(DefaultMutableTreeNode node ,MatlabSynchronizedExecutor MatExec) {


		if (node == null)
			//Nothing is selected.	
			return;
	//	System.out.println("dbl click detected");
		if(node.isLeaf()){
			final SimulationBrowser.Node n = (Node) node.getUserObject();
			//System.out.println(n.getName());
			//final MatlabControl mc = new MatlabControl();

			//class Caller extends Thread{
				
				//public void run(){
				//	try{
						Object[] args = new Object[2];
						//args[0] = 1;
						//args[1] = n.getName() + "\n";
						//Object rets[] = new Object[1];
						//rets[0] =  mc.blockingFeval("fprintf", args);
						//args[0] = "uuuu\n";
						// rets[0] =  mc.blockingFeval("fprintf", args);
						//   mc.feval(new String("disp"),rets );
						args[0] = simulation;
						args[1] = n.getName();
				//		System.out.println("sending command");
						//rets[0] = mc.blockingFeval("plotSignalFromName",args);
						//mc.feval(new String("disp"),rets );
						//rets[0] = 
							MatExec.execFeval("plotSignalFromName",args);
				//	} catch(Exception e){
				//	}
			//	}

			//}
			//Caller c = new Caller();
			//c.start();
		}

	}


	@SuppressWarnings("unused")
	private static Object[] oldBuildList(SignalDatabaseImpl simulation , String basename){
		//HashSet<Object> list = new HashSet<Object>();
		Vector<Object> list = new Vector<Object>();
		String[] names;
		int baselength;
		if( basename != null){
			baselength = basename.length()+1;
			String[] sublist = basename.split("\\.");
			list.add(sublist[sublist.length-1]);
			basename = basename + ".";
			names = simulation.getNamesForFilter(basename+".*");
		}else{
			//
			// the first node is now declared separatedly
			//
			//list.add(simulation.getMetaInfo("title"));
			list.add("root");
			baselength = 0;
			basename = "";
			
			names = simulation.getAllNames();
		}
		//basename.substring(beginIndex)
		HashSet<String> subcktList = new HashSet<String>();
		for (String longName : names){
			String name = (longName.substring(baselength));
			String[] splitted =  name.split("\\.");
			//StringTokenizer st = new StringTokenizer(name, ".");
			if ( splitted.length <2 ) {
				Node n = new SimulationBrowser.Node(longName ,name);
				list.add(n);
			} else {
				String subckt = splitted[0];
				subcktList.add(subckt);
				//if (!list.contains(subckt) ){
				// list.add(subckt);
					// Object[] subList = buildList(simulation,basename+subckt);
					// list.add(subList);
			//}
			}
		}
		for (String subckt : subcktList ){
			list.add(buildList(simulation,basename+subckt)); 
		}
		
		return list.toArray();
		
	}
	
	private static Object[] buildList(SignalDatabaseImpl simulation , String basename){
		//System.out.println("build list");
		HeaderHierarchy header;
		NamesIndex generic_header = simulation.getHeader();
		//System.out.println(generic_header.getClass().getName());
		CompressedNamesIndex index = (CompressedNamesIndex) generic_header;
		String[] yNamesC = index.getRawCompressedNames();
		List<List<String>> sets = index.getRawSets();		
		ArrayList<String> compressedNames = new ArrayList<String>();
		for( String name : yNamesC) { compressedNames.add( name ); }
		header = HeaderHierarchy.createTreeFromNamesWithSubsets( compressedNames, sets );		
		
		
		//System.out.println("converting list");
		//header.printTree();
		List<HeaderEntry>  root_nodes = header.getEntriesAtThisLevel(0);
		//for (HeaderEntry j : root_nodes ){
		//	System.out.println(j.getName());
		//}
		Vector<Object> list = new Vector<Object>();
		list.add(index.getTitle());
		for (HeaderEntry i : root_nodes) {
			String nodeName = i.getName();
			Node n = new SimulationBrowser.Node(nodeName , nodeName);
			list.add(n);
		}
		
		Map<String, HeaderHierarchyPlus> subsets = header.getSubsets();
		list.add(buildHierarchySubSet(subsets));
		
	
		/*
		//HashSet<Object> list = new HashSet<Object>();
		
		
		int baselength;
		if( basename != null){
			baselength = basename.length()+1;
			String[] sublist = basename.split("\\.");
			list.add(sublist[sublist.length-1]);
			basename = basename + "\\.";
			names = simulation.getNamesForFilter(basename+"[^.]*");
		}else{
			//
			// the first node is now declared separately
			//
			list.add("root");
			baselength = 0;
			basename = "";
			//names = simulation.getAllNames();
			names = simulation.getNamesForFilter("[^.]*");
		}
		//basename.substring(beginIndex)
		HashSet<String> subcktList = new HashSet<String>();
		for (String longName : names){
			String name = (longName.substring(baselength));
			String[] splitted =  name.split("\\.");
			//StringTokenizer st = new StringTokenizer(name, ".");
			if ( splitted.length <2 ) {
				Node n = new SimulationBrowser.Node(longName ,name);
				list.add(n);
			} else {
				String subckt = splitted[0];
				subcktList.add(subckt);
				//if (!list.contains(subckt) ){
				// list.add(subckt);
					// Object[] subList = buildList(simulation,basename+subckt);
					// list.add(subList);
			//}
			}
		}
		if( basename != null){
			names = simulation.getNamesForFilter(basename+"\\.[^.]*");
		} 
		else {
			names = simulation.getNamesForFilter("[^.]*");
		}
			
		for (String longName : names){
			String name = (longName.substring(baselength));
			String[] splitted =  name.split("\\.");
			//StringTokenizer st = new StringTokenizer(name, ".");
			String subckt = splitted[0];
			subcktList.add(subckt);
		}
		
		for (String subckt : subcktList ){
			list.add(buildList(simulation,basename+subckt)); 
		}
		*/
		return list.toArray();
		
	}

	private static Object[] buildHierarchySubSet( Map<String, HeaderHierarchyPlus> subsets) {
		 Set<String> subcktSet = subsets.keySet();
		 Vector<Object> generalList = new Vector<Object>();
		//List<Object> subcktList = new List<Object>()
		 for ( String subckt : subcktSet){
			Vector<Object> subcktList = new Vector<Object>();
			subcktList.add(subckt);
			HeaderHierarchy subcktDesc = subsets.get(subckt).getSubset();
			
			
			List<HeaderEntry>  root_nodes = subcktDesc.getEntriesAtThisLevel(subsets.get(subckt).getBaseIndex());
			//for (HeaderEntry j : root_nodes ){
			//	System.out.println(j.getName());
			//}
			for (HeaderEntry i : root_nodes) {
				String nodeName = i.getName();
				Node n = new SimulationBrowser.Node(subckt  + nodeName , nodeName.substring(1));
				subcktList.add(n);
			}
			subcktList.add(buildHierarchySubSet(subcktDesc.getSubsets()));
			generalList.add(subcktList.toArray());
		}
		return generalList.toArray();
	}

	/** Small routine that will make node out of the first entry
	 *  in the array, then make nodes out of subsequent entries
	 *  and make them child nodes of the first one. The process is
	 *  repeated recursively for entries that are arrays.
	 * @param model 
	 */
/*
	private DefaultMutableTreeNode processHierarchy(Object[] hierarchy, DefaultTreeModel model) {
		DefaultMutableTreeNode node =
			new DefaultMutableTreeNode(hierarchy[0]);
		DefaultMutableTreeNode child;
		for(int i=1; i<hierarchy.length; i++) {
			Object nodeSpecifier = hierarchy[i];
			if (nodeSpecifier instanceof Object[]) {  // Ie node with children
				child = processHierarchy((Object[])nodeSpecifier,model);
				//child = new LazyLoadingTreeNode(this,node,simulation,(Object[])nodeSpecifier,model);
			} else {
				child = new DefaultMutableTreeNode(nodeSpecifier); // Ie Leaf
			}
			node.add(child);
		}
		return(node);
	}
*/
	static public final class Node {
		private String shortName;
		private String name;

		public Node(String name , String shortName){
			this.name = name;
			this.shortName = shortName;
		}

		public String getName(){
			return name;
		}

		public final String  getShortName(){
			return shortName;
		}

		@Override
		public final String toString(){
			return getShortName();
		}
	}

	static class SimuFile extends JFrame {
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		public SignalDatabaseImpl simu;
		public   SimuFile(){
			//Create a file chooser
			final JFileChooser fc = new JFileChooser();
			//File fstart = new File("/users/micas/avignon/cordelia/SimOutput");
			
//			fc.setCurrentDirectory(fstart);
			int returnVal = fc.showOpenDialog(SimuFile.this);
			if (returnVal == JFileChooser.APPROVE_OPTION) {
				File file = fc.getSelectedFile();
				//This is where a real application would open the file.
				//System.out.println("Opening: " + file.getAbsoluteFile() );
				String filename = file.getAbsolutePath();
				try {
					this.simu = (SignalDatabaseImpl) SimulationLoader.loadSimulation(filename);
					//this.simu = SimulationCompressedUWI.read(filename);

				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		
		public   SimuFile( String Path){
			//Create a file chooser
			final JFileChooser fc = new JFileChooser();
			File fstart = new File(Path);
			
			fc.setCurrentDirectory(fstart);
			int returnVal = fc.showOpenDialog(SimuFile.this);
			if (returnVal == JFileChooser.APPROVE_OPTION) {
				File file = fc.getSelectedFile();
				//This is where a real application would open the file.
				//System.out.println("Opening: " + file.getAbsoluteFile() );
				String filename = file.getAbsolutePath();
				try {
					this.simu = (SignalDatabaseImpl) SimulationLoader.loadSimulation(filename);
					//this.simu = SimulationCompressedUWI.read(filename);

				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		




	} }
