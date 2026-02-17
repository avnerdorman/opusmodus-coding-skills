Opusmodus                                                                            rnd-sample     1

rnd-sample n sequence &key norep section exclude prob seed encode omn
[Function]

Arguments and Values:
n                      an integer or a list of integers.
sequence               a sequence.
norep                  T (no consecutive repeat) or NIL. The default is NIL.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.
encode                 T or NIL. With :encode T (the default) the function transforms OMN repeat
                       symbols (=) into its values, while :encode NIL returns
                       selections unchanged.
omn                    NIL or T. The default is NIL (T force OMN style output).
prob                   Optional parameter with a default value of 0.5. This is a oating-point
                       number ranging between 0.0 and 1.0, which affects the distribution
                       of the generated random number within the speci ed range. A lower value for
                       this parameter increases the likelihood of selecting a lower number within
                       the given range, while a higher value favours the selection of higher numbers.
seed                   This is an integer that guarantees consistent results each time the code is
                       evaluated. By providing a speci c seed, you can ensure that the randomness in
                       your code is reproducible. The default value for seed is NIL, which means the
                       seed is not set, resulting in different outputs on each run due to natural
                       randomness.


Description:

This function RND-SAMPLE can be used to choose randomly a given n (number) of items
from a sequence.

(rnd-sample 5 '(0 1 2 3 4 5 6 7 8 9))
=> (2 6 5 3 0)

With probability:

(rnd-sample 5 '(0 1 2 3 4 5 6 7 8 9) :prob 0.1)
=> (0 0 2 1 0)

(rnd-sample 5 '(0 1 2 3 4 5 6 7 8 9) :prob 0.9)
=> (9 7 8 7 7)
                                              fi
                                                                fi
                                                                         fl
Opusmodus                                                         rnd-sample   2

Examples:
(rnd-sample 5 '(c4 d4 e4 g4 a4))
=> (e4 d4 c4 c4 d4)

Pick items from sublists:

(rnd-sample 5 '((c4 d4) (e4 g4) (a4)))
=> ((e4 g4) (a4) (a4) (a4) (c4 d4))

Pick items from sublists without consecutive repeat:

(rnd-sample 5 '((c4 d4) (e4 g4) (a4)) :norep t)
=> ((a4) (c4 d4) (a4) (c4 d4) (e4 g4))

Pick the same items each time using a given random seed:

(rnd-sample 5 '((c4 d4) (e4 g4) (a4)) :seed 32)
=> ((a4) (c4 d4) (e4 g4) (c4 d4) (c4 d4))

Using a list to pick from the contents of a series of sublists:

(rnd-sample '(1 2 2) '((c4 d4) (e4 g4) (a4)) :seed 65)
=> ((c4) (e4 g4) (a4 a4))

(rnd-sample '(1 2 2 3 2 1) '((c4 d4) (e4 g4) (a4)) :seed 34)
=> ((d4) (e4 e4) (a4 a4) (c4 d4 c4) (g4 g4) (a4))

(rnd-sample '(1 2 2 3 2 1) '((c4 d4) (e4 g4) (a4)) :norep t :seed 34)
=> ((d4) (e4 g4) (a4 a4) (c4 d4 c4) (g4 e4) (a4))

OMN:

(rnd-sample 5 '((q c4 p d4 ff) (s a4 stacc) (s e4 app q c5 d5 pp)))
=> ((s a4 ff stacc) (q c4 p d4 ff) (q c4 p d4 ff)
    ((app s e4 ff) q c5 d5 pp) (q c4 p d4 ff))

(rnd-sample 5 '((q c4 p d4 ff) (s a4 stacc) (s e4 app q c5 d5 pp))
            :norep t)
=> (((app s e4 ff) q c5 d5 pp) (s a4 ff stacc) (q c4 p d4 ff)
    (s a4 ff stacc) ((app s e4 ff) q c5 d5 pp))

(rnd-sample '(6 3 4 2 2)
            '((q c4 p d4 ff) (s a4 stacc) (s e4 ten q c5 d5 pp)))
=> ((q c4 p d4 ff d4 d4 d4 d4)
    (s a4 mf stacc a4 stacc a4 stacc)
    (q c5 mf s e4 ten q c5 d5 pp)
    (q d4 ff c4 p)
    (s a4 mf stacc a4 stacc))
Opusmodus                                                                    rnd-sample     3

It is probably the most useful and direct way of generating random elements from which to
make instant original music.

Look at the way it is used here:

(setf l1
      (gen-length-cartesian
       1 (rnd-sample 50 '(1 2 3 4 5))
       (gen-weight 50 '((m 3) (d 2)))
       (gen-weight 50 '((n 3) (? 2)))
       (rnd-sample 50 '(2 4)) '(1 2 3)
       (rnd-sample 50 '(5 7 3 13 12 11)) '(1 2 3 4 5 8)))

(setf l2
      (gen-length-cartesian
       1 (rnd-sample 50 '(1 2 3 4 5))
       (gen-weight 50 '((m 3) (d 2)))
       (gen-weight 50 '((n 2) (? 3)))
       (rnd-sample 50 '(2 4)) '(1 2 3)
       (rnd-sample 50 '(5 7 3 13 12 11)) '(1 2 3 4 5 8)))
