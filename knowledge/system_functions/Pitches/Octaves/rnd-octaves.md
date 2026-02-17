Opusmodus                                                                                 rnd-octaves   1

rnd-octaves range sequence &key section exclude seed
[Function]

Arguments and Values:
range                    integers (low, high), pitches (low, high) or instrument-name.
sequence                 list of pitches.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     NIL or number. The default is NIL.


Description:

The function RND-OCTAVES will transpose each pitch in a list to a new octave within a
given range.

(rnd-octaves '(c3 g6) '(c4 d4 e4 f4 g4))
=> (c5 d4 e6 f5 g3)


Examples:

The simplest way to use the function is to provide a pitch range. But this range can also be
an instrument-name (ambitus) and be speci ed in order to use the full range of an
instrument:

(rnd-octaves 'violin '(c3 bb3 e4 f4 g4))
=> (c5 bb6 e5 f5 g4)

Transpose the pitches in each sublist between c3 and g5:

(rnd-octaves '(c3 g5) '((c4g4 b4) (f3a3 d4 e4) (f4)))
=> ((c4g3 b4) (f5a4 d5 e3) (f5))

(rnd-octaves
 '(c3 g5) '((h c4g4 b4) (h f3a3 d4 q e4) (q f4)))
=> ((h c3g3 b4) (h f3a3 d5 q e3) (q f4))

To transpose all pitches in a list to random octave, see RND-OCTAVE.
                                             fi
