Opusmodus                                                                           chord-pitch-unique   1

chord-pitch-unique sequence &key section exclude
[Function]

Arguments and Values:
sequence                  a list or lists of pitches.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

This function removes duplicate chord pitches in a single list:

(chord-pitch-unique '(c4c4g4 d4d4 f4a4))
=> (c4g4 d4 f4a4)


Examples:

When working with large amounts of generated or processed data, there may be some
situations in which repeated pitches occur in chords. It may be desirable to lter out any
repeated values (e.g. same octave and pitch class). Executing CHORD-PITCH-UNIQUE will
remove repeated notes from either a pitch or OMN lists.

Remove duplicate chord pitches in a single list:

(chord-pitch-unique '(c4c4g4 d4d4 f4a4))
=> (c4g4 d4 f4a4)

Remove duplicate chord pitches in a multiple lists:

(chord-pitch-unique '((c4c4g4) (d4d4) (f4a4)))
=> ((c4g4) (d4) (f4a4))

Remove duplicate chord pitches only in a selected list:

(chord-pitch-unique '((c4c4g4) (d4d4) (f4a4)) :section 1)
=> ((c4c4g4) (d4) (f4a4))

Remove duplicate chord pitches in a single list:

(chord-pitch-unique '(h c4c4g4 q d4d4 h f4a4))
=> (h c4g4 q d4 h f4a4)
                                                                               fi
Opusmodus                                                 chord-pitch-unique   2

Remove duplicate chord pitches in a multiple lists:

(chord-pitch-unique '((h c4c4g4) (q d4d4) (h f4a4)))
=> ((h c4g4) (q d4) (h f4a4))

Remove duplicate chord pitches only in a selected list:

(chord-pitch-unique '((h c4c4g4) (q d4d4) (h f4a4)) :section 1)
=> ((h c4c4g4) (q d4) (h f4a4))
