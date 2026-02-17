Opusmodus                                                               standard-deviation-series   1

standard-deviation-series data
[Function]

Arguments and Values:
data                      A list of numerical data points for which the standard deviation
                          is to be calculated.


Description:

This function calculates the standard deviation for each pair of consecutive elements in a
given list and returns a list of the calculated standard deviations.


Examples:
(standard-deviation-series '(1 5 3 4 2 1 3 2))
=> (2.0 1.0 0.5 1.0 0.5 1.0 0.5)

(setf tendency
  (gen-tendency 20 '(.1 .4 .2 .6 .45 .16 .75 .8 .5 .1) :variance 0.3))


         0.80

         0.70

         0.60

         0.50

         0.40

         0.30

         0.20

         0.10

         0.00
                   2      4        6       8      10       12      14      16      18        20
Opusmodus                                                standard-deviation-series       2

(setf std-dev (standard-deviation-series tendency))


       0.28

       0.24

       0.20

        0.16

        0.12

       0.08

       0.04

       0.00
               2       4   6       8       10       12     14       16       18




(setf lengths1 (quantize tendency '(1 2 3 4 5)))
(setf pitches1 (vector-to-pitch '(c3 c6) tendency))
(make-omn :length lengths1 :pitch pitches1)

                       5                                                 5
                                   5
                                       2                        3



                                                3
                           3
                                                           5                 Opusmodus




(setf lengths2 (quantize std-dev '(1 2 3 4 5)))
(setf pitches2 (vector-to-pitch '(c3 c6) std-dev))
(make-omn :length lengths2 :pitch pitches2)

                                                    5
                               5
                   5




                                                                                             Opusmodus
