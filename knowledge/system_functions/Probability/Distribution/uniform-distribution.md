Opusmodus                                                                  uniform-distribution       1

uniform-distribution a b &key seed
[Function]

Arguments and Values:
a                         A single value or a list of values representing the lower bound(s)
                          of the uniform distribution.
b                         A single value or a list of values representing the upper bound(s)
                          of the uniform distribution.
seed                      This is an integer that guarantees consistent results each time the code is
                          evaluated. By providing a speci c seed, you can ensure that the randomness in
                          your code is reproducible. The default value for seed is NIL, which means the
                          seed is not set, resulting in different outputs on each run due to natural
                          randomness.


Description:

The UNIFORM-DISTRIBUTION function generates random values from a uniform
distribution between the lower and upper bounds provided. It returns a single random value if
both a and b are single values, or a list of random values if either or both a and b are lists. If
either a or b is a list, the function generates random values with corresponding lower and
upper bounds from the lists. The function uses the formula a + (random 1.0) * (b
- a) to generate random values within the speci ed range.


Examples:
(uniform-distribution 2 5)
=> 2.769073

(uniform-distribution '(1 2 3) '(4 5 6))
=> (1.3143191 3.251449 3.669941)
                                             fi
                                                  fi
