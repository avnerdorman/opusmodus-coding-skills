Opusmodus                                                                            row-variant       1

row-variant transposition variant segment set
                   &key mod assoc remove type seed

[Function]

Arguments and Values:
transposition           an integer or a pitch symbol.
variant                 'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert), '4 (4th),
                        'r4 (retrograde-4th), '5 (5th) ,'r5 (retrograde-5th) or '? (at random).
segment                 integer lists.
set                     list of integers (twelve-tone row).
remove                  NIL or T. The default is NIL.
mod                     an integer. The default is 12.
assoc                   an integer. The default is 12.
type                    :integer or :pitch. The default is :integer.
seed                    NIL or an integer. The default is NIL.


Description:

This function allows for many different and simultaneous variants to be produced. The
variant functions include transposition, with pitch alone, and with retrograde 'r,
inversion 'i, retrograde inversion 'ri, a 4th '4, retrograde 4th 'r4, a 5th '5 and
retrograde 5th 'r5 and '? at random. The row interval size and length can be controlled too.
The 12-note row, of course, has no minus values.

(row-variant 0 'p '(9 5 4 10 7 2 6 0 1 3 8 11))
=> ((0 8 7 1 10 5 9 3 4 6 11 2)

(interval-row-variant 0 'p '(9 5 4 10 7 2 6 0 1 3 8 11))
=> (0 -8 -7 1 -10 -5 -9 -3 -4 -6 -11 2)

(interval-row-variant 0 '? '(9 5 4 10 7 2 6 0 1 3 8 11))
=> (10 -7 -6 -8 -3 -9 -1 -2 5 -11 -4 0)


Examples:
(row-variant 9 'p '(9 5 4 10 7 2 6 0 1 3 8 11))
=> (9 5 4 10 7 2 6 0 1 3 8 11)

(row-variant
 10 'i '(d4 f4 gs4 bb4 eb4 a4 g4 e4 b4 cs4 c4 ab4) :type :pitch)
=> (d4 b4 gs4 fs4 cs4 g4 a4 c4 f4 ds4 e4 gs4)
Opusmodus                                                    row-variant   2

(row-variant
 0 'p '(0 1 2 3 5 8 13 9 10 7 12 4 14 11 6)
 :remove '(0 1 2) :assoc 12 :type :pitch :mod 14)
=> (ds4 f4 gs4 cs5 a4 as4 g4 c5 e4 b4 fs4)

(row-variant
 '(0 0) '(p r4) '(0 8 11 10 2 1 4 3 7 6 9 5) :assoc 12 :mod 11)
=> ((0 8 0 10 2 1 4 3 7 6 9 5)
    (1 9 6 11 3 8 5 10 2 0 4 0))

(row-variant
 '(0 0 0) '(?) '(0 8 11 10 2 1 4 3 7 6 9 5) :assoc 12 :mod 11)
=> ((0 8 0 10 2 1 4 3 7 6 9 5)
    (7 3 6 5 9 8 11 10 2 0 4 0)
    (1 9 6 11 3 8 5 10 2 0 4 0))
