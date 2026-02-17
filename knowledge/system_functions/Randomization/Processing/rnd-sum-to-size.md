Opusmodus                                                                           rnd-sum-to-size       1

rnd-sum-to-size sum size numbers &key seed
[Function]

Arguments and Values:
sum                      (integer): The desired sum of the numbers in the resulting list.
size                     (integer): The number of elements in the resulting list.
numbers                  (list of integers): A list of integers to choose from when constructing the result.
seed                     (integer, optional): An optional seed for the random number generator to
                         ensure reproducibility.


Description:

The RND-SUM-TO-SIZE function aims to construct a list of a speci ed size where the
elements sum up to a speci ed sum. It attempts to nd a combination using only the
provided numbers. If no such combination exists, it adjusts the numbers by introducing
new numbers as necessary (either smaller or larger than those provided) to nd a valid
combination.

1. Random Trials and Systematic Search:
   • It rst tries to nd a valid combination using random sampling of the provided
     numbers.
   • If unsuccessful, it performs a systematic search with pruning to exhaustively explore
     possible combinations.

2. Adjustments:
   • If no valid combination is found with the provided numbers, the function adjusts the
     numbers by introducing new numbers.
   • Adjustments are made incrementally, adding smaller numbers (down to 1) if the total is
     less than the minimum possible sum, or larger numbers if the total is greater than the
     maximum possible sum with the provided numbers.

3. Constraints:
   • The function ensures that all elements in the resulting list are positive integers.
   • It avoids introducing new numbers unless necessary, prioritising solutions using the
     provided numbers.
 fi
             fi
                    fi
                                                fi
                                                                      fi
                                                                             fi
Opusmodus                                                               rnd-sum-to-size      2

Examples:
(rnd-sum-to-size 45 8 '(2 3 5 7 11 13 17 19))
=> (3 7 13 5 7 5 3 2)

Generate a list of 8 numbers that sum up to 45, using the numbers (2 3 5 7 11 13
17 19). The function attempts to nd a combination of 8 numbers from the provided list
that sum to 45. It uses random sampling and systematic search to nd a valid combination.

(rnd-sum-to-size 25 7 '(6 11 13 1 3) :seed 686)
=> (3 1 3 11 1 3 3)

Generate a list of 7 numbers that sum up to 25, using the numbers (6 11 13 1 3).
The seed 686 is provided for reproducibility. The function uses the seed to initialise the
random number generator, ensuring the same result each time. It searches for a combination
that sums to 25.

(rnd-sum-to-size 25 3 '(6 11 13 1 3) :seed 436)
=> (11 1 13)

Generate a list of 3 numbers that sum up to 25, using the numbers (6 11 13 1 3).
The seed 436 ensures reproducibility. The function nds a combination where the sum of
three numbers equals 25.

(rnd-sum-to-size 25 11 '(6 1 3))
=> (1 1 3 1 1 6 1 1 6 3 1)

Generate a list of 11 numbers that sum up to 25, using the numbers (6 1 3). The
seed 13 is used. The function distributes the total sum across 11 numbers, using smaller
numbers more frequently due to the large size and relatively small sum.

(rnd-sum-to-size 45 22 '(1 2 3))
=> (3 2 2 2 2 2 1 2 2 2 1 2 3 3 2 1 2 3 2 2 3 1)

In the next two examples the numbers set is altered:

(rnd-sum-to-size 11 5 '(2 4))
=> (2 3 2 2 2)

Generate a list of 5 numbers that sum up to 11, using the numbers (2 4). It’s impossible to
reach 11 using only 2s and 4s in 5 elements. The function adjusts the number set by
introducing 3 to nd a valid combination.
            fi
                            fi
                                              fi
                                                          fi
Opusmodus                                                              rnd-sum-to-size      3

(rnd-sum-to-size 103 8 '(2 3 5 7 11 13 17 19))
=> (13 7 13 19 17 2 13 19)

Generate a list of 8 numbers that sum up to 103, using the numbers (2 3 5 7 11 13
17 19).

It can be very useful when constructing new material from an existing list. If you have a
generated a list long list of pitches, using RND-SUM-TO-SIZE provides an ingenuous way
of creating list divisions.

(setf series (rnd-sample 24 '(c4 cs4 fs4 g4 c5)))
=> (c4 c4 cs4 fs4 cs4 c5 cs4 c5 g4 c4 g4 c5
    c5 c4 g4 c4 g4 g4 cs4 cs4 cs4 c4 c5 fs4)

(setf div-lis (rnd-sum-to-size 24 7 '(2 3 4)))
=> (3 2 4 4 4 4 3)

(gen-divide div-lis series)
=> ((c4 c4 cs4) (fs4 cs4) (c5 cs4 c5 g4)
    (c4 g4 c5 c5) (c4 g4 c4 g4) (g4 cs4 cs4 cs4)
    (c4 c5 fs4))

The GEN-DIVIDE function splits the series into segments based on div-lis.
