/*
 * @(#)Hybrid.java
 *
 * Summary: Converts a Applet into an Application.
 *
 * Copyright: (c) 2006-2009 Roedy Green, Canadian Mind Products, http://mindprod.com
 *
 * Licence: This software may be copied and used freely for any purpose but military.
 *          http://mindprod.com/contact/nonmil.html
 *
 * Requires: JDK 1.1+
 *
 * Created with: IntelliJ IDEA IDE.
 *
 * Version History:
 *  1.0 2006-03-07 - initial version.
 */
package com.mindprod.common11;

import java.applet.Applet;
import java.awt.Frame;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

/**
 * Converts a Applet into an Application.
 *
 * @author Roedy Green, Canadian Mind Products
 * @version 1.0 2006-03-07 - Created with IntelliJ IDEA.
 * @since 2006-03-07
 */
public final class Hybrid
    {
    // -------------------------- PUBLIC STATIC METHODS --------------------------

    /**
     * Fire up the Applet as an application
     *
     * @param title             title for frame usually TITLE_STRING+ " " + VERSION_STRING
     * @param applicationWidth  width of frame, usually APPLET_WIDTH
     * @param applicationHeight height of frame body, usually  APPLET_HEIGHT
     */
    public static void fireup( final Applet applet,
                               final String title,
                               final int applicationWidth,
                               final int applicationHeight )
        {
        final Frame frame = new Frame( title );
        // allow some extra room for the frame title bar.
        frame.setSize( applicationWidth + 16, applicationHeight + 36 );
        frame.addWindowListener( new WindowAdapter()
        {
        /**
         * Handle request to shutdown.
         *
         * @param e event giving details of closing.
         */
        public void windowClosing( WindowEvent e )
            {
            applet.stop();
            applet.destroy();
            System.exit( 0 );
            }// end WindowClosing
        }// end anonymous class
        );// end addWindowListener line

        frame.add( applet );
        applet.init();
        frame.validate();
        frame.setVisible( true );
        applet.start();
        }
    }
