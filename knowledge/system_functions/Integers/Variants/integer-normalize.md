Opusmodus                                                     integer-normalize   1

integer-normalize integers min max low high
[Function]

Arguments and Values:
integers             a list or lists of integers.
min                  a number.
max                  a number.
low                  a number.
high                 a number.


Description:

The INTEGER-NORMALIZE function normalizes a list of integers into min, max range
to the low, high range.

(integer-normalize '(1 3 5 7) 0 24 0 36)
=> (2 4 8 10)


Example:
(integer-normalize '(1 2 5 3 4 7 3) 0 24 0 46)
=> (2 4 10 6 8 13 6)

(integer-normalize '(3 (4 7 3)) 0 24 12 46)
=> (16 (18 22 16))

(integer-normalize '(3 (4 7 3)) 0 45 12 46)
=> (14 (15 17 14))

(integer-to-pitch
 (integer-normalize '((1 2 5 3) (4 7 3)) 0 24 0 46))
=> ((d4 e4 bb4 fs4) (gs4 cs5 fs4))
