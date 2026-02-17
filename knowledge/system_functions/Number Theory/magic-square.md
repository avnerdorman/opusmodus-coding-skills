Opusmodus                                                                            magic-square    1

magic-square n
[Function]

Arguments and Values:
n                         The size of the magic square. It must be an odd number greater than 1 or
                          a doubly even number (divisible by 4).


Description:

The MAGIC-SQUARE function generates a magic square of size n. A magic square is a
square grid of numbers where the sum of every row, column, and both main diagonals are
equal. This function generates a magic square using different methods depending on the size
(n):

Odd-sized Magic Squares (n is odd and greater than 1):
Utilizes the Siamese method, a well-known algorithm for creating odd-sized magic squares.
This method starts at the middle of the top row and moves up and to the right on each step,
wrapping around when necessary. If a lled cell is encountered, it moves down one row
instead.

(magic-square 3)
=> ((8 1 6)
    (3 5 7)
    (4 9 2))

Doubly Even-sized Magic Squares (n is divisible by 4):
Constructs the magic square by lling the grid sequentially and then applying a speci c
inversion pattern to certain quadrants and the center cells. This method ensures that the sum
of the numbers in each row, column, and diagonal are the same.

(magic-square 4)
=> ((16 5 9 4)
    (2 11 7 14)
    (3 10 6 15)
    (13 8 12 1))
                          fi
                                 fi
                                                                                       fi
Opusmodus                                         magic-square   2

Examples:
(magic-square 5)
=> ((17 24 1 8 15)
    (23 5 7 14 16)
    (4 6 13 20 22)
    (10 12 19 21 3)
    (11 18 25 2 9))

(magic-square 8)
=> ((64 56 17 25 33 41 16 8)
    (63 55 18 26 34 42 15 7)
    (3 11 46 38 30 22 51 59)
    (4 12 45 37 29 21 52 60)
    (5 13 44 36 28 20 53 61)
    (6 14 43 35 27 19 54 62)
    (58 50 23 31 39 47 10 2)
    (57 49 24 32 40 48 9 1))

Help functions:

Returns the constant (sum) of the magic square.

(magic-constant 9)
=> 369

(print-magic-square 9)
Magic constant for n=9: 369
47 58 69 80 1 12 23 34 45
57 68 79 9 11 22 33 44 46
67 78 8 10 21 32 43 54 56
77 7 18 20 31 42 53 55 66
 6 17 19 30 41 52 63 65 76
16 27 29 40 51 62 64 75 5
26 28 39 50 61 72 74 4 15
36 38 49 60 71 73 3 14 25
37 48 59 70 81 2 13 24 35
