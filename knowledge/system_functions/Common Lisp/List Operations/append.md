Opusmodus                                                                                     append   1

append &rest lists
[Function]

Arguments and Values:
lists                  each must be a proper list except the last, which may be any object.


Description:

Construct a new list by concatenating the list arguments.


Examples:
(append '(a b c) '(d e f) '(g))
=> (a b c d e f g)

(setf dur-1 '(1/8 1/8 1/8 1/8))
(setf dur-2 '(3/8 1/8))

(append dur-1 dur-2)
=> (1/8 1/8 1/8 1/8 3/8 1/8)

(setf lst '(a b c))
=> (a b c)

(append lst '(d))
=> (a b c d)

lst
=> (a b c)

(append)
=> nil

(append 'a)
=> a
