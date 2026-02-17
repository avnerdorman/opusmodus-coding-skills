Opusmodus                                                                     row-invert      1

row-invert row &key mod assoc seed
[Function]

Arguments and Values:
row                     list of integers (twelve-tone row).
mod                     an integer. The default is 12.
assoc                   an integer. The default is 12.
seed                    NIL or an integer. The default is NIL.


Description:

This is a standard inversion function to deal with 12-note music. It carries the additional
arguments mod and assoc which can make it possible for a composer to work with integer
row collections outside the normal 12-note interval values. It works in an identical way to
INTERVAL-ROW-INVERT.


Examples:
(row-invert '(9 5 4 10 7 2 6 0 1 3 8 11))
=> (3 7 8 2 5 10 6 0 11 9 4 1)

(row-invert '(9 5 4 10 7 2 6 0 1 3 8 11) :mod 14)
=> (5 9 10 4 7 12 8 0 13 11 6 3)

(row-invert '(9 5 4 10 7 2 6 0 1 3 8 11) :mod 14 :assoc 12)
=> (3 7 8 2 5 10 6 0 13 9 4 1)
