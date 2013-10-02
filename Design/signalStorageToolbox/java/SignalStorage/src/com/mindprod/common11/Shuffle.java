/*
 * @(#)Shuffle.java
 *
 * Summary: Shuffles an int[], much like Collections.shuffle.
 *
 * Copyright: (c) 2007-2009 Roedy Green, Canadian Mind Products, http://mindprod.com
 *
 * Licence: This software may be copied and used freely for any purpose but military.
 *          http://mindprod.com/contact/nonmil.html
 *
 * Requires: JDK 1.1+
 *
 * Created with: IntelliJ IDEA IDE.
 *
 * Version History:
 *  1.0 2007-10-03 - Created with IntelliJ IDEA.
 */
package com.mindprod.common11;

import java.util.Random;

/**
 * Shuffles an int[], much like Collections.shuffle.
 *
 * @author Roedy Green, Canadian Mind Products
 * @version 1.0 2007-10-03 - Created with IntelliJ IDEA.
 * @since 2007-10-03
 */
public class Shuffle
    {
    // ------------------------------ CONSTANTS ------------------------------

    /**
     * true if you want the debugging main harness.
     */
    private static final boolean DEBUGGING = true;

    /**
     * how many cards in a deck that we shuffle.
     */
    private static final int DECKSIZE = 52;

    // ------------------------------ FIELDS ------------------------------

    /**
     * default source of randomness for shuffling.
     */
    private static Random wheel;

    // -------------------------- PUBLIC STATIC METHODS --------------------------

    /**
     * Shuffle an array whene Collections.shuffle is not available or where you need high quality randomness. Works much
     * like Collections.shuffle. Randomly permutes the specified list using a default source of randomness. All
     * permutations occur with approximately equal likelihood.<p>
     * <p/>
     * The hedge "approximately" is used in the foregoing description because default source of randomness is only
     * approximately an unbiased source of independently chosen bits. If it were a perfect source of randomly chosen
     * bits, then the algorithm would choose permutations with perfect uniformity.<p>
     * <p/>
     * This implementation traverses the list backwards, from the last element up to the second, repeatedly swapping a
     * randomly selected element into the "current position".  Elements are randomly selected from the portion of the
     * list that runs from the first element to the current position, inclusive.<p>
     *
     * @param toShuffle the array to be shuffled.
     */
    public static void shuffle( int[] toShuffle )
        {
        // wheel is initialised only once, and only if needed.
        if ( wheel == null )
            {
            wheel = new Random();
            }
        shuffle( toShuffle, wheel );
        }

    /**
     * This method uses the same technique as Collections.shuffle, but is somewhat simpler with direct array access.
     * Randomly permute the specified list using the specified source of randomness.  All permutations occur with equal
     * likelihood assuming that the source of randomness is fair.<p>
     * <p/>
     * This implementation traverses the array backwards, from the last element up to the second, repeatedly swapping a
     * randomly selected element into the "current position".  Elements are randomly selected from the portion of the
     * list that runs from the first element to the current position, inclusive.<p>
     *
     * @param toShuffle the array to be shuffled.
     * @param wheel     the source of randomness to use to shuffle the list.
     */
    public static void shuffle( int[] toShuffle, Random wheel )
        {
        for ( int i = toShuffle.length; i > 1; i-- )
            {
            // swap elt i-1 and a random elt 0..i-1
            final int temp = toShuffle[ i - 1 ];
            final int otherSlot = wheel.nextInt( i );
            toShuffle[ i - 1 ] = toShuffle[ otherSlot ];
            toShuffle[ otherSlot ] = temp;
            }
        }

    // --------------------------- main() method ---------------------------

    /**
     * test driver demonstrate use of shuffle.
     *
     * @param args not used.
     */
    public static void main( String[] args )
        {
        if ( DEBUGGING )
            {
            int[] deck = new int[DECKSIZE];
            for ( int i = 0; i < DECKSIZE; i++ )
                {
                // assign each card in deck a number 0..51
                deck[ i ] = i;
                }
            System.out.println( "\nbefore shuffle" );
            for ( int i = 0; i < DECKSIZE; i++ )
                {
                System.out.print( " " );
                System.out.print( deck[ i ] );
                }

            shuffle( deck );

            System.out.println( "\nafter shuffle" );

            for ( int i = 0; i < DECKSIZE; i++ )
                {
                System.out.print( " " );
                System.out.print( deck[ i ] );
                }
            }
        }
    }
