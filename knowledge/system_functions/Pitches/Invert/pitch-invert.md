Opusmodus                                                                             pitch-invert   1

pitch-invert sequence &key flatten section exclude ambitus
[Function]

Arguments and Values:
sequence                  a list or list of pitches.
flatten                   NIL or T. (T invert all sublists as though attened). The default is NIL.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
ambitus                   instrument name or an integer or pitch list (low high).
                          The default is 'piano.


Description:

The function PITCH-INVERT will invert the pitches around the rst value in a list.

(pitch-invert '(c4 d4 e4))
=> (c4 bb3 ab3)

Whereas PITCH-INVERT-START can invert from any point or pitch in a list.

(pitch-invert-start 'd4 '(c4 d4 e4))
=> (e4 d4 c4)


Example:

In the case of sublists, each list will be processed independently:

(pitch-invert '((c4 d4 e4) (d4 e4 f4)))
=> ((c4 bb3 ab3) (d4 c4 b3))

Unless :flatten is invoked, in which case the inversion will be applied to the entire list as
though it were attened:

(pitch-invert '((c4 d4 e4) (d4 e4 f4)) :flatten t)
=> ((c4 bb3 ab3) (bb3 ab3 g3))

Chords are inverted around their roots:

(pitch-invert '(c4e4g4))
=> (c4ab3f3)
         fl
                                                            fl
                                                                 fi
Opusmodus                                                      pitch-invert   2

Selected sublists can be processed with section:

(pitch-invert '((d4 c4e4g4) (f4 g4 a4)
                (d4fs4a4 e4 f4) (g4 a4 b4)) :section '(0 2))
=> ((d4 e4c4a3) (f4 g4 a4) (d4bb3g3 c4 b3) (g4 a4 b4))

(pitch-invert '((q d4 h c4e4g4) (3q f4 g4 a4)
                (q d4fs4a4 e e4 f4) (3q g4 a4 b4)) :section '(1 3))
=> ((q d4 h e4c4a3) (3q f4 g4 a4)
    (q d4bb3g3 e c4 b3) (3q g4 a4 b4))
