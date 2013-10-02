package be.kuleuven.micas.helpers;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Set;


public class MetaInfoImplementation implements MetaInfo, Serializable {

	private static final long serialVersionUID = 1L;
	HashMap<String, String> metaInfo;
	
	/**
	 * copy constructor
	 * 
	 * @param metaInfo 	another object that implements the MetaInfo interface
	 * 					the MetaInfo is copied   
	 */
	public MetaInfoImplementation( MetaInfo metaInfo ) {
		String[] fields = metaInfo.getMetaInfoFields();
		this.metaInfo = new HashMap<String, String>( );
		for( String key : fields ) {
			this.metaInfo.put( key, metaInfo.getMetaInfo(key) );
		}
	}
	
	/**
	 * default constructor
	 */
	public MetaInfoImplementation( ) {
		metaInfo = new HashMap<String, String>( );
	}
	
	
	public String getMetaInfo(String field) {
		return metaInfo.get(field);
	}

	public String[] getMetaInfoFields() {
		int L = metaInfo.size();
		String[] result = new String[L];
		
		Set<String> keys = metaInfo.keySet();
		int i=0;
		for( String key : keys ) {
			result[i] = key;
			i++;
		}		
		return result;
	}

	public void setMetaInfo(String field, String value) {
		metaInfo.put(field, value);
	}

	
	public void addMetaInfoFields( MetaInfo metaInfo ){
		String[] fields = metaInfo.getMetaInfoFields();
		for( int i=0 ; i<fields.length ; i++ ) {
			String field = fields[i];
			setMetaInfo( field, metaInfo.getMetaInfo(field));
		}
	}
	
	public void printMetaInfo( ) {
		System.out.println( "metaInfo content: [ ");
		String[] fields = getMetaInfoFields();
		for( String key : fields ) {
			String value = getMetaInfo( key);
			System.out.println( "("+key+"::"+value+")" );
		}
		System.out.println( "] ");
	}
	

	
}
