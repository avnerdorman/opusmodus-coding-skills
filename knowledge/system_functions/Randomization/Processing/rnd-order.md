Opusmodus                                                                               rnd-order     1

rnd-order sequence &key type list encode section exclude prob seed
[Function]

Arguments and Values:
sequence                 a sequence.
type                     OMN reordering: :pitch, :length, :velocity or :all.
                         The default is NIL.
list                     an integer or NIL. T sublists order. NIL content order. The default is NIL.
encode                   T or NIL. With :encode T (default) the function transforms OMN repeat
                         symbols (=) into its values, while :encode NIL returns
                         selections unchanged.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
prob                     Optional parameter with a default value of 0.5. This is a oating-point
                         number ranging between 0.0 and 1.0, which affects the distribution
                         of the generated random number within the speci ed range. A lower value for
                         this parameter increases the likelihood of selecting a lower number within
                         the given range, while a higher value favours the selection of higher numbers.
seed                     This is an integer that guarantees consistent results each time the code is
                         evaluated. By providing a speci c seed, you can ensure that the randomness in
                         your code is reproducible. The default value for seed is NIL, which means the
                         seed is not set, resulting in different outputs on each run due to natural
                         randomness.


Description:

The function RND-ORDER can be used to shuf e the order of a list, or to shuf e the order of
the contents of a series of lists.

(rnd-order '(0 1 2 3 4 5 6 7 8 9 10 11))
=> (10 1 2 5 4 0 6 7 8 9 3 11)

(rnd-order '(c4 cs4 fs4 g4 c5 f5 fs5 b5) :seed 56)
=> (fs5 b5 c4 f5 g4 c5 fs4 cs4)

(rnd-order '((c4 cs4 fs4) (g4 c5 f5 fs5 b5)) :seed 32)
=> ((fs4 c4 cs4) (f5 fs5 c5 b5 g4))
                                          fl
                                                 fi
                                                                  fi
                                                                           fl
                                                                                fl
Opusmodus                                                                rnd-order   2

With probability:

(rnd-order '(0 1 2 3 4 5 6 7 8 9 10 11) :prob 0.1)
=> (9 4 11 3 7 6 8 10 2 0 5 1)

(rnd-order '(0 1 2 3 4 5 6 7 8 9 10 11) :prob 0.7)
=> (0 6 2 3 4 5 1 7 8 9 10 11)

(rnd-order '(0 1 2 3 4 5 6 7 8 9 10 11) :prob 0.0)
=> (0 1 2 3 4 5 6 7 8 9 10 11)

(rnd-order '(0 1 2 3 4 5 6 7 8 9 10 11) :prob 1.0)
=> (11 10 9 8 7 6 5 4 3 2 1 0)

Elements of an OMN list can also be disassembled and reordered:

(setf omn '(-q c4 p f4 mp e e4 mf f4 q f g4 ff a4))

This sequence of OMN can be shuf ed in its entirety (events):

(rnd-order omn :seed 21)
=> (q c4 p e e4 mf f4 q g4 ff f4 mp f a4 ff -)

Or only in the pitch domain:

(rnd-order omn :type :pitch :seed 21)
=> (-q f4 p e4 mp e f4 mf g4 q f4 f c4 ff a4)

Or the length domain:

(rnd-order omn :type :length :seed 21)
=> (q c4 p e f4 mp e4 mf q f4 f4 f g4 ff a4 -)

Or the velocity domain:

(rnd-order omn :type :velocity :seed 21)
=> (-q c4 mp f4 mf e e4 f f4 ff q mf g4 p a4 ff)

Or the all (length, pitch, velocity and articulation together) domain:

(rnd-order omn :type :all :seed 21)
=> (q f4 ff e g4 mf e4 ff q f4 p a4 f f4 mf c4 mp -)
                             fl
Opusmodus                                            rnd-order   3

Examples:
(setf mat '(he. c4 pppp ten
            he cs4 ppp ten
            hs d4 pp ten
            h eb4 p ten
            q.. f4 mp marc
            q. fs4 mf marc
            qs g4 f marc
            q gs4 ff stacc
            e a4 fff stacc
            e bb4 ffff stacs
            s b4 fffff stacs))

(rnd-order mat :seed 25)
=> (h eb4 p ten
    q. fs4 mf marc
    e a4 fff stacc
    q.. f4 mp marc
    qs g4 f marc
    e bb4 ffff stacs
    hs d4 pp ten
    s b4 fffff stacs
    he cs4 ppp ten
    he. c4 pppp ten
    q gs4 ff stacc)

(rnd-order mat :type :all :seed 25)
=> (h cs4 mp ten
    q. c4 mf marc
    e f4 pppp stacc
    q.. b4 pp marc
    qs eb4 fff marc
    e fs4 ppp stacs
    hs g4 p ten
    s d4 fffff stacs
    he gs4 ff ten
    he. a4 ffff ten
    q bb4 f stacc)

Reorder a single list:

(rnd-order '(a b c d e f g h) :encode nil)
=> (g h f e b a c d)

Reorder the contents of multiple lists:

(rnd-order '((a b) (c d) (e f) (g h)) :encode nil)
=> ((b a) (c d) (f e) (h g))
Opusmodus                                         rnd-order   4

Reorder the sublists:

(rnd-order '((a b) (c d) (e f) (g h)) :list t)
=> ((g h) (c d) (e f) (a b))

Set a seed to ensure consistent output:

(setf r-1 (integer-to-interval (rndn 10 -5 5)))
=> (8 -3 -4 1 3 3 -9 8 -1)

(setf p-2 (integer-to-pitch (rndn 10 -5 5)))
=> (a3 f4 d4 bb3 b3 d4 f4 gs3 e4 eb4)

(rnd-order r-1 :prob 0.2 :seed 21)
=> (-3 1 -4 8 3 3 8 -9 -1)

(rnd-order p-2 :prob 0.2 :seed 21)
=> (f4 b3 d4 e4 bb3 a3 f4 gs3 eb4 d4)
