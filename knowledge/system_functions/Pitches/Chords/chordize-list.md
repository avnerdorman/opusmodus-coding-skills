     Opusmodus                                                               chordize-list   1

     chordize-list pitches
     [Function]

     Arguments and Values:
     pitches                      list of pitches.


     Description:

     CHORDIZE-LIST is a more exible version of CHORDIZE. It allows you to declare exactly
     what material in a given list of pitches will be chordized.

     (chordize-list '((c4 e4) (g4 c5)))
     => (c4e4 g4c5)


     Examples:

     All unlisted items are treated as single pitches.

     (chordize-list '(c4 e4 g4 c5))
     => (c4 e4 g4 c5)

     Mixtures of melodic and chordal material can also be used:

     (chordize-list '(c4 e4 (g4 c5)))
     => (c4 e4 g4c5)

     Note that duplicate pitches will not be automatically ltered out, so:

     (chordize-list '(c4 e4 (g4 c5 c5)))
     => (c4 e4 g4c5c5)

     To lter our duplicates, use CHORD-PITCH-UNIQUE:

     (chord-pitch-unique (chordize-list '(c4 e4 (g4 c5 c5))))
     => (c4 e4 g4c5)

     To divide up a melody into chords:

     (chordize-list (gen-divide '(2 1 3) '(c4 f4 g4 a4 d4 f3)))
     => (c4f4 g4 a4d4f3)
fi
                             fl
                                                         fi
