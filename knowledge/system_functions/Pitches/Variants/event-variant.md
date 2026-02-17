     Opusmodus                                                                                 event-variant         1

     event-variant variant sequence &key section exclude seed
     [Function]

     Arguments and Values:
     variant                     Speci es the transformation to be applied. Valid options include:
                                 'p (prime (original)), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                                 'a (ascending), 'd (descending), 'ad (ascending-descending),
                                 'da (descending-ascending), or '? (at random).

     sequence                    A list of pitch or omn-form sequence.

     section                     (integer or list of integers, optional): Speci es the sections of the sequence to
                                 be processed. If not provided, the function applies to the entire sequence.

     exclude                     (integer or list of integers, optional): Speci es the sections of the sequence that
                                 should be excluded from processing. If not speci ed, no sections are excluded.

     seed                        (optional): integer; sets a speci c seed for reproducible randomness in
                                 transformations. Default is NIL, which allows for natural randomness.


     Description:

     The EVENT-VARIANT function adjusts a sequence of pitch events according to the
     speci ed variant transformations. It generates a series of variant sequences and then
     selects pitches based on the ordered variant list. The output is a new sequence where each
     pitch is replaced according to the corresponding variant transformation.


     Examples:

     Basic sequence transformation:

     Sequence: (c4 d4 e4 f4)
     I:        (c4 bb3 gs3 g3)
     R:        (f4 e4 d4 c4)
     RI:       (f4 fs4 gs4 bb4)
     P:        (c4 d4 e4 f4)

     (event-variant '(i r ri p) '(c4 d4 e4 f4))
     => (c4 e4 gs4 f4)
fi
                            fi
                                                         fi
                                                                     fi
                                                                     fi
                                                                            fi
Opusmodus                                                                               event-variant         2

(setf pitches '((cs5 gs4 g4 d4 cs4) (f5 c5 b4 fs4 f4)
                (c4 b3 fs3 f3 c3) (eb5 bb4 a4 e4 eb4)))

(event-variant '(r ri i p i) pitches)
=> ((cs4 c4 g5 d4 cs6) (f4 e4 b5 fs4 f6)
    (c3 g2 fs4 f3 c5) (eb4 d4 a5 e4 eb6))

OMN:

(setf omn '((5q fs4 p - bb3 f3 e4) (-3q g4 c5) (s eb5 a5 mf cs6 gs6)
            (5q gs6 pp cs6 mf a5 eb5 -) (-s c5 g4 e4)))

                5

                            2                   3           4                       5



                                                                        5
                                    3
                                                                                                  Opusmodus




(event-variant '(ri i ad r d) omn)


            5

                        2                   3           4                       5



                                                                    5

                                3
                                                                                                  Opusmodus




Transforming an OMN sequence with multiple, nested variants:

(event-variant '((ri i) (? r d)) omn)




            5       2                   3           4                       5



                                                                5
                            3
                                                                                                  Opusmodus
