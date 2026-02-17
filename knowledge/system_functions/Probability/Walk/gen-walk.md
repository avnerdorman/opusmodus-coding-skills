Opusmodus                                                                             gen-walk     1

gen-walk n &key backward forward step start seed
[Function]

Arguments and Values:
n                      an integer. Amount of intervals to generate.
backward               a oating-point. The default is 0.5. Maximum 1.0.
forward                a oating-point. The default is 0.5. Maximum 1.0.
step                   an integer (an interval). The default is 1.
start                  an integer or pitch symbol.
seed                   This is an integer that guarantees consistent results each time the code is
                       evaluated. By providing a speci c seed, you can ensure that the randomness in
                       your code is reproducible. The default value for seed is NIL, which means the
                       seed is not set, resulting in different outputs on each run due to natural
                       randomness.


Description:

This function returns a series of intervals of given :step and probability values
(backward and forward). The :backward and :forward are oating-points in range
between 0.1 and 1.0.

With default values:
-1 with probability backward
 1 with probability forward
 0 with probability 1 - (forward + backward) - same as being stationary.

(gen-walk 16)
=> (1 1 -1 1 -1 1 1 1 1 -1 1 1 1 -1 1)

(gen-walk 16 :start 0)
=> (0 1 0 1 2 1 0 -1 0 1 0 -1 -2 -3 -2 -1)

(gen-walk 16 :start 'c4)
=> (c4 cs4 c4 b3 c4 b3 c4 b3 c4 cs4 c4 cs4 c4 cs4 c4 b3)


Examples:

Get 16 pitches with :start 'c4 based on a given :seed value and with default :step
1:

(gen-walk 16 :start 'c4 :seed 76)
=> (c4 b3 c4 b3 bb3 b3 c4 b3 bb3 a3 gs3 a3 gs3 g3 fs3 f3)
                  fl
                  fl
                                              fi
                                                                 fl
Opusmodus                                                                  gen-walk   2

In this example the :step values are 1 and 2 (randomly selected):

(gen-walk 16 :step '(1 2) :seed 234)
=> (-1 -2 -1 -2 1 2 -2 2 -1 1 -1 2 2 -2 -2)

(gen-walk 16 :step '(1 2) :start 'c4 :seed 234)
=> (c4 b3 a3 gs3 fs3 g3 a3 g3 a3 gs3 a3 gs3 bb3 c4 bb3 gs3)

In the next two examples the probability to move :forward is bigger then
going :backward.

(gen-walk 16 :step '(1 2) :backward 0.3 :forward 0.9
             :start 'c4 :seed 234)
=> (c4 b3 cs4 d4 e4 f4 g4 f4 g4 fs4 g4 fs4 gs4 bb4 gs4 fs4)

(gen-walk 16 :step '(1 13) :backward 0.3 :forward 0.7
             :start 'c4 :seed 234)
=> (c4 b3 c5 cs5 d6 eb6 e7 eb6 e7 eb7 e7 eb7 d6 cs5 d6 eb7)
