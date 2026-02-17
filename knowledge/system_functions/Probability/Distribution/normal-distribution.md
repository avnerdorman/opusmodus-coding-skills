Opusmodus                                                                  normal-distribution       1

normal-distribution mu sigma &key seed
[Function]

Arguments and Values:
mu                       A single value or a list of values representing the mean(s)
                         of the normal distribution.
sigma                    A single value or a list of values representing the standard deviation(s)
                         of the normal distribution.
seed                     This is an integer that guarantees consistent results each time the code is
                         evaluated. By providing a speci c seed, you can ensure that the randomness in
                         your code is reproducible. The default value for seed is NIL, which means the
                         seed is not set, resulting in different outputs on each run due to natural
                         randomness.


Description:

The NORMAL-DISTRIBUTION function generates random values from the normal
distribution using the Box-Muller transform. It returns a single random value if both mu and
sigma are single values, or a list of random values if either or both mu and sigma are lists.
If either mu or sigma is a list, the function generates random values with corresponding
means and standard deviations from the lists. This function uses the Box-Muller transform
internally to generate normally distributed random values. The Box-Muller transform takes
two uniform random numbers in the range (0,1) and produces two independent random
numbers with a standard normal distribution (mean 0, standard deviation 1).


Examples:
(normal-distribution 0.0 1.0)
=> 0.3626792862235642D0

(normal-distribution '(0.0 1.0 2.0) '(1.0 2.0 3.0))
=> (0.7279112572932373D0 -2.0022594781535293D0 2.84843670642028D0)
                                                fi
