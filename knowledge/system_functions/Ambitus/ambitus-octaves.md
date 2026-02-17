Opusmodus                                                                        ambitus-octaves   1

ambitus-octaves octave n sequence &key section exclude
[Function]

Arguments and Values:
octave               a pitch symbol.
n                    an integer (number of octaves).
sequence             a list or lists of pitches or omn sequence.
section              an integer or list of integers. Selected list or lists to process.
                     The default is NIL.
exclude              an integer or list of integers. Excluded list or lists from process.
                     The default is NIL.


Description:

The function AMBITUS-OCTAVE return new sequence of pitches in given octave and n
(number) of octaves.


Examples:
(ambitus-octaves 'c4 1 '(c4 cs4 d4 g5))
=> (c4 cs4 d4 g4)

(ambitus-octaves 'a4 2 '(c4 cs4 d4g5))
=> (c5 cs5 d5g5)

(ambitus-octaves '(c3 fs4) '(1 2) '((c4 cs4 d4g5) (c4 d4 e4f4 g4 a4)))
=> ((c3 cs3 d3g3) (c5 d5 e5f5 g4 a4))

(ambitus-octaves 'fs4 '(1 2) '((c4 cs4 d4g5) (c4 d4 e4 f4 g4 a4)))
=> ((c5 cs5 d5g4) (c5 d5 e5 f5 g4 a4))

(ambitus-octaves '(fs4 d5) '(1 2)
                 '((c4 f4 a3 gs3 cs4 b3 bb3 eb4 d4 e4)
                   (cs4 gs3 e4 f4 c4 d4 eb4 bb3 cs4 a3)
                   (fs3 d3 f3 c3 cs3 eb3 g3 b2 g3 d3)) :section '(0 2))
=> ((c5 f5 a4 gs4 cs5 b4 bb4 eb5 d5 e5)
    (cs4 gs3 e4 f4 c4 d4 eb4 bb3 cs4 a3)
    (fs5 d5 f5 c6 cs6 eb5 g5 b5 g5 d5))
