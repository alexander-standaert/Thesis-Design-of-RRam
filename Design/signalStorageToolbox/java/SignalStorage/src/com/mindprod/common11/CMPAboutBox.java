/*
 * @(#)CMPAboutBox.java
 *
 * Summary: An AWT About box that truly tells you about he program, not just the author's name.
 *
 * Copyright: (c) 1999-2009 Roedy Green, Canadian Mind Products, http://mindprod.com
 *
 * Licence: This software may be copied and used freely for any purpose but military.
 *          http://mindprod.com/contact/nonmil.html
 *
 * Requires: JDK 1.1+
 *
 * Created with: IntelliJ IDEA IDE.
 *
 * Version History:
 *  1.1 2006-03-04
 */
package com.mindprod.common11;

import java.awt.*;
import java.awt.event.*;

/**
 * An AWT About box that truly tells you about he program, not just the author's name.
 * <p/>
 * @noinspection FieldCanBeLocal
 *
 * @author Roedy Green, Canadian Mind Products
 * @version 1.1 2006-03-04
 * @since 1999
 */
public final class CMPAboutBox extends Dialog
    {
    // ------------------------------ CONSTANTS ------------------------------

    /**
     * true if debugging
     */
    private static final boolean DEBUGGING = false;

    /**
     * height of the about box not counting frame
     */
    private static final int HEIGHT = 354;

    /**
     * width of the about box not counting frame
     */
    private static final int WIDTH = 484;

    // ------------------------------ FIELDS ------------------------------

    private static final Color BLACK = Color.black;

    private static final Color DARK_GREEN = new Color( 0x008000 );

    private static final Color LABEL_FOREGROUND = new Color( 0x0000b0 );

    /**
     * for titles
     */
    private static final Color TITLE_FOREGROUND = new Color( 0xdc143c );

    private static final Color WHITE = Color.white;

    /**
     * for for titles and About buttons
     */
    private static final Font TITLE_FONT = FontFactory.build( "Dialog", Font.BOLD, 16 );

    /**
     * button to dismiss the dialog
     */
    private Button _dismissButton;

    /**
     * line 1 of CMP mailing address
     */
    private Label _addr1;

    /**
     * line 2 of CMP mailing address
     */
    private Label _addr2;

    /**
     * program author
     */
    private Label _author;

    /**
     * Canadian Mind Products
     */
    private Label _cmp;

    /**
     * copyright notice
     */
    private Label _copyright;

    /**
     * download URL
     */
    private Label _http;

    /**
     * minimum JDK version
     */
    private Label _jdkVersion;

    /**
     * contact email
     */
    private Label _mailto;

    /**
     * CMP phone number
     */
    private Label _phone;

    /**
     * program name and version
     */
    private Label _prognameVersion;

    /**
     * line 1 of what program is for
     */
    private Label _purpose1;

    /**
     * line 2 of what program is for
     */
    private Label _purpose2;

    /**
     * yyyy-mm-dd this version released
     */
    private Label _released;

    /**
     * is prgram free, shareware etc.
     */
    private Label _status;

    // -------------------------- PUBLIC INSTANCE  METHODS --------------------------

    /**
     * Create an about box when don't have parent
     *
     * @param progname           Program name
     * @param version            Program version e.g. "1.3"
     * @param purpose1           what is this program for? line-1
     * @param purpose2           what is this program for? line-2. may be null, or "".
     * @param status             e.g. "unregistered shareware", "freeware", "commercial", "company confidential"
     * @param released           Date released e.g. "1999-12-31"
     * @param firstCopyrightYear e.g. 1996
     * @param author             e.g. "Roedy Green"
     * @param masterSite         e.g. CONVERTER -- where to find most up to date ZIP
     * @param jdkVersion         e.g. 1.1 (minimum JDK version required)
     */
    public CMPAboutBox( final String progname,
                        final String version,
                        final String purpose1,
                        final String purpose2,
                        final String status,
                        final String released,
                        final int firstCopyrightYear,
                        final String author,
                        final String masterSite,
                        final String jdkVersion )
        {
        this( new Frame( progname + " " + version )
                /*
                * dummy parent, won't be
                * disposed!!
                */,
                progname,
                version,
                purpose1,
                purpose2,
                status,
                released,
                firstCopyrightYear,
                author,
                masterSite,
                jdkVersion );
        }

    /**
     * Create an about box
     *
     * @param parent             frame for this about box.
     * @param progname           Program name
     * @param version            Program version e.g. "1.3"
     * @param purpose1           what is this program for? line-1
     * @param purpose2           what is this program for? line-2. may be null, or "".
     * @param status             e.g. "unregistered shareware", "freeware", "commercial", "company confidential"
     * @param released           Date released e.g. "1999-12-31"
     * @param firstCopyrightYear e.g. 1996
     * @param author             e.g. "Roedy Green"
     * @param masterSite         e.g. CONVERTER -- where to find most up to date ZIP
     * @param jdkVersion         e.g. 1.1 (minimum JDK version required)
     *
     * @noinspection WeakerAccess
     */
    public CMPAboutBox( final Frame parent,
                        final String progname,
                        final String version,
                        final String purpose1,
                        final String purpose2,
                        final String status,
                        final String released,
                        final int firstCopyrightYear,
                        final String author,
                        final String masterSite,
                        final String jdkVersion )
        {
        super( parent, progname + " " + version, false/* not modal */ );
        guts( progname,
                version,
                purpose1,
                purpose2,
                status,
                released,
                firstCopyrightYear,
                author,
                masterSite,
                jdkVersion );
        }

    /**
     * bypass setBackground bug, by setting it over and over, every time addNotify gets called.
     */
    public void addNotify()
        {
        super.addNotify();
        setBackground( WHITE );
        }

    // -------------------------- OTHER METHODS --------------------------

    /**
     * Shutdown the about box
     */
    private void dismiss()
        {
        // close the about box
        this.setVisible( false );
        // tell AWT to discard all pointers to the Dialog box.
        this.dispose();
        }// end dismiss

    /**
     * common parts to all creation Guts of reating an an about box
     *
     * @param progname           Program name
     * @param version            Program version e.g. "1.3"
     * @param purpose1           what is this program for? line-1
     * @param purpose2           what is this program for? line-2. may be null, or "".
     * @param status             e.g. "unregistered shareware", "freeware", "commercial", "company confidential"
     * @param released           Date released e.g. "1999-12-31"
     * @param firstCopyrightYear 1996
     * @param author             e.g. "Roedy Green"
     * @param masterSite         e.g. CONVERTER -- where to find most up to date ZIP
     * @param jdkVersion         e.g. 1.1 (minimum JDK version required)
     */
    private void guts( final String progname,
                       final String version,
                       final String purpose1,
                       final String purpose2,
                       final String status,
                       final String released,
                       final int firstCopyrightYear,
                       final String author,
                       final String masterSite,
                       final String jdkVersion )
        {
        // basic layout
        // 0 1
        // 0 ---------------progname version--------------------------------- 0
        //
        // 1 ---------------------purpose1------------------------------------ 1
        // 2 ---------------------purpose2------------------------------------ 2
        //
        // 3 ---------------------status-------------------------------------- 3
        // 4 --------------released: xxxxxxxxx-------------------------------- 4
        //
        // 5 copyright 2000 5
        // 6 Roedy Green 6
        // 7 Canadian Mind Products 7
        // 8 #101 - 2536 Wark Street --- ----requires:JDK 1.1+"    8
        // 9 Victoria, BC Canada V8T 4G8 ----phone:(250) 361-9093 9
        // 10 roedyg@mindprod.com------- --- http://mindprod.com/products#CONVERTER 10
        //
        // 11 (Dismiss) 11
        // 0 1

        // leave room for warning this frame belongs to Java applet.

        setSize( WIDTH + 16, HEIGHT + 36 );
        setLocation( 0, 0 );
        setBackground( WHITE );

        _prognameVersion = new Label( progname + " " + version + " build " + Build
                .BUILD_NUMBER, Label.CENTER );
        _prognameVersion.setFont( TITLE_FONT );
        _prognameVersion.setForeground( TITLE_FOREGROUND );
        _prognameVersion.setBackground( WHITE );

        _purpose1 = new Label( purpose1, Label.CENTER );
        _purpose1.setFont( FontFactory.build( "Dialog", Font.ITALIC, 12 ) );
        _purpose1.setForeground( BLACK );
        _purpose1.setBackground( WHITE );

        if ( purpose2 != null && purpose2.length() > 0 )
            {
            _purpose2 = new Label( purpose2, Label.CENTER );
            _purpose2.setFont( FontFactory.build( "Dialog", Font.ITALIC, 12 ) );
            _purpose2.setForeground( BLACK );
            _purpose2.setBackground( WHITE );
            }

        _status = new Label( status, Label.CENTER );
        _status.setFont( FontFactory.build( "Dialog", Font.BOLD, 12 ) );
        _status.setForeground( LABEL_FOREGROUND );
        _status.setBackground( WHITE );

        _released = new Label( "released: " + released, Label.CENTER );
        _released.setFont( FontFactory.build( "Dialog", Font.PLAIN, 11 ) );
        _released.setForeground( LABEL_FOREGROUND );
        _released.setBackground( WHITE );

        final String copyright;
        if ( firstCopyrightYear == Build.THIS_COPYRIGHT_YEAR )
            {
            copyright = Integer.toString( Build.THIS_COPYRIGHT_YEAR );
            }
        else
            {
            copyright = firstCopyrightYear + "-" + Build.THIS_COPYRIGHT_YEAR;
            }
        _copyright = new Label( "copyright " + copyright, Label.LEFT );
        _copyright.setFont( FontFactory.build( "Dialog", Font.ITALIC, 11 ) );
        _copyright.setForeground( DARK_GREEN );
        _copyright.setBackground( WHITE );

        _author = new Label( author, Label.LEFT );
        _author.setFont( FontFactory.build( "Dialog", Font.BOLD + Font.ITALIC, 11 ) );
        _author.setForeground( DARK_GREEN );
        _author.setBackground( WHITE );

        _cmp = new Label( "Canadian Mind Products", Label.LEFT );
        _cmp.setFont( FontFactory.build( "Dialog", Font.BOLD + Font.ITALIC, 11 ) );
        _cmp.setForeground( DARK_GREEN );
        _cmp.setBackground( WHITE );

        _addr1 = new Label( "#101 - 2536 Wark Street", Label.LEFT );
        _addr1.setFont( FontFactory.build( "Dialog", Font.ITALIC, 11 ) );
        _addr1.setForeground( DARK_GREEN );
        _addr1.setBackground( WHITE );

        _addr2 = new Label( "Victoria, BC Canada V8T 4G8", Label.LEFT );
        _addr2.setFont( FontFactory.build( "Dialog", Font.ITALIC, 11 ) );
        _addr2.setForeground( DARK_GREEN );
        _addr2.setBackground( WHITE );

        _jdkVersion = new Label( "requires: JDK " + jdkVersion + "+", Label.RIGHT );
        _jdkVersion.setFont( FontFactory.build( "Dialog", Font.ITALIC, 11 ) );
        _jdkVersion.setForeground( DARK_GREEN );
        _jdkVersion.setBackground( WHITE );

        _phone = new Label( "phone: (250) 361-9093", Label.RIGHT );
        _phone.setFont( FontFactory.build( "Dialog", Font.ITALIC, 11 ) );
        _phone.setForeground( DARK_GREEN );
        _phone.setBackground( WHITE );

        _mailto = new Label( "roedyg@mindprod.com", Label.LEFT );
        _mailto.setFont( FontFactory.build( "Dialog", Font.ITALIC, 11 ) );
        _mailto.setForeground( DARK_GREEN );
        _mailto.setBackground( WHITE );

        _http = new Label( "http://mindprod.com/products.html#" + masterSite,
                Label.RIGHT );
        _http.setFont( FontFactory.build( "Dialog", Font.ITALIC, 10 ) );
        _http.setForeground( DARK_GREEN );
        _http.setBackground( WHITE );

        _dismissButton = new Button( "Dismiss" );
        _dismissButton.setFont( FontFactory.build( "Dialog", Font.BOLD, 15 ) );

        layoutComponents();

        // hook up About box listeners

        this.addFocusListener( new FocusAdapter()
        {
        /**
         * Handle About Dialog getting focus, give to dismiss Button.
         *
         * @param e event giving details
         */
        public void focusGained( FocusEvent e )
            {
            _dismissButton.requestFocus();
            }// end focusGained
        }// end anonymous class
        );// end addFocusListenerline

        this.addWindowListener( new WindowAdapter()
        {
        /**
         * Handle request to close about box
         *
         * @param e event giving details of closing.
         */
        public void windowClosing( WindowEvent e )
            {
            dismiss();
            }// end WindowClosing
        }// end anonymous class
        );// end addWindowListener line

        _dismissButton.addActionListener( new ActionListener()
        {
        /**
         * close down the About box when user clicks Dismiss
         */
        public void actionPerformed( ActionEvent e )
            {
            Object object = e.getSource();
            if ( object == _dismissButton )
                {
                dismiss();
                }// end if
            }// end actionPerformed
        }// end anonymous class
        );// end addActionListener line

        // The following code is only necessary if you want
        // any keystroke while the Dismiss button has focus
        // to simulate clicking the Dismiss button.

        _dismissButton.addKeyListener( new KeyAdapter()
        {
        /**
         * Handle Dismiss button getting a function keystroke, treat like a
         * dismiss Button click
         *
         * @param e event giving details
         */
        public void keyPressed( KeyEvent e )
            {
            dismiss();
            }// end keyPressed

        /**
         * Handle Dismiss button getting an ordinary keystroke, treat like a
         * dismiss Button click
         *
         * @param e event giving details
         */
        public void keyTyped( KeyEvent e )
            {
            dismiss();
            }// end keyTyped
        }// end anonymous class
        );// end addKeyListener

        this.validate();
        this.setVisible( true );
        }// end constructor

    /**
     * layout the components
     */
    private void layoutComponents()
        {
        this.setLayout( new GridBagLayout() );

        // x y w h wtx wty anchor fill T L B R padx pady

        this.add( _prognameVersion,
                new GridBagConstraints( 0,
                        0,
                        2,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.CENTER,
                        GridBagConstraints.NONE,
                        new Insets( 15, 10, 5, 10 ),
                        0,
                        0 ) );

        this.add( _purpose1,
                new GridBagConstraints( 0,
                        1,
                        2,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.CENTER,
                        GridBagConstraints.NONE,

                        new Insets( 15, 10, 0, 10 ),
                        0,
                        0 ) );

        if ( _purpose2 != null )
            {
            this.add( _purpose2,
                    new GridBagConstraints( 0,
                            2,
                            2,
                            1,
                            0.0,
                            0.0,
                            GridBagConstraints.CENTER,
                            GridBagConstraints.NONE,
                            new Insets( 0, 10, 0, 10 ),
                            0,
                            0 ) );
            }

        this.add( _status,
                new GridBagConstraints( 0,
                        3,
                        2,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.CENTER,
                        GridBagConstraints.NONE,
                        new Insets( 10, 10, 0, 10 ),
                        0,
                        0 ) );

        this.add( _released,
                new GridBagConstraints( 0,
                        4,
                        2,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.CENTER,
                        GridBagConstraints.NONE,
                        new Insets( 0, 10, 10, 10 ),
                        0,
                        0 ) );

        this.add( _copyright,
                new GridBagConstraints( 0,
                        5,
                        1,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.WEST,
                        GridBagConstraints.NONE,
                        new Insets( 5, 10, 0, 10 ),
                        0,
                        0 ) );

        this.add( _author,
                new GridBagConstraints( 0,
                        6,
                        1,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.WEST,
                        GridBagConstraints.NONE,
                        new Insets( 0, 10, 0, 5 ),
                        0,
                        0 ) );

        this.add( _cmp,
                new GridBagConstraints( 0,
                        7,
                        1,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.WEST,
                        GridBagConstraints.NONE,
                        new Insets( 0, 10, 0, 5 ),
                        0,
                        0 ) );

        this.add( _addr1,
                new GridBagConstraints( 0,
                        8,
                        1,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.WEST,
                        GridBagConstraints.NONE,
                        new Insets( 0, 10, 0, 5 ),
                        0,
                        0 ) );

        this.add( _addr2,
                new GridBagConstraints( 0,
                        9,
                        1,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.WEST,
                        GridBagConstraints.NONE,
                        new Insets( 0, 10, 0, 5 ),
                        0,
                        0 ) );
        this.add( _mailto,
                new GridBagConstraints( 0,
                        10,
                        1,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.WEST,
                        GridBagConstraints.NONE,
                        new Insets( 0, 10, 0, 5 ),
                        0,
                        0 ) );

        this.add( _dismissButton,
                new GridBagConstraints( 0,
                        11,
                        2,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.CENTER,
                        GridBagConstraints.NONE,
                        new Insets( 15, 10, 15, 10 ),
                        0,
                        0 ) );

        // second column
        this.add( _jdkVersion,
                new GridBagConstraints( 1,
                        8,
                        1,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.EAST,
                        GridBagConstraints.NONE,
                        new Insets( 0, 5, 0, 10 ),
                        0,
                        0 ) );

        this.add( _phone,
                new GridBagConstraints( 1,
                        9,
                        1,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.EAST,
                        GridBagConstraints.NONE,
                        new Insets( 0, 5, 0, 10 ),
                        0,
                        0 ) );

        this.add( _http,
                new GridBagConstraints( 1,
                        10,
                        1,
                        1,
                        0.0,
                        0.0,
                        GridBagConstraints.EAST,
                        GridBagConstraints.NONE,
                        new Insets( 0, 5, 0, 10 ),
                        0,
                        0 ) );
        }

    // --------------------------- main() method ---------------------------

    /**
     * sample test driver
     *
     * @param args not used
     */
    public static void main( String[] args )
        {
        if ( DEBUGGING )
            {
            final Frame frame = new Frame( "About box test" );
            // need have no relation to size of About box
            frame.setSize( 450, 400 );

            MenuBar mb = frame.getMenuBar();
            if ( mb == null )
                {
                mb = new MenuBar();
                frame.setMenuBar( mb );
                }

            Menu help = mb.getHelpMenu();
            if ( help == null )
                {
                help = new Menu( "Help", /* tearoff */false );
                mb.setHelpMenu( help );
                }

            help.add( new MenuItem( "keyboard" ) );
            help.add( new MenuItem( "command line" ) );
            help.add( new MenuItem( "About" ) );
            help.addActionListener( new ActionListener()
            {
            /**
             * Handle Menu Selection Request
             *
             * @param e event giving details of selection
             */
            public void actionPerformed( ActionEvent e )
                {
                String command = e.getActionCommand();
                if ( command.equals( "About" ) )
                    {
                    // Don't need to retain a reference.
                    // We do nothing more that fire it up.
                    new CMPAboutBox( frame,
                            "Sample Amanuensis",
                            "1.3",
                            "Teaches you how to interconvert the 16 basic Java types,",
                            "e.g. String to int, Long to double.",
                            "freeware",
                            "2000-01-01"
                            /* RELEASE_DATE */,
                            1996
                            /* copyright */,
                            "Roedy Green",
                            "CONVERTER",
                            "1.5" );
                    }// end if
                }// end ActionListener
            }// end anonymous class
            );// end addActionListener line

            frame.addWindowListener( new WindowAdapter()
            {
            /**
             * Handle request to shutdown.
             *
             * @param e event giving details of closing.
             */
            public void windowClosing( WindowEvent e )
                {
                System.exit( 0 );
                }// end WindowClosing
            }// end anonymous class
            );// end addWindowListener line

            frame.validate();
            frame.setVisible( true );
            }// end if
        }// end main
    }
