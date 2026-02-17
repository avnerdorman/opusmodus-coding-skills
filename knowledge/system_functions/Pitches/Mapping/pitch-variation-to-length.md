Opusmodus                                                             pitch-variation-to-length   1

pitch-variation-to-length step repeat duration length pitch
                                               &key ignore type transpose seed

[Function]

Arguments and Values:
step                     the size of consecutive interval step in a chord (semitone) or NIL.
repeat                   number of consecutive repeat.
duration                 all values above the duration values are process.
length                   list of lengths.
pitch                    list of chords or pitches.
ignore                   chord size.
type                     'c (chord), 'm (melody) or '? (random selection is used).
transpose                transposition value.
seed                     NIL or an integer. The default is NIL.


Description:

Use this function to generate mixtures or variations of chords or pitches from a chord
sequence.

(pitch-variation-to-length
 1 1 1/2
 '(s cs4fs4 e f4fs4b4 s g4b4c5 q f4b4cs5 - h cs4fs4))
=> (s cs4 e fs4 s cs4 q fs4 - h f4fs4b4)


Examples:

In the example below chords are formed from applying the CHORDIZE function to lists of
pitches generated from the PCS-CARDINAL function. Like all the other CHORDIZE
mapping functions a list of lengths is determined and upon which the pitch mapping is
focused.

(setf pitches (pcs (pcs-cardinal 5 :forte) :pitch))
=> ((c4 db4 d4 eb4 e4) (c4 db4 d4 eb4 f4) (c4 db4 d4 e4 f4)
    . . .)

(setf chords (chordize pitches))
=> ((c4db4d4eb4e4) (c4db4d4eb4f4) (c4db4d4e4f4) (c4db4d4eb4gb4)
    . . .)
Opusmodus                                                    pitch-variation-to-length   2

In this instance the length list is generated from GEN-TUPLET.

(setf len (flatten (gen-tuplet 1 2 '? 'n 4 '(4 1 8 2 3 1 2 2 1))))
=> (3/16 1/16 1/4 7/32 1/32 1/8 1/8
    1/6 1/12 1/4 1/8 1/8 1/8 1/8 1/4)

In the function PITCH-VARIATION-TO-LENGTH its possible to recon gure the chordal
output of the variable chords so that some chords become melodized back to pitches.

(setf omn (make-omn :length len :pitch chords))
=> (s c4cs4d4eb4e4 c4cs4d4eb4f4 e c4d4eb4e4f4 q c4cs4d4e4f4
    e c4cs4eb4e4f4 s c4cs4d4eb4fs4 c4eb4e4f4fs4 e c4cs4d4eb4g4
c4e4f4fs4g4
    3q c4cs4d4f4fs4 3h c4cs4e4f4fs4 q c4cs4d4fs4g4
    e c4cs4f4fs4g4 c4d4eb4e4fs4 c4cs4d4e4fs4 c4d4e4f4fs4
    q c4cs4eb4e4fs4)

(pitch-variation-to-length 2 1 1/4 omn :type '(? c c))
=> (s c4 cs4 e eb4 q c4cs4d4eb4f4 e cs4 s eb4 c4
    e d4 cs4 3q eb4 3h c4 q c4d4eb4e4f4 e e4 f4 d4 e4 q c4cs4d4e4f4)

In this expression below further edits and transformations of the original chords variable
are set up in the additional arguments attached to the function.

(pitch-variation-to-length 2 1 1/4 omn
                           :type '(? c c) :ignore '(4 5)
                           :transpose '(1 6 13 1 0 6) :seed 45)
=> (s eb4 cs4 e eb4 q fs4g4gs4a4b4 e f5e5d5 s eb5d5 eb5d5c5
    e cs5b4 gs5fs5 3q eb5 3h e5eb5 q cs4eb4e4f4fs4
    e eb4d4cs4 fs4e4eb4 e4eb4 d4 q fs4g4gs4bb4b4)
                                                                 fi
