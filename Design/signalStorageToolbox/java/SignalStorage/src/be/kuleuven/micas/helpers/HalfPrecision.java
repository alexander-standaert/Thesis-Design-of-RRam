package be.kuleuven.micas.helpers;

/*
 * helper class to convert 
 *  - double values into their HPF binary format ( packed as int ) 
 *  		( not implemented yet, see c implementation in spectreBinaryWaves UWI modules )  
 *  - binary representation ( packed as int ) of a HPF value into its value as double
 *   
 */

public class HalfPrecision {

	/*
	 * value must be an unsigned short (0...65535)
	 */
	private final static int b10_14 =  (1   +2   +4   +8   +16  )<<10;
	//							 2^10+2^11+2^12+2^13+2^14;
	private final static int b15    =  1<<15; //2^15
	private final static int b0_9   = (1<<10)-1;
	private final static int b10    = (1<<10);
	
	public static double HPFtoFloat( int hpf ) {			    
		
		int signBit = ( ( hpf & b15 ) >> 15 ) ;		
//	    signBit = single( bitshift( bitand( hpf, 2^15 ), -15 ) );
		
		int sign=-1;
		if( signBit==0 ) { sign=1; }		
//	    sign = (-1).^signBit;
			        
		int exponent = ( hpf & b10_14 ) >> 10;
//	    exponent = single( bitshift( bitand ( hpf, sum( 2.^(10:14) ) ), -10 ) );

		int significand = ( hpf & b0_9 );
		if( exponent!=0 ) {
			significand = significand+ b10;
		}

		if( exponent==0) {
			return sign * significand * Math.pow(2, -14 ) * Math.pow( 2,- 10 ) ;			
		}	else {
			return sign * significand * Math.pow(2, (exponent-15) ) * Math.pow( 2, -10);					
		}
		//	    f = ( exponent==0 ) .* sign .* 2.^(-14) .* significand .* 2^(-10) + ...
		//	        ( exponent~=0 ) .* sign .* 2.^(exponent-15) .* significand .* 2^(-10) ;
	   
	}
	
}
