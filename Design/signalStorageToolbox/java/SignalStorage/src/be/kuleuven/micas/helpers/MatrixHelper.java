package be.kuleuven.micas.helpers;

import java.util.List;

public class MatrixHelper {

	
	public static double[] toArray( List<Double> list ) {
		int L = list.size();
		double[] result = new double[L];
		for( int i=0 ; i<L ; i++ ) {
			result[i]=list.get(i);
		}
		return result;		
	}
	
	
}
