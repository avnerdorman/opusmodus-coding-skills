Opusmodus                                                             rnd-envelope-tendency        1

rnd-envelope-tendency lower-envelope upper-envelope
                                   &key smooth prob seed

[Function]

Arguments and Values:
lower-envelope        A list representing the lower envelope. This should be a list of alternating
                      x and y values, where the y-values specify the lower limit at different
                      x-values.
upper-envelope        A list representing the upper envelope. This should be a list of alternating
                      x and y values, where the y-values specify the upper limit at different
                      x-values.
smooth                An optional keyword argument. The smoothing factor between 0.0 and 1.0
                      to be used when smoothing the result. If not provided, no smoothing will be
                      applied.
prob                  Optional parameter with a default value of 0.5. This is a oating-point
                      number ranging between 0.0 and 1.0, which affects the distribution
                      of the generated random number within the speci ed range. A lower value for
                      this parameter increases the likelihood of selecting a lower number within
                      the given range, while a higher value favours the selection of higher numbers.
seed                  This is an integer that guarantees consistent results each time the code is
                      evaluated. By providing a speci c seed, you can ensure that the randomness in
                      your code is reproducible. The default value for seed is NIL, which means the
                      seed is not set, resulting in different outputs on each run due to natural
                      randomness.


Description:

The RND-ENVELOPE-TENDENCY function generates a new time series by creating random
values that fall within the given envelope-lower and envelope-upper. It uses the
RNDN function to generate random numbers within the speci ed range. If the smooth
parameter is provided, the resulting data series will be smoothed using the
VECTOR-SMOOTH function.
                                              fi
                                                       fi
                                                               fi
                                                                        fl
Opusmodus                                                        rnd-envelope-tendency   2

Examples:

Envelops:

(setf l-limit (envelope-samples '(0 0 1 -1 2 -1 3 -2 4 3 5 -1 6 0) 128))
(setf u-limit (envelope-samples '(0 1 1 4 2 2 3 4 6 4) 128))

(xy-plot (list l-limit u-limit) :join-points t)


        4.0

        3.0

        2.0

            1.0

        0.0
                   1.0         2.0        3.0        4.0          5.0        6.0
        -1.0

        -2.0




Random numbers in the envelopes range:

(list-plot (rnd-envelope-tendency l-limit u-limit :seed 56)
           :zero-based t :point-radius 2 :join-points t)


        4.0

        3.0

        2.0

            1.0

        0.0
                  20      40         60         80         100      120      140
        -1.0

        -2.0
Opusmodus                                            rnd-envelope-tendency   3

(vector-to-pitch
 '(c2 c6)
 (rnd-envelope-tendency l-limit u-limit :seed 56))


            c6

            fs5

             c5

            fs4

            c4

            fs3

            c3

            fs2

             c2
                  20    40      60      80     100      120      140




With smooth option:

(list-plot (rnd-envelope-tendency l-limit u-limit :smooth 0.3 :seed 56)
           :zero-based t :point-radius 2 :join-points t)


        3.5

        3.0

        2.5

        2.0

            1.5

            1.0

        0.5

        0.0
                  20    40      60      80     100      120      140
        -0.5
Opusmodus                                            rnd-envelope-tendency   4


(vector-to-pitch
 '(c2 c6)
 (rnd-envelope-tendency l-limit u-limit :smooth 0.3 :seed 56))


            c6

            fs5

             c5

            fs4

            c4

            fs3

            c3

            fs2

             c2
                  20    40      60      80     100      120      140




(list-plot (rnd-envelope-tendency l-limit u-limit :smooth 0.1 :seed 56)
           :zero-based t :point-radius 2 :join-points t)


        3.2

        2.8

        2.4

        2.0

            1.6

            1.2

        0.8

        0.4

        0.0
                  20    40      60      80     100      120      140
