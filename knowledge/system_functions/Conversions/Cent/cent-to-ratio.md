Opusmodus                                                                    cent-to-ratio    1

cent-to-ratio ratio
[Function]

Arguments and Values:
values                    a list of numbers.


Description:

This function converts cents values to ratios.

(cent-to-ratio '(0 100 200 300 400 500 600 700 800 900 1000 1100 1200))
=> (1.0 1.0594631 1.122462 1.1892071 1.2599211 1.3348398
    1.4142135 1.4983071 1.587401 1.6817929 1.7817974 1.8877486 2.0)

(cent-to-ratio '(0 113 203 294 407 498 611 702 792 905 996 1109 1200))
=> (1.0 1.0674486 1.1244088 1.1850928 1.2650257 1.3332987
    1.4232279 1.500039 1.5800827 1.6866571 1.7776853 1.8975879 2.0)

The cent is a logarithmic unit of measure used for musical intervals. Twelve-tone equal
temperament divides the octave into 12 semitones of 100 cents each. Cents are used to
measure extremely small nite intervals, or to compare the sizes of comparable intervals in
different tuning systems, and in fact the interval of one cent is much too small to be heard
between successive notes. a cent is a ratio between two close frequencies. For the ratio to
remain constant over the frequency spectrum, the frequency range encompassed by a cent
must be proportional to the two frequencies. An equally tempered semitone (the interval
between two adjacent piano keys) decidedly spans 100 cents. An octave -- two notes that
have a frequency ratio of 2:1 -- spans twelve semitones and therefore 1200 cents.


Examples:

This function might be used to explore a particular tuning as a way towards a unique musical
structure. Here is an example of Bach's favourites, the second of Kirkenberger's tunings. See
the conversion from ratios to cents:

(ratio-to-cent
 '(1.0 1.0594631 1.122462 1.1892071 1.2599211 1.3348398
   1.4142135 1.4983071 1.587401 1.6817929 1.7817974 1.8877486 2.0))
=> (0 100 200 300 400 500 600 700 800 900 1000 1100 1200)

Look at Bill Aves notes on this tuning here to see how cents, ratios, frequency and pitches
relate to one another. http://www.billalves.com/porgitaro/tandystangotuning.html
                   fi
