Opusmodus                                                                     interval-to-pitch   1

interval-to-pitch list &key ambitus start quantize remain
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
functions. The function INTERVAL-TO-PITCH converts a series of intervals to pitches. 0,
or c4, is usually interpreted as the default starting note.


Examples:
(interval-to-pitch '(2 2 1 2))
=> (c4 d4 e4 f4 g4)

(interval-to-pitch '((2 2 1 2) (5 -3 1 2) (7 3 4 -5)))
=> ((c4 d4 e4 f4 g4) (c5 a4 bb4 c5) (g5 bb5 d6 a5))

However, the starting pitch can be overridden. This effectively rotates the interval list:

(interval-to-pitch '(2 2 1 2) :start 'd4)
=> (d4 e4 fs4 g4 a4)

Sublists will be interpreted as chords. Notice how the :start note is included in the rst
chord.

(interval-to-pitch '((3 4) 1 -2 (-1 4)) :start 'd4)
=> (d4f4a4 bb4 fs4 g4b4)
                                                                                       fi
