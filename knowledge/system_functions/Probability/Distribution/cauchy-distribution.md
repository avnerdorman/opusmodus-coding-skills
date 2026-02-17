Opusmodus                                                                       cauchy-distribution   1

cauchy-distribution x0 gamma &key seed
[Function]

Arguments and Values:
x0                          a list representing the location parameters of the Cauchy distribution.
gamma                       a list representing the scale parameters of the Cauchy distribution.
seed                        an optional keyword parameter specifying the seed for random
                            number generation.


Description:

The Cauchy distribution is a probability distribution that is characterised by its symmetric
bell-shaped curve. The function returns a list of values generated from the Cauchy
distribution using the given location parameters x0 and scale parameters gamma. It is also
known as the Cauchy-Lorentz distribution and is named after mathematicians Augustin
Cauchy and Hendrik Lorentz. Applications of the Cauchy distribution include modelling
extreme events, analysing data with outliers, and in physics, where it arises naturally in
certain physical phenomena, such as quantum mechanics and resonant systems.

(cauchy-distribution 2 5)
=> (1.2288708680854848D0)


Examples:

Single number:

(setf x0 2)
(setf gamma 5)
(setf
  data (flatten (gen-loop 24 (cauchy-distribution x0 gamma) :seed 563)))

             40.
             20.
              0.
         -20.           4              8             12            16           20            24
         -40.
         -60.
         -80.
        -100.
        -120.
        -140.
        -160.
        -180.
Opusmodus                                                                               cauchy-distribution         2

List of numbers:

(setf lx0 (rndn 24 0.1 1.0))
(setf lgamma (rndn 24 0.1 1.0))
(setf data2 (cauchy-distribution lx0 lgamma :seed 563))


              5.
              0.
                        4            8               12               16                20              24
             -5.
         -10.
         -15.
         -20.
         -25.
        -30.
         -35.
        -40.




Mapping result of bilateral exponential distribution to lengths and pitches:

(setf lengths1 (quantize data '(1 2 3 4 5) :scale 0.1))
(setf pitches1 (vector-to-pitch '(c2 c7) data))

(make-omn :length lengths1 :pitch pitches1)



                                             2                             3


                         5                           3        5                 5                   5




         4                   5                   6        7       8    9       10



                    5            3                                                  3           5

                                                                                                        Opusmodus
Opusmodus                                             cauchy-distribution   3


(setf lengths2 (quantize data2 '(1 2 3 4 5) :scale 0.1))
(setf pitches2 (vector-to-pitch '(c2 c7) data2))

(make-omn :length lengths2 :pitch pitches2)




                                         2            3



                 5      5     5      5        5            5
                                                                                Opusmod
