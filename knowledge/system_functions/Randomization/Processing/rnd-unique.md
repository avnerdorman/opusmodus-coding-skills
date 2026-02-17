Opusmodus                                                                            rnd-unique     1

rnd-unique n sequence &key encode extend prob seed
[Function]

Arguments and Values:
n                      a number or a list.
sequence               a list.
encode                 T or NIL. With :encode T (the default) the function transforms OMN repeat
                       symbols (=) into its values, while :encode NIL returns
                       selections unchanged.
extend                 NIL, :rnd or :loop. The default is NIL. Returns a given number of
                       elements if a number of unique elements is lower then the given number.
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

The function RND-UNIQUE can be used to choose randomly a given n (number) of unique
items from a sequence.

(rnd-unique 6 '(0 1 2 3 4 5 6 7 8 9))
=> (3 4 2 9 0 1)

With probability:

(rnd-unique 6 '(0 1 2 3 4 5 6 7 8 9) :prob 0.1)
=> (3 4 8 2 1 0)

(rnd-unique 6 '(0 1 2 3 4 5 6 7 8 9) :prob 1.0)
=> (9 6 7 4 8 5)

(rnd-unique 6 '(c4 cs4 c4 c5 fs4 f4 fs4 g4 b4 f4 c5) :seed 576)
=> (b4 cs4 c5 c4 g4 fs4)
                                              fi
                                                                fi
                                                                         fl
Opusmodus                                                                         rnd-unique      2

Examples:

Pick unique items from a single list:

(rnd-unique 3 '(c4 d4 e4 g4 a4))
=> (c4 a4 e4)
Pick unique sublists:

(rnd-unique 3 '((c4e4g4) (d4) (g3e4g4) (a4)))
=> ((c4e4g4) (a4) (d4))
Pick a given number of items from each sublist:

(rnd-unique '(3 1) '((c4 d4 e4) (f4 g4 a4)))
=> ((e4 c4 d4) (a4))

An example with further nested sublists in the rst list:

(rnd-unique '(2 1) '(((c4 d4) (e4) (f4 g4)) (f4 g4 a4)))
=> (((e4) (f4 g4)) (g4))

Set the random seed:

(rnd-unique 3 '(c4 d4 e4 g4 a4) :seed 32)
=> (a4 d4 c4)

Note that if the number of items to be picked exceeds the length of the list, all items will be
picked, albeit in a random order:

(rnd-unique 20 '(a b c d e f))
=> (a f d b e c)

Extends the result to a given number:

(rnd-unique 13 '(c4 cs4 d4 ds4 e4 f4 fs4) :extend :loop :seed 45)
=> (f4 d4 fs4 ds4 c4 cs4 e4 f4 d4 fs4 ds4 c4 cs4)

(rnd-unique 13 '(c4 cs4 d4 ds4 e4 f4 fs4) :extend :rnd :seed 45)
=> (c4 fs4 d4 ds4 c4 cs4 e4 f4 d4 fs4 ds4 f4 cs4)

See also RND-PICK.
                                         fi
Opusmodus                                                                    rnd-unique   3

Here is the workings for building a sequence of complex chords some of which will be
required to be split into arpeggios.

(setf p1 (gen-chord 24 2 4 -5 7
                    (gen-repeat 10 '(e4 f4 a4 ds5 e5)) :seed 45))
=> (bb4b4eb5a5 fs5fs4 cs4f4b4c5 a4bb4d5 d5eb5eb4 a4cs5g5gs5
    cs4d4fs4c5 fs5fs4g4b4 gs5a5a4 c4e4bb4 bb5bb4b4eb5
    c5cs5cs4d4 f4b4c5c4 fs4bb4 d5eb5)

(setf p2 (gen-chord 24 2 4 -7 5
                    (gen-repeat 10 '(f4 b4 ds5 e5 a5)) :seed 42))
=> (bb3e4 g5gs5cs6a4 b4eb5 bb4eb5b3f4 fs5g5c6 d4gs4c5
    fs5b5g4cs5 bb4b4e5c4 b4eb5e5a5 gs4d5fs5 a4d5bb3
    eb5g5gs5cs6 c4fs4bb4b4 eb5b3f4a4 eb5gs5)

(setq chd-mix (flatten (gen-combine p1 p2)))
=> (bb4b4eb5a5 bb3e4 fs5fs4 g5gs5cs6a4 cs4f4b4c5 b4eb5 a4bb4d5
    bb4eb5b3f4 d5eb5eb4 fs5g5c6 a4cs5g5gs5 d4gs4c5 cs4d4fs4c5
    fs5b5g4cs5 fs5fs4g4b4 bb4b4e5c4 gs5a5a4 b4eb5e5a5 c4e4bb4
    gs4d5fs5 bb5bb4b4eb5 a4d5bb3 c5cs5cs4d4 eb5g5gs5cs6 f4b4c5c4
    c4fs4bb4b4 fs4bb4 eb5b3f4a4 d5eb5 eb5gs5)

Now let's add arpeggiation to some of the chords in this interleaved list.

(setf selection-of-arpeggios
      (sort-asc
       (rnd-unique
        12 (rnd-sample 24 (gen-integer (length chd-mix))))))
=> (0 1 4 10 13 14 15 21 23 24 26 27)

(setq arpeggiate-some
        (sort-asc
         (pitch-melodize
          (mclist chd-mix) :section selection-of-arpeggios)
         :section selection-of-arpeggios))
=> ((bb4 b4 eb5 a5) (bb3 e4) (fs5fs4) (g5gs5cs6a4) (cs4 f4 b4 c5)
    (b4eb5) (a4bb4d5) (bb4eb5b3f4) (d5eb5eb4) (fs5g5c6) (a4 cs5 g5 gs5)
    (d4gs4c5) (cs4d4fs4c5) (g4 cs5 fs5 b5) (fs4 g4 b4 fs5)
    (c4 bb4 b4 e5) (gs5a5a4) (b4eb5e5a5) (c4e4bb4) (gs4d5fs5)
    (bb5bb4b4eb5) (bb3 a4 d5) (c5cs5cs4d4) (eb5 g5 gs5 cs6)
    (c4 f4 b4 c5) (c4fs4bb4b4) (fs4 bb4) (b3 f4 a4 eb5)
    (d5eb5) (eb5gs5))
