Opusmodus                                                                               normal-prob   1

normal-prob numbers mean std-dev
[Function]

Arguments and Values:
numbers                  a list of numbers for which to calculate the probability.
mean                     a number. The mean of the normal distribution.
std-dev                  a number. The standard deviation of the normal distribution.


Description:

This function takes a list of numbers as input and returns a list of probabilities for each
number in the input list, assuming a normal distribution with a given mean and standard
deviation.

The NORMAL-PROB function takes three arguments: numbers, mean, and std-dev. The
numbers argument is a list of numbers for which we want to calculate the probability, while
the mean and std-dev arguments specify the mean and standard deviation of the
normal distribution, respectively. The function returns a list of probabilities for each
number in the input list.


Examples:
(normal-prob '(1 3 2 4 5) 2 1)
=> (0.2419707271675955D0 0.2419707271675955D0
    0.3989422804014327D0 0.053990965816900896D0
    0.004431848335480958D0)

(setf data (flatten (gen-loop 4 (rnd-row) :seed 63)))
=> (0 2 6 11 3 9 5 4 8 1 7 10 0 4 11 10 5 9 1 8 2 7 6 3
    0 6 11 2 9 4 3 7 5 1 10 8 0 11 10 4 9 2 8 3 7 6 1 5)

(vector-round 0 12 (normal-prob data 1 2))
=> (11 11 1 0 7 0 2 4 0 12 0 0 11 4 0 0 2 0 12 0 11 0 1 7
    11 1 0 11 0 4 7 0 2 12 0 0 11 0 0 4 0 11 0 7 0 1 12 2)
Opusmodus                                                                                                                  normal-prob                 2

(setf data (flatten
            (list
             (normal-prob (flatten (gen-loop 4 (rnd-row))) .3 1)
             (normal-prob (flatten (gen-loop 4 (rnd-row))) .3 2)
             (normal-prob (flatten (gen-loop 4 (rnd-row))) .3 3)
             (normal-prob (flatten (gen-loop 4 (rnd-row))) .3 2)
             (normal-prob (flatten (gen-loop 4 (rnd-row))) .3 4))))

 0.40

 0.35

 0.30

 0.25

 0.20

 0.15

 0.10

 0.05

 0.00
                        40                  80                   120                     160                   200                         240



(make-omn
 :pitch (vector-to-pitch '(c2 c6) data)
 :length (quantize data '(1 2 3 4 5)))


                5                                                                                          5
                                                                                         5
                        5                                            5                                                         5
                                5                            2




                                                 5

                    5
                                                     5                   5                             5
                                    5                                                5
  3                                                                              4                                     5




                                                                                                                                   5


                                        5                                    5
                            5                            5                                     5                   5                   5
            5
  5                                                              6




                                    5                        5                       5
                5                                                                                              5
  7                                                                                                8                               5




                                                                                                                                           Opusmodus
