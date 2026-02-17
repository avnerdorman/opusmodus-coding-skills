Opusmodus                                                                                 rnd-rest     1

rnd-rest percent sequence &key section exclude prob seed omn
[Function]

Arguments and Values:
percent                   A oating-point number between 0.0 and 1.0, representing the target
                          percentage for the sum of the negative numbers relative to the sum of absolute
                          values of all numbers.
sequence                  A sequence (lengths or omn-form list).
section                   An integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   An integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
prob                      Optional parameter with a default value of 0.5. This is a oating-point
                          number ranging between 0.0 and 1.0, which affects the distribution
                          of the generated random number within the speci ed range. A lower value for
                          this parameter increases the likelihood of selecting a lower number within
                          the given range, while a higher value favours the selection of higher numbers.
seed                      This is an integer that guarantees consistent results each time the code is
                          evaluated. By providing a speci c seed, you can ensure that the randomness in
                          your code is reproducible. The default value for seed is NIL, which means the
                          seed is not set, resulting in different outputs on each run due to natural
                          randomnes.
omn                       NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

The function RND-REST convert a subset of the length notes in the list to length rests, such
that the sum of all length rests (including any existing ones) becomes equal to the given
percentage of the sum (span) of the absolute values of all lengths in the list.


Examples:
(setf lengths (gen-repeat 8 1/16))
=> (1/16 1/16 1/16 1/16 1/16 1/16 1/16 1/16)

(rnd-rest 0.3 lengths)
=> (1/16 1/16 1/16 1/16 1/16 -1/16 1/16 -1/16)

(rnd-rest 0.5 lengths)
=> (1/16 1/16 -1/16 1/16 -1/16 -1/16 1/16 -1/16)
                     fl
                                                  fi
                                                                   fi
                                                                            fl
Opusmodus                                                         rnd-rest         2

(rnd-rest '(0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9)
          (gen-repeat 9 (list lengths))
          :seed 76)

                     2             3            4             5




    6                    7              8              9



                                                                       Opusmodus




(setf percent (vector-round 0.2 0.8 (gen-sine 16 1 0.8)))
=> (0.5 0.61480505 0.71213204 0.77716387 0.8 0.77716387 0.71213204
    0.614805 0.5 0.38519496 0.28786793 0.2228361 0.2 0.22283617
    0.28786805 0.38519496)

(setf seq '((1/10 1/10 1/10 1/10 1/10) (1/6 1/6 1/6)
            (1/16 1/16 1/16 1/16 1/16 1/16 1/16 1/16)
            (1/16 1/16 1/16 1/16) (1/20 1/20 1/20 1/20 1/20)
            (1/6 1/6 1/6) (1/10 1/10 1/10 1/10 1/10)
            (1/10 1/10 1/10 1/10 1/10) (1/6 1/6 1/6) (1/6 1/6 1/6)
            (1/10 1/10 1/10 1/10 1/10) (1/16 1/16 1/16 1/16)
            (1/16 1/16 1/16 1/16) (1/6 1/6 1/6) (1/6 1/6 1/6)
            (1/10 1/10 1/10 1/10 1/10) (1/10 1/10 1/10 1/10 1/10)))

(rnd-rest percent seq :omn t :seed 32)
=> ((5h - = = -) (3h - =) (s - - - = - = -) (-s - = -)
    (-5q - - - =) (-3h = -) (-5h = - - =) (-5h = = - -)
    (3h - =) (-3h = =) (-5h = = = =) (s = = =) (s = = =)
    (3h = =) (3h = =) (5h = = = -) (5h = = - -))

(setf omn1 '((q c5gs4f4 e f5c5gs4 e gs5f5c5 s c6gs5f5)
             (e c6eb5 c5eb4 e eb4c4 eb5c5)
             (q b4g4d4 e g4d4b3 s d4b3g3 b3g3d3 q g3d3b2)))


                               2            3




(rnd-rest 0.5 omn1 :seed 11)

                               2            3




                                                                                       O
Opusmodus                                                         rnd-rest         3

(setf omn2 '((e cs4 mf cs4 cs4 d4)
             (s d4 mf cs4 ds4 d4 d4 e4 d4 d4)
             (e f4 mf ds4 d4 fs4)
             (e ds4 mf d4 fs4 ds4)
             (e d4 mf s g4 e ds4 s d4 e g4)
             (s ds4 mf d4 g4 ds4 d4 g4 ds4 d4)
             (e g4 mf s ds4 d4 e g4 s ds4 d4)
             (q g4 mf ds4)))

                     2                     3            4




    5                    6                     7              8




                                                                       Opusmodus




(rnd-rest '(0.0 0.2 0.3 0.4 0.5 0.7 0.9 1.0) omn2 :seed 34)

                     2                     3            4




    5                        6                     7              8



                                                                       Opusmodus
