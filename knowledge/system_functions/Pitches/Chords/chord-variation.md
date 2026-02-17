Opusmodus                                                                              chord-variation   1

chord-variation chord &key section exclude seed
[Function]

Arguments and Values:
chord                     a list or list of pitches.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
seed                      NIL or an integer. The default is NIL.


Description:

This function produces variants of a list of chords.

(chord-variation '(d4fs4a4 a4e5c5a4))
=> (bb4gb4eb4 a4d4gb4a4)
=> (bb4gb4eb4 b5e5ab5b5)
=> (d4bb3g3 a4d4gb4a4)
=> . . .

Each variant inverts or mirrors the chord but does not change the interval size in any way.
Only the transposition is changed, but in a random fashion. The limits of randomisation are
within an octave up or down. Use this function with ambitus to constrain the output to
what you might require.


Examples:
(setf chords '(c4fs4g4 c4fs4a4 d4gs4bb4 c4fs4
               e4as4b4 c4fs4c5 c4fs4c5 c4fs4c5))

(setf chords-i (chord-variation chords))
=> (c5gb4f4 gb5c5a4 gb5c5bb4 c4gb3
    e4bb3a3 c5gb4c4 c6gb5c5 c4gb3c3)

(ambitus '(d4 a5) chords-i)
=> (c5gb4f4 gb5c5a4 gb5c5bb4 c5gb4
    e4bb4a4 c5gb4c5 c5gb5c5 c5gb4c5)

(chord-variation '(d4fs4a4 c5 e5c5a4 = (c4 m7)))
=> (e5c5a4 c5 e5ab5b5 ab4c5eb5 d5b4g4e4)

(chord-variation '((d4fs4a4 c5 e5c5a4) (b5d5gs4 = = g3)))
=> ((bb4gb4eb4 c5 d4gb4a4) (f4d5ab5 b5ab6d7 f4d5ab5 g3))
Opusmodus                                                chord-variation   2

(chord-variation '((q d4fs4a4 s c5 e e5c5a4) (h b5d5gs4 s = h g3)))
=> ((q d4bb3g3 s c5 e d4gb4a4)
    (h b5ab6d7 s f4d5ab5 b5ab6d7 h g3))

(gen-loop 5 (chord-variation '(d4fs4a4 a4e5c5a4)))
=> ((bb4gb4eb4 b5e5ab5b5) (d4bb3g3 a4d4gb4a4)
    (e5c5a4 a4d4gb4a4) (d4bb3g3 b5e5ab5b5)
    (e5c5a4 a4d4gb4a4))
