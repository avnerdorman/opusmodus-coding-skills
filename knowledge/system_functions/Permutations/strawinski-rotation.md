Opusmodus                                                                   strawinski-rotation   1

strawinski-rotation row &key invert chord
[Function]

Arguments and Values:
row                      12-tone row. Integer or pitch row.
invert                   an integer or a pitch symbol.
chord                    return chords if T and melody if NIL. The default is T.


Description:

When Strawinski started to use 12-tone rows in his compositions he added his own way of
producing chordal material so that he could get his beloved major/minor tetra-chords.

This function takes the original row and its inversion and divides them into 4 hexachords. It
then uses cyclic-rotation which are transposed so that the beginning note is always the same
which gives you 6 rows of each hexachord. All in all 24 new rows. It then makes chords
out of the vertical rows.

(setf row '(c4 eb4 gs4 g4 a4 d4 fs4 cs4 bb4 b4 f4 e4))

(strawinski-rotation row)
=> ((c4c4c4c4c4c4 eb4f4b3d4f3bb3 gs4e4cs4g3eb3cs4
     g4fs4fs3f3fs3fs4 a4b3e3gs3b3f4 d4a3g3cs4bb3g4)
    (fs4fs4fs4fs4fs4fs4 cs4eb5g4c4f4gs4 bb4e5cs4b3g4eb4
     b4bb4c4cs4d4c5 f4a4d4gs3b4cs5 e4b4a3f4c5g4)
    (c4c4c4c4c4c4 a3g3cs4bb3g4d4 e3gs3b3f4a4b3
     f3fs3fs4g4fs4fs3 eb3cs4gs4e4cs4g3 bb3eb4f4b3d4f3)
    (fs3fs3fs3fs3fs3fs3 b3a2f3c4g3e3 d3gs2b3cs4f3a3
     cs3d3c4b3bb3c3 g3eb3bb3e4cs3b2 gs3cs3eb4g3c3f3))

(strawinski-rotation '(0 3 8 7 9 2 6 1 10 11 5 4))
=> (((0 0 0 0 0 0) (3 5 -1 2 -7 -2) (8 4 1 -5 -9 1)
     (7 6 -6 -7 -6 6) (9 -1 -8 -4 -1 5) (2 -3 -5 1 -2 7))
    ((6 6 6 6 6 6) (1 15 7 0 5 8) (10 16 1 -1 7 3)
     (11 10 0 1 2 12) (5 9 2 -4 11 13) (4 11 -3 5 12 7))
    ((0 0 0 0 0 0) (-3 -5 1 -2 7 2) (-8 -4 -1 5 9 -1)
     (-7 -6 6 7 6 -6) (-9 1 8 4 1 -5) (-2 3 5 -1 2 -7))
    ((-6 -6 -6 -6 -6 -6) (-1 -15 -7 0 -5 -8) (-10 -16 -1 1 -7 -3)
     (-11 -10 0 -1 -2 -12) (-5 -9 -2 4 -11 -13) (-4 -11 3 -5 -12 -7)))
     Opusmodus                                                            strawinski-rotation    2

     Examples:

     The rst chord of each list is of course not very useful, to remove them set the keyword
     to :remove T:

     (strawinski-rotation row :remove t)
     => ((eb4f4b3d4f3bb3 gs4e4cs4g3eb3cs4
          g4fs4fs3f3fs3fs4 a4b3e3gs3b3f4 d4a3g3cs4bb3g4)
         (cs4eb5g4c4f4gs4 bb4e5cs4b3g4eb4
          b4bb4c4cs4d4c5 f4a4d4gs3b4cs5 e4b4a3f4c5g4)
         (a3g3cs4bb3g4d4 e3gs3b3f4a4b3
          f3fs3fs4g4fs4fs3 eb3cs4gs4e4cs4g3 bb3eb4f4b3d4f3)
         (b3a2f3c4g3e3 d3gs2b3cs4f3a3
          cs3d3c4b3bb3c3 g3eb3bb3e4cs3b2 gs3cs3eb4g3c3f3))

     If :chord in set to NIL the result is melodic:

     (strawinski-rotation row :chord nil)
     => ((c4 eb4 gs4 g4 a4 d4) (c4 f4 e4 fs4 b3 a3) (c4 b3 cs4 fs3 e3 g3)
         (c4 d4 g3 f3 gs3 cs4) (c4 f3 eb3 fs3 b3 bb3) (c4 bb3 cs4 fs4 f4 g4)
         (fs4 cs4 bb4 b4 f4 e4) (fs4 eb5 e5 bb4 a4 b4) (fs4 g4 cs4 c4 d4 a3)
         (fs4 c4 b3 cs4 gs3 f4) (fs4 f4 g4 d4 b4 c5) (fs4 gs4 eb4 c5 cs5 g4)
         (c4 a3 e3 f3 eb3 bb3) (c4 g3 gs3 fs3 cs4 eb4) (c4 cs4 b3 fs4 gs4 f4)
         (c4 bb3 f4 g4 e4 b3) (c4 g4 a4 fs4 cs4 d4) (c4 d4 b3 fs3 g3 f3)
         (fs3 b3 d3 cs3 g3 gs3) (fs3 a2 gs2 d3 eb3 cs3)(fs3 f3 b3 c4 bb3 eb4)
         (fs3 c4 cs4 b3 e4 g3) (fs3 g3 f3 bb3 cs3 c3) (fs3 e3 a3 c3 b2 f3))

     You can also set the inversion-point with :invert. The default inversion value is the rst
     value of the row. Here the invert value is 4:

     (strawinski-rotation row :invert 4 :remove t)
     => ((eb4f4b3d4f3bb3 gs4e4cs4g3eb3cs4
          g4fs4fs3f3fs3fs4 a4b3e3gs3b3f4 d4a3g3cs4bb3g4)
         (cs4eb5g4c4f4gs4 bb4e5cs4b3g4eb4
          b4bb4c4cs4d4c5 f4a4d4gs3b4cs5 e4b4a3f4c5g4)
         (f4eb4a4fs4eb5bb4 c4e4g4cs5f5g4
          cs4d4d5eb5d5d4 b3a4e5c5a4eb4 fs4b4cs5g4bb4cs4)
         (g4f3cs4gs4eb4c4 bb3e3g4a4cs4f4
          a3bb3gs4g4fs4gs3 eb4b3fs4c5a3g3 e4a3b4eb4gs3cs4))
fi
                                                                                     fi
