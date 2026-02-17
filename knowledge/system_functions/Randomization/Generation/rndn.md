Opusmodus                                                                                     rndn     1

rndn &rest args &key prob seed
[Function]

Arguments and Values:
args                    A rest parameter that accepts a variable number of arguments, interpreted as
                        follows: First positional argument (n): The number of random numbers to
                        generate. If not speci ed, defaults to generating a single number.
                        Second and third positional arguments (min and max): The range within
                        which to generate the random numbers. Defaults to the range (0.0, 1.0).

prob                    An optional probability factor (between 0.0 and 1.0) that biases the
                        generated numbers towards min (for prob closer to 0.0) or max (for prob
                        closer to 1.0). Defaults to 0.5, which represents no bias.

seed                    This is an integer that guarantees consistent results each time the code is
                        evaluated. By providing a speci c seed, you can ensure that the randomness in
                        your code is reproducible. The default value for seed is NIL, which means the
                        seed is not set, resulting in different outputs on each run due to natural
                        randomness.


Description:

The RNDN function generates a speci ed number of random numbers within a given range,
with optional control over randomness through a seed and a probability bias towards
the range's endpoints.


Examples:

Generate a single random number within the default range (0.0, 1.0):

(rndn)
=> 0.16355323

Generate a single random number within the range (1.0, 10.0):

(rndn 1 1.0 10.0)
=> 2.8387156

Generate a three random number within the default range (0.0, 1.0):

(rndn 3)
=> (0.7981618 0.5396613 0.82033575)
                             fi
                                     fi
                                                fi
     Opusmodus                                                                              rndn   2

     Generate three random integers within the range (1, 10):

     (rndn 3 1 10)
     => (9 6 8)

     Generate three random numbers within the range (1.0, 10.0), with a speci c seed:

     (rndn 3 1.0 10.0 :seed 23)
     => (3.1102078 6.39866 3.6368139)

     Generate three random numbers within the range (1.0, 10.0), with a speci c seed and a
     high probability bias towards the maximum:

     (rndn 3 1.0 10.0 :seed 23 :prob 0.9)
     => (5.3579664 7.9705048 5.871481)

     This can be particularly useful for generating novel material for pitches, lengths or dynamics.

     (integer-to-pitch (vector-round 0 12 (rndn 12 :seed 89)))
     => (c4 cs4 c5 g4 cs4 d4 bb4 cs4 gs4 b4 eb4 c4)


     Note:

     The RNDN function simpli es the process of generating random numbers by combining the
     features of four previous functions: RND, RND1, RND-NUMBER, and RND-ROUND. This
     uni cation means you can now use a single, ef cient function for all your random number
     needs, making both coding and maintenance simpler. The original functions are kept for
     compatibility with older code but are no longer actively documented, ensuring that existing
     projects can still run without any issues.
fi
                         fi
                                             fi
                                                                            fi
                                                                            fi
