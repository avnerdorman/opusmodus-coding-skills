Opusmodus                                                                                 pitch-variant         1

pitch-variant pitch &key variant transpose omit
                      section exclude seed omn

[Function]

Arguments and Values:
pitch                       A list of pitch or omn-form sequence.

variant                     Speci es the transformation to be applied. Valid options include:
                            'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                            'a (ascending), 'd (descending), 'ad (ascending-descending),
                            'da (descending-ascending), or '? (at random). The default is NIL (random).

transpose                   An integer or list of integers. The default is NIL.
omit                        A list of variants to omit. The default is NIL.

section                     (integer or list of integers, optional): Speci es the sections of the sequence to
                            be processed. If not provided, the function applies to the entire sequence.

exclude                     (integer or list of integers, optional): Speci es the sections of the sequence that
                            should be excluded from processing. If not speci ed, no sections are excluded.

seed                        (optional): integer; sets a speci c seed for reproducible randomness in
                            transformations. Default is NIL, which allows for natural randomness.
omn                         NIL or T. If true force OMN style output. The default is T.


Description:

This function can process a sequence of common variant forms on lists of pitches.


Examples:
(pitch-variant '(c4 d4 e4 f4) :variant 'r)
=> (f4 e4 d4 c4)

(pitch-variant '(c4 d4 e4 f4) :variant 'i)
=> (c4 bb3 gs3 g3)

(pitch-variant '(c4 d4 e4 f4) :variant 'ro)
=> (c4 f4 e4 d4)

(pitch-variant '((c4 d4 e4 f4) (d4 e4 f4 g4)) :variant '(r p))
=> ((f4 e4 d4 c4) (d4 e4 f4 g4))

(pitch-variant '((c4 d4 e4 f4) (d4 e4 f4 g4))
               :variant '(i r) :transpose '(12 3))
=> ((c5 bb4 gs4 g4) (bb4 gs4 g4 f4))
                       fi
                                                    fi
                                                                fi
                                                                fi
                                                                       fi
Opusmodus                                                                  pitch-variant      2

The variant processes included in this function are all standard forms used throughout most
composition practice. The function does not use any speculative or random-based processes.
All the function processes used can be found in OPUSMODUS as standalone functions.

(setf pitches (gen-repeat 4 '((c4 cs4 fs4 g4 c5))))

(sort-desc
 (pitch-retrograde
  (pitch-invert
   (pitch-transpose '(1 5 0 3) pitches)
   :section '(2))
  :section '(0 1))
 :section '(3))
=> ((cs5 gs4 g4 d4 cs4)
    (f5 c5 b4 fs4 f4)
    (c4 b3 fs3 f3 c3)
    (eb5 bb4 a4 e4 eb4))

(pitch-variant pitches :variant '(r r i d) :transpose '(1 5 0 3))
=> ((cs5 gs4 g4 d4 cs4) (f5 c5 b4 fs4 f4)
    (c4 b3 fs3 f3 c3) (eb5 bb4 a4 e4 eb4))

OMN:

(setf omn '((5q fs4 p - bb3 f3 e4)
            (-3q g4 c5)
            (s eb5 a5 mf cs6 gs6)
            (5q gs6 pp cs6 mf a5 eb5 -)
            (-s c5 g4 e4)))


                                5

                                            2              3




                                                    3




             4                                  5



                                5

                                                                       Opusmodus
Opusmodus                                             pitch-variant   3

(pitch-variant omn :variant '(ri i ad ? d))



                       5             3
                                2             3




            4                        5



                           5

                                                  Opusmodus
