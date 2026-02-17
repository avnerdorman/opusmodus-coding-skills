Opusmodus                                                                  interval-to-integer   1

interval-to-integer list &key ambitus start quantize remain
[Function]

Arguments and Values:
list                     a list or lists of intervals. Chords as sublists in a list.
ambitus                  a pitch symbol (low high), integers (low high) or instrument name.
                         The default is 'piano.
start                    an integer or pitch symbol. The default is 0 (c4).
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is NIL (1/8).
remain                   NIL or T (remaining values in cents). The default is NIL.


Description:

In OPUSMODUS the composer can create highly original pitch and rhythm schemes by
using integers as source material. To do this there must be the appropriate conversion
functions. The function INTERVAL-TO-INTEGER converts a series of intervals into their
corresponding integers. By default it is assumed that the intervals :start from 0 (c4 in
terms of integer-pitch relations).


Examples:
(interval-to-integer '(2 2 1 2))
=> (0 2 4 5 7)

(interval-to-integer '((2 2 1 2) (5 -3 1 2) (7 3 4 -5)))
=> ((0 2 4 5 7) (12 9 10 12) (19 22 26 21))

Although the start can be freely de ned:

(interval-to-integer '(2 2 1 2) :start 2)
=> (2 4 6 7 9)

(interval-to-integer
 (gen-integer-seq '(2 4 6 (7 14) 16)) :ambitus 'violin)
=> (0 2 6 12 19 27 36 26 15 3 16 30 14)
                            fi
Opusmodus                                             interval-to-integer   2

Sublists will be interpreted as chords:

(setf intervals (interval-to-integer '(2 2 (1 7) 2) :start 2))
=> (2 4 6 (7 14) 16)

(interval-map 'd4 intervals)
=> (d4 e4 gs4 d5 a5b6 g5)

(interval-to-integer '(2.5 2 1.5 2) :start 2)
=> (2 4.5 6.5 8.0 10.0)
