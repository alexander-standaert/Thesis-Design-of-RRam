package be.kuleuven.micas.helpers;

/**
 * the MetaInfo interface provides some fields to add and retrieve meta info from objects.
 * 
 * <p>
 * Typically, this interface will be implemented by delegating the requests to a member of
 * type MetaInfoImplementation.
 * </p>
 * 
 * @author scoseman
 */
public interface MetaInfo {
	
	// ------------------------------------------------
	// get/set meta-info
	// ------------------------------------------------	
	
	/**
	 * gets all available meta info fields of this simulation output
	 * 
	 * @param	field	the name of the metaInfo to retrieve, for example "title" or "date"
	 * @return	the value of the requested field, 
	 * 			or null if the requested field is not set		
	 */
	public String getMetaInfo( String field );
	
	/**
	 * sets the meta info field to the given value
	 * 
	 * @param field		the name of the metaInfo to set
	 * @param value		the value to which the metafield is set
	 */
	public void setMetaInfo( String field, String value );
	
	/**
	 * gets a String[] with all the metaInfo fields that have been set.
	 * 
	 * @return 	String[] s, the list of all previously set metaInfoFields
	 */
	public String[] getMetaInfoFields( );
	
	/**
	 * appends the content of the provided <code>metaInfo</code> to <code>this</code> 
	 */
	public void addMetaInfoFields( MetaInfo metaInfo );
	
	/**
	 * print the content of the metaInfo object
	 */
	public void printMetaInfo( );
}
