Opusmodus                                                            count-repeat    1

count-repeat sequence
[Function]

Arguments and Values:
sequence               a sequence.


Description:

The function COUNT-REPEAT counts the consecutive repeat of elements in a sequence.

(count-repeat '(1 1 2 2 2 3 4 4 1))
=> (2 3 1 2 1)

(count-repeat '((1 1 2 2) (2 3 4 4 1)))
=> ((2 2) (1 1 2 1))
