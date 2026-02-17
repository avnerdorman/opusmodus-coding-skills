Opusmodus                                                                        rnd-sample-seq      1

rnd-sample-seq n sequence &key encode section exclude
                         prob seed

[Function]

Arguments and Values:
n                       an integer or a list of integers.
sequence                a sequence.
encode                  T or NIL. With :encode T (the default) the function transforms OMN repeat
                        symbols (=) into its values, while :encode NIL returns
                        selections unchanged.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.
prob                    Optional parameter with a default value of 0.5. This is a oating-point
                        number ranging between 0.0 and 1.0, which affects the distribution
                        of the generated random number within the speci ed range. A lower value for
                        this parameter increases the likelihood of selecting a lower number within
                        the given range, while a higher value favours the selection of higher numbers.
seed                    This is an integer that guarantees consistent results each time the code is
                        evaluated. By providing a speci c seed, you can ensure that the randomness in
                        your code is reproducible. The default value for seed is NIL, which means the
                        seed is not set, resulting in different outputs on each run due to natural
                        randomness.


Description:

This function RND-SAMPLE-SEQ can be used to choose randomly a given n (number) of
items in a consecutive order from a sequence.

(rnd-sample-seq 4 '(0 1 2 3 4 5 6 7 8 9 10 11))
=> (2 3 4 5)


Examples:

Pick items from sublists with a given random seed:

(rnd-sample-seq 3 '((c4e4g4) (c5d5e5g5a5b5) (e5a5cs6) (bb4d5f5)
                    (a5d6f6) (gs5eb6) (fs4a4cs5) (b5e6gs6)) :seed 12)
=> ((gs5eb6) (fs4a4cs5) (b5e6gs6))
                                               fi
                                                                 fi
                                                                          fl
Opusmodus                                                         rnd-sample-seq   2

Using a list to pick from the contents of a series of sublists:

(rnd-sample-seq '(3 2 5) '((0 1 2 3 4 5 6 7 8 9 10 11)
                           (0 1 2 3 4 5 6 7 8 9 10 11)
                           (0 1 2 3 4 5 6 7 8 9 10 11)))
=> ((6 7 8) (10 11) (6 7 8 9 10))

Look at the way it is used here:

(setf pitches
 (gen-loop 12 (rnd-sample-seq 3 '(f4 g4 a4 bb4 c5 d5 eb5 e5)) :seed 34))

(make-omn :length '(s) :pitch pitches :span :pitch)
=> ((s bb4 mf c5 d5) (s a4 mf bb4 c5) (s g4 mf a4 bb4)
    (s a4 mf bb4 c5) (s f4 mf g4 a4) (s c5 mf d5 eb5)
    (s g4 mf a4 bb4) (s a4 mf bb4 c5) (s d5 mf eb5 e5)
    (s d5 mf eb5 e5) (s a4 mf bb4 c5) (s bb4 mf c5 d5))
