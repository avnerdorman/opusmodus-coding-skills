Opusmodus                                                                  cons   1

cons x list-or-thing
[Function]

Arguments and Values:
x                     an object.
list-or-thing         an object.


Description:

Allocates a new CONS cell whose CAR is X and whose CDR is list-or-thing.


Examples:
(cons 'a '(b c d))
=> (a b c d)

(cons '(a) '(b c d))
=> ((a) b c d)

(cons '(a) '((b) (c) (d)))
=> ((a) (b) (c) (d))

(cons 1 nil)
=> (1)
