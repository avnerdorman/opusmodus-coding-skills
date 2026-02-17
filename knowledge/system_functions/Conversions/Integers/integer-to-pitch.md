Opusmodus                                                                       integer-to-pitch   1

integer-to-pitch values &key quantize remain
[Function]

Arguments and Values:
values                     a list or lists of integers. Chords as sublists in a list.
quantize                   NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                           The default is NIL (1/8).
remain                     NIL or T (remaining values in cents). The default is NIL.


Description:

In OPUSMODUS the composer can create highly original pitch and rhythm schemes by
using integers as source material. To do this there must be the appropriate conversion
functions. The function INTEGER-TO-PITCH converts a series of integers into pitch
equivalents, based on 0 = c4.


Examples:
(integer-to-pitch '(-2 -1 0 1 2))
=> (bb3 b3 c4 db4 d4)

(setf motif (rnd-sample 10 (gen-integer -3 12) :seed 21))
=> (2 6 4 4 11 6 12 4 2 0)

(integer-to-pitch motif)
=> (d4 fs4 e4 e4 b4 fs4 c5 e4 d4 c4)

Sublists in the list will be chordized:

(integer-to-pitch '((-2 -1) 0 (1 2)))
=> (bb3b3 c4 db4d4)

(setf values (rndn 12 -12.5 12.5))
=> (-4.0175104 -7.5934653 7.873888 8.472134 6.6712303
     7.494217 1.3128891 -8.3569355 11.346745 11.440529
     -2.0488586 -8.165472)

(integer-to-pitch values :quantize 1/2)
=> (gs3 e3 gs4 gs4 g4 g4 cs4 e3 b4 b4 bb3 e3)

(integer-to-pitch values :quantize 1/4)
=> (gs3 e3+ gs4 gs4+ fs4+ g4+ cs4+ ds3+ b4+ b4+ bb3 e3)
Opusmodus                                               integer-to-pitch   2

(integer-to-pitch values :quantize 1/8)
=> (gs3 e3+ g4.. gs4+ fs4.. g4+ cs4. ds3.. b4. b4+ bb3 ds3..)

Remaining cents:

(integer-to-pitch values :quantize 1/4 :remain t)
=> (-2 -9 -13 -3 17 -1 -19 14 -15 -6 -5 -17)

(integer-to-pitch values :quantize 1/8 :remain t)
=> (-2 -9 12 -3 -8 -1 6 -11 10 -6 -5 8)
