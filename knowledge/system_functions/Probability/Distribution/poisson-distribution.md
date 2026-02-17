Opusmodus                                                               poisson-distribution       1

poisson-distribution lambda-list &key seed
[Function]

Arguments and Values:
lambda-list            A list of lambda values representing the mean or average number of events
                       for each random number generation.
seed                   This is an integer that guarantees consistent results each time the code is
                       evaluated. By providing a speci c seed, you can ensure that the randomness in
                       your code is reproducible. The default value for seed is NIL, which means the
                       seed is not set, resulting in different outputs on each run due to natural
                       randomness.



Description:

The POISSON-DISTRIBUTION function generates a list of random numbers from a
Poisson distribution. Each random number is generated based on a corresponding lambda
value from the lambda-list. The lambda values represent the mean or average number of
events for each random number generation.


Examples:
(poisson-distribution '(0 1 2 3 4 5))
=> (0 2 0 2 4 6)

(poisson-distribution '(0 1 2 3 4 5) :seed 43)
=> (0 0 2 5 5 6)
                                              fi
