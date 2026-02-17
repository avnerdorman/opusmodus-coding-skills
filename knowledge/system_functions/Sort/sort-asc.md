Opusmodus                                                                                      sort-asc   1

sort-asc sequence &key type section exclude
[Function]

Arguments and Values:
sequence                a list or lists of any type.
type                    NIL, :length, :pitch, :velocity. The default is NIL.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.


Description:

The function SORT-ASC will sort any sequence into ascending order.

(sort-asc '(7 3 2 6 5 10 9 8 4 1))
=> (1 2 3 4 5 6 7 8 9 10)

(sort-asc '(b4 d4 g4 a4 e4 c4 f4))
=> (c4 d4 e4 f4 g4 a4 b4)

(sort-asc '(1/4 1/2 1/4 1/16))
=> (1/16 1/4 1/4 1/2)

(sort-asc '(fff p pp mf f))
=> (pp p mf f fff)

(sort-asc '(0.432 0.23 1.432 0.654 1.4536))
=> (0.23 0.432 0.654 1.432 1.4536)


Examples:

OMN sort:

(sort-asc '(q c4 stacc s cs4 d4 q c4db5 ten e d4))
=> (s c4 stacc c4db5 e db4 q d4 ten d4)

OMN sort, pitch only:

(sort-asc '(q c4 stacc s cs4 d4 q c4db5 ten e d4) :type :pitch)
=> (q c4 stacc s c4db5 db4 q d4 ten e)
Opusmodus                                                                    sort-asc   2

Sort only certain sublists:

(sort-asc '((7 4 8 5) (8 4 2 7) (9 5 3 1)) :section '(0 2))
=> ((4 5 7 8) (8 4 2 7) (1 3 5 9))

Notice that the function SORT-ASC will operate over sublists.

(setf phrase-1 (rndn 20 0 12))
(setf phrase-2 (rndn 20 0 24))

(sort-asc (list phrase-1 phrase-2))
=> ((2 2 2 3 3 3 4 4 4 4 4 5 5 6 8 8 8 9 10 11)
      (4 4 5 6 7 7 8 8 9 9 9 9 10 12 15 16 16 18 21 23))

When making new tonalities the use of the SORT-ASC function is crucial. Here's an example
from the opening of Nigel Morgan's Fifteen Images for solo keyboard.

(setf rh (chordize
          (gen-loop 15 (rnd-sample
                        (rndn 1 2 4)
                        (integer-to-pitch chromatic))
          :seed 4321)))

(setf lh (chordize
            (gen-loop 15 (rnd-sample
                          (rndn 1 2 4)
                          (reverse (integer-to-pitch chromatic)))
         :seed 9876)))

(setf lh-rh-mix
      (sort-asc
       (pitch-melodize
        (chord-pitch-unique
         (gen-divide
          2 (flatten (gen-combine lh (pitch-transpose 12 rh))))))))
=> ((eb4 f4 eb5 g5) (f4 b4 e5 f5 ab5)
    (db4 d4 f4 db5 g5) (d4 eb4 e4 c5 db5 b5)
    (d4 ab4 b4 eb5 g5) (db4 a4 bb4 e5 a5 bb5)
    (e4 b4 eb5 f5 gb5) (d4 gb4 b4 db5 a5 bb5 b5)
    (c4 eb4 b4 g5 ab5 a5) (c4 a4 f5 gb5)
    (eb4 a4 c5 ab5 a5) (d4 f4 gb4 d5 gb5 bb5)
    (db4 g4 a4 b4 db5 gb5 ab5) (c4 db4 e4 ab4 db5 a5)
    (c4 a4 bb4 eb5 gb5 b5))

(create-tonality image-1 '(eb4 f4 eb5 g5))
=> (3 5 15 19)

(create-tonality image-2 '(f4 b4 e5 f5 ab5))
=> (5 11 16 17 20)
