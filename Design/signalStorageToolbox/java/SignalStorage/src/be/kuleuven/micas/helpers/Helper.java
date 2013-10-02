package be.kuleuven.micas.helpers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Helper {

	private static final boolean test=false; 
	
	/*
	 * Converts a string representation of a vector of doubles 
	 * to an array of doubles.  The string representation must be
	 * separated by single spaces.
	 * 
	 * @throws NumberFormatException:	if not a valid double string
	 */
	static public double[] StringToDoubleVector( String string) {
		String[] tokens = string.split(" ");
		int l=tokens.length;
		double[] result=new double[l];
		for( int i=0 ; i<l ; i++ ) {
			result[i] = Double.valueOf( tokens[i] );			
		}		
		return result;
	}
	
	static public double[] 
	StringToDoubleVector( String string, int expectedNumberOfEntries) {
		
		double[] result=StringToDoubleVector(string);
		
		if(expectedNumberOfEntries!=result.length) {
			throw new IllegalArgumentException(
					"expected number of elemements:"+expectedNumberOfEntries+
					" ("+string+")" );
		}
		return result;
	}
	
	static public String doubleVectorToString( double[] v ) {
		StringBuffer b = new StringBuffer();
		b.append("[");
		for( int i=0 ; i<v.length ; i++ ) {
			b.append( " "+v[i] );
			if( i<(v.length-1) ) {
				b.append(",");
			} else {
				b.append(" ");
			}
		}
		b.append("]");
		return b.toString();
	}

	static public String intVectorToString( int[] v ) {
		StringBuffer b = new StringBuffer();
		b.append("[");
		for( int i=0 ; i<v.length ; i++ ) {
			b.append( " "+v[i] );
			if( i<(v.length-1) ) {
				b.append(",");
			} else {
				b.append(" ");
			}
		}
		b.append("]");
		return b.toString();
	}

	
	
	
	static public int[] StringToIntVector( String string) {
		String[] tokens = string.split(" ");
		int l=tokens.length;
		int[] result=new int[l];
		for( int i=0 ; i<l ; i++ ) {
			result[i] = Integer.valueOf( tokens[i] );			
		}		
		return result;
	}
	
	static public int[] 
	StringToIntVector( String string, int expectedNumberOfEntries) {
		
		int[] result=StringToIntVector(string);
		
		if(expectedNumberOfEntries!=result.length) {
			throw new IllegalArgumentException(
					"expected number of elemements:"+expectedNumberOfEntries+
					" ("+string+")" );
		}
		return result;
	}
	
	
	static public double findMinValue( double[] vector ) {
		double min=vector[0];
		for( int i=1 ; i<vector.length ; i++) {
			min = Math.min( min, vector[i] );
		}
		return min;
	}
	
	static public double findMaxValue( double[] vector ) {
		double max=vector[0];
		for( int i=1 ; i<vector.length ; i++) {
			max = Math.max( max, vector[i] );
		}
		return max;
	}
	
	/*
	 * assumes x1 and xs are sorted 
	 * xs should be ascending
	 */
	static public double[] resampleSignal( double[] x1, double[] y1, double[] xs ) {
						
		if( Math.signum( x1[1]-x1[0] ) < 0 ) {
			x1 = reverse(x1);
			y1 = reverse(y1);
		}
				
		int L= xs.length;
		
		int index=0;
				
		double[] ys = new double[L];
		
		// loop invariant: x1[index] <= xi
		for( int i=0; i<L ;i++ ) {
			double xi = xs[i];
						
			if( x1[index] > xi ) {
				throw new IllegalArgumentException("wrong interpolation: x1[index]="+x1[index]+"xs[i]="+ xi+" index="+index+" i="+i);				
			}			
			if( isNear( x1[index], xi, 1e-14) ) {
				ys[i]=y1[index];
				continue;
			}
			while( index<(x1.length-1)  && x1[index+1] < xi ) {
				index=index+1;
			}			
			//now x1[index] <= xi <= x1[index+1]   (if index+1 is a valid index ..)
			if( index == x1.length-1 ) {
				if( isNear( x1[index],xi,1e-14) ) {
					ys[i]=y1[index];
					continue;
				} else {
					throw new IllegalArgumentException("requested extrapolation: x1[index]="+x1[index]+"xs[i]="+ xi+" index="+index+" i="+i);
				}
			}
			//now x1[index] < xi <= x1[index+1]
			
			double x_v1 = x1[index];
			double x_v2 = x1[index+1];
			double y_v1 = y1[index];
			double y_v2 = y1[index+1];
			
			double alpha = ( xi - x_v1 ) / (x_v2 - x_v1 );
			ys[i] = y_v1 * (1-alpha) + y_v2 * alpha;			
		}
		return ys;
	}
	
	
	static public double[] ListToDoubleArray( List<Double> list ) {
		double[] result = new double[ list.size() ];
		for( int i=0 ; i< list.size() ; i++ ) {
			result[i] = list.get(i).doubleValue();			
		}
		return result;
			
	}
	
	static public double[] doubleVector( double start, double step, double stop ) {
		int points = (int) ( (stop-start)/step ) + 1 ;
		double[] vector = new double[ points ];
		
		for( int i=0 ; i<points; i++ ) {
			vector[i] = start + i*step ;			
		}
		
		return vector;
	}
	
	
	/*
	 *   result: y, a vector with same length as x, and y[L-i-1]=x[i]  (L=x.length, i=0..L-1)   
	 */	
	static public double[] reverse( double[] x ) {
		int L=x.length;
		double[] y=new double[L];
		for( int i=0; i<L ; i++ ) {
			y[i] = x[ (L-1)-i ];
		}
		return y;
	}
	
	/*
	 * return x-y  -- must have equal length
	 */
	static public double[] subtract( double[] x, double[] y) {
		int L1= x.length;
		int L2= y.length;
		if( L1 != L2 ) {
			throw new IllegalArgumentException("different lengths in subtract");
		}
		double[] z=new double[L1];
		for( int i=0; i<L1 ; i++ ) {
			z[i]= x[i]-y[i];
		}
		return z;		
	}
	
	static public double[] subtract( double x, double[] y) {		
		int L= y.length;
		
		double[] z=new double[L];
		for( int i=0; i<L ; i++ ) {
			z[i]= x-y[i];
		}
		return z;		
	}
	
	static public double[] multiply(  double[] y, double x) {		
		int L= y.length;
		
		double[] z=new double[L];
		for( int i=0; i<L ; i++ ) {
			z[i]= x*y[i];
		}
		return z;		
	}
	
	/*
	 *  returns the indices of the zero-crossings in v.  if the crossing is on an exact index, this index is returned,
	 *  otherwise, a value between the nearest indices is returned
	 *  
	 *  sub-indexing assumes equally spaced points in v and linear function v between two points
	 */
	static public double[] findZeroCrossings( double[] v ) {
		int L=v.length;
		
		ArrayList<Double> list = new ArrayList<Double>();
		
		if( v[0]==0 ) {
			list.add( new Double(0) );
		}
		
		for( int i=1; i<L ; i++ ) {
			if( v[i]==0 ) {
				list.add( new Double(i) );
				continue;
			}
			if( v[i-1]*v[i]<0 ) {
				// there is a crossing somewhere, and it is not on the nodes itself
				double y1 = v[i];
				double y0 = v[i-1];
				double x1 = i;
				double x0 = (i-1);
				double a=(y1-y0)/(x1-x0);
				double xcross = (0-y0)/a + x0;
				if( test ) { System.out.println( "y1="+y1+" y0="+y0+" x1="+x1+" x0="+x0+" xcross="+xcross ); }
				list.add( new Double(xcross) );
			}
		}
		return Helper.ListToDoubleArray( list );
	}
	
	public static double[] subVector( double[] v, int from, int toInclusive ) {
		return Arrays.copyOfRange(v, from, toInclusive+1 );
	}
	
	public static boolean isNear( double a, double b, double eps) {
		if( Math.abs(a-b)<eps ) {
			return true;
		} else {
			return false;
		}			
	}
	
	
	public static double sumPositiveElements( double[] v ) {
		double sum=0;
		for( int i=0 ; i<v.length ; i++ ) {
			if( v[i] > 0 ) {
				sum = sum + v[i];
			}
		}
		return sum;
	}
	
	public static double sumNegativeElements( double[] v ) {
		double sum=0;
		for( int i=0 ; i<v.length ; i++ ) {
			if( v[i] < 0 ) {
				sum = sum + v[i];
			}
		}
		return sum;
	}
	

	public static double[] log10( double[] v ) {
		double[] log = new double[v.length];
		for( int i=0 ; i<v.length ; i++ ) {
			log[i] = Math.log10( v[i] );
		}
		return log;
	}

	
	public static double[] abs( double[] v ) {
		double[] abs = new double[v.length];
		for( int i=0 ; i<v.length ; i++ ) {
			abs[i] = Math.abs( v[i] );
		}
		return abs;
	}

	
	
	/*
	 * split = e.g. "'" or "$"
	 */
	public static String StringVectorToString(String[] tokens, String split) {
		StringBuffer b = new StringBuffer();
		b.append("{ ");
		for( int i=0; i<tokens.length ; i++ ) {
			b.append( split+tokens[i]+split );
			if( i<tokens.length-1 ) {
				b.append( ", " );
			}
		}
		b.append(" }");
		return b.toString();
	}

	
	/*
	 * replace inf, -inf, nan with the given double value
	 */
	public static double[] replaceStrange(double[] v, double replaceWith ) {
		double[] r = new double[v.length];
		for( int i=0 ; i<v.length ; i++ ) {
			if( Double.isNaN( v[i] ) || Double.isInfinite(v[i]) ) { 
				r[i] = replaceWith;
			} else {
				r[i] = v[i];
			}
		}
		return r;
	}
	
}
