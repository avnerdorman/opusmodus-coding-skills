Opusmodus                                                            interval-transpose-series   1

interval-transpose-series transpose intervals
[Function]

Arguments and Values:
transpose                  a list.
intervals                  a list or lists of intervals.


Description:

Use this function to create a series of transposed interval lists.

(interval-transpose-series '(0 1 2 3) '(1 -3 2 5 -1))
=> ((1 -3 2 5 -1) (2 -2 3 6 0)
    (3 -1 4 7 1) (4 0 5 8 2))

(interval-transpose-series '(0 1 3 1 0)
 '((1 -3 2 5 -1) ((1 -3) 2 5 -1)))
=> ((1 -3 2 5 -1) ((2 -2) 3 6 0) (4 0 5 8 2)
    ((2 -2) 3 6 0) (1 -3 2 5 -1))

Notice that each transposition integer adds a further list to the series of interval lists.

(interval-transpose-series '(0 11 2 13 2 11 0) '(1 -3 2 5 -1))
=> ((1 -3 2 5 -1) (12 8 13 16 10)
    (3 -1 4 7 1) (14 10 15 18 12)
    (3 -1 4 7 1) (12 8 13 16 10) (1 -3 2 5 -1))


Example:
(rndn 6 -12 12)
=> (-5 2 -10 2 -5 12)

(integer-to-interval (rndn 6 -12 12))
=> (7 -12 12 -7 17)

(setf i-lis
        (interval-transpose-series
         (gen-integer 5) (integer-to-interval (rndn 6 -12 12))))
=> ((7 -12 12 -7 17) (8 -11 13 -6 18) (9 -10 14 -5 19)
    (10 -9 15 -4 20) (11 -8 16 -3 21) (12 -7 17 -2 22))
