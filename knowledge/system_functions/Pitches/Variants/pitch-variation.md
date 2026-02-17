Opusmodus                                                                          pitch-variation   1

pitch-variation step repeat size chord &key type ignore
                        section exclude flat omn span seed

[Function]

Arguments and Values:
step                   in semitone steps.
repeat                 maximum repeat value.
size                   length of list.
chord                  list(s) of chords.
type                   'c (chord), 'm (melody) and '? (at random).
ignore                 excluded power-sets lists.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.
omn                    NIL or T. If true force OMN style output. The default is T.
seed                   NIL or number. The default is NIL.

OMN:
flat                   NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                   :length, :pitch or :velocity. The default is :pitch.


Description:

This function produces PITCH-VARIATION within chordal pitch material.

(setf chords '(c4e4g4 d4f4a4 g4b4d5))


                                               = 120




                                                                                                         OPUS
(pitch-variation 0 0 4 chords)
=> ((c4 e4 c4 g4) (d4 a4 d4 f4) (d5 b4 g4 b4))


                                  = 120




                                                                                              OPUSMODUS
                                                                  fl
Opusmodus                                                                    pitch-variation       2

(pitch-variation 2 0 4 chords)
=> ((c4 g4 e4 c4) (d4 f4 a4 f4) (b4 d5 b4 d5))


                                     = 120




 It uses a powerful generation and permutation architecture to produce complex lists from
                                                                                      OPUSMODUS

very simple pitch material.

 Let's go through the arguments of this function step by step. The rst argument step is the
maximum interval size in a chord. The repeat argument is the maximum repeat value of
pitches or chords. The size is the total number of slots to ll in the phrase, including repeats.

(pitch-variation 4 4 '(4 5 3) '(c4d4fs4 e4g4 c3g3d4)
                 :type 'c :ignore '(4))
=> ((d4 = e4d4bb3 =) (e4 = bb4g4 e4db4 =) (g3 = =))

The argument :set-exclude is a ' lter' for chord size with reference to the function
POWER-SET. The larger the step (interval) size is there more variations of chords is
available, therefore more processing is possible.

(power-set '(1 2 3 4))
=> ((1 2 3)
    (1 2)
    (1 2 4)
    (1 3)
    (1)
    (1 4)
    (1 3 4)
    (2 3)
    (2)
    (2 4)
    (3)
    (4)
    (3 4)
    (2 3 4)
    (1 2 3 4))

The count argument has been expanded to request three different list sizes '(4 5 3).
                                fi
                                                    fi
                                                             fi
Opusmodus                                                 pitch-variation   3

Examples:

The :type 'c will produce chords only.

(pitch-variation 12 1 7 '(c4d4fs4 e4g4 c3g3d4)
                 :type 'c :ignore 1 :seed 23)
=> ((c4bb3gb3 c4gb3 e4d4bb3 c5gb4 bb4gb4 c4gb3 bb4gb4)
    (e4db4) (d4g3 c3f2bb1 a4d4 d4g3 c3f2bb1 d4g3 g3c3))

The :type 'm will produce pitches rows only.

(pitch-variation 12 1 7 '(c4d4fs4 e4g4 c3g3d4)
                 :type 'm :seed 23)
=> ((c4 d4 fs4 c4 fs4 d4 fs4)
    (g4 e4 g4 e4 = g4 =)
    (c3 g3 d4 g3 c3 g3 c3))

(pitch-variation 4 4 12
 (make-omn
  :length '(1/4 1/8 1/8 1/2)
  :pitch '(c4cs4 fs4g4c5 f5cs5 c6b5gs4)) :seed 5678)
=> ((q c4 e cs4 = h q e cs4 c4 h q e c4 cs4 h)
    (q c5 e c5 g4 h q gb4f4 e g4 = h gb4f4 q e g4 c5 h)
    (q f5a5 e a4db5 f5a5 h q cs5 e = h a4db5 q cs5 e = h)
    (q c6 e b5 c6 h b5 q c6 e b5 gs4 h b5 q c6 e gs4 = h))
