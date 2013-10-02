package be.kuleuven.micas.helpers;

import java.util.List;

/**
 * utensil class to aid in operations on collections, particularly converting to arrays
 * 
 * @author: Stefan Cosemans
 *  last modified: Feb 27, 2011
 *
 */
public class CollectionHelper {

	/*
	public static double[] toArray( List<Double> list ) {
		int L = list.size();
		double[] result = new double[L];
		for( int i=0 ; i<L ; i++ ) {
			result[i]=list.get(i);
		}
		return result;		
	}
	 */
	
	public static String[] toArray( List<String> list ) {
		int L = list.size();
		String[] result = new String[L];
		for( int i=0 ; i<L ; i++ ) {
			result[i]=list.get(i);
		}
		return result;		
	}
	
}
