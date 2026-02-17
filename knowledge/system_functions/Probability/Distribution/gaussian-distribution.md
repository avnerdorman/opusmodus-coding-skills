Opusmodus                                                                     gaussian-distribution     1

gaussian-distribution mean stddev &key seed
[Function]

Arguments and Values:
mean                        a list representing the means of the Gaussian distribution.
stddev                      a list representing the standard deviations of the Gaussian distribution.
seed                        an optional keyword parameter specifying the seed for random
                            number generation.


Description:

The function returns a list of pairs (x, y), where x and y are random numbers generated from
a Gaussian distribution with the given means and standard deviations. The Gaussian
distribution, also known as the normal distribution or bell curve, is one of the most widely
used probability distributions in statistics. It is named after mathematician Carl Friedrich
Gauss.

(gaussian-distribution 2 5)
=> (2.033053949859013D0)


Examples:

Single number:

(setf mean 2)
(setf stddev 5)
(setf data (flatten (gen-loop 24 (gaussian-distribution mean stddev))))

             20.

             16.

             12.

              8.

              4.

              0.
                        4               8            12            16            20            24
             -4.

             -8.




List of numbers:
Opusmodus                                                                                    gaussian-distribution             2


(setf lmean (rndn 24 0.1 1.0))
(setf lstddev (rndn 24 0.1 1.0))
(setf data2 (gaussian-distribution lmean lstddev))


             3.0

             2.5

             2.0

             1.5

             1.0

             0.5

             0.0
                                   4             8                 12           16                20               24
        -0.5

         -1.0




Mapping result of bilateral exponential distribution to lengths and pitches:

(setf lengths1 (quantize data '(1 2 3 4 5) :scale 0.5))
(setf pitches1 (vector-to-pitch '(c2 c7) data))

(make-omn :length lengths1 :pitch pitches1)


                                                                                             3                 5
                       2                         3                              4




                   5
                           5
         5                             3    6             7         5       8                          9




                                                                                         5



        10                             11            12                             13



                                   5                           5




        14                                  15                16                17           18



                                                                        5
                               5                                                                           5
                                                                                                                   Opusmodus
Opusmodus                                            gaussian-distribution         3

(setf lengths2 (quantize data2 '(1 2 3 4 5) :scale 0.5))
(setf pitches2 (vector-to-pitch '(c2 c7) data2))

(make-omn :length lengths2 :pitch pitches2)


                                          5




                            5
                 5




                                                               5

                        5

                                                 5                 3
        2                                                  3




             5                                                         Opusmodus
