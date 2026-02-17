Opusmodus                                                                              chord-inversion         1

chord-inversion number chord &key series root rep variant omit seed
[Function]

Arguments and Values:
number                      An integer or list of integers specifying the inversion (rotation) number.
                            Positive values indicate upward inversions, while negative values indicate
                            downward inversions.

chord                       A chord or list of chords to be inverted. Each chord is represented as a list of
                            pitches.

series                      A boolean or NIL. If set to T, generates a series of inversions up to the
                            speci ed number. The default is NIL.

rep                         A boolean or NIL. If set to T, repeats a single pitch when the :root option is
                            also set to T. The default is NIL.

root                        A boolean or NIL. If set to T, includes the root chord in the output along with
                            the inversions. The default is NIL.

variant                     A symbol specifying the type of variant to apply. Options include 'p (prime),
                            'r (retrograde), 'i (invert), 'ri (retrograde-invert), 'a (ascending),
                            'd (descending), 'ad (ascending-descending), 'da (descending-ascending),
                            'ro (random order), or '? (at random). The default is NIL.

omit                        A list of variants to omit from the results. The default is NIL.

seed                        NIL or an integer. An integer seed ensures that the same result is generated
                            each time the function is evaluated, providing reproducibility.
                            The default is NIL.


Description:

The CHORD-INVERSION function generates all the inversions (rotations) of a chord up to
and including the speci ed number. For example, the rst inversion of a C major chord is
(e4g4c5). The function can also combine root position and inversions, generate series
of rotations, and apply various variants and options to customise the output. This
versatility makes it a powerful tool for chord manipulation in composition and analysis.

(setf chord 'c4e4g4)

Generates the rst inversion of the C major chord:

(chord-inversion 1 chord)
=> (e4g4c5)
         fi
                fi
                       fi
                                                        fi
Opusmodus                                                                chord-inversion     2

Generates the root position and the rst inversion together:

(chord-inversion 1 chord :root t)
=> (c4e4g4 e4g4c5)

Generates a series of up to the third inversion, including the root position:

(chord-inversion 3 chord :root t :series t)
=> (c4e4g4 e4g4c5 g4c5e5 c5e5g5)

Generates a downward series of rotations up to the third inversion, including the root
position:

(chord-inversion -3 chord :root t :series t)
=> (c4e4g4 g3c4e4 e3g3c4 c3e3g3)

Generates only the nal rotation in the downward series:

(chord-inversion -3 chord)
=> (c3e3g3)

Generates the rst inversion for a list of chords, including the root position:

(chord-inversion 1 '(c4 cs4d4 f4 e4fs4) :root t)
=> ((c4) (cs4d4 d4cs5) (f4) (e4fs4 fs4e5))

Generates the rst inversion for a list of chords, including the root position, with single
pitches repeated:

(chord-inversion 1 '(c4 cs4d4 f4 e4fs4) :root t :rep t)
=> ((c4 c4) (cs4d4 d4cs5) (f4 f4) (e4fs4 fs4e5))

Examples:

Generates the second inversion for each chord in the list, including the root position:

(chord-inversion '(2 2) '(c4e4g4 g4b4d4) :root t)
=> ((c4e4g4 g4c5e5) (g4b4d4 b4d5g5))
       fi
       fi
            fi
                              fi
Opusmodus                                                               chord-inversion      3

Generates a series of up to the second inversion for each chord in the list, including the
root position:

(chord-inversion '(2 2) '(c4e4g4 g4b4d4) :root t :series t)
=> ((c4e4g4 e4g4c5 g4c5e5) (g4b4d4 g4b4d5 b4d5g5))




(setf chords '(c4e4g4 c4eb4 g4b4d4))




Generates a series of inversions for a list of chords, including both upward and
downward rotations:

(chord-inversion '(3 3 -4) chords :series t :root t)
=> ((c4e4g4 e4g4c5 g4c5e5 c5e5g5)
    (c4eb4 eb4c5 c5eb5 eb5c6)
    (g4b4d4 b3d4g4 g3b3d4 d3g3b3 b2d3g3))




Generates a series of inversions with random variant for a list of OPUSMODUS
                                                                   chords, including
both upward and downward rotations:

(chord-inversion '(3 3 -4) chords :series t :root t :variant '?)
=> ((c5gs4f4 f5c5gs4 gs5f5c5 c6gs5f5)
    (c6eb5 c5eb4 eb4c4 eb5c5)
    (b4g4d4 g4d4b3 d4b3g3 b3g3d3 g3d3b2))




                                                                                  OPUSMODUS
