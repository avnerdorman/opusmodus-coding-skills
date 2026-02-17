Opusmodus                                                   binary-to-section   1

binary-to-section list &key num
[Function]

Arguments and Values:
list                   a binary list.
num                    a binary number. The default is 1.


Description:

Converts binary list to section numbers.


Examples:
(binary-to-section '(0 1 1 0 1 0 1 1) :num 1)
=> (1 2 4 6 7)

(binary-to-section '(0 1 1 0 1 0 1 1) :num 0)
=> (0 3 5)

(binary-to-section '(1 1 0 1 0 1 0 0 1 1 0 1))
=> (0 1 3 5 8 9 11)

(binary-to-section '((1 1 0 1) (0 0 0 0 0 1 0 0 1 1 0 1)))
=> ((0 1 3) (5 8 9 11))
