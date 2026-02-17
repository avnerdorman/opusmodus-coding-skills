Opusmodus                                                                    position-filter     1

position-filter position sequence &key encode
[Function]

Arguments and Values:
position                 a list of integers, 0-based.
sequence                 a sequence.
encode                   T or NIL. With :encode T (the default) the function transforms OMN repeat
                         symbols (=) into its values, while :encode NIL returns
                         selections unchanged.


Description:

This function returns multiple items from a list, based on their index position. Use this
function to create novel variants on an existing parameter or omn-form list.

(position-filter '(0 2 5) '(c4 d4 e4 f4 g4 a4 b4 c5))
=> (c4 e4 a4)

With sublists:

(position-filter '(0 1)
                 '((c4 d4 e4) (f4 g4 a4) (b4 c5 d5) (e5 f5 g5)))
=> ((c4 d4 e4) (f4 g4 a4))

(position-filter '((0 1))
                 '((c4 d4 e4) (f4 g4 a4) (b4 c5 d5) (e5 f5 g5)))
=> ((c4 d4) (f4 g4) (b4 c5) (e5 f5))

(position-filter '((1 0) (0 2) (0 2) (0 2) (0 1) (0 2))
                 '((c4 d4 e4) (f4 g4 a4) (b4 c5 d5) (e5 f5 g5)))
=> ((d4 c4) (f4 a4) (b4 d5) (e5 g5) (c4 d4) (f4 a4))


Examples:

Below is an example of how a variant might be developed using nd-position. The
position numbers from the violin phrase are generated randomly and with POSITION-
FILTER a series of 10 pitches are extracted and a new list generated with its own particular
and novel rhythm.

(setf violin (rnd-sample 24 '(c4 cs4 d4 fs4 g4 gs4 c5) :seed 356))
=> (g4 c4 gs4 c5 c5 d4 c5 gs4 c4 gs4 cs4 d4
    c4 d4 c5 c4 g4 c4 d4 gs4 fs4 gs4 g4 g4)
                                                            fi
Opusmodus                                                   position-filter   2

(setf vn-var (position-filter (rndn 10 1 24) violin))
=> (c5 d4 c5 c4 g4 gs4 c5 c5 c4 c5)

(setf vn-map (gen-binary-remove vn-var violin))
=> (0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0)

(binary-map vn-map 's)
=> (-1/16 -1/16 -1/16 -1/16 -1/16 -1/16 -1/16 -1/16 -1/16
    -1/16 1/16 -1/16 -1/16 -1/16 -1/16 -1/16 -1/16 -1/16
    -1/16 -1/16 1/16 -1/16 -1/16 -1/16)

OMN events:

(position-filter '(1 3 3 1 2 1 0 1 2)
                 '(q c4 p e d4 e e4 q f4 s g4 a4 bb4 b4))
=> (e d4 p q f4 f4 e d4 e4 d4 q c4 e d4 e4)

(position-filter '((1 3 3 1 2 5) (1 0 1 2 7 3))
                 '(q c4 p e d4 e e4 q f4 s g4 a4 bb4 b4))
=> ((e d4 p q f4 f4 e d4 e4 s a4)
    (e d4 p q c4 e d4 e4 s b4 q f4))

(position-filter '(1 0)
                 '((q c4 p e d4 e e4) (s f4 mf s g4 e a4)
                   (q b4 p s c5 s d5) (e e5 mp s. f5 t g5)))
=> ((s f4 mf s g4 e a4) (q c4 p e d4 e e4))

(position-filter '((1 0) (0 2))
                 '((q c4 p e d4 e e4) (s f4 mf s g4 e a4)
                   (q b4 p s c5 s d5) (e e5 mp s. f5 t g5)))
=> ((e d4 p q c4) (s f4 mf e a4) (s c5 p q b4) (e e5 mp t g5))

(position-filter '((1 0) (0 2) (0 2) (0 2) (0 1) (0 2))
                 '((q c4 p e d4 e e4) (s f4 mf s g4 e a4)
                   (q b4 p s c5 s d5) (e e5 mp s. f5 t g5)))
=> ((e d4 p q c4) (s f4 mf e a4) (q b4 p s d5)
    (e e5 mp t g5) (q c4 p e d4) (s f4 mf e a4))
