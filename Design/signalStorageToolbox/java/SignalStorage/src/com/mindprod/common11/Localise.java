/*
 * @(#)Localise.java
 *
 * Summary: Miscellaneous static methods localising an app to a particular platform under JDK 1.1+.
 *
 * Copyright: (c) 2009 Roedy Green, Canadian Mind Products, http://mindprod.com
 *
 * Licence: This software may be copied and used freely for any purpose but military.
 *          http://mindprod.com/contact/nonmil.html
 *
 * Requires: JDK 1.1+
 *
 * Created with: IntelliJ IDEA IDE.
 *
 * Version History:
 *  1.0 2009-05-03 - initial version, just localise(String)
 */

package com.mindprod.common11;

/**
 * Miscellaneous static methods localising an app to a particular platform under JDK 1.1+.
 * <p/>
 * There is a more efficient implemmentation of localise at com.mindprod.common15.Localise for JDK 1.5+.
 *
 * @author Roedy Green, Canadian Mind Products
 * @version 1.0 2009-05-03 - initial version, just localise(String)
 * @see com.mindprod.hunkio.PrintWriterPortable
 * @see com.mindprod.common11.Localise
 * @since 2009-05-03
 */
public class Localise
    {
    // ------------------------------ FIELDS ------------------------------

    /**
     * lineSeparator using now.
     */
    protected static String lineSeparator = System.getProperty( "line.separator" );

    // -------------------------- PUBLIC STATIC METHODS --------------------------

    /**
     * converts \n  in String to configurable  local line separator.
     * There is a more efficient implemmentation at localise at com.mindprod.common15.Localise for JDK 1.5+.
     *
     * @param s string with possible \ns embedded.
     *
     * @return string with \n converted to \r\n for Windows, \a for Mac, \n for Unix etc.
     * @see com.mindprod.common15.Localise.localise(String)
     */
    public static String localise( String s )
        {
        // See if we can avoid work of building a new string.
        // No point in testing a long string.  Almost certainly it will need work.
        if ( lineSeparator.equals( "\n" ) || s.length() < 100 && s.indexOf( '\n' ) < 0 )
            {
            return s;
            }
        StringBuffer sb = new StringBuffer( s.length() + 100 );
        for ( int i = 0; i < s.length(); i++ )
            {
            final char c = s.charAt( i );
            if ( c == '\n' )
                {
                sb.append( lineSeparator );
                }
            else
                {
                sb.append( c );
                }
            }
        return sb.toString();
        }

    /**
     * Use a line separator other than the system default.
     *
     * @param lineSeparator Sequence to separate lines. usually Windows: "\r\n" Unix: "\n" or Mac: "\r". But could be
     *                      anything.
     */
    public static void setLineSeparator( String lineSeparator )
        {
        Localise.lineSeparator = lineSeparator;
        }
    }
