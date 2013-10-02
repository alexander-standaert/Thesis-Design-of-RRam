package be.kuleuven.micas.helpers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class VectorHelper {

	/**
	 * return a new double vector corresponding to -in
	 * 
	 * @param in
	 * @return -in
	 */
	static public double[] invert( double[] in ) {
		int L=in.length;
		double[] out = new double[L];
		for( int i=0 ; i<L ; i++ ) {
			out[i] = - in[i];
		}
		return out;
	}
	
	/**
	 * return a new double vector corresponding to abs(in)
	 * 
	 * @param in
	 * @return abs(in)
	 */
	static public double[] abs( double[] in ) {
		int L=in.length;
		double[] out = new double[L];
		for( int i=0 ; i<L ; i++ ) {
			out[i] = Math.abs( in[i] );
		}
		return out;
	}
	
	
	/**
	 * return a new vector c, wich contains the union of the values in a and the values in b with only unique
	 * items, sorted ascending
	 * 
	 * @param a
	 * @param b
	 * @return
	 */
	static public double[] merge( double[] a, double[] b ) {
		double[] aSorted = Arrays.copyOf( a, a.length );
		Arrays.sort(aSorted);		
		double[] bSorted = Arrays.copyOf( b, b.length );
		Arrays.sort(bSorted);
		
		int iA = 0;
		int iB = 0;
		
		List<Double> merged = new ArrayList<Double>();
		
		while( iA<aSorted.length && iB<bSorted.length ) {
			if( aSorted[iA]==bSorted[iB] ) {
				merged.add( aSorted[iA] );
				iA++;
				iB++;				
			} else if( aSorted[iA]<bSorted[iB] ) {
				merged.add( aSorted[iA] );
				iA++;
			} else {
				merged.add( bSorted[iB]);
				iB++;
			}
		}
		
		while( iA<aSorted.length ) {
			merged.add( aSorted[iA] );
			iA++;
		}
		while( iB<bSorted.length ) {
			merged.add( bSorted[iB]);
			iB++;
		}
		
		return MatrixHelper.toArray(merged);
	}
	
	/**
	 * create a new vector whose elements are a[i]+b[i]
	 * a and b must have the same length
	 * 
	 * @param a
	 * @param b
	 * @return
	 */			
	public static double[] add( double[] a, double[] b) {
		double[] sum = new double[a.length];
		for( int i=0 ; i<a.length ; i++ ) {
			sum[i] = a[i] + b[i];
		}
		return sum;
	}
	
	/**
	 * create a new vector whose elements are a[i]+constant
	 * 
	 * @param a
	 * @param constant
	 * @return
	 */			
	public static double[] add( double[] a, double constant ) {
		double[] sum = new double[a.length];
		for( int i=0 ; i<a.length ; i++ ) {
			sum[i] = a[i] + constant;
		}
		return sum;
	}
	
	/**
	 * create a new vector whose elements are a[i]*b[i]
	 * 
	 * @param a
	 * @param b
	 * @return
	 */			
	public static double[] multiply( double[] a, double[] b) {
		double[] prod = new double[a.length];
		for( int i=0 ; i<a.length ; i++ ) {
			prod[i] = a[i] * b[i];
		}
		return prod;
	}
	
	/**
	 * create a new vector whose elements are a[i]*constant
	 * 
	 * @param a
	 * @param constant
	 * @return
	 */			
	public static double[] multiply( double[] a, double constant ) {		
		double[] prod = new double[a.length];
		for( int i=0 ; i<a.length ; i++ ) {
			prod[i] = a[i] * constant;
		}
		return prod;
	}
	
	/**
	 * create a new vector whose elements are a[i]-b[i]
	 * 
	 * @param a
	 * @param b
	 * @return
	 */			
	public static double[] subtract( double[] a, double[] b) {
		double[] diff = new double[a.length];
		for( int i=0 ; i<a.length ; i++ ) {
			diff[i] = a[i] - b[i];
		}
		return diff;
	}
	
	/**
	 * create a new vector whose elements are a[i]-constant
	 * 
	 * @param a
	 * @param constant
	 * @return
	 */			
	public static double[] subtract( double[] a, double constant ) {
		double[] diff = new double[a.length];
		for( int i=0 ; i<a.length ; i++ ) {
			diff[i] = a[i] - constant;
		}
		return diff;
	}
	
	/**
	 * create a new vector whose elements are a[i]/b[i]
	 * 
	 * @param a
	 * @param b
	 * @return
	 */			
	public static double[] divide( double[] a, double[] b) {
		double[] div = new double[a.length];
		for( int i=0 ; i<a.length ; i++ ) {
			div[i] = a[i] / b[i];
		}
		return div;
	}
	
	/**
	 * create a new vector whose elements are a[i]/constant
	 * 
	 * @param a
	 * @param constant
	 * @return
	 */			
	public static double[] divide( double[] a, double constant ) {
		double[] div = new double[a.length];
		for( int i=0 ; i<a.length ; i++ ) {
			div[i] = a[i] / constant;
		}
		return div;
	}
	
	
}
