Opusmodus                                   section-to-binary   1

section-to-binary list
[Function]

Arguments and Values:
list                   a list of numbers.


Description:

Converts section numbers to binary list.


Examples:
(section-to-binary '(0 1 3 5 8 9 11))
=> (1 1 0 1 0 1 0 0 1 1 0 1)

(section-to-binary '((0 1 3) (5 8 9 11)))
=> ((1 1 0 1) (0 0 0 0 0 1 0 0 1 1 0 1))
