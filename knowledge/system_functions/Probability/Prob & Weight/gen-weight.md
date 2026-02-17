Opusmodus                                                                           gen-weight    1

gen-weight count weigh &key seed
[Function]

Arguments and Values:
count                      an integer.
weight                     a sequence of lists of paired values(<element><weight-number>).
seed                       an integer - ensure the same result each time the code is evaluated.
                           The default is NIL.


Description:

GEN-WEIGHT can be used to generate lists based on a series of probabilistic weightings.

(gen-weight 10 '((ff 1) (mp 4)) :seed 54)
=> (mp mp ff mp ff mp ff mp mp mp)

In the example above, the velocity ff has a weighting of 1, and mp has a weighting of 4, so
we would expect mp to be around four times as prevalent in the output.

Example using variables:

(setf
 a '(3q = =)
 b '(e =)
 c '(e = - =)
 d '(e = = =)
 e '(e = = -)
 )

(gen-weight 24 (list
                (list a 7)
                (list b 4)
                (list c 6)
                (list d 7)
                (list e 3)))
=> ((3q = =) (e =) (e = = =) (3q = =) (e =) (e = = =) (3q = =)
    (e = - =) (e = = -) (3q = =) (e = = -) (e = - =) (3q = =)
    (e = = -) (e =) (3q = =) (e = - =) (e =) (3q = =) (e = - =)
    (3q = =) (3q = =) (3q = =) (e =))
Opusmodus                                                                 gen-weight    2




                 3                              3                           3




     8                                  3                                   3




    14                                          3




    19       3                              3          3          3




                                                                          Opusmodus




Examples:
(setf chords (gen-weight 10 '((c4cs4 3) (fs4f4 4)) :seed 85))
=> (c4cs4 fs4f4 c4cs4 fs4f4 fs4f4 fs4f4 fs4f4 fs4f4 fs4f4 fs4f4)

(gen-combine (gen-repeat 10 '(c2)) chords)
=> ((c2 c4cs4) (c2 fs4f4) (c2 c4cs4) (c2 fs4f4) (c2 fs4f4)
    (c2 fs4f4) (c2 fs4f4) (c2 fs4f4) (c2 fs4f4) (c2 fs4f4))

In this example from 'Study No.1' by Janusz Podrazik notice how GEN-WEIGHT is used to
apply probabilistic weighting to arguments inside a function.

(setf
 l1 (flatten
       (gen-length-cartesian
        1 (rnd-sample 50 '(1 2 3 4 5))
        (gen-weight 50 '((m 3) (d 2)))
        (gen-weight 50 '((n 3) (? 2)))
        (rnd-sample 50 '(2 4)) '(1 2 3)
        (rnd-sample 50 '(5 7 3 13 12 11)) '(1 2 3 4 5 8))))
Opusmodus                                                                                                                        gen-weight   3

                                 3                                                                       3




                                                                 3                   5
            4




                                                                                                 3
            6                5




                         5           3                   5                                                       5
            7




                                                                                     5
            9




            11                           3           5                   3                                             3




                                                 3                                   3
            13                                                       5




                                                     3
            15




                                                                                             3
            18




                 3                                           3                                                         3
            21                                                                                           3




            23                                                                                   3




            26                               3




                     3               5
            30




            32                               3                               5   5       5           5       3             5




            36                                                                                   3                     3




            38



                                                                                                                     Opusmodus
Opusmodus                                                                gen-weight      4

(setf mat (pitch-list-plot
           (gen-weight 100 '((c4 5) (d4 1) (e4 3) (f4 2) (g4 3))
            :seed 45)
           :style :axis :point-radius 2 :join-points nil))


          c5c5




          fs4fs4




          c4c4


                   10
                    10   20
                          20   30
                                30   40
                                      40   50
                                            50   60
                                                  60   70
                                                        70   80
                                                              80       90
                                                                        90       100
                                                                                   100




Example with lists:

(gen-weight 10 '(((5e = = = =) 4) ((h) 2)
                 ((e = s = = =) 1) ((q - q - e =) 2)))

                     5          5                                        5




                                                                   5
     5




                                                                             5
     7




     10



                                                                             Opusmodus
