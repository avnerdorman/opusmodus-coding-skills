Opusmodus                                                                row-rotation   1

row-rotation number row
[Function]

Arguments and Values:
number                  an integer.
row                     list of integers (twelve-tone row).


Description:

This function employs rotation. This was an important and well-used device in most common
Twelve-Tone composition practice. The number in the argument rotates the row by position
in the list.


Examples:
(row-rotation 7 '(0 1 2 3 4 5 6 7 8 9 10 11))
=> (6 7 8 9 10 11 0 1 2 3 4 5)

(setf row (rnd-row :seed 34))
=> (0 7 3 1 4 11 6 9 8 5 10 2)

(row-rotation 4 row)
=> (10 9 6 3 1 5 8 4 7 0 2 11)
