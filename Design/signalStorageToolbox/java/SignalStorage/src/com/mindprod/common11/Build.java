/*
 * @(#)Build.java
 *
 * Summary: Track the build number used for all applications.
 *
 * Copyright: (c) 2005-2009 Roedy Green, Canadian Mind Products, http://mindprod.com
 *
 * Licence: This software may be copied and used freely for any purpose but military.
 *          http://mindprod.com/contact/nonmil.html
 *
 * Requires: JDK 1.1+
 *
 * Created with: IntelliJ IDEA IDE.
 *
 * Version History:
 *  1.0 2007-09-19 - added comment created with IntelliJ IDEA.
 */
package com.mindprod.common11;

import java.awt.Color;

/**
 * Track the build number used for all applications.
 *
 * @author Roedy Green, Canadian Mind Products
 * @version 1.0 2007-09-19 - added comment created with IntelliJ IDEA.
 * @since 2007-09-19
 */
public class Build
    {
    // ------------------------------ CONSTANTS ------------------------------

    /**
     * incremented for each microrelease even when version numbers are not changed. Global to all apps.
     */
    public static final int BUILD_NUMBER = 9326;

    /**
     * current year, used for copyright
     */
    public static final int THIS_COPYRIGHT_YEAR = com.mindprod.common11.Misc.thisYear();

    /**
     * name of the code signing cert without .cer
     */
    public static final String MINDPRODCERT = "mindprodcert2009dsa";

    // ------------------------------ FIELDS ------------------------------

    /**
     * colour to let app blend with CMP background
     */
    public static final Color BLEND_BACKGROUND = new Color( 0xf3fff6 );
    }
