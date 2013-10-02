/*
 * @(#)Misc.java
 *
 * Summary: Simple convenience methods used often by CMP utilities.
 *
 * Copyright: (c) 1997-2009 Roedy Green, Canadian Mind Products, http://mindprod.com
 *
 * Licence: This software may be copied and used freely for any purpose but military.
 *          http://mindprod.com/contact/nonmil.html
 *
 * Requires: JDK 1.1+
 *
 * Created with: IntelliJ IDEA IDE.
 *
 * Version History:
 *  1.0 1997-03-23 - initial.
 *  1.1 1998-11-10 - add dates
 *  1.2 1998-12-14 - add isJavaVersionOX
 *  1.3 1999-08-24 - add leftPad, rightPad, smarter rep.
 *                   isJavaVersionOK now handles 1.3beta.
 *  1.4 2002-08-17 - add quoteSQL
 *  1.5 2005-07-14 - trimmed down. moved to com.mindprod.common11
 *                   splitting off StringTools Limiters VersionCheck
 *  1.6 2006-01-02 - added thisYear
 */
package com.mindprod.common11;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StreamTokenizer;
import java.util.GregorianCalendar;

/**
 * Simple convenience methods used often by CMP utilities.
 * <p/>
 * Simple enough to work in any JDK1.1+.
 *
 * @author Roedy Green, Canadian Mind Products
 * @version 1.1 2006-03-04
 * @since 2003-05-15
 */
