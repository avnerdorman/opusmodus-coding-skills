Opusmodus                                                                          chord-progression   1

chord-progression sequence &key sort reverse section exclude
[Function]

Arguments and Values:
sequence                 a list or list of pitches.
sort                     a chord note, 'low or 'high. The default is 'low.
reverse                  T or NIL. The default is NIL.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

This function will sort a sequence of chords and pitches to the lowest or highest chord
note.

Sorting to lowest chord note:

(chord-progression '(g2g3 a2a4 a2a3 g2d4 g2g4 a2e4))
=> (g2g3 g2d4 g2g4 a2a3 a2e4 a2a4)




Sorting to highest chord note:

(chord-progression '(g2g3 a2a4 a2a3 g2d4 g2g4 a2e4) :sort 'high)
=> (g2g3 a2a3 g2d4 a2e4 g2g4 a2a4)
Opusmodus                                               chord-progression   2

Examples:
(setf omn '((q d4a4g5 fs4eb5bb5 eb4fs5d5 bb4g5a5 fs4eb5d6 bb4a5g6)
            (q g4d4a4 bb4fs4eb4 a4g5d6 eb5bb5fs6 bb4a5g5 eb5d5fs5)))




(chord-progression omn)




(chord-progression omn :sort 'high)




(chord-progression omn :sort '(high low) :reverse '(nil t))
