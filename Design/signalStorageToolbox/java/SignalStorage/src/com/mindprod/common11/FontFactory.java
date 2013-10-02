/*
 * @(#)FontFactory.java
 *
 * Summary: Modifies Java's logical font mapping.
 *
 * Copyright: (c) 2008-2009 Roedy Green, Canadian Mind Products, http://mindprod.com
 *
 * Licence: This software may be copied and used freely for any purpose but military.
 *          http://mindprod.com/contact/nonmil.html
 *
 * Requires: JDK 1.1+
 *
 * Created with: IntelliJ IDEA IDE.
 *
 * Version History:
 *  1.0 2008-08-20 - initial version
 *  1.1 2009-04-17 - use Hashtables, add Arrows.
 */
package com.mindprod.common11;

import java.awt.Font;
import java.util.Hashtable;

/**
 * Modifies Java's logical font mapping.
 *
 * @author Roedy Green, Canadian Mind Products
 * @version 1.1 2009-04-17 - use Hashtables, add Arrows.
 * @since 2008-08-20
 */
public class FontFactory
    {
    // ------------------------------ FIELDS ------------------------------

    /**
     * font name transformations for non Windows. No HashMap or generics allowed in JDK 1.1
     */
    private static final Hashtable otherTransforms = new Hashtable( 17 );

    /**
     * font name transformations for Windows. No HashMap or generics allowed in JDK 1.1
     */
    private static final Hashtable vistaTransforms = new Hashtable( 17 );

    // -------------------------- PUBLIC STATIC METHODS --------------------------

    /**
     * Creates a new <code>Font</code> from the specified name, style and
     * point size.  Like new Font, but modifies the mapping of logical fonts.
     * E.g. Dialog will be translated to Segoe-UI
     *
     * @param fontFamilyName the font name.  This can be a font face name or a font
     *                       family name, and may represent either a logical font or a physical
     *                       font
     *                       The family names for logical fonts are: Dialog, DialogInput,
     *                       Monospaced, Serif, or SansSerif.
     * @param style          the style constant for the <code>Font</code>
     *                       The style argument is an integer bitmask that may
     *                       be PLAIN, or a bitwise union of BOLD and/or ITALIC
     *                       (for example, ITALIC or BOLD|ITALIC).
     * @param size           the point size of the <code>Font</code>
     *
     * @return corresponding Font, with logical fonts remapped for Windows Vista to new native high res fonts.
     */
    public static Font build( String fontFamilyName, final int style, final int size )
        {
        String os = System.getProperty( "os.name", "unknown" );

        /* we meddle with Vista logical font mapping.  Potentially we could meddle with others.
         AIX
         Digital Unix
         FreeBSD
         HP UX
         Irix
         Linux
         Mac OS
         Mac OS X
         MPE/iX
         Netware 4.11
         OS/2
         Solaris
         Windows 2000
         Windows 95
         Windows 98
         Windows NT
         Windows Vista
         Windows XP
     */
        final String changedFontName = ( String ) ( os.equals( "Windows Vista" ) ? vistaTransforms.get( fontFamilyName ) :
                                                    otherTransforms.get( fontFamilyName ) );
        if ( changedFontName != null )
            {
            fontFamilyName = changedFontName;
            }

        // In Future we could potentially also cache fonts, or weakly cache them.
        return new Font( fontFamilyName, style, size );
        }

    // -------------------------- STATIC METHODS --------------------------

    static
        {
        vistaTransforms.put( "Arrows", "Dialog" );   // Calibri has some arrows, but is weak.
        vistaTransforms.put( "Dialog", "Segoe UI" );
        vistaTransforms.put( "DialogInput", "Consolas" );
        vistaTransforms.put( "Monospaced", "Consolas" );
        vistaTransforms.put( "SanSerif", "Arial" );
        vistaTransforms.put( "Serif", "Constantia" );
        vistaTransforms.put( "Unicode", "Dialog" );
        }

    static
        {
        otherTransforms.put( "Arrows", "Dialog" );
        otherTransforms.put( "Unicode", "Dialog" );
        }
    }
