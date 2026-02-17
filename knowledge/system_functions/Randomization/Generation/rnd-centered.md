Opusmodus                                                                          rnd-centered     1

rnd-centered n &key seed
[Function]

Arguments and Values:
n                       a number.
seed                    This is an integer that guarantees consistent results each time the code is
                        evaluated. By providing a speci c seed, you can ensure that the randomness in
                        your code is reproducible. The default value for seed is NIL, which means the
                        seed is not set, resulting in different outputs on each run due to natural
                        randomness.


Description:

If n is 1.0 then the function returns a value between -1.0 and 1.0.
If n is 5 then the function returns a number between -5 and 5.

(rnd-centered 5 :seed 54)
=> -4


Examples:

Return number between -5 and 5 for a given seed number:

(rnd-centered 5 :seed 54)
=> -4
                                               fi
