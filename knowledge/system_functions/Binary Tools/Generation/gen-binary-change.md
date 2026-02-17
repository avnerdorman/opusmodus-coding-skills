Opusmodus                                                                          gen-binary-change   1

gen-binary-change sequence &key section exclude
[Function]

Arguments and Values:
sequence                  a list of items.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

This function is one of a pair with GEN-BINARY-ANACRUSIS. The two functions are at
their most useful as an editor when generating long streams of data. One of the problems of
using such data for the composition of music for human performance is partitioning such
streams into phrases. Even instrumental music has to breath and good instrumental music
often has a similar temporal phrase structure as poetry or prose. Applying these functions to a
data stream makes such division into phrasing possible.

(setf mat (rnd-sample 20 '(c4 d4 e4 fs4 gs4) :seed 69))
=> (gs4 gs4 e4 c4 e4 gs4 c4 d4 c4 d4
    gs4 d4 fs4 d4 e4 e4 d4 fs4 d4 gs4)

(gen-binary-change mat)
=> (1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1 1 1)


Examples:
(setf stream
        (integer-to-pitch
         (vector-round 0 7 (gen-noise 30 :seed 12))))

=> (cs4 e4 cs4 d4 e4 eb4 eb4 fs4 e4 g4 eb4 d4 cs4 fs4 fs4
    f4 fs4 e4 c4 g4 g4 d4 c4 eb4 g4 c4 cs4 c4 cs4 fs4)

(setf map (gen-binary-change stream))
=> (1 1 1 1 1 1 0 1 1 1 1 1 1 1 0
    1 1 1 1 1 0 1 1 1 1 1 1 1 1 1)

The function GEN-BINARY-CHANGE looks out for pairs of matching pitch data and
removes the second of the pair. This produces the effect of a pick up. This can be clearly
appreciated when the name parameter :list BINARY-MAP function is set to T (true).
Opusmodus                                                      gen-binary-change   2

(binary-map map stream :list t)
=> ((cs4 e4 cs4 d4 e4 eb4)
    (fs4 e4 g4 eb4 d4 cs4 fs4)
    (f4 fs4 e4 c4 g4)
    (d4 c4 eb4 g4 c4 cs4 c4 cs4 fs4))

The function GEN-BINARY-CHANGE nds and removes the end of a series of repeated
symbols 0 replacing the others with 1. The result is a list of binary numbers.


                             fi
