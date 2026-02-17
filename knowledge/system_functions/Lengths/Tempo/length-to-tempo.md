Opusmodus                                                                          length-to-tempo       1

length-to-tempo master tempo sequence &key meter quantize
                            section exclude

[Function]

Arguments and Values:
master                    An integer representing the master tempo to which the sequence will be
                          adjusted.
tempo                     An integer or list of integers representing the original tempos of sections of
                          the sequence.
sequence                  A list of lengths or an OMN-form sequence to be adjusted to the master tempo.
meter                     A list representing the time signature or meter of the sequence.
quantize                  A list of integers used for quantizing the length values in the sequence.
                          Default is '(1 2 3 4 5 6 7 8).
section                   An integer or list of integers specifying the selected list or lists to process.
                          Default is NIL.
exclude                   An integer or list of integers specifying the list or lists to be excluded from
                          the process. Default is NIL.

Quantize Values:

1 = 1/4
2 = 1/8
3 = 1/12
4 = 1/16
5 = 1/20
7 = 1/28
8 = 1/32


Description:

Converts length values of a given sequence with a tempo value into one master tempo value
for the entire sequence, facilitating adjustments for consistent rhythmic interpretation across
varying tempos.


Examples:
(length-to-tempo 72 36 '(1/4))
Opusmodus                                                length-to-tempo       2

(length-to-tempo 72 36 '(1/4 1/8 1/8 1/8 3/8))




(length-to-tempo
 72 '(120 36) '((1/4 1/8 1/8 1/8 3/8) (1/4 1/8 1/8 1/8 3/8)))

                   7
                           3       2




                                                                            Opusmodus


(length-to-tempo
 72 '(120 36) '((1/4 1/8 1/8 1/8 3/8) (1/4 1/8 1/8 1/8 3/8))
 :quantize '(1 2 3 4 5))


                       5       5       2




                                                                                   Opusm


(length-to-tempo 72 '(36 96 72)
                 '((1/20 1/20 1/20 1/20 1/20)
                   (1/16 1/16 1/16 1/16 1/16 1/16 1/16 1/16)
                   (1/8 1/8 1/8 1/8)
                   (1/4 1/4 1/4 1/4 1/4 1/4 1/4 1/4))
                 :meter '(1 1 1))

             5     5   2                         3




     4




                                                                Opusmodus
Opusmodus                                                               length-to-tempo   3

OMN:

(setf omn '((5q fs4 p - bb3 f3 e4) (-3q g4 c5) (s eb5 a5 mf cs6 gs6)
            (5q gs6 pp cs6 mf a5 eb5 -) (-s c5 g4 e4)))

                        5

                                    2                       3




                                                3




        4                                   5



                            5

                                                                          Opusmodus




(length-to-tempo 72 36 omn :quantize '(1 2 3 5 8)))

                        5
                                                3
                                    2                       3




        4                                   5



                            5

                                                                          Opusmodus




(length-to-tempo 72 '(76 36 44 64 56) omn :quantize '(1 2 3 5 8))

                    5
                                        3
                                2                       3


                                                                5




        4                                           5




                                                                    3
                                                                          Opusmodus
