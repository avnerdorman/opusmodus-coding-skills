Opusmodus                                                                     nreverse   1

nreverse sequence
[Function]

Arguments and Values:
sequence                a proper sequence.


Description:

Return a sequence of the same elements in reverse order; the argument is destroyed.


Examples:
(nreverse '(a b c d))
=> (d c b a)

(setf l (list 1 2 3))
=> (1 2 3)

(nreverse l)
=> (3 2 1)
