Opusmodus                                                             ulam-spiral-array      1

ulam-spiral-array n &key print
[Function]

Arguments and Values:
n                        an integer.
print                    NIL or T. The default is NIL.


Description:

An Ulam spiral (of primes) is a method of visualising primes when expressed in a (normally
counter-clockwise) outward spiral (usually starting at 1), constructed on a square grid,
starting at the centre. An Ulam spiral is also known as a prime spiral.


Examples:
(ulam-spiral-array 9)
=> #2A((65 64 63 62 61 60 59 58 57) (66 37 36 35 34 33 32 31 56)
       (67 38 17 16 15 14 13 30 55) (68 39 18 5 4 3 12 29 54)
       (69 40 19 6 1 2 11 28 53) (70 41 20 7 8 9 10 27 52)
       (71 42 21 22 23 24 25 26 51) (72 43 44 45 46 47 48 49 50)
       (73 74 75 76 77 78 79 80 81))

(ulam-spiral-array 9 :print t)
=> 65 64 63 62 61 60 59 58 57
   66 37 36 35 34 33 32 31 56
   67 38 17 16 15 14 13 30 55
   68 39 18 5 4 3 12 29 54
   69 40 19 6 1 2 11 28 53
   70 41 20 7 8 9 10 27 52
   71 42 21 22 23 24 25 26 51
   72 43 44 45 46 47 48 49 50
   73 74 75 76 77 78 79 80 81
Opusmodus                                               ulam-spiral-array   2

(list-plot (array-to-list (ulam-spiral-array 9)) :join-points t)
