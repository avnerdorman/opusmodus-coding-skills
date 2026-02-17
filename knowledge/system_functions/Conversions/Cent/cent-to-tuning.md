Opusmodus                                                                 cent-to-tuning   1

cent-to-tuning values
[Function]

Arguments and Values:
values                   a list of cents values.


This function converts cents values into tuning values.

The cent is a logarithmic unit of measure used for musical intervals. Twelve-tone equal
temperament divides the octave into 12 semitones of 100 cents each. Cents are used to
measure extremely small nite intervals, or to compare the sizes of comparable intervals in
different tuning systems, and in fact the interval of one cent is much too small to be heard
between successive notes. A cent is a ratio between two close frequencies. For the ratio to
remain constant over the frequency spectrum, the frequency range encompassed by a cent
must be proportional to the two frequencies. An equally tempered semitone (the interval
between two adjacent piano keys) decidedly spans 100 cents. An octave -- two notes that
have a frequency ratio of 2:1 -- spans twelve semitones and therefore 1200 cents.

100 cents = 1.0 tuning = 1 semitone.
50 cents = 0.5 tuning - one quarter tone.


Examples:
(cent-to-tuning '(-14 50 5))
=> (-0.14 0.5 0.05)

(cent-to-tuning '((-14 50 5) (45 90 23 -12 30 -10)))
=> ((-0.14 0.5 0.05) (0.45 0.9 0.23 -0.12 0.3 -0.1))
                   fi
