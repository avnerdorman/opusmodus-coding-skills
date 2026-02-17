Opusmodus                                                                      row-transpose      1

row-transpose row &key mod
[Function]

Arguments and Values:
row                       list of integers (twelve-tone row).
mod                       an integer. The default is 12.


Description:

This is a standard transposition function to deal with 12-note music. It carries the additional
argument mod which can make it possible for a composer to work with integer row
collections outside the normal 12-note interval values. It works in an identical way to
INTERVAL-ROW-TRANSPOSE.


Examples:
(row-transpose 3 '(9 5 4 10 7 2 6 0 1 3 8 11))
=> (3 11 10 4 1 8 0 6 7 9 2 5)

(row-transpose 6 '(9 5 4 10 7 2 6 0 1 3 8 11))
=> (6 2 1 7 4 11 3 9 10 0 5 8)

(row-transpose 6 '(9 5 4 10 7 2 6 0 1 3 8 11) :mod 14)
=> (6 2 1 7 4 13 3 11 12 0 5 8)
