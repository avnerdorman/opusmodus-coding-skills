Opusmodus                                                                      pitch-invert-start       1

pitch-invert-start start sequence &key ambitus section exclude
[Function]

Arguments and Values:
start                      pitch centre of inversion (can be a list).
sequence                   a list or list of pitches.
ambitus                    instrument name or an integer or pitch list (low high). The default is 'piano.
section                    an integer or list of integers. Selected list or lists to process.
                           The default is NIL.
exclude                    an integer or list of integers. Excluded list or lists from process.
                           The default is NIL.


Description:

PITCH-INVERT-START allows you to specify a centre of inversion, rather than simply
inverting around the rst note in a sequence as in PITCH-INVERT.

(pitch-invert-start 'd4 '(c4 d4 e4))
=> (e4 d4 c4)

Invert multiple lists around a single pitch centre:

(pitch-invert-start 'd4 '((c4 d4 e4) (f4 g4 a4) (b4 c5 d5)))
=> ((e4 d4 c4) (b3 a3 g3) (f3 e3 d3))

Invert lists around multiple pitch centres:

(pitch-invert-start '(d4 g4 c5) '((c4 d4 e4) (f4 g4 a4) (b4 c5 d5)))
=> ((e4 d4 c4) (a4 g4 f4) (db5 c5 bb4))

Process only given :sections.

(pitch-invert-start '(d4 g4 c5)
                    '((c4 d4 e4) (f4 g4 a4) (b4 c5 d5))
                    :section '(0 2))
=> ((e4 d4 c4) (f4 g4 a4) (db5 c5 bb4))

(pitch-invert-start '(d4 g4 c5)
                    '((q c4 d4 e4) (3q f4 g4 a4) (e b4 c5 d5))
                    :section '(0 2))
=> ((q e4 d4 c4) (3q f4 g4 a4) (e db5 c5 bb4))
               fi
Opusmodus                                              pitch-invert-start   2

Examples:
(setf seq1 (rnd-order (gen-integer 24) :seed 56))
=> (13 22 17 19 10 12 24 18 16 3 2 7
    11 5 21 4 20 14 1 9 23 15 0 8 6)

(setf seq1a (gen-divide '(7 8 5 3) (integer-to-pitch seq1)))
=> ((db5 bb5 f5 g5 bb4 c5 c6) (gb5 e5 eb4 d4 g4 b4 f4 a5)
    (e4 ab5 d5 db4 a4) (b5 eb5 c4) (ab4 gb4))

(pitch-invert-start (rnd-pick seq1a :type :seq) seq1a)
=> ((db6 e5 a5 g5 e6 d6 d5) (e3 gb3 g4 ab4 eb4 b3 f4 db3)
    (c7 ab5 d6 eb7 g6) (db2 a2 c4) (e4 gb4))
