Opusmodus                                                                                      sort-desc   1

sort-desc sequence &key type section exclude
[Function]

Arguments and Values:
sequence                a list or lists of any type.
type                    NIL, :length, :pitch, :velocity. The default is NIL.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.


Description:

The function SORT-DESC will sort any sequence into descending order.

(sort-desc '(7 3 2 6 5 10 9 8 4 1))
=> (10 9 8 7 6 5 4 3 2 1)

(sort-desc '(b4 d4 g4 a4 e4 c4 f4))
=> (b4 a4 g4 f4 e4 d4 c4)

(sort-desc '(1/4 1/2 1/4 1/16))
=> (1/2 1/4 1/4 1/16)

(sort-desc '(fff p pp mf f))
=> (fff f mf p pp)

(sort-desc '(0.432 0.23 1.432 0.654 1.4536))
=> (1.4536 1.432 0.654 0.432 0.23)


Examples:

OMN sort:

(sort-desc '(q c4 stacc s cs4 d4 q c4db5 ten e d4))
=> (q db5c4 stacc d4 e s db4 ten c4)

OMN sort, pitch only:

(sort-desc '(q c4 stacc s cs4 d4 q c4db5 ten e d4) :type :pitch)
=> (q db5c4 stacc s d4 d4 q db4 ten e c4)
Opusmodus                                                        sort-desc   2

Sort only certain sublists:

(sort-desc '((7 4 8 5) (8 4 2 7) (9 5 3 1)) :section '(0 2))
=> ((8 7 5 4) (8 4 2 7) (9 5 3 1))

Notice that the function SORT-DESC will operate over sublists.

(setf phrase-1 (rndn 20 0 12))
(setf phrase-2 (rndn 20 0 24))

(sort-desc (list phrase-2 phrase-1))
=> ((23 21 18 16 16 15 12 10 9 9 9 9 8 8 7 7 6 5 4 4)
    (11 10 9 8 8 8 6 5 5 4 4 4 4 4 3 3 3 2 2 2))
