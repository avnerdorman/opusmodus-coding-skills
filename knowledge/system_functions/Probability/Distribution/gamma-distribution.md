Opusmodus                                                                     gamma-distribution       1

gamma-distribution shape scale &key seed
[Function]

Arguments and Values:
shape                      A single value or a list of values representing the shape parameter(s)
                           of the gamma distribution.
scale                      A single value or a list of values representing the scale parameter(s)
                           of the gamma distribution.
seed                       This is an integer that guarantees consistent results each time the code is
                           evaluated. By providing a speci c seed, you can ensure that the randomness in
                           your code is reproducible. The default value for seed is NIL, which means the
                           seed is not set, resulting in different outputs on each run due to natural
                           randomness.


Description:

The GAMMA-DISTRIBUTION function generates random values from the gamma
distribution using the shape and scale parameters. It returns a single random value if
shape and scale are single values, or a list of random values if either or both of shape
and scale are lists.


Examples:
(gamma-distribution 2 5)
=> 6.686864762949591D0

(gamma-distribution (rndn 24 0.1 1.0) (rndn 24 0.1 1.0))


             2.0
             1.8
             1.6
             1.4
             1.2
             1.0
             0.8
             0.6
             0.4
             0.2
             0.0
         -0.2          4              8                12       16           20           24
                                                  fi
