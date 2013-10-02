package be.kuleuven.micas.signals;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import be.kuleuven.micas.helpers.MatrixHelper;
import be.kuleuven.micas.helpers.VectorHelper;




public class Signal implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private final SignalPart x;
	private final SignalPart y;
	
	// ============================================================
	// constructors
	// ============================================================
	
	/**
	 * construct a new signal with the provided SignalParts as x and y components.  
	 * No copy of x and y is made.
	 * 
	 * @param x
	 * @param y
	 * @throws IllegalArgumentException   if x.length != y.length, except if y.length()==0
	 *                                    y.length()==0 is allowed to enable use of not-loaded signals (TODO: check)
	 *  
	 */
	public Signal( SignalPart x, SignalPart y ) throws IllegalArgumentException {

		//To allow the use of not-loaded signals ... ( y-values = empty )		
		if( x.length()!=y.length() && y.length()!=0 ) {
			String e = "signalparts have different length: ("+x.getName()+";"+y.getName()+")\n"+
			           "x.length="+x.length()+", y.length="+y.length() ;
			throw new IllegalArgumentException(e);			
		}
		this.x = x;
		this.y = y;
	}
	
	/**
	 * construct a new signal with the provided arguments as content.
	 * As new SignalPart() creates a copy of the array, no reference to the array is stored
	 * 
	 * @param x
	 * @param y
	 * @throws IllegalArgumentException   if x.length != y.length, except if y.length()==0
	 *                                    y.length()==0 is allowed to enable use of not-loaded signals (TODO: check)
	 *  
	 */
	public Signal( double[] x, String xName, String xUnit, double[] y, String yName, String yUnit ) {
		
		//To allow the use of not-loaded signals ... ( y-values = empty )		
		if( x.length!=y.length && y.length!=0 ) {
			String e = "Xvalues and Yvalues have different length: ("+xName+";"+yName+")\n"+
			           "x.length="+x.length+", y.length="+y.length ;
			throw new IllegalArgumentException(e);			
		}
		
		this.x = new SignalPart( x, xName, xUnit );
		this.y = new SignalPart( y, yName, yUnit );		
	}
	
	// ============================================================
	// basic data accesses
	// ============================================================
	
	/**
	 * get a reference to the x-component of this signal
	 * @return
	 */
	public SignalPart getX() {
		return x;
	}
	
	/**
	 * get a copy of the xValues of this signal
	 * @return
	 */
	public double[] getXValues() {
		return x.getValues();
	}
	
	/**
	 * get a reference to the xValues array.  This array should never be modified! 
	 * @return
	 */
	private double[] getXValuesNoClone() {
		return x.getValuesNoClone();
	}
	
	/**
	 * creates a new array with the xValues at the specified indices
	 * 
	 * [ matlab:   result = xValues( indices ) ]
	 * @param indices
	 * @return
	 */
	public double[] getXValuesForIndices( int[] indices ) {
		double[] xValues = x.getValuesNoClone();
		double[] xSubset= new double[ indices.length ];
		for( int i=0 ; i<indices.length ; i++ ) {
			xSubset[ i ] = xValues[ indices[i] ];
		}
		return xSubset;
	}

	/**
	 * get the name of the x-component of this signal
	 * @return
	 */
	public String getXName() {
		return x.getName();
	}
	
	/**
	 * get the unit of the x-component of this signal
	 * @return
	 */
	public String getXUnit() {
		return x.getUnit();
	}

	/**
	 * get a reference to the y-component of this signal
	 * @return
	 */
	public SignalPart getY() {
		return y;
	}	
	
	/**
	 * get a reference to the yValues array 
	 * @return
	 */
	public double[] getYValues() {
		return y.getValues();
	}
	
	/**
	 * get a reference to the yValues array. This array should never be modified!  
	 * @return
	 */
	private double[] getYValuesNoClone() {
		return y.getValuesNoClone();
	}
	
	/**
	 * creates a new array with the yValues at the specified indices
	 * 
	 * [ matlab:   result = yValues( indices ) ]
	 * @param indices
	 * @return
	 */
	public double[] getYValuesForIndices( int[] indices ) {
		double[] yValues = y.getValuesNoClone();
		double[] ySubset= new double[ indices.length ];
		for( int i=0 ; i<indices.length ; i++ ) {
			ySubset[ i ] = yValues[ indices[i] ];
		}
		return ySubset;
	}
	
	/**
	 * get the name of the y-component of this signal
	 * @return
	 */
	public String getYName() {
		return y.getName();
	}
	
	/**
	 * get the name of the x-component of this signal
	 * @return
	 */
	public String getYUnit() {
		return y.getUnit();
	}	

	/**
	 * get the number of points in the signal
	 * @return
	 */
	public double length() {
		return x.length();
	}

	
	// ============================================================
	// get minimal and maximal values
	// ============================================================
	// TODO: make a function that returns ( x index y ) as a single structure
	
	/**
	 * get the highest value in the yValues
	 * @return
	 */
	public double getMaxY() {
		double[] yValues=getYValuesNoClone();
		double ymax=Double.NEGATIVE_INFINITY;
		for( int i=0 ; i<yValues.length ; i++ ) {
			double yv=yValues[i];
			if( yv>ymax ) {
				ymax=yv;
			}
		}
		return ymax;
	}
	
	/**
	 * get the lowest value in the yValues
	 * @return
	 */
	public double getMinY() {
		double[] yValues=getYValuesNoClone();
		double ymin=Double.POSITIVE_INFINITY;
		for( int i=0 ; i<yValues.length ; i++ ) {
			double yv=yValues[i];
			if( yv<ymin ) {
				ymin=yv;
			}
		}
		return ymin;
	}
	
	/**
	 * get the index of the highest yValue in the signal 
	 * @return
	 */
	public int getMaxYIndex() {
		double[] yValues=getYValuesNoClone();
		int index=0;
		double ymax=Double.NEGATIVE_INFINITY;
		for( int i=0 ; i<yValues.length ; i++ ) {
			double yv=yValues[i];
			if( yv>ymax ) {
				ymax=yv;
				index=i;
			}
		}
		return index;
	}
	

	/**
	 * get the index of the lowest yValue in the signal 
	 * @return
	 */
	public int getMinYIndex() {
		double[] yValues=getYValuesNoClone();
		int index=0;
		double ymin=Double.POSITIVE_INFINITY;
		for( int i=0 ; i<yValues.length ; i++ ) {
			double yv=yValues[i];
			if( yv<ymin ) {
				ymin=yv;
				index=i;
			}
		}
		return index;
	}
		
	/**
	 * find the largest value in the xVector
	 * 
	 * @return
	 */
	public double getMaxX() {
		double[] xValues=getXValuesNoClone();
		double xmax=Double.NEGATIVE_INFINITY;
		for( int i=0 ; i<xValues.length ; i++ ) {
			double xv=xValues[i];
			if( xv>xmax ) {
				xmax=xv;
			}
		}
		return xmax;
	}
	
	/**
	 * find the smallest value in the xVector
	 * @return
	 */
	public double getMinX() {
		double[] xValues=getXValuesNoClone();
		double xmin=Double.POSITIVE_INFINITY;
		for( int i=0 ; i<xValues.length ; i++ ) {
			double xv=xValues[i];
			if( xv<xmin ) {
				xmin=xv;
			}
		}
		return xmin;
	}
		
	// ============================================================
	// resampling operations
	// ============================================================
	
	/**
	 * get the yValue that corresponds to the (first occurrence) of the given xValue.
	 * 
	 * @return  the yValue that corresponds to the given xValue. Linear interpolation is used
	 * @throws  IllegalArgumentException if xValue is outside the range of this signal's xValues  
	 */
	public double getValueAt( double xValue ) throws IllegalArgumentException {
		double[] xValues = getXValuesNoClone();
		double[] yValues = getYValuesNoClone();

		if( Double.isNaN(xValue)) {
			return Double.NaN;
		}
		
		if( xValues.length==0 ) {
			throw new IllegalArgumentException("extrapolating");
		}
		if( xValues.length==1 ) {
			if( xValues[0]==xValue ) {
				return yValues[0];
			} else {
				throw new IllegalArgumentException("extrapolating");
			}
		}
		
		for( int i=0 ; i<(xValues.length-1) ; i++ ) {
			if( ((xValues[i]<=xValue) && (xValues[i+1]>=xValue)) ||
				((xValues[i]>=xValue) && (xValues[i+1]<=xValue))	) {
				return interpolate( xValue, xValues[i], yValues[i], xValues[i+1], yValues[i+1] );				
			} 
		}
		
//		if( xValues[ xValues.length-1 ]==xValue ) {
//			return yValues[ xValues.length-1 ]; 
//		}
// added 2x -1 by stefan cosemans, March 11th 2011 
// commented by stefan

		
		throw new IllegalArgumentException("extrapolating");
		
	}

	/**
	 * get the yValue that corresponds to the given xValue.  The caller must ensure that
	 * the xValue lies between xValues[ lowerIndex ] and xValues[ lowerIndex+1 ] 
	 * 
	 * @return  the yValue that corresponds to the given xValue. Linear interpolation is used
	 * @throws  IllegalArgumentException if xValue is outside the range 
	 *                                   xValues[ lowerIndex ] .. xValues[ lowerIndex+1 ] 
	 */
	private double getValueAt( double xValue, int lowerIndex ) throws IllegalArgumentException {
		double[] xValues = getXValuesNoClone();
		double[] yValues = getYValuesNoClone();				
		
		int i=lowerIndex;
		if( ((xValues[i]<=xValue) && (xValues[i+1]>=xValue)) ||
			((xValues[i]>=xValue) && (xValues[i+1]<=xValue))	) {
				return interpolate( xValue, xValues[i], yValues[i], xValues[i+1], yValues[i+1] );				
		} else {
			throw new IllegalArgumentException("xValue not in range xValues[ lowerIndex ] .. xValues[ lowerIndex+1 ]");
		}
		
	}
	
	/**
	 * linear interpolation - find the value y that corresponds to x on the given line segment
	 * 
	 * @param x
	 * @param x0
	 * @param y0
	 * @param x1
	 * @param y1
	 * @return y that corresponds with x on the line segment x0,y0 - x1,y1
	 */
	private double interpolate( double x, double x0, double y0, double x1, double y1 ) {
		double alpha = (x-x0)/(x1-x0);
		double y = y0 + alpha * (y1-y0);
		return y;
	}
	
	/**
	 * resample this signal at different xValues.  Values outside the range are extended with the 
	 * last stored point
	 * 
	 * Lousy implementation for now
	 * 
	 * @param xValues
	 * @return  a new signal with values at the requested xValues
	 */
	public Signal resampleGeneral( double[] xValues ) {
		
		double[] yValues = new double[xValues.length];
		
		double xmin, xmax, yxmin, yxmax;
		double[] signalXValues = getXValuesNoClone();
		double[] signalYValues = getYValuesNoClone();
		
		if( signalXValues[0]<signalXValues[signalXValues.length-1] ) {
			xmin = signalXValues[0];
			xmax = signalXValues[signalXValues.length-1];
			yxmin = signalYValues[0];
			yxmax = signalYValues[signalYValues.length-1];			
		} else {
			xmax = signalXValues[0];
			xmin = signalXValues[signalXValues.length-1];
			yxmax = signalYValues[0];
			yxmin = signalYValues[signalYValues.length-1];	
		}
		
		for( int i=0 ; i<xValues.length ; i++ ) {
			if( xValues[i]<=xmin) {
				yValues[i]=yxmin;
			} else if( xValues[i]>=xmax) {
				yValues[i]=yxmax;
			} else {
				yValues[i] = getValueAt( xValues[i] );
			}
		}
		return new Signal( xValues, getXName(), getXUnit(), yValues, getYName(), getYUnit() );
	}
	
	/**
	 * resample this signal at different xValues.  Values outside the range are extended with the 
	 * last stored point.  This method assumes strictly increasing xValues
	 * 
	 * TODO: still slow --- create a non-cloning version of getXValues ???
	 * 
	 * @param xValues
	 * @return  a new signal with values at the requested xValues
	 */
	public Signal resample( double[] xValues ) {
		
		double[] yValues = new double[xValues.length];
		
		double xmin, xmax, yxmin; //, yxmax;
		double[] signalXValues = getXValuesNoClone();
		double[] signalYValues = getYValuesNoClone();
				
		xmin = signalXValues[0];
		xmax = signalXValues[signalXValues.length-1];
		yxmin = signalYValues[0];
		//yxmax = signalYValues[signalYValues.length-1];			
			
		// values below the available source range
		int i;
		for( i=0 ; i<xValues.length ; i++ ) {
			if( xValues[i]<=xmin) {
				yValues[i]=yxmin;
			} else {
				break;
			}
		}
		int firstIndexInRange=i;
		
		int previousIndex=0; 
		// the data to be looked up is not before this value 
		
		// values inside the available range
		for( i=firstIndexInRange ; i<xValues.length ; i++ ) {
			if( xValues[i]>xmax) {
				// should this be changed to 
				// changed from "if( xValues[i]>xmax)" ?
				// on 2010-12-07 by Stefan Cosemans
				// changed back by stefan cosemans on 2011-04-01: problem with resampling signal with xValues with same xValues
				break;			
			} else {
				previousIndex = getLowerIndexOfRange( signalXValues, xValues[i], previousIndex ); 
				yValues[i] = getValueAt( xValues[i], previousIndex );
			}
		}		
		
		int firstIndexBeyondRange = i; 
		
		// values above the available source range
		for( i=firstIndexBeyondRange ; i<xValues.length ; i++ ) {
			//yValues[i]=yValues[ xValues.length-1 ];
			yValues[i]=yValues[ i-1 ]; // changed by stefan - 2011-03-07
		}		
		
		return new Signal( xValues, getXName(), getXUnit(), yValues, getYName(), getYUnit() );
	}
	
	/**  
	 * if xValues[ xValues.length ]> xValue: find the smallest index i so that xValue<=xValues[i+1] and i>=lowestIndex
	 * if xValues[ xValues.length ]<= xValue, i==xValues.length
	 * 
	 * this method scans the xValues from low to high.  The first time that the next point (i+1) is larger than xThreshold,
	 * the current point is returned.  Unless i=0, the returned point x[i] is smaller are equal than xThreshold  
	 * 
	 * changelog: Stefan Cosemans - 2011-03-07: changed xValue<Xvalues[i+1] to xValue<=Xvalues[i+1]
	 */
	private int getLowerIndexOfRange( double[] xValues, double xThreshold, int lowestIndex ) {
		for( int i=lowestIndex ; i<(xValues.length-1) ; i++ ) {
			if( xThreshold<=xValues[i+1] ) {
				return i;
			}
		}
		return xValues.length;
	}
	
	/**
	 * create a subsignal from this signal, over the x-interval [ T1 .. T2 ]
	 * 
	 * All x-values xi in the interval [ T1 .. T2 ] are maintained.
	 * No additional values are added in ] T1 .. T2 [
	 * if there is no xi==T1, (T1, y1) is added, where y1 is the interpolated value [ using getValueAt() ]
	 * if there is no xi==T2, (T2, y2) is added, where y2 is the interpolated value [ using getValueAt() ]  
	 * 
	 * It is assumed that this.xValues is strictly increasing
	 * @param T1
	 * @param T2
	 */
	public Signal getSubSignal( double T1, double T2 ) {
		double[] xValues = getXValuesNoClone();
		double[] yValues = getYValuesNoClone();
		int iL = getLowerIndexOfRange( xValues, T1, 0  ); // the largest index for which x[iL]<=T1 ( except if x[0]>T1, then iL=0 )
		int iH = getLowerIndexOfRange( xValues, T2, iL ); // the largest index for which x[iH]<=T2 ( except if x[0]>T2, then iH=0 )
	
		//boolean lowerIndexMatches;
		boolean higherIndexMatches;
		int addIndices=0;
		if( xValues[iL] == T1 ) {
			//lowerIndexMatches=true;
		} else {
			//addIndices=addIndices+1;
			//lowerIndexMatches=false;
		}
		
		if( xValues[iH] == T2 ) {
			higherIndexMatches=true;
		} else {
			addIndices=addIndices+1;
			higherIndexMatches=false;
		}
		
		int L=iH-iL+1;
		double[] resultXValues = new double[ L+addIndices ];
		double[] resultYValues = new double[ L+addIndices ];
		
		int index=0;
		resultXValues[index]=T1;
		resultYValues[index]=getValueAt( T1, iL );					
		index=index+1;			
				
		for( int i=iL+1 ; i<=iH ; i++ ) {
			resultXValues[index]=xValues[ i ];
			resultYValues[index]=yValues[ i ];
			index=index+1;			
		}
		
		if( !higherIndexMatches ) {
			resultXValues[index]=T2;
			try{				
				resultYValues[index]=getValueAt( T2, iH );				
			} catch( IllegalArgumentException e ) {
				System.out.println( "T2="+T2+", yValues[iH]="+xValues[iH]+" yValues[iL]="+yValues[iL] );
				System.out.println( "iL="+iL+", iH="+iH );				
			}
		}
		
		
		return new Signal( resultXValues, getXName(), getXUnit(), resultYValues, getYName(), getYUnit() );
	}
	


	// ============================================================
	// unary arithmetic operations
	// ============================================================
	/**
	 * @return  a new Signal x,-y
	 */
	public Signal getInvertedSignal( ) {		
		double[] yValuesInverted = VectorHelper.invert( getYValuesNoClone() );
		Signal s = new Signal(getXValuesNoClone(), getXName(), getXUnit(), yValuesInverted, getYName(), getYUnit() );
		return s;
	}
	
	/**
	 * @return  a new Signal x,abs(y)
	 */
	public Signal getAbsoluteValue( ) {		
		double[] yValuesInverted = VectorHelper.abs( getYValuesNoClone() );
		Signal s = new Signal(getXValuesNoClone(), getXName(), getXUnit(), yValuesInverted, getYName(), getYUnit() );
		return s;
	}
	
	/**
	 * integrate this signal  int( y(t), t=t_0..t_N )
	 * 
	 * a trapezoidal rule is used:  
	 *   int ~= sum[ n=0..N-1 ,  (y(n)+y(n-1))/2 * ( t(n+1)-t(n) ) ] 
	 * 
	 * @return the integrated value
	 */
	public double integrate () {
		double sum = 0;
		double[] xValues = this.getXValues();
		double[] yValues = this.getYValues();
		for( int i=0 ; i<yValues.length-2 ; i++ ) {
			double y = ( yValues[i]+yValues[i+1] )/2;
			double dx = xValues[i+1]-xValues[i];
			sum = sum+y*dx;
		}
		return sum;
	}
		
	/**
	 * integrate this signal  int( y(t), t=T0..T1 )
	 * 
	 * a trapezoidal rule is used:  
	 *   result ~= sum[ n=0..N-1 ,  (y(n)+y(n-1))/2 * ( t(n+1)-t(n) ) ] 
	 * 
	 * @return the integrated value
	 *
	 */
	public double integrate ( double T1, double T2 ) {
		double sum = 0;
		
		// get the subsignal from T1 to T2.  This 
		Signal interval = this.getSubSignal( T1, T2 );
		double[] xValues = interval.getXValuesNoClone();
		double[] yValues = interval.getYValuesNoClone();
				
		for( int i=0 ; i<yValues.length-2 ; i++ ) {
			double y = ( yValues[i]+yValues[i+1] )/2;
			double dx = xValues[i+1]-xValues[i];
			sum = sum+y*dx;
		}
		return sum;
	}
	 	
	// ============================================================
	// arithmetic operations with constants
	// ============================================================
	/**
	 * create a new Signal which has the same attributes as this signal, but with yValues divided with the given constant
	 * 
	 * @param constant
	 * @return
	 */
	public Signal divide( double constant ) {
		double[] yValues = VectorHelper.divide( this.getYValues(), constant );
		Signal result=new Signal(this.getXValues(), this.getXName(), this.getXUnit(), yValues, this.getYName(), this.getYUnit() );
		return result;
	}
	
	/**
	 * create a new Signal which has the same attributes as this signal, but with yValues increased with the given constant
	 * 
	 * @param constant
	 * @return
	 */
	public Signal add( double constant ) {
		double[] yValues = VectorHelper.add( this.getYValues(), constant );
		Signal result=new Signal(this.getXValues(), this.getXName(), this.getXUnit(), yValues, this.getYName(), this.getYUnit() );
		return result;
	}
	
	/**
	 * create a new Signal which has the same attributes as this signal, but with yValues decreased with the given constant
	 * 
	 * @param constant
	 * @return
	 */
	public Signal subtract( double constant ) {
		double[] yValues = VectorHelper.subtract( this.getYValues(), constant );
		Signal result=new Signal(this.getXValues(), this.getXName(), this.getXUnit(), yValues, this.getYName(), this.getYUnit() );
		return result;
	}
	
	/**
	 * create a new Signal which has the same attributes as this signal, but with yValues multiplied with the given constant
	 * 
	 * @param constant
	 * @return
	 */
	public Signal multiply( double constant ) {
		double[] yValues = VectorHelper.multiply( this.getYValues(), constant );
		Signal result=new Signal(this.getXValues(), this.getXName(), this.getXUnit(), yValues, this.getYName(), this.getYUnit() );
		return result;
	}
		
	// ============================================================
	// arithmetic operations with two signals ( static methods ==> deprecate public use?? )
	// ============================================================
	
	/**
	 * return a signal which is the sum of s1 and s2.  
	 * 
	 * if samebase=true, no resampling of the values is done.
	 * 
	 * @param s1
	 * @param s2
	 * @param sameBase
	 * @return
	 */
	public static Signal add( Signal s1, Signal s2, boolean sameBase ) {
		Signal sr1,sr2;
		double[] xValues;
		if( !sameBase ) {
			double[] xValues1 = s1.getXValues();
			double[] xValues2 = s2.getXValues();
			xValues = VectorHelper.merge( xValues1, xValues2 );
		
			sr1 = s1.resample(xValues);
			sr2 = s2.resample(xValues);
		} else {
			sr1 = s1;
			sr2 = s2;
			xValues = s1.getXValues();
		}
		
		double[] yValues1=sr1.getYValues();
		double[] yValues2=sr2.getYValues();
		
		double[] yValues;
		try{
			yValues = VectorHelper.add( yValues1, yValues2 );
		} catch( ArrayIndexOutOfBoundsException e ) {
			System.out.println( "yValues1.length="+yValues1.length );
			System.out.println( "yValues2.length="+yValues2.length );
			System.out.println( "xValues.length="+xValues.length );
			System.out.println( "sameBase="+sameBase );
			throw e;
		}
		
		return new Signal( xValues, s1.getXName(), s1.getXUnit(), 
				           yValues, s1.getYName()+"+"+s2.getYName(), s1.getYUnit() );		
		
	}

	/**
	 * return a signal which is the sum of s1 and s2. They can have different xValues 
	 * ( if you know that the two signals have the same xValues, use add( s1, s2, true ) instead for speed
	 * 
	 * @param s1
	 * @param s2
	 * @return
	 */
	public static Signal add( Signal s1, Signal s2 ) {
		return add( s1, s2, false );
	}
	
	/**
	 * return a signal which is s1-s2.  
	 * 
	 * if samebase=true, no resampling of the values is done.
	 * 
	 * @param s1
	 * @param s2
	 * @param sameBase
	 * @return
	 */
	public static Signal subtract( Signal s1, Signal s2, boolean sameBase ) {
		Signal sr1,sr2;
		double[] xValues;
		if( !sameBase ) {
			double[] xValues1 = s1.getXValues();
			double[] xValues2 = s2.getXValues();
			xValues = VectorHelper.merge( xValues1, xValues2 );
		
			sr1 = s1.resample(xValues);
			sr2 = s2.resample(xValues);
		} else {
			sr1 = s1;
			sr2 = s2;
			xValues = s1.getXValues();
		}
		
		double[] yValues1=sr1.getYValues();
		double[] yValues2=sr2.getYValues();
		double[] yValues = VectorHelper.subtract( yValues1, yValues2 );
		
		return new Signal( xValues, s1.getXName(), s1.getXUnit(), 
				           yValues, s1.getYName()+"-"+s2.getYName(), s1.getYUnit() );		
		
	}

	/**
	 * return a signal which is the s1-s2. They can have different xValues 
	 * ( if you know that the two signals have the same xValues, use subtract( s1, s2, true ) instead for speed
	 * 
	 * @param s1
	 * @param s2
	 * @return
	 */
	public static Signal subtract( Signal s1, Signal s2 ) {
		return subtract( s1, s2, false );
	}
	
	/**
	 * return a signal which is s1*s2.  
	 * 
	 * if samebase=true, no resampling of the values is done.
	 * 
	 * @param s1
	 * @param s2
	 * @param sameBase
	 * @return
	 */
	public static Signal multiply( Signal s1, Signal s2, boolean sameBase ) {
		Signal sr1,sr2;
		double[] xValues;
		if( !sameBase ) {
			double[] xValues1 = s1.getXValues();
			double[] xValues2 = s2.getXValues();
			xValues = VectorHelper.merge( xValues1, xValues2 );
		
			sr1 = s1.resample(xValues);
			sr2 = s2.resample(xValues);
		} else {
			sr1 = s1;
			sr2 = s2;
			xValues = s1.getXValues();
		}
		
		double[] yValues1=sr1.getYValues();
		double[] yValues2=sr2.getYValues();
		double[] yValues = VectorHelper.multiply( yValues1, yValues2 );
		
		return new Signal( xValues, s1.getXName(), s1.getXUnit(), 
				           yValues, s1.getYName()+"*"+s2.getYName(), s1.getYUnit() );		
		
	}

	/**
	 * return a signal which is the s1*s2. They can have different xValues 
	 *  ( if you know that the two signals have the same xValues, use multiply( s1, s2, true ) instead for speed
	 * 
	 * @param s1
	 * @param s2
	 * @return
	 */
	public static Signal multiply( Signal s1, Signal s2 ) {
		return multiply( s1, s2, false );
	}
	
	/**
	 * return a signal which is s1/s2.  
	 * 
	 * if samebase=true, no resampling of the values is done.
	 * 
	 * @param s1
	 * @param s2
	 * @param sameBase
	 * @return
	 */
	public static Signal divide( Signal s1, Signal s2, boolean sameBase ) {
		Signal sr1,sr2;
		double[] xValues;
		if( !sameBase ) {
			double[] xValues1 = s1.getXValues();
			double[] xValues2 = s2.getXValues();
			xValues = VectorHelper.merge( xValues1, xValues2 );
		
			sr1 = s1.resample(xValues);
			sr2 = s2.resample(xValues);
		} else {
			sr1 = s1;
			sr2 = s2;
			xValues = s1.getXValues();
		}
		
		double[] yValues1=sr1.getYValues();
		double[] yValues2=sr2.getYValues();
		double[] yValues = VectorHelper.divide( yValues1, yValues2 );
		
		return new Signal( xValues, s1.getXName(), s1.getXUnit(), 
				           yValues, s1.getYName()+"/"+s2.getYName(), s1.getYUnit() );		
		
	}
	
	/**
	 * return a signal which is the s1/s2. They can have different xValues 
	 *  ( if you know that the two signals have the same xValues, use divide( s1, s1, true ) instead for speed
	 * 
	 * @param s1
	 * @param s2
	 * @return
	 */
	public static Signal divide( Signal s1, Signal s2 ) {
		return divide( s1, s2, false );
	}
	
	
	// ============================================================
	// arithmetic operations with two signals ( this notation allows to concatenate operations )
	// ============================================================
	/**
	 * return a signal which is the sum of this and s  
	 * 
	 * if samebase=true, no resampling of the values is done.
	 * 
	 * @param s
	 * @param sameBase
	 * @return
	 */
	public Signal add( Signal s, boolean sameBase ) {
		return Signal.add( this, s, sameBase );		
	}

	/**
	 * return a signal which is the sum of this and s. They can have different xValues 
	 * ( if signals have same x-values, use add( signal, true ) instead )
	 * 
	 * @param s
	 * @return
	 */
	public  Signal add( Signal s ) {
		return this.add( s, false );
	}
	
	/**
	 * return a signal which is this-s.  
	 * 
	 * if samebase=true, no resampling of the values is done.
	 * 
	 * @param s
	 * @param sameBase
	 * @return
	 */
	public Signal subtract( Signal s, boolean sameBase ) {
		return Signal.subtract( this, s, sameBase );		
	}

	/**
	 * return a signal which is the this-s. They can have different xValues 
	 * ( if signals have same x-values, use subtract( signal, true ) instead )
	 * 
	 * @param s
	 * @return
	 */
	public Signal subtract( Signal s ) {
		return this.subtract( s, false );
	}
	
	/**
	 * return a signal which is this*s  
	 * 
	 * if samebase=true, no resampling of the values is done.
	 * 
	 * @param s
	 * @param sameBase
	 * @return
	 */
	public  Signal multiply( Signal s, boolean sameBase ) {
		return Signal.multiply( this, s, sameBase );		
	}

	/**
	 * return a signal which is s1*s2. They can have different xValues 
	 * ( if signals have same x-values, use multiply( signal, true ) instead )
	 * 
	 * @param s
	 * @return
	 */
	public Signal multiply( Signal s ) {
		return this.multiply( s, false );
	}
		
	/**
	 * return a signal which is this/s.  
	 * 
	 * if samebase=true, no resampling of the values is done.
	 * 
	 * @param s
	 * @param sameBase
	 * @return
	 */
	public Signal divideBy( Signal s, boolean sameBase ) {
		return Signal.divide( this, s, sameBase );		
	}
	
	/**
	 * return a signal which is the this/s. They can have different xValues 
	 * ( if signals have same x-values, use divideBy( signal, true ) instead )
	 * 
	 * @param s
	 * @param sameBase
	 * @return
	 */
	public Signal divideBy( Signal s ) {
		return this.divideBy( s, false );
	}
	

	// ============================================================
	// geometric operations
	// ============================================================
	// could also add rotations and axis rescaling here
	// notice: shiftY and scaleY are simply add and multiply
	
	/**
	 * create a new Signal with xnew[i] = xold[i]+deltaX
	 * 
	 * positive deltaX hence means a shift to the right
	 */
	public Signal shiftX( double deltaX ) {
		double xValues[] = getXValuesNoClone();
		double yValues[] = getYValuesNoClone();
		double newXValues[] = new double[ xValues.length ];
		
		for( int i=0 ; i<xValues.length ; i++ ) {
			newXValues[i]=xValues[i]+deltaX;
		}
		
		return new Signal( newXValues, getXName(), getXUnit(),yValues, getYName(), getYUnit() );
		
	}
	
	/**
	 * create a new Signal where the xValues are shifted so that x[0]=0   
	 *  
	 * result = this.shiftX( -x[0] )
	 * 
	 */
	public Signal shiftToOriginX( ) {
		double[] xValues = getXValuesNoClone();
		return shiftX( -xValues[0] );
	}
	
	/**
	 * create a new Signal with xnew[i] = xold[i]*factor
	 * 
	 * @param factor
	 * @return
	 */
	public Signal stretchX( double factor ) {
		double xValues[] = getXValuesNoClone();
		double yValues[] = getYValuesNoClone();
		double newXValues[] = new double[ xValues.length ];
		
		for( int i=0 ; i<xValues.length ; i++ ) {
			newXValues[i]=xValues[i]*factor;
		}
		
		return new Signal( newXValues, getXName(), getXUnit(),yValues, getYName(), getYUnit() );
		
	}
	
	/**
	 * create a new signal with swapped x and y values compared to this signal
	 * 
	 * the new Signal's x-values are this signal's y-values
	 * the new Signal's y-values are this signal's x-values
	 * 
	 * @return
	 */
	public Signal swapXY( ) {		
		return new Signal( this.getY(), this.getX() );
	}
	
	// ============================================================
	// advanced features
	// ============================================================
	// add versions that return ( x,y, index ( double ) )
	
	/**
	 * find the x-values at which the y-values cross the given threshold
	 *  
	 *  find the times and indices where the yvals vector crosses the threshold,
	 *    ( (1-fractions(i))*yvals(i) + fractions(i) yvals(i+1) == threshold )
	 *
	 *  the returned x-values are obtained by linear interpolation
	 */	
	public double[] findCrossesX( double threshold ) {
		List<Double> xCrossings = new ArrayList<Double>();
		//List<Double> fractions = new ArrayList<Double>();
		//List<Integer> indices = new ArrayList<Integer>();
				
		double[] xValues = this.getXValues();
		double[] yValues = this.getYValues();
	 
		//indices   = [];
		//fractions = [];
		//times     = [];

		for( int i=0 ; i<yValues.length-2 ; i++ ) {
			if( ( yValues[i] <= threshold && yValues[i+1] > threshold ) || 
	            ( yValues[i] >= threshold && yValues[i+1] < threshold ) ) {
				//indices.add( i );
				double fraction = ( threshold - yValues[i])/(yValues[i+1]-yValues[i] );
				//fractions.add( fraction );
				double xCrossing = xValues[i] + fraction * ( xValues[i+1]-xValues[i] );
				xCrossings.add( xCrossing );  
			}
		}
		return MatrixHelper.toArray( xCrossings );
	}
		
	/**
	 * find the x-values at which the y-values cross the given threshold while going up
	 *  
	 *  find the times and indices where the yvals vector crosses the threshold,
	 *    ( (1-fractions(i))*yvals(i) + fractions(i) yvals(i+1) == threshold )
	 *
	 *  the returned x-values are obtained by linear interpolation
	 */	
	public double[] findCrossesUpX( double threshold ) {
		List<Double> xCrossings = new ArrayList<Double>();
		//List<Double> fractions = new ArrayList<Double>();
		//List<Integer> indices = new ArrayList<Integer>();
				
		double[] xValues = this.getXValues();
		double[] yValues = this.getYValues();
	 
		//indices   = [];
		//fractions = [];
		//times     = [];

		for( int i=0 ; i<yValues.length-2 ; i++ ) {
			if( ( yValues[i] <= threshold && yValues[i+1] > threshold ) ) {
				//indices.add( i );
				double fraction = ( threshold - yValues[i])/(yValues[i+1]-yValues[i] );
				//fractions.add( fraction );
				double xCrossing = xValues[i] + fraction * ( xValues[i+1]-xValues[i] );
				xCrossings.add( xCrossing );  
			}
		}
		return MatrixHelper.toArray( xCrossings );
	}
		
	/**
	 * find the x-values at which the y-values cross the given threshold while going down
	 *  
	 *  find the times and indices where the yvals vector crosses the threshold,
	 *    ( (1-fractions(i))*yvals(i) + fractions(i) yvals(i+1) == threshold )
	 *
	 *  the returned x-values are obtained by linear interpolation
	 */
	public double[] findCrossesDownX( double threshold ) {
		List<Double> xCrossings = new ArrayList<Double>();
		//List<Double> fractions = new ArrayList<Double>();
		//List<Integer> indices = new ArrayList<Integer>();
				
		double[] xValues = this.getXValues();
		double[] yValues = this.getYValues();
	 
		//indices   = [];
		//fractions = [];
		//times     = [];

		for( int i=0 ; i<yValues.length-2 ; i++ ) {
			if( ( yValues[i] >= threshold && yValues[i+1] < threshold ) ) {
				//indices.add( i );
				double fraction = ( threshold - yValues[i])/(yValues[i+1]-yValues[i] );
				//fractions.add( fraction );
				double xCrossing = xValues[i] + fraction * ( xValues[i+1]-xValues[i] );
				xCrossings.add( xCrossing );  
			}
		}
		return MatrixHelper.toArray( xCrossings );
	}
		
	/**
	 * returns true if a signal reaches both values above thresholdHigh and below thresholdLow.
	 * The method can be used to find the signals that make logical transitions.
	 * 
	 * @param thresholdLow
	 * @param thresholdHigh
	 * @return
	 */
	public boolean lowerAndHigherThan( double thresholdLow, double thresholdHigh ) {
		double[] yv = getYValues();
		int L = yv.length;
		
		double min = Double.POSITIVE_INFINITY;
		double max = Double.NEGATIVE_INFINITY;
		
		for( int i=0 ; i<L ; i++ ) {
			min = Math.min( min, yv[i] );
			max = Math.max( max, yv[i] );
		}		
		return ( (min<thresholdLow) && (max>thresholdHigh) );
	}

	/**
	 * returns a new Signal with the same xValues as this signal, but digitized
	 * 
	 * if y[i]<lowThreshold , yr[i]=0
	 * if y[i]>highThreshold, yr[i]=1
	 * if lowThreshold<y[i]<highThreshold, yr[i]=resultInbetween
	 * 
	 * TODO: make a version that reduces the number of x-points
	 * 
	 * @param lowThreshold
	 * @param highThreshold
	 * @param resultInbetween   the value that is assigned to indices where lowThreshold<y[i]<highThreshold
	 * @return
	 */
	public Signal digitize( double lowThreshold, double highThreshold, double resultInbetween ) {
		double[] yValues = getYValues();
		for( int i=0 ; i<yValues.length ; i++ ) {
			if( yValues[i]<lowThreshold ) {
				yValues[i]=0;
			} else if( yValues[i]>highThreshold ) {
				yValues[i]=1;
			} else {
				yValues[i]=resultInbetween;
			}				
		}
		
		return new Signal( getXValuesNoClone(), getXName(), getXUnit(), 
		           yValues, getYName()+" digitized", getYUnit()+" digitized" );		
	}
	
	/**
	 * return a new Signal in which the order of the xValues is reversed.
	 * 
	 * e.g. (x1 y1) (x2 y2) (x3 y3) becomes (x3 y3) (x2 y2) (x3 y3)
	 * 
	 * @return
	 */
	public Signal reverse( ) {
		
		double[] oldX = getXValuesNoClone();
		double[] oldY = getYValuesNoClone();
		
		int L = oldX.length; 
		double[] newX = new double[ L ];
		double[] newY = new double[ L ];
		
		for( int i=0 ; i<L ; i++ ) {
			newX[i] = oldX[ L-i-1 ];
			newY[i] = oldY[ L-i-1 ];
		}
		
		return new Signal( newX, getXName(), getXUnit(),  newY, getYName(), getYUnit() );
	}
	
	/**
	 * create a copy of this signal in which all values strictly below threshold are replaced with replacement
	 * 
	 * @param threshold
	 * @param replacement
	 * @return
	 */
	public Signal replaceValuesStrictlyBelow( double threshold, double replacement ) {
		double[] oldX = getXValuesNoClone();
		double[] oldY = getYValuesNoClone();
		
		int L = oldX.length; 
		double[] newY = new double[ L ];
		
		for( int i=0 ; i<L ; i++ ) {
			double y = oldY[ i ];
			if( y<threshold ) {
				newY[i] = replacement;
			} else {
				newY[i] = y;	
			}
		}
		
		return new Signal( oldX, getXName(), getXUnit(),  newY, getYName(), getYUnit() );
	}
	
	/**
	 * create a copy of this signal in which all values strictly above threshold are replaced with replacement
	 * 
	 * @param threshold
	 * @param replacement
	 * @return
	 */
	public Signal replaceValuesStrictlyAbove( double threshold, double replacement ) {
		double[] oldX = getXValuesNoClone();
		double[] oldY = getYValuesNoClone();
		
		int L = oldX.length; 
		double[] newY = new double[ L ];
		
		for( int i=0 ; i<L ; i++ ) {
			double y = oldY[ i ];
			if( y>threshold ) {
				newY[i] = replacement;
			} else {
				newY[i] = y;	
			}
		}
		
		return new Signal( oldX, getXName(), getXUnit(),  newY, getYName(), getYUnit() );
	}
	
	// ============================================================
	// features to construct often-used signals
	// ============================================================
	
	/**
	 * create a signal with the same xValues as this signal, but all yValues equal to constant
	 * 
	 * @param constant
	 * @return Signal
	 */
	public Signal createConstantSignal( double constant) {
		return this.multiply(0).add( constant );
	}
	
	/**
	 * Create a signal with the same xValues as this signal, but yValue = xValue*slope+offset
	 * 
	 * That is, a line through ( 0, offset ) with the given slope
	 * 
	 * @param slope
	 * @param offset
	 * @return Signal
	 */
	public Signal createRampSignal( double slope, double offset ) {
		double[] oldX = getXValuesNoClone();
		int L = oldX.length; 
		double[] newY = new double[ L ];
		
		for( int i=0 ; i<L ; i++ ) {
			newY[i] = offset + slope * oldX[i];
		}
		
		return new Signal( oldX, getXName(), getXUnit(),  newY, getYName(), getYUnit() );
	}
	
	
	// ============================================================
	// debug functionality tests
	// ============================================================
	public static void main( String args[] ) {
		
		// ----------------- test getSubSignal
//		if( false ) {
//			double[] xValues = { 1.0, 2.0, 3.0, 4.0, 4.5, 5.0, 6.0 };
//			double[] yValues = { 1.1, 2.1, 3.1, 4.1, 4.6, 5.1, 6.1 };
//
//			Signal s = new Signal( xValues, "x", "s", yValues, "y", "I" );
//
//			Signal sub1 = s.getSubSignal(2.0, 4.5);
//			sub1.print();
//
//			Signal sub2 = s.getSubSignal(2.2, 4.5);
//			sub2.print();
//
//			Signal sub3 = s.getSubSignal(2.2, 4.7);
//			sub3.print();
//
//			Signal sub4 = s.getSubSignal(2.0, 4.7);
//			sub4.print();
//		}
		
//		// ----------------- test addition
//		if( false ) {
//			double[] xValues  = { 1.0, 2.0, 3.0 };
//			
//			double[] yValues1 = { 0.1, 0.2, 0.3 };
//			double[] yValues2 = { 1.5, 2.5, 3.5 };
//
//			Signal s1 = new Signal( xValues, "x", "s", yValues1, "y", "I" );
//			Signal s2 = new Signal( xValues, "x", "s", yValues2, "y", "I" );
//
//			Signal sum = s1.add( s2 );
//			sum.print();
//		}
//		
//		// ------------------ test resampleGeneral
//		if( true ) {
//			//double[] xValues  = { 1.0, 2.0, 3.0, 4.0, 5.0 };
//			double[] xValues  = { 5.0, 4.0, 3.0, 2.0, 1.0 };
//			double[] yValues  = { 1.0, 2.0, 3.0, 4.0, 5.0 };
//		
//			double[] xValuesResample = { 1.0, 1.2, 1.3, 3.0, 3.4, 4.0, 4.5 };
//			Signal s1 = new Signal( xValues, "x", "s", yValues, "y", "I" );
//			
//			Signal sr = s1.resampleGeneral(xValuesResample);
//			sr.print();
//		}
		
		// ------------------- test subtract
		if( true ) {
			double[] xValues   = { 1.0, 2.0, 3.0, 4.0, 5.0 };
			double[] yValues1  = { 1.0, 2.0, 3.0, 4.0, 5.0 };
			double[] yValues2  = { 1.0, 1.0, 1.0, 1.0, 1.0 };
			Signal s1 = new Signal( xValues, "x", "s", yValues1, "y", "I" );
			Signal s2 = new Signal( xValues, "x", "s", yValues2, "y", "I" );
			Signal s3 = s1.subtract( s2 );
			s1.print();
			s2.print();
			s3.print();
		}
		
//		// ------------------- test resample signal with same xvalues
//		if( true ) {
//			double[] xValues   = { 1.0, 2.0, 3.0, 4.0, 5.0 };
//			double[] yValues1  = { 1.0, 2.0, 3.0, 4.0, 5.0 };
//			double[] yValues2  = { 1.0, 1.0, 1.0, -1.0, 0.0 };
//			Signal s1 = new Signal( xValues, "x", "s", yValues1, "y", "I" );
//			Signal s2 = new Signal( xValues, "x", "s", yValues2, "y", "I" );
//			Signal sr1 = s1.resample(xValues);
//			Signal sr2 = s2.resample(xValues);
//			
//			s1.print();
//			sr1.print();
//			s2.print();
//			sr2.print();			
//		}
		
	}
	
	/**
	 * display values of the signal on screen - use for debug only
	 */
	public void print( ) {
		double [] xValues = this.getXValues();
		double [] yValues = this.getYValues();
		
		StringBuffer buffer = new StringBuffer( );
		buffer.append("[ ");
		
		for( int i=0 ; i<xValues.length ; i++ ) {
			buffer.append( "("+xValues[i]+":"+yValues[i]+") ");
		}
		buffer.append( "]" );
		System.out.println( buffer.toString() );
	}
	
}
 