public final class Misc
    {
    // ------------------------------ CONSTANTS ------------------------------

    /**
     * true if you want extra debugging output and test code
     */
    static final boolean DEBUGGING = false;

    // -------------------------- PUBLIC STATIC METHODS --------------------------

    /**
     * makeshift system beep if awt.Toolkit.beep is not available. Works also in JDK 1.02.
     */
    public static void beep()
        {
        System.out.print( "\007" );
        System.out.flush();
        }// end beep

    /**
     * Load a properties file, but not into a Property hashTable, into an array that does not disturb property order.
     * Returns array of string pairs. Closes the given inputstream. Property file might look like something like this: #
     * com.mindprod.inwords.InWords.properties must live in inwords.jar. # Describes languages supported to translate
     * numbers to words. # Fully qualified classname, (without .class)=name on menu (embedded blanks ok) # Everything is
     * case sensitive. com.mindprod.inwords.Indonesian=Bahahasa Indonesia com.mindprod.inwords.BritishEnglish=British
     * com.mindprod.inwords.Dutch=Dutch com.mindprod.inwords.Esperanto=Esperanto com.mindprod.inwords.AmericanEnglish=North
     * American Vector com.mindprod.inwords.Norwegian=Norwegian com.mindprod.inwords.Swedish=Swedish #-30-
     *
     * @param fis InputStream from which the properties can be read.
     *
     * @return a matrix of properties, keyword one column and value in the other.
     * @throws IOException
     */
    public static String[][] loadProperties( InputStream fis ) throws IOException
        {
        // make them big to start, we will shrink them later to fit.
        String[] left = new String[1000];
        String[] right = new String[1000];
        int count = 0;
        // we don't use Properties.load since that would scramble the order.
        StreamTokenizer s =
                new StreamTokenizer( new BufferedReader( new InputStreamReader(
                        fis ) ) );
        // treat space, alpha, numbers and most punctuation as ordinary char
        s.wordChars( ' ', '_' );
        s.commentChar( '#' );
        s.whitespaceChars( '=', '=' );// ignore equal, just separates fields
        s.eolIsSignificant( true );

        while ( true )
            {
            s.nextToken();
            if ( s.ttype == StreamTokenizer.TT_EOF )
                {
                break;
                }
            if ( s.ttype == StreamTokenizer.TT_EOL )
                {
                continue;
                }
            left[ count ] = s.sval.trim();
            s.nextToken();
            right[ count ] = s.sval.trim();
            count++;
            }// end for

        fis.close();
        // prune back arrays to size
        String[][] result = new String[2][count];
        System.arraycopy( left, 0, result[ 0 ], 0, count );
        System.arraycopy( right, 0, result[ 1 ], 0, count );
        return result;
        }// end loadProperties

    /**
     * alternate to signum for use in compare. Not a true signum, since it returns ints other than +-1. Where there is
     * any possibility of overflow, you should compare two longs with < rather than subtraction. In Pentium assembler
     * you could implement this algorthm with following code:
     * <p/>
     * <pre>
     *  diff = edx:eax result = eax
     *  mov ebx,eax
     *  shl eax,1
     *  or  eax,ebx
     *  slr eax,1
     *  or  eax,edx
     * <p/>
     *  which would take 5 cycles, 2 more that lohi.  However, JET did even
     * better,
     *  with code essentially this using a clever trick to implement piotr.
     * <p/>
     *   lea    ecx,0(eax,eax)  ; shifts lo left by doubling, keeps copy of
     * lo
     *   or     eax,ecx
     *   shr    eax,1
     *   or     eax,edx
     *  This is 4 cycles, still one more than lohi. Why was Piotr so much
     * faster
     * on JET?
     *  Piotr has no pipeline-confounding jumps. Further, the lo then high
     * operands actually
     *  come from the ram-based stack. Piotr nicely separates the accesses
     * giving plenty of
     *  for pre-emptive fetch of hi. lohi insists on having them both
     * upfront,
     * so it has to wait
     *  for memory access. Piotr does not have to wait.
     *  Modern CPUS hurry up and wait for RAM most of the time.
     * </pre>
     *
     * @param diff number to be collapsed to an int preserving sign and zeroness. usually represents the difference of
     *             two long.
     *
     * @return sign of diff, some -ve int, 0 or some -ve int.
     *         created with Intellij Idea
     * @author Peter Kobzda
     */
    public static final int signum( long diff )
        {
        return ( int ) ( diff >>> 32 ) | ( ( int ) diff | ( int ) diff << 1 ) >>> 1;
        }

    /**
     * Collapse magnitude down to +1, 0 or -1 .
     *
     * @param diff number to test.
     *
     * @return positive => +1; 0 => 0; negative => -1.
     */
    public static int signum( double diff )
        {
        if ( diff > 0 )
            {
            return +1;
            }
        if ( diff < 0 )
            {
            return -1;
            }
        return 0;
        }

    /**
     * Collapse magnitude down to +1, 0 or -1 .
     *
     * @param diff number to test.
     *
     * @return positive => +1; 0 => 0; negative => -1.
     */
    public static int signum( float diff )
        {
        if ( diff > 0 )
            {
            return 1;
            }
        else if ( diff < 0 )
            {
            return -1;
            }
        else
            {
            return 0;
            }
        }

    /**
     * Get this day e.g. 1=1st of month using default timezone
     *
     * @return dd 1=first day of month.
     */
    public static int thisDayOfMonth()
        {
        return new GregorianCalendar().get( GregorianCalendar.DAY_OF_MONTH );
        }

    /**
     * Get this month e.g. 1=January using default timezone
     *
     * @return mm 1=Jan
     */
    public static int thisMonth()
        {
        return new GregorianCalendar().get( GregorianCalendar.MONTH ) + 1;
        }

    /**
     * Get this year e.g. 2008 using default timezone
     *
     * @return yyyy
     */
    public static int thisYear()
        {
        return new GregorianCalendar().get( GregorianCalendar.YEAR );
        }

    // --------------------------- CONSTRUCTORS ---------------------------

    /**
     * Misc contains only static methods.
     */
    private Misc()
        {
        }

    // --------------------------- main() method ---------------------------

    /**
     * Debug harness
     *
     * @param args
     */
    public static void main( String[] args )
        {
        if ( DEBUGGING )
            {
            System.out
                    .println( thisYear()
                              + ":"
                              + thisMonth()
                              + ":"
                              + thisDayOfMonth() );
            }
        }
    }
