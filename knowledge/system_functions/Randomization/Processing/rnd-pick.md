Opusmodus                                                                                 rnd-pick     1

rnd-pick sequence &key type encode prob seed
[Function]

Arguments and Values:
sequence                  a sequence.
type                      NIL or 'list (sequential). The default is NIL.
encode                    T or NIL. With :encode T (the default) the function transforms OMN repeat
                          symbols (=) into its values, while :encode NIL returns
                          selections unchanged.
prob                      Optional parameter with a default value of 0.5. This is a oating-point
                          number ranging between 0.0 and 1.0, which affects the distribution
                          of the generated random number within the speci ed range. A lower value for
                          this parameter increases the likelihood of selecting a lower number within
                          the given range, while a higher value favours the selection of higher numbers.
seed                      This is an integer that guarantees consistent results each time the code is
                          evaluated. By providing a speci c seed, you can ensure that the randomness in
                          your code is reproducible. The default value for seed is NIL, which means the
                          seed is not set, resulting in different outputs on each run due to natural
                          randomness.


Description:

The function RND-PICK will pick either a single item from a list, or a sublist from a list of
lists.

(rnd-pick '(0 1 2 3 4 5 6 7 8 9))
=> 6

With probability:

(rnd-pick '(0 1 2 3 4 5 6 7 8 9) :prob 0.1)
=> 2

(rnd-pick '(0 1 2 3 4 5 6 7 8 9) :prob 1.0)
=> 9

(rnd-pick '(c4 d4 e4 g4 a4))
=> g4

Pick from sublists:

(rnd-pick '((c4 d4) (e4 f4)))
=> (e4 f4)

(rnd-pick '((c4 d4) (e4 f4)) :type 'list)
=> (d4 f4)
                                                 fi
                                                                   fi
                                                                            fl
Opusmodus                                                                        rnd-pick   2

A :seed can also be set to ensure the same result each time the code is evaluated.

(rnd-pick '((c4 d4) (e4 f4)) :seed 32)
=> (e4 f4)


Examples:
(setf seq1 (rnd-order (gen-integer 24) :seed 57))
=> (13 3 4 12 23 5 19 10 6 16 7 8 22 1 15 21 20 24 2 17 11 0 18 14 9)

(setf seq1a (gen-divide '(7 8 5 3) (integer-to-pitch seq1)))
=> ((cs5 eb4 e4 c5 b5 f4 g5) (bb4 fs4 e5 g4 gs4 bb5 cs4 eb5)
    (a5 gs5 c6 d4 f5) (b4 c4 fs5) (d5 a4))

(setf pitch-list (rnd-pick seq1a :type 'list :seed 96))
=> (eb4 eb5 gs5 fs5 d5)

(pitch-invert-start pitch-list seq1a)
=> ((f3 eb4 d4 fs3 g2 cs4 b2) (gs5 c6 d5 b5 bb5 gs4 f6 eb5)
    (g5 gs5 e5 d7 b5) (cs6 c7 fs5) (d5 g5))

What happens above is the RND-PICK is used to pick an inversion point at random from
each list.
