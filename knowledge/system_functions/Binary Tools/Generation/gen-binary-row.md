Opusmodus                                                              gen-binary-row   1

gen-binary-row size integer
[Function]

Arguments and Values:
size                    an integer.
integer                 a list of integers.


Description:

This function creates a binary row of N length from a list of integers acting as position
numbers in a list of N length.

(gen-binary-row 12 '(0 2 5 7 8 11))
=> (1 0 1 0 0 1 0 1 1 0 0 1)


Examples:
(gen-binary-row 12 '(1 2 5 6 7))
=> (0 1 1 0 0 1 1 1 0 0 0 0)

Notice in the example below how the function sorts the integer position numbers.

(setf section (gen-loop 12 (rnd-unique (rndn 1 1 6) '(0 1 2 3 4 5 6))))

=> ((6 1 3 5)
    (1 4)
    (3)
    (5 2)
    (2 1 4 6 5 0)
    (1 4 6)
    (3 5 6 1 4)
    (5 6 2 4 0)
    (6 2 5)
    (2 5 0 1 4 6)
    (5 0 1 3 4 6)
    (0 1 3))

(gen-binary-row 7 section)
=> ((0 1 0 1 0 1 1) (0 1 0 0 1 0 0) (0 0 0 1 0 0 0) (0 0 1 0 0 1 0)
    (1 1 1 0 1 1 1) (0 1 0 0 1 0 1) (0 1 0 1 1 1 1) (1 0 1 0 1 1 1)
    (0 0 1 0 0 1 1) (1 1 1 0 1 1 1) (1 1 0 1 1 1 1) (1 1 0 1 0 0 0))
