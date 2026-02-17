Opusmodus                                                     get-chord-size   1

get-chord-size pitches
[Function]

Arguments and Values:
pitches                 a list or lists of pitches.


Description:

GET-CHORD-SIZE will count the number of pitches in a chord.

(get-chord-size '(c4e4 g4c5 a3 d4fs4c5 g3d4e4 f3c4e4 f3c4d4g4b4))
=> (2 2 1 3 3 3 5)


Examples:
(get-chord-size '((c4e4g4c5fs5 a3d4fs4c5e5 g3d4e4b4d5)
                    (c4e4g4 c4fs4a4)))
=> ((5 5 5) (3 3))

Chord size to length example:

(gen-length 8 (get-chord-size '(c4 d4e4 f4 g4 a4b4c5)))
=> (1/8 1/4 1/8 1/8 3/8)
