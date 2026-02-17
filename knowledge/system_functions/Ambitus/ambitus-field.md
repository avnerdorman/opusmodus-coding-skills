Opusmodus                                                                           ambitus-field   1

ambitus-field range sequence &key section exclude omn
[Function]

Arguments and Values:
range                        an integer (low high), a pitch symbol (low high) or instrument-name.
sequence                     a list or lists of pitches or omn sequence.
section                      an integer or list of integers. Selected list or lists to process.
                             The default is NIL.
exclude                      an integer or list of integers. Excluded list or lists from process.
                             The default is NIL.
omn                          NIL or T. If true force OMN style output. The default is NIL.


Description:

The AMBITUS-FIELD function can be used to compress or expand the eld of a given
series of pitches to a speci c range (ambitus).

(ambitus-field '(0 24) '(c4 d4 e4 f4 g4 a4 b4))
=> (c4 e4 a4 b4 eb5 gs5 c6)

(ambitus-field 'violin '(c4 d4 e4 f4 g4 a4 b4))
=> (g3 e4 c5 f5 d6 bb6 g7)


Examples:
(setf omn
      '((h e4f5 p c5a4) (h b3d3 gs4eb2fs3) (h bb2g5cs5 gs4d4eb2)
        (w bb2 mp) (h g3f4cs5 p c5) (h fs5a5b3 e4b3) (h bb2)
        (w e2eb4) (h c5cs6 a5) (h f4g3 gs4d3) (h fs5 bb2fs5g3)
        (h d3e5eb4 gs4) (h a2c6 f2) (h b0 cs6c5) (h gs4d3)))

                   2              3                 4         5       6            7




  8            9            10        11       12        13          14            15




                                                                          8
                                                                                        Opusmodus
                       fi
                                                                              fi
Opusmodus                                                                                    ambitus-field     2

(ambitus-field '(-6 12) omn)
                2                         3   4                  5       6                     7




    8                   9                          10                             11




    12                          13                          14                          15




                                                                                                   Opusmodus




(ambitus-field '(-6 0) omn)
                    2                     3             4            5       6                 7




    8                       9                 10                                 11




    12                               13                     14                         15




                                                                                                   Opusmodus
     Opusmodus                                                                                     ambitus-field        3


     (ambitus-field '(-24 36) omn)

                                         8
                            2        3                     4         5       6                 7




                                                  8                      8
         8          9           10           11       12            13                14
                                                                                           8            15




                                                                                                            Opusmodus



     With eld series:

     (ambitus-field '((-5 16) (-4 17) (-3 18) (-1 19)
                      (1 22) (6 26) (12 32) (12 32)
                      (12 32) (6 26) (1 22) (-1 19)) omn)

                            2            3             4        5            6                     7




         8              9       10            11       12      13                14                    15




                                                                                                            Opusmodus
fi
