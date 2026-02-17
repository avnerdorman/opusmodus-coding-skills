Opusmodus                                                                    pitch-to-interval   1

pitch-to-interval list &key quantize remain
[Function]

Arguments and Values:
list                     a list or lists of pitches.
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is NIL (1/8).
remain                   NIL or T (remaining values in cents). The default is NIL.


Description:

This function converts a list of pitches into intervals. This is most valuable as a way of
making use of the extensive functions covering Pitch Class, Rows and Twelve Tone
Composition. Interval lists can also be manipulated like integers with the sequence and
number functions in the 'Integers & Numbers' menu.


Examples:
(pitch-to-interval '(c4 d4 e4 f4))
=> (2 2 1)

(a*x 2 (pitch-to-interval '(c4 d4 e4 f4 cs4 gs4)))
=> (4 4 2 -8 14)

(interval-to-pitch '(4 4 2 -8 14))
=> (c4 e4 gs4 bb4 d4 e5)

Chords will be rendered as sublists:

(pitch-to-interval '(c4 g4 d4fs4a4 e4 f4a4c5eb5))
=> (7 (-5 4 3) -5 (1 4 3 3))

(pitch-to-interval '(c4+ d4 e4.. f4 cs4+ gs4))
=> (1.5 2.75 0.25 -3.5 6.5)

(pitch-to-interval '(c4+ d4 e4.. f4 cs4+ gs4) :quantize 1/2)
=> (2 3 0 -3 6)
