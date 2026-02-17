Opusmodus                                                                    ratio-to-cent       1

ratio-to-cent ratio &key round
[Function]

Arguments and Values:
ratio                         a ratio or a list of ratios.
round                         NIL or T. The default is T.


Description:

This function converts ratios values to cents.


Examples:

Pythagorean with major thirds at:

(ratio-to-cent
 '(1.0 1.0594631 1.122462 1.1892071 1.2599211 1.3348398
   1.4142135 1.4983071 1.587401 1.6817929 1.7817974 1.8877486 2.0))
=> (0 100 200 300 400 500 600 700 800 900 1000 1100 1200)

LaMonte Young's Well-Tuned Piano:

(ratio-to-cent
 '(1/1 567/512 9/8 147/128 1323/1024 21/16
   189/128 3/2 49/32 441/256 7/4 63/32 2/1))
=> (0 177 204 240 444 471 675 702 738 942 969 1173 1200)

(ratio-to-cent
 '(1/1 567/512 9/8 147/128 1323/1024 21/16
   189/128 3/2 49/32 441/256 7/4 63/32 2/1)
 :round nil)
=> (0.0 176.6459 203.90999 239.60683 443.5168 470.78088 674.69086
   701.95496 737.65186 941.56177 968.8259 1172.7358 1200.0)

The ratio here means frequency ratio. In scienti c terms, an interval is the ratio between
two sonic frequencies. For example, any two notes an octave apart have a frequency ratio of
2:1. This means that successive increments of pitch by the same interval result in an
exponential increase of frequency, even though the human ear perceives this as a linear
increase in pitch. For this reason, intervals are often measured in cents, a unit derived from
the logarithm of the frequency ratio.
                         fl
                                                    fi
Opusmodus                                                                     ratio-to-cent    2

The cent is a logarithmic unit of measure used for musical intervals. Twelve-tone equal
temperament divides the octave into 12 semitones of 100 cents each. Cents are used to
measure extremely small nite intervals, or to compare the sizes of comparable intervals in
different tuning systems, and in fact the interval of one cent is much too small to be heard
between successive notes. a cent is a ratio between two close frequencies. For the ratio to
remain constant over the frequency spectrum, the frequency range encompassed by a cent
must be proportional to the two frequencies. An equally tempered semitone (the interval
between two adjacent piano keys) decidedly spans 100 cents. An octave -- two notes that
have a frequency ratio of 2:1 -- spans twelve semitones and therefore 1200 cents.

This function might be used to explore a particular tuning as a way towards a unique musical
structure. Here is an example of Bach's favourites, the second of Kirkenberger's tunings.

See the conversion from cents to ratio:

(cent-to-ratio '(0 100 200 300 400 500 600
                   700 800 900 1000 1100 1200))
=> (1.0 1.0594631 1.122462 1.1892071 1.2599211 1.3348398
    1.4142135 1.4983071 1.587401 1.6817929 1.7817974 1.8877486 2.0)

This tuning is used in Lou Harrison's Tandy's Tango for tuned guitars. Look at Bill Aves
notes on this tuning here to see how cents, ratios, frequency and pitches relate to one another.

http://www.billalves.com/porgitaro/tandystangotuning.html
                   fi
