Opusmodus                                                                get-count     1

get-count sequence &key length item predicate sum
[Function]

Arguments and Values:
sequence                a sequence.
length                  :note (note length) or :rest (rest length).
item                    an item.
predicate               a predicate.
sum                     NIL or T. The default is NIL.


Description:

The function GET-COUNT counts how many items are in a sequence.

(get-count '(a b c d e))
=> 5


Examples:
(setf seql '((2/16 1/16 -1/16) (1/16 2/16 -1/16) (1/4) (1/1)))
(setf seqp '((c4 d4 e4 f4 g4 a4) (bb4 ab4 gb4 e4 db4 c4)))
(setf seqb '((0 1 0 0 1 0 0 1) (1 0 0 1 1 0 0 1)))
(setf seqx '((1 2 3 4 -3 -2 0) (0 -2 3 5 -6 0 -1)))

The :length keyword, counts how many length notes or length rests are in a sequence.

(get-count seql :length :note)
=> (2 2 1 1)

The sum of all length-notes in the sequence:

(get-count seql :length :note :sum t)
=> 6

The ordinary count:

(get-count seqp)
=> (6 6)

The :item keyword, counts a speci c item in the sequence:

(get-count seql :item 1/4)
=> (0 0 1 0)
                             fi
Opusmodus                                   get-count   2

(get-count seqp :item 'bb4)
=> (0 1)

(get-count seqp :sum t)
=> 12

(get-count seqb)
=> (8 8)

(get-count seqb :item 1 :sum t)
=> 7

Predicate:

(get-count seqx :predicate 'oddp)
=> (3 3)

(get-count seqx :predicate 'plusp)
=> (4 2)

(get-count seqx :predicate 'plusp :sum t)
=> 6
