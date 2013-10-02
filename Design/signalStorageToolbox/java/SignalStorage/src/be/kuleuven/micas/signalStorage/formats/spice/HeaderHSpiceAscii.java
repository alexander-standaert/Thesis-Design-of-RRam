package be.kuleuven.micas.signalStorage.formats.spice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import be.kuleuven.micas.helpers.MetaInfoImplementation;
import be.kuleuven.micas.signalStorage.CompressedNamesIndex;
import be.kuleuven.micas.signalStorage.formats.GenericLineReader;
import be.kuleuven.micas.signalStorage.headerHierarchy.HeaderEntry;
import be.kuleuven.micas.signalStorage.interfaces.NamesIndex;


/**
 * @deprecated
 * 
 * A helper class to read the header of a hspice transient ASCII file and construct
 * a corresponding SimulationOutputHeader
 * 
 * startOfData indicates the value of the first data-point, so little time is lost
 * by splitting the reading procedure in two parts
 * 
 * To output this file format in hspice, add these lines to the spice netlist:
 * .PRINT TRAN
 * .OPTIONS POST=ASCII
 * 
 * Output is then dumped in netlistName.tr0
 * 
 * 
 */
public class HeaderHSpiceAscii {
	
	private int startOfData;
	private NamesIndex header;
	private boolean skipSignal0=false;  // true if signal 0 ="0" - otherwise problem with tree construction

	public int getStartOfData() {
		return startOfData;
	}
	public NamesIndex getHeader() {
		return header;
	}
	public boolean getSkipSignal0() {
		return skipSignal0;
	}

	public HeaderHSpiceAscii( String filename ) throws IOException {
		super();
		header = readHeaderInternal(filename);		
	}

	public static NamesIndex readHeader( String filename ) throws IOException {
		HeaderHSpiceAscii headerReader = new HeaderHSpiceAscii( filename );
		return headerReader.getHeader();
	}

	public NamesIndex readHeaderInternal( String filename ) throws IOException {

		GenericLineReader lr = new GenericLineReader( filename );

		MetaInfoImplementation meta = new MetaInfoImplementation();
		
		// ------------------------- example header code:
		// note: wraps around at x columns
		// ID - some spaces - title (65 chars) - date space time space -
		// copyright notice - junk numbers??? - TIME - nodenames $&%#
		// note: names are aligned at tab positions; but long names just run over and
		//       the following name is put at the next free positon.  There is always a
		//       whitespace or newline in between
		/*
		 *00070000000000009601    title                                               
         *	08/28/2009      16:41:07 Copyright (C) 2008 Synopsys, Inc. All Rights Re
		 *served.                    0                                                    
         *                 		 1       1       1       1       1       1       8     
		 *TIME            0               n1              n2              n3              
		 *n4              I(vin           $&%#                                            
		 *0.00000E+000.00000E+000.00000E+000.00000E+000.00000E+000.00000E+000.00000E+0
		 */

		// append strings until we reached ^TIME		
		StringBuffer intro = new StringBuffer("");
		String remainderOfTimeLine=null;
		while( true ) {
			String line=lr.readLine();
			if( line.contains("TIME") ) {
				int timeIndex = line.indexOf("TIME");
				intro.append( line.substring(0,timeIndex) );
				remainderOfTimeLine = line.substring(timeIndex);
				break;
			}
			intro.append( line );
		}
		try {
			meta.setMetaInfo( "id"      , intro.substring(0,20) );
			meta.setMetaInfo( "title"   , intro.substring(20,20+68).trim() );
			meta.setMetaInfo( "date"    , intro.substring(88,88+10).trim() );
			meta.setMetaInfo( "time"    , intro.substring(98,98+14).trim() );
			meta.setMetaInfo( "junk"    , intro.substring(98+14) );
		} catch( IndexOutOfBoundsException e ) {
			System.out.println( "hspice ASCII header file format changed");
		}
		
		//meta.printMetaInfo();
		
		// now append lines to the "TIME ..." line until we find $&%#		
		String signalNamesString = remainderOfTimeLine+" "+
		                           readLineUntilIdentifierLine( lr, "$&%#" );
		String[] signalNames = signalNamesString.split( "\\s+" );
		// last one is the $&%# identifier

		// we assume that the first signalName after 
		
		List<String> yNamesUnits = new ArrayList<String>();
		// copy the signalnames to xName, xUnit, yNames, yUnits
		//String xName = signalNames[0];
		//String xUnit = "s";
		meta.setMetaInfo("xName", "TIME");
		meta.setMetaInfo("xUnit", "s"   );	
		for( int i=1 ; i<signalNames.length-1 ; i++ ) { // skip last token
			String name = signalNames[i];			
			if( i==1 && name.equals("0")) { // skip this basterd
				skipSignal0=true;				
			} else {
				String unit = "V";
				if( name.startsWith("I(")) {
					unit="A";
				}
				yNamesUnits.add( name+" "+unit  );
			}
		}		

		CompressedNamesIndex header = new CompressedNamesIndex( yNamesUnits );
				
		startOfData = lr.getCurrentPosition();
		meta.setMetaInfo("startOfData", ""+startOfData );
		

		lr.close();

		header.addMetaInfoFields( meta );
		
		return header;
	}	


	/**
	 * read lines from lr until a line with the given identifier is encountered
	 * All these lines are appended (newlines are removed) and the
	 * result is returned.
	 * 
	 * The last line is read until the next newline, it does not stop at the
	 * identifier token
	 * 
	 * @throws IllegalArgumentException  if identifier is not encountered before eof
	 */
	public String readLineUntilIdentifierLine( GenericLineReader lr, String identifier ) throws IOException, IllegalArgumentException {
		
		StringBuffer buffer = new StringBuffer();
		while( true ) {
			String addLine = lr.readLine();
			if( addLine==null ) {
				throw new IllegalArgumentException("illegal file format");
			}			
			//buffer.append( addLine+" " );
			buffer.append( addLine );	
			if( addLine.contains( identifier ) ) {
				break;
			}
		}	
		return buffer.toString();
	}
	
	public static void main( String[] args ) throws IOException {
		HeaderHSpiceAscii header = new HeaderHSpiceAscii("/users/micas/scoseman/matlab/spiceReader/RC.tr0");
		
		int L = header.getHeader().getNumberOfSignalNames();
		for( int i=0 ; i<L ; i++ ) {
			//String name=header.getHeader().getName(i);
			HeaderEntry entry=header.getHeader().getEntry(i);
			
			System.out.println( "'"+entry.getName()+"' "+entry.getUnit()+"'" );
		}		
	}
	
	
	
}
