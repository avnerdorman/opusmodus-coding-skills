     Opusmodus                                                                             beta-distribution   1

     beta-distribution alpha beta &key seed
     [Function]

     Arguments and Values:
     alpha                       a list representing the alpha (shape) parameters of the Beta distribution.
     beta                        a list representing the beta (shape) parameters of the Beta distribution.
     seed                        an optional keyword parameter specifying the seed for random
                                 number generation.


     Description:

     The function returns a list of values generated from the Beta distribution using the given
     alpha and beta parameters. The Beta distribution is a continuous probability distribution
     de ned on the interval [0, 1]. It is commonly used to model random variables that have
     values between zero and one, such as proportions, probabilities, or parameters that are
     constrained to a speci c range.

     (beta-distribution 2 5)
     => (0.46917835)

     Examples:

     Single values:

     (setf alpha 2)
     (setf beta 5)
     (setf data (flatten (gen-loop 24 (beta-distribution alpha beta))))



              0.50

              0.48

              0.46

              0.44

              0.42

              0.40

              0.38

              0.36
                             4               8            12            16            20            24
fi
                      fi
Opusmodus                                                           beta-distribution    2

List of numbers:

(setf alpha2 (rndn 24 0.1 1.0))
(setf beta2 (rndn 24 0.1 1.0))
(setf data2 (beta-distribution alpha2 beta2))


        0.48

        0.46

        0.44

        0.42

        0.40

        0.38

        0.36

        0.34
                        4          8           12         16   20            24




Mapping result of Beta distribution to lengths and pitches”


(setf lengths1 (quantize data '(1 2 3 4 5)))
(setf pitches1 (vector-to-pitch '(c2 c7) data))
(make-omn :length lengths1 :pitch pitches1)


                                           5                             3


                                                    2



                        5




        3



                                                                             Opusmodus
Opusmodus                                                  beta-distribution    3

(setf lengths2 (quantize data2 '(1 2 3 4 5)))
(setf pitches2 (vector-to-pitch '(c2 c7) data2))
(make-omn :length lengths2 :pitch pitches2)


                                         3




                                     2


                          5
                                                                5
                   5                               5
                                                       5




        3


                                                           5
                                     5                              Opusmodus
