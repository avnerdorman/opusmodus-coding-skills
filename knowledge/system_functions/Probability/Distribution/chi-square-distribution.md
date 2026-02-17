Opusmodus                                                              chi-square-distribution        1

chi-square-distribution k &key seed
[Function]

Arguments and Values:
k                         A single value or a list of values representing the degrees of freedom for
                          each chi-square distribution.
seed                      This is an integer that guarantees consistent results each time the code is
                          evaluated. By providing a speci c seed, you can ensure that the randomness in
                          your code is reproducible. The default value for seed is NIL, which means the
                          seed is not set, resulting in different outputs on each run due to natural
                          randomness.


Description:

The CHI-SQUARE-DISTRIBUTION function generates random values from the chi-square
distribution using the Marsaglia and Tsang algorithm. It returns a single random value if k is
a single value, or a list of random values if k is a list. The chi-square distribution is a
continuous probability distribution that arises in the context of statistical inference. It is the
distribution of the sum of squares of k independent standard normal random variables. For
each value k, the function generates a random value from the chi-square distribution using
the Marsaglia and Tsang algorithm. It combines the Box-Muller transformation with the
acceptance-rejection method to generate random variables.


Examples:
(chi-square-distribution 1.0)
=> 1.282297122445258D0

(chi-square-distribution '(0.0 1.0 2.0))
=> (-0.6666666865348816D0 0.0014269860591242033D0 3.824691159870055D0)
                                                 fi
