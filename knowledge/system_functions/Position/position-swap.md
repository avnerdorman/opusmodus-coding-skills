Opusmodus                                                                position-swap      1

position-swap position list &key seq
[Function]

Arguments and Values:
position                a list or lists of integers (<position><swap-position>), 0-based.
list                    a list.
seq                     NIL or T. The default is NIL.


Description:

The function POSITION-SWAP swaps the positions of the items within a list.


Examples:
(position-swap '(0 2) '(0 1 2 3 4 5 6))
=> (2 1 0 3 4 5 6)

(position-swap '((0 2) (3 5)) '(c4 d4 e4 f4 g4 a4 b4))
=> (e4 d4 c4 a4 g4 f4 b4)

(position-swap '((0 2) (3 5)) '(c4 d4 e4 f4 g4 a4 b4) :seq t)
=> ((e4 d4 c4 f4 g4 a4 b4) (e4 d4 c4 a4 g4 f4 b4))

(position-swap '((0 2) (3 5)) '(e c4 f d4 p s e4 mp f4 g4 f a4) :seq t)
=> ((s e4 mp e d4 p c4 f s f4 mp g4 f a4)
    (s e4 mp e d4 p c4 f s a4 g4 f4 mp))
