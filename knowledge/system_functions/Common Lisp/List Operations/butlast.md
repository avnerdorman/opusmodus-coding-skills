Opusmodus                                          butlast   1

butlast list &optional n
[Function]

Arguments and Values:
list                     a list.
n                        a non-negative integer.


Description:

Returns a list containing all but last element.


Examples:
(butlast '(a b c d))
=> (a b c)

(butlast '((a b) (c d)))
=> ((a b))

(butlast '(a))
=> nil

(butlast nil)
=> nil

(butlast '(1 2 3 4 5 6 7 8 9) 5)
=> (1 2 3 4)
