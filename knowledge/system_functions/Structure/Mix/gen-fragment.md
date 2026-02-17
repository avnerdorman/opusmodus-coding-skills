     Opusmodus                                                                                 gen-fragment   1

     gen-fragment size sequence &key variant flatten section exclude seed
     [Function]

     Arguments and Values:
     size                     an integer or list of integers (fragment size).
     sequence                 a sequence.
     type                     an integer: 1 or 2. The type 1 applies the variant to the original sequence.
                              The type 2 applies the variant after the fragmentation. The default is 1.
     variant                  'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                              'a (ascending), 'd (descending), 'ad (ascending-descending),
                              'da (descending-ascending), 'ro (random order) or '? (at random).
                              The default is 'p.
     flatten                  NIL or T ( atten fragment series) The default is NIL.
     section                  an integer or list of integers. Selected list or lists to process.
                              The default is NIL.
     exclude                  an integer or list of integers. Excluded list or lists from process.
                              The default is NIL.
     seed                     NIL or an integer. The default is NIL.


     Description:

     This function returns a fragment of a sequence from an existing list or lists. The fragment
     is de ned by the size value and the number of the size values within the list, de ne the
     numbers of the returned fragments.

     (gen-fragment 3 '(c5 b4 bb4 fs4 f4 e4))
     => (bb4 fs4 f4)

     (gen-fragment '(3 3) '(c5 b4 bb4 fs4 f4 e4))
     => ((c5 b4 bb4) (bb4 fs4 f4))

     (gen-fragment '(3 3) '(c5 b4 bb4 fs4 f4 e4) :flatten t)
     => (bb4 fs4 f4 b4 bb4 fs4)

     (gen-fragment '((4 4) (3 3))
                   '((1/8 1/8 1/4 -1/16 1/16 1/8 1/12 -1/12 1/12)
                     (1/16 1/16 -1/16 1/16 -1/8 1/8 1/8 1/8)))
     => ((-1/16 1/16 1/8 1/12 -1/12 1/12) (1/4 -1/16 1/16 1/8)
         (1/16 -1/8 1/8) (1/16 -1/8 1/8))

     The function has many applications, not least in the area of LIVE CODING. In non-realtime
     composition it is invaluable for exploring the potential of a motif or theme.
fi
                                 fl
                                                                                          fi
Opusmodus                                                                   gen-fragment     2

Examples:
(gen-fragment '((3 3 3 3 3) (4 3 4 3 4 3))
              '((c4 cs4 d4 fs4 g4 gs4) (c4 cs4 e4 f4 fs4 g4 bb4 b4))
              :variant '?
              :seed 74)


              2          3               4             5           6




  7               8              9                10                   11




                                                                                 Opusmodus




(gen-fragment '((3 3 3 3 3) (4 3 4 3 4 3))
              '((c4 cs4 d4 fs4 g4 gs4) (c4 cs4 e4 f4 fs4 g4 bb4 b4))
              :variant '?
              :type 2
              :seed 74)


                  2          3               4             5   6




  7               8                  9           10                    11




                                                                                 Opusmodus
Opusmodus                                                                                                         gen-fragment     3

OMN:

The following examples show how OMN list form can be fragmented.

(setf mat '(5q bb2 mf g3 c4 e3 a3 s eb5 a5 mf cs6 gs6
            5q d4 mp fs4 gs4 b4 p cs5 s f5 eb6 bb3 g3))

(gen-fragment (rnd-sample 24 '(2 3 4)) mat :variant '? :seed 54)


                                                                                                              5
                                                                2




                    5



                                                                                               5
  3         5                        4                      5                6




                                                        5
  7                     8                                                9




                                                                                           5




 10                                  11                                          12                     13




                        5                          5




                                               5
 14                             15                                                16               17




                5
                                          8


                            5                                                                                     5
 18                                                19                        20




 21                                       22                        23                                       24




                                                                                       5
                        5
                                                                                                                       Opusmodus
Opusmodus                                                                                                    gen-fragment           4

(setf p1 '(s a4 p e b5 s gs3 3h f3 3q e2 5h eb4 5q g5 fs2 f4)
      p2 '(s bb4 mp cs6 c5 b5 bb4 cs6 a3 gs2 3q a2 gs5 fs4))

(gen-fragment (list (rnd-sample 12 '(4 3)) (rnd-sample 12 '(4 3)))
              (list p1 p2) :variant '?)

                                                                3
                                                                                                                        5

            3   2                     3        3                                      4



                                                                                                        3
                                                                              5


                                                        5
                                                                                                                    8
  5                                                                  6



                        3                                                                                       3




                                                                                          8
                                                                                                                            3
  7                 3                                       8                                       9


                                                                                          3

                                           5



 10                               3                11                             3           12                    3




                                                                                                                                8
                                                                                                    3
 13                          14                     15                   16                             17


                3




 18                     19                                                                    20



                                                                          3




 21                                   22                            23                             24




                                                                                                                    Opusmodus
