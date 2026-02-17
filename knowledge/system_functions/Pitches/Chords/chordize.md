     Opusmodus                                                                          chordize   1

     chordize pitches
     [Function]

     Arguments and Values:
     pitches                    a list(s) of pitches.


     Description:

     CHORDIZE can be used to group all the pitch symbols in a list (or series of lists) into a single
     chord. For a more exible method of controlling what material is chordized, see
     CHORDIZE-LIST.

     (chordize '(c4 e4 g4))
     => (c4e4g4)


     Examples:

     Chordize multiple lists:

     (chordize '((c4 e4 g4) (d4 f4 a4)))
     => ((c4e4g4) (d4f4a4))

     Note that duplicate pitches will not be automatically ltered out, so:

     (chordize '((c4 c4 e4 g4) (d4 d4 f4 a4)))
     => ((c4c4e4g4) (d4d4f4a4))

     To lter our duplicates, use CHORD-PITCH-UNIQUE:

     (chord-pitch-unique (chordize '((c4 c4 e4 g4) (d4 d4 f4 a4))))
     => ((c4e4g4) (d4f4a4))
fi
                  fl
                                                        fi
