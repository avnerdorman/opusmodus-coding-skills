Opusmodus                                                                                  rnd-sum    1

rnd-sum total numbers &key trials alternatives seed
[Function]

Arguments and Values:
total                     an integer.
numbers                   a list of integers.
trials                    an integer. The default is 10.
alternatives              an integer or list of integers. The default is '(1).
seed                      This is an integer that guarantees consistent results each time the code is
                          evaluated. By providing a speci c seed, you can ensure that the randomness in
                          your code is reproducible. The default value for seed is NIL, which means the
                          seed is not set, resulting in different outputs on each run due to natural
                          randomness.


Description:

This function returns a list of numbers which add up to N. Given a list of positive integers
numbers and a positive integer total, select a multi set from numbers such that their
sum equals or is close to total. If total was not reached after trial trials, solve the
same problem with :alternatives and the difference between total and the sum
reached and append that result to the best selection found in the rst trials. Note that it cannot
be guaranteed that there is always a selection that adds up to total and that the problem is
NP complete, i.e., so far nobody has found a good (polynomial time) algorithm to solve this
problem.

(rnd-sum 11 '(1 2 3))
=> (3 3 1 1 3)

(rnd-sum 11 '(1 2 3) :seed 345)
=> (2 2 1 3 3)


Examples:

It can be very useful when constructing new material from an existing list. If you have a
generated a list long list of pitches, using RND-SUM provides an ingenuous way of creating
list divisions.

(setf series (rnd-sample 24 '(c4 cs4 fs4 g4 c5)))
=> (cs4 c4 c5 c5 g4 g4 fs4 c4 c5 c5 fs4 c4 fs4
    c5 c4 cs4 c4 cs4 c5 cs4 g4 cs4 fs4 fs4)

(setf div-lis (rnd-sum 24 '(2 3 4)))
=> (4 4 2 3 4 3 4)
                                                 fi
                                                              fi
Opusmodus                                                rnd-sum   2

(gen-divide div-lis series)
=> ((cs4 c4 c5 c5) (g4 g4 fs4 c4) (c5 c5) (fs4 c4 fs4)
    (c5 c4 cs4 c4) (cs4 c5 cs4) (g4 cs4 fs4 fs4))
