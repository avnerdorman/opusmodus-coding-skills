     Opusmodus                                                                            ambitus      1

     ambitus range sequence &key type section exclude omn
     [Function]

     Arguments and Values:
     range                   an integer list (low high), a pitch list (low high) or instrument-name.
     sequence                a list or lists of pitches or omn sequence.
     type                    :transpose, :invert or :flat-invert.
                             The default is :transpose.
     section                 an integer or list of integers. Selected list or lists to process.
                             The default is NIL.
     exclude                 an integer or list of integers. Excluded list or lists from process.
                             The default is NIL.
     omn                     NIL or T. If true force OMN style output. The default is NIL.


     Description:

     The AMBITUS function can be used to constrain the range of a given series of pitches to a
     speci c range (ambitus). By default a value falling outside the range is transposed up
     or down an octave. Values falling outside the range can also be inverted.


     Examples:
     (ambitus '(g3 g4) '(c4 d4 e4 f4 g4 a4 b4))
     => (c4 d4 e4 f4 g4 a3 b3)

     (ambitus '(g3 g4) '(c4 d4 e4 f4 g4 a4 b4) :type :invert)
     => (c4 d4 e4 f4 g4 f4 eb4)

     (ambitus 'violin '((c4 cs4 d5 e3 fs3) (cs4 c3 d5 e5 fs3)) :type :invert)
     => ((c4 cs4 d5 c7 bb6) (cs4 d5 e7 fs7 gs5))

     (ambitus 'violin '((c4 cs4 d5 e3 fs3) (cs4 c3 d5 e5 fs3))
              :type :flat-invert)
     => ((c4 cs4 d5 c7 bb6) (eb6 e7 d5 c5 bb6))

     Notice the marked difference between :flat-invert and :invert. It is as
     though :flat-invert attens the two lists into one, rst and then proceeds with the
     inversion.
fi
                        fl
                                                      fi
Opusmodus                                                                                                                               ambitus   2

(setf omn
      '((h e4f5 p c5a4) (h b3d3 gs4eb2fs3) (h bb2g5cs5 gs4d4eb2)
        (w bb2 mp) (h g3f4cs5 p c5) (h fs5a5b3 e4b3) (h bb2)
        (w e2eb4) (h c5cs6 a5) (h f4g3 gs4d3) (h fs5 bb2fs5g3)
        (h d3e5eb4 gs4) (h a2c6 f2) (h b0 cs6c5) (h gs4d3)))


                       2                      3                           4            5                 6                      7




    8              9            10                11                 12           13                    14                  15




                                                                                                             8
                                                                                                                                    Opusmodus



