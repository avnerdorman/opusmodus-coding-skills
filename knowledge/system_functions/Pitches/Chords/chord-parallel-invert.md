Opusmodus                                                                     chord-parallel-invert   1

chord-parallel-invert sequence &key section exclude seed
[Function]

Arguments and Values:
sequence                 a list or list of pitches.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     NIL or an integer. The default is NIL.


Description:

This function mirrors the intervals of a following chord around the highest pitch of the
following chord. In other words the intervals in the rst chord are parallel but reversed (from
the highest pitch of the second or following chord). This function is particular useful as an
elegant way of avoiding parallelism in chord sequences.

(chord-parallel-invert '(c4g4 ds4as4))
=> (c4g4 bb3ds4)

(chord-parallel-invert '(c4g4 d4a4))
=> (c4g4 a3d4)

Such mirroring can produce colourful additions to generated chord sequences.

(setf chords '(c4fs4 c4fs4 c4fs4 c4fs4 c4fs4 c4fs4 c4fs4 c4fs4))

(setf chords-i (pitch-transpose-rnd 6 12 chords))
=> (c3fs3 c5fs5 c4fs4 c3fs3 c4fs4 c5fs5 c3fs3 c5fs5)

(chord-parallel-invert chords-i)
=> (c3fs3 fs5c6 fs4c5 fs2c3 fs4c5 fs4c5 fs2c3 fs4c5)


Examples:
(chord-parallel-invert '((c4g4 = = cs4gs4) (c4 = = f4 =)))
=> (c4g4 g4c5 c4g4 ab3cs4 c4 = = f4 =)

(chord-parallel-invert '(c4g4 cs4gs4))
=> (c4g4 ab3cs4)
                                                  fi
Opusmodus                                              chord-parallel-invert   2

(chord-parallel-invert
 '(c4e4 c4e4g4c5 d4fs4a4d5 f5 c4e4g4c5 cs4f4gs4cs5))
=> (c4e4 c4e4g4c5 gb3a3d4d4 f5 c4e4g4c5 f4gs4cs5db5)

(chord-parallel-invert
 '(q c4e4 pp c4e4g4c5 d4fs4a4d5 f5 c4e4g4c5 cs4f4gs4cs5))
=> (q c4e4 pp c4e4g4c5 a3d4d4fs4 f5 c4e4g4c5 f4gs4cs5db5)

(chord-parallel-invert '(q (c maj) (d maj) (g maj) (bb maj)))
=> (q c4e4g4 a3d4gb4 g4b4d5 f4bb4d5)
