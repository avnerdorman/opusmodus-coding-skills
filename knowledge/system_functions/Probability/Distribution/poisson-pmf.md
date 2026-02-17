Opusmodus                                                                               poisson-pmf      1

poisson-pmf k lambda
[Function]

Arguments and Values:
k                        (Integer or List of Integers): This is the number of events to compute
                         the probability for. The number of events you're interested in should be
                         a non-negative integer, or a list of non-negative integers.
lambda                   (Number): This is the average rate of occurrence for the event. It represents
                         the expected number of times an event happens within the interval.
                         It should be a positive number.



Description:

This function compute the Poisson probability mass function (PMF). The Poisson
distribution is a discrete probability distribution that expresses the probability of a given
number of events occurring in a xed interval of time or space, given a known average rate
of occurrence (lambda). It is named after French mathematician Siméon Denis Poisson. The
Poisson distribution can also be used for the number of events in other speci ed interval
types such as distance, area, or volume.


Examples:
(poisson-pmf '(0 1 2 3 4 5) .2)
=> (0.8187308 0.16374617 0.016374616 0.0010916411
    5.458205E-5 2.1832823E-6)

(poisson-pmf '(0 1 2 3 4 5) .6)
=> (0.5488116 0.329287 0.09878609 0.019757219
    0.002963583 3.5562998E-4)
                          fi
                                                                              fi