(ambitus '(-6 12) omn)
              2                      3                          4             5                 6                 7                 8




    9         10                         11                12                     13                    14                 15




                                                                                                                                    Opusmodus




(ambitus '(-6 0) omn)
                                2                                3                                  4             5




    6                       7                          8                      9                              10




    11                     12                                   13                         14                         15




                                                                                                                                    Opusmodus
Opusmodus                                                                                              ambitus   3

(ambitus '(-24 36) omn)

                       2                 3                  4             5            6         7




     8             9           10            11        12            13            14           15




                                                                                                     Opusmodus



Example how to generate series of ambitus.

(setf range
      (gen-ambitus-series
       '(-30 42)
       (vector-smooth 0.2 (gen-noise 15 :seed 23))
       (vector-smooth 0.2 (gen-noise 15 :seed 24))))
=> ((8 27) (8 27) (-3 13) (-11 5) (17 42) (14 24)
    (25 42) (-7 24) (-30 0) (-30 -15) (-11 -5)
    (16 26) (21 28) (3 39) (-16 29))

(ambitus range omn)


                   2                3                  4         5                 6            7




     8                     9        10            11            12            13           14   15




                                                                                                     Opusmodus




(setf omn2
        '((q c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4)
          (q c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4)
          (q c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4)
          (q c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4)))
Opusmodus                                                                        ambitus   4

(ambitus '((g3 bb4) (gs5 e7) (g3 f4)) omn2)
=> ((q c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b3)
    (q c6 cs6 d6 eb6 e6 f6 fs6 g6 gs5 a5 bb5 b5)
    (q c4 cs4 d4 eb4 e4 f4 c4 g3 gs3 a3 bb3 b3)
    (q c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b3))

In the example above there are four lists but only three ambitus ranges. This means that at
list four the ambitus list ranges loop back. Thus list four takes the ambitus values '(g3
bb4).

(setf pitch-lists
      (gen-divide 16
       (vector-to-pitch '(c2 c6)
        (vector-smooth 0.32 (gen-noise 128 :seed 34)))))

=> ((bb5 bb5 cs5 d4 fs3 d4 g3 b4 eb4 d4 cs5 eb5 g5 c5 bb4 a5)
    (c6 c6 fs4 f3 eb3 gs3 d3 eb4 fs3 g4 a4 g3 b3 a4 g5 eb4)
    (g4 fs3 cs4 fs4 g3 b2 gs2 d2 b3 bb3 c3 f2 g2 d4 gs3 cs3)
    (cs4 g4 gs3 b2 e2 cs4 gs3 eb4 eb3 f4 cs5 bb4 fs3 a4 g4 fs4)
    (d3 gs2 c2 f3 gs4 fs4 cs4 e3 f3 a4 b3 b2 c4 c5 bb4 e4)
    (b2 f3 f4 g3 gs4 c5 cs5 cs4 gs4 d3 bb2 fs3 gs4 c5 fs3 b2)
    (d3 gs3 bb4 e5 e4 eb3 g3 b2 f2 gs2 bb2 fs2 g2 f3 eb3 g2)
    (d3 fs3 gs4 d4 eb4 eb3 a3 g2 a3 g3 cs4 b2 gs3 g3 d3 d4))

Generate a crescendo-decrescendo of ambitus:

(setf low
      (gen-palindrome
       (sort-asc
        (rnd-sample
          (length pitch-lists)
         (gen-integer -5 12)
         :seed 7732))))
=> (-5 -4 -3 -1 1 6 12 12 12 6 1 -1 -3 -4 -5)

(setf high
      (gen-palindrome
       (sort-asc
        (rnd-sample
         (length pitch-lists)
         (gen-integer 16 32)
         :seed 7732))))
=> (16 17 18 19 22 26 32 32 32 26 22 19 18 17 16)

(setf ambitus (gen-combine low high))
=> ((-5 16) (-4 17) (-3 18) (-1 19) (1 22) (6 26)
    (12 32) (12 32) (12 32) (6 26) (1 22) (-1 19)
    (-3 18) (-4 17) (-5 16))
Opusmodus                                                         ambitus   5

Apply the ambitus series:

(ambitus ambitus pitch-lists)
=> ((bb4 bb4 cs5 d4 fs4 d4 g3 b4 eb4 d4 cs5 eb5 g4 c5 bb4 a4)
    (c5 c5 fs4 f4 eb4 gs3 d4 eb4 fs4 g4 a4 g4 b3 a4 g4 eb4)
    (g4 fs4 cs4 fs4 g4 b3 gs4 d4 b3 bb3 c4 f4 g4 d4 gs4 cs4)
    (cs4 g4 gs4 b3 e4 cs4 gs4 eb4 eb4 f4 cs5 bb4 fs4 a4 g4 fs4)
    (d4 gs4 c5 f4 gs4 fs4 cs4 e4 f4 a4 b4 b4 c5 c5 bb4 e4)
    (b4 f5 f5 g4 gs4 c5 cs5 cs5 gs4 d5 bb4 fs4 gs4 c5 fs4 b4)
    (d5 gs5 bb5 e5 e5 eb5 g5 b5 f5 gs5 bb5 fs5 g5 f5 eb5 g5)
    (d5 fs5 gs5 d5 eb5 eb5 a5 g5 a5 g5 cs5 b5 gs5 g5 d5 d5))
