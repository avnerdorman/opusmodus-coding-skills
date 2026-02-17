Opusmodus                                                                                   rnd-octave   1

rnd-octave range sequence &key section exclude seed
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

RND-OCTAVE chooses an octave at random within a given range and transposes all the
pitches accordingly.

(rnd-octave '(c3 g6) '(c4 d4 e4 f4 g4))
=> (c5 d5 e5 f5 g5)

The simplest way to use the function is to provide a pitch range. But this range can also be
an instrument-name (ambitus) and be speci ed in order to use the full range of an
instrument:

(rnd-octave 'violin '(c4 d4 e4 f4 g4))
=> (c7 d7 e7 f7 g7)


Examples:

Transpose each sublist between c3 and g5:

(rnd-octave '(c3 g5) '((c4g4b4) (f3a3d4 e4) (f4)))
=> ((c5g4b4) (f4a4d4 e4) (f5))

(rnd-octave '(c3 g5) '((h c4g4b4) (h f3a3d4 q e4) (q f4)))
=> ((h c3g3b3) (h f3a3d3 q e3) (q f4))

To transpose all pitches in a list to random octaves, see RANDOMIZE-OCTAVES.
                                             fi
