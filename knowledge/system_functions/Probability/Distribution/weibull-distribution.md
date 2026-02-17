Opusmodus                                                                     weibull-distribution   1

weibull-distribution lambda k &key seed
[Function]

Arguments and Values:
lambda                     a list representing the scale parameters of the Weibull distribution.
k                          a list representing the shape parameters of the Weibull distribution.
seed                       an optional keyword parameter specifying the seed for random
                           number generation.


Description:

The Weibull distribution is a probability distribution that is commonly used to model the
failure times or lifetimes of various types of systems or phenomena. It was introduced by
Wallodi Weibull, a Swedish engineer and mathematician. The function returns a list of values
generated from the Weibull distribution using the given scale parameters lambda and shape
parameters k.

(weibull-distribution 2 5)
=> (1.9174644)


Examples:

Single number:

(setf lambda 2)
(setf k 5)
(setf data (flatten (gen-loop 24
                     (weibull-distribution lambda k) :seed 563)))


             2.0
             1.9
             1.8
             1.7
             1.6
             1.5
             1.4
             1.3
             1.2
             1.1
                       4              8             12            16           20            24
Opusmodus                                                                                 weibull-distribution     2

List of numbers:

(setf llambda (rndn 24 0.1 1.0))
(setf lk (rndn 24 0.1 1.0))
(setf data2 (weibull-distribution llambda lk :seed 563))


        0.90

        0.80

        0.70

        0.60

        0.50

        0.40

        0.30

        0.20

        0.10
                           4           8            12                   16               20           24




Mapping result of bilateral exponential distribution to lengths and pitches:

(setf lengths1 (quantize data '(1 2 3 4 5)))
(setf pitches1 (vector-to-pitch '(c2 c7) data))

(make-omn :length lengths1 :pitch pitches1)


                           3
                                                                              3
                                   2            3                                     4



                                                                                                   5


                                                                                  5



         5                             6                         7



               3               5                             5



                                                                          5                    5



         8                                               9



                               5            5


                                                                     5



        10


                       5
                                                                                                       Opusmodus
Opusmodus                                          weibull-distribution      3

(setf lengths2 (quantize data2 '(1 2 3 4 5)))
(setf pitches2 (vector-to-pitch '(c2 c7) data2))

(make-omn :length lengths2 :pitch pitches2)


                                                             5
                                   5
                                              5

            3
                                         2




                          5

                    5
                                                      3
        3


                                                                 Opusmodus
