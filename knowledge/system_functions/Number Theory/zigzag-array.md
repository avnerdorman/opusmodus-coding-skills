Opusmodus                                                                 zigzag-array    1

zigzag-array n &key print
[Function]

Arguments and Values:
n                       an integer.
print                   NIL or T. The default is NIL.


Description:

A zigzag array is a square arrangement of the rst N2 natural numbers, where the numbers
increase sequentially as you zig-zag along the array's anti-diagonals.


Examples:
(zigzag-array 9)
=> #2A((0 1 5 6 14 15 27 28 44) (2 4 7 13 16 26 29 43 45)
       (3 8 12 17 25 30 42 46 59) (9 11 18 24 31 41 47 58 60)
       (10 19 23 32 40 48 57 61 70) (20 22 33 39 49 56 62 69 71)
       (21 34 38 50 55 63 68 72 77) (35 37 51 54 64 67 73 76 78)
       (36 52 53 65 66 74 75 79 80))

(zigzag-array 9 :print t)
=> 0 1 5 6 14 15 27 28 44
   2 4 7 13 16 26 29 43 45
   3 8 12 17 25 30 42 46 59
   9 11 18 24 31 41 47 58 60
  10 19 23 32 40 48 57 61 70
  20 22 33 39 49 56 62 69 71
  21 34 38 50 55 63 68 72 77
  35 37 51 54 64 67 73 76 78
  36 52 53 65 66 74 75 79 80
                                       fi
Opusmodus                                                     zigzag-array   2

(list-plot (array-to-list (zigzag-array 9)) :join-points t)
