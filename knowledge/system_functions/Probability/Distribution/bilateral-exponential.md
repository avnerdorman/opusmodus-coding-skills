Opusmodus                                                                       bilateral-exponential         1

bilateral-exponential a b &key seed
[Function]

Arguments and Values:
a                           a list representing the lower limits of the bilateral exponential distribution.
b                           a list representing the upper limits of the bilateral exponential distribution.
seed                        an optional keyword parameter specifying the seed for random
                            number generation.


Description:

The bilateral exponential distribution is a probability distribution that models random
variables with values in a symmetric interval around zero. It is often used to describe
quantities that exhibit both positive and negative values, such as the differences between two
related measurements or errors in scienti c experiments. The function returns a list of values
generated from the bilateral exponential distribution using the given lower limits a and upper
limits b.

(bilateral-exponential 2 5)
=> (1.5117064)


Examples:

Single number:

(setf a 2)
(setf b 5)
(setf data (flatten (gen-loop 24 (bilateral-exponential a b))))


             20.

             16.

             12.

              8.

              4.

              0.
                        4                  8          12            16            20            24
             -4.

             -8.
                                      fi
Opusmodus                                                                                                             bilateral-exponential                       2

List of numbers:

(setf la (rndn 24 0.1 1.0))
(setf lb (rndn 24 0.1 1.0))
(setf data2 (bilateral-exponential la lb))


             2.0

             1.6

             1.2

             0.8

             0.4

             0.0
                                4                      8                       12                     16                       20                     24
        -0.4

        -0.8




Mapping result of bilateral exponential distribution to lengths and pitches:

(setf lengths1 (quantize data '(1 2 3 4 5)))
(setf pitches1 (vector-to-pitch '(c2 c7) data))
(make-omn :length lengths1 :pitch pitches1)


                            2                 5                            3                 4                   5                       5




                        5
         6                           7                     8           5            9                 10         11                 12       13




                                                                                                                                    5



                   5
        14                               15                    5                16                                        17



                                                                                                       5


                                                                                                                                                  3
        18                      19                20                                    3        21         22        5




                                                                   5
        23             24                              25                               26                 27                                28



                                          5                                                                                              5
                                                                                                                                                      Opusmodus
Opusmodus                                                     bilateral-exponential    3

(setf lengths2 (quantize data2 '(1 2 3 4 5)))
(setf pitches2 (vector-to-pitch '(c2 c7) data2))
(make-omn :length lengths2 :pitch pitches2)


                                                  5




                                              2


            5                                             3       3


                    5     5


                                                                      5


        3                         4


                                                  3       5
                3
                              5
                                          3

                    5



        5




                                      5               5                    Opusmodus
