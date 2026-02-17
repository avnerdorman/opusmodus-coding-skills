Opusmodus                                                                               rnd-melodize      1

rnd-melodize percentage sequence &key rnd-order section exclude
                           prob seed

[Function]

Arguments and Values:
percentage                   A oating-point number between 0.0 and 1.0, representing the target
                             percentage for the sum of the negative numbers relative to the sum of absolute
                             values of all numbers.
sequence                     A sequence (pitches and chords).
rnd-order                    Boolean. When set to true, the pitch order of the chord will be randomized
                             before the melodization process begins.
section                      An integer or list of integers. Selected list or lists to process.
                             The default is NIL.
exclude                      An integer or list of integers. Excluded list or lists from process.
                             The default is NIL.
prob                         Optional parameter with a default value of 0.5. This is a oating-point
                             number ranging between 0.0 and 1.0, which affects the distribution
                             of the generated random number within the speci ed range. A lower value for
                             this parameter increases the likelihood of selecting a lower number within
                             the given range, while a higher value favours the selection of higher numbers.
seed                         This is an integer that guarantees consistent results each time the code is
                             evaluated. By providing a speci c seed, you can ensure that the randomness in
                             your code is reproducible. The default value for seed is NIL, which means the
                             seed is not set, resulting in different outputs on each run due to natural
                             randomnes.


Description:

The RND-MELODIZE function accepts a sequence of pitches and chords, melodizing
them according to a speci ed percentage. The positions of the melodized chords and
pitches remain unchanged. The function also supports optional customisation through
keyword arguments.

Examples:
(setf chords '(g4a4cs5fs5 c4eb4g4b4 a4b4eb5gs5 fs4a4cs5f5 a4b4eb5gs5))

(rnd-melodize 0.2 chords)
=> (g4a4cs5fs5 c4 eb4 g4 b4 a4b4eb5gs5 fs4a4cs5f5 a4b4eb5gs5)

(rnd-melodize 0.4 chords)
=> (g4a4cs5fs5 c4 eb4 g4 b4 a4b4eb5gs5 fs4a4cs5f5 a4 b4 eb5 gs5)

(rnd-melodize 0.6 chords :seed 45)
=> (g4 a4 cs5 fs5 c4eb4g4b4 a4 b4 eb5 gs5 fs4a4cs5f5 a4 b4 eb5 gs5)
                 fi
                      fl
                                                     fi
                                                                      fi
                                                                               fl
Opusmodus                                                                            rnd-melodize          2

(rnd-melodize 0.6 chords :seed 45 :rnd-order t)
=> (g4 cs5 a4 fs5 c4eb4g4b4 gs5 eb5 b4 a4 fs4a4cs5f5 gs5 eb5 a4 b4)

(setf chopin '(fs3e4 g3b3e4 fs3a3e4 fs3a3eb4 f3a3eb4 f3a3d4 f3gs3d4
               e3gs3d4 e3g3d4 e3g3cs4 e3g3c4 e3fs3c4 e3fs3c4 eb3fs3c4))

                             2                           3               4




                                                                                                               Opusmo




(rnd-melodize 0.5 chopin :seed 21)
                                     2                               3




   4                     5                           6                           7



                                                                                               Opusmodus




(rnd-melodize 0.5 chopin :seed 21 :rnd-order t)
                                 2                                   3




   4                 5                           6                           7



                                                                                               Opusmodus




(setf seq1 '((c5gs4f4 f5c5gs4 gs5f5c5 c6gs5f5)
             (c6eb5 c5eb4 eb4c4 eb5c5)
             (b4g4d4 g4d4b3 d4b3g3 b3g3d3 g3d3b2)))

                                         2                   3




(rnd-melodize '(0.8 0.4 0.0) seq1 :seed 46)

                                             2                   3
Opusmodus                                                          rnd-melodize         3

(rnd-melodize '(0.8 0.4 0.0) seq1 :seed 46 :rnd-order t)

                                       2                       3




(setf percent (vector-round 0.2 0.8 (gen-sine 6 1 0.8)))
=> (0.5 0.8 0.79999996 0.5 0.2 0.2)

(setf seq2 (gen-chord3 '((cs4 g4 a5 gs5 e4 b3) (c4 gs3 a4 eb5 d5)
                         (b5 b5 gs5 g5 f5 f5) (b4 fs4 bb5 eb4 d5)
                         (cs5 c6 c6 gs4 d4 a4) (e5 g3 a5 a5 d4))
                       '((6 8 11) (3 5 13) (2 7 11)))


                                               2




  3                                        4




  5                                                    6




                                                                            Opusmodus




(rnd-melodize percent seq2 :seed 23)




  2




  3                                                        4




  5                                                6




                                                                            Opusmodus
Opusmodus                                           rnd-melodize         4

(rnd-melodize percent seq2 :seed 23 :rnd-order t)




  2




  3




  4




  5                                    6




                                                             Opusmodus
