Opusmodus                                                                           rnd-replace      1

rnd-replace item sequence &key encode section exclude prob seed
[Function]

Arguments and Values:
item                    an item.
sequence                a sequence.
encode                  T or NIL. With :encode T (the default) the function transforms OMN repeat
                        symbols (=) into its values, while :encode NIL returns selections
                        unchanged.
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

This function replace a given item in a sequence at random.

(rnd-replace 'c4fs4 '(c4 d4 e4 f4 g4 a4 b4))
=> (c4 c4fs4 e4 f4 g4 a4 b4)

Replace items in a sequence with the count (2) of items in the list:

(rnd-replace '(d4 e4) '(c4 c4 c4 c4 c4 c4 c4 c4))
=> (c4 c4 c4 e4 c4 d4 c4 c4)

Set a random :seed to ensure a recurring result:

(rnd-replace '(d4 e4) '(c4 c4 c4 c4 c4 c4 c4 c4) :seed 32)
=> (c4 c4 c4 e4 c4 d4 c4 c4)

(rnd-replace '((c4fs4 c5fs5) (c4cs4))
             '((c4 fs4 c5 c5 fs5 c6 c6)
               (c4 fs4 c5 c5 fs5 c6 c6)) :seed 145)
=> ((c4 fs4 c4fs4 c5 fs5 c6 c5fs5)
    (c4 c4cs4 c5 c5 fs5 c6 c6))
                                               fi
                                                                 fi
                                                                          fl
Opusmodus                                           rnd-replace   2

Replacement with :section number:

(rnd-replace '((c4fs4 c5fs5) (c4cs4))
             '((c4 fs4 c5 c5 fs5 c6 c6)
               (c4 fs4 c5 c5 fs5 c6 c6))
             :section 1)
=> ((c4 fs4 c5 c5 fs5 c6 c6)
    (c4 fs4 c4cs4 c5 fs5 c6 c6))


Examples:
(setf seq
        (integer-to-pitch
         (gen-divide '(2 3 4)
          (rnd-order (gen-integer 24)))))
=> ((db5 bb5) (f5 g5 bb4) (c5 c6 gb5 e5) (eb4 d4)
    (g4 b4 f4) (a5 e4 ab5 d5) (db4 a4)
    (b5 eb5 c4) (ab4 gb4))

(rnd-replace '((c4cs5) (f4fs5)) seq)
=> ((db5 c4cs5) (f4fs5 g5 bb4) (c5 c4cs5 gb5 e5)
    (f4fs5 d4) (c4cs5 b4 f4) (a5 e4 f4fs5 d5)
    (db4 c4cs5) (b5 eb5 f4fs5) (ab4 c4cs5))
