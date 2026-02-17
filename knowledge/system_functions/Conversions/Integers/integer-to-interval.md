Opusmodus                                                                 integer-to-interval   1

integer-to-interval values &key quantize remain
[Function]

Arguments and Values:
values                   a list or lists of integers. Chords as sublists in a list.
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is NIL (1/8).
remain                   NIL or T (remaining values in cents). The default is NIL.


Description:

In OPUSMODUS the composer can create highly original pitch and rhythm schemes by
using integers as source material. To do this there must be the appropriate conversion
functions. The function INTEGER-TO-INTERVAL converts a series of integers into
intervals, by calculating the difference between each value.


Examples:
(integer-to-interval '(-1 7 0 7 13 (32 -5)))
=> (8 -7 7 6 (19 -37))

(integer-to-interval '((2 4 5 9 (11 -9)) (2 4 5) (9 11 (2 -10))))
=> ((2 1 4 (2 -20)) (11 2 1) (4 2 (-9 -12)))

(integer-to-interval '(0 (0 2 -8 -7 -2)))
=> (nil (0 2 -10 1 5))

(integer-to-interval '((-12 (2 4) 5 19) (-2 (2 4) 5 19)))
=> ((nil (14 2) 1 14) (-21 (4 2) 1 14))

(integer-to-interval '(-12 (2 4) 5 19 -12 (2 4) 5 19))
=> (nil (14 2) 1 14 -31 (14 2) 1 14)

(setf motif
      (integer-to-interval
       (rnd-sample 10 (gen-integer -3 12) :seed 45)))
=> (-2 10 0 -1 0 -4 -6 13 0)

(interval-to-pitch motif)
=> (c4 bb3 gs4 gs4 g4 g4 eb4 a3 bb4 bb4)
Opusmodus                                             integer-to-interval   2

(setf values (rndn 12 -12.5 12.5))
=> (-4.0175104 -7.5934653 7.873888 8.472134 6.6712303 7.494217
    1.3128891 -8.3569355 11.346745 11.440529 -2.0488586 -8.165472)

(integer-to-interval values :quantize 1/2)
=> (-4 16 0 -1 0 -6 -9 19 0 -13 -6)

(integer-to-interval values :quantize 1/4)
=> (-3.5 15.5 0.5 -2 1 -6 -10 20 0 -13.5 -6)
