Opusmodus                                                                 interval-row-variant   1

interval-row-variant transpose variant intervals
                                    &key remove assoc mod seed

[Function]

Arguments and Values:
transpose               an integer (transposition value).
variant                 'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                        '4 (4th), 'r4 (retrograde-4th), '5 (5th) ,'r5 (retrograde-5th)
                        or '? (at random).
intervals               row of intervals.
remove                  an integer (interval).
assoc                   row size. The default is 12.
mod                     row size. The default is 12.
seed                    NIL or an integer. The default is NIL.


Description:

This function allows for many different and simultaneous variants to be produced.
The :variant functions include transposition, with pitch alone, and with retrograde
'r, inversion 'i, retrograde inversion 'ri, and with a 4th '4, retrograde 4th 'r4, a 5th
'5, and retrograde 5th 'r5. The row interval size and length can be controlled too.

(pcs '6-Z10)
=> (0 1 3 4 5 7)

(interval-row-variant 0 '4 (pcs '6-Z10))
=> (0 5 3 8 1 11)


Example:
(interval-row-variant 0 'p '(0 8 -11 10 2 1 4 -3 7 6 -9 5))
=> (0 8 -11 10 2 1 4 -3 7 6 -9 5)

(interval-row-variant 0 '? '(0 8 -11 10 2 1 4 -3 7 6 -9 5))
=> (0 -4 1 -2 -10 -11 -8 9 -5 -6 3 -7)

(interval-row-variant
 0 'p '(0 1 2 -3 -5 8 13 9 -10 -7 -12 4 -14 -11 -6)
 :assoc 12 :mod 14)
=> (0 1 2 -3 -5 8 13 9 -10 -7 -12 4 0 -11 -6)
Opusmodus                                               interval-row-variant   2

(interval-row-variant
 (gen-repeat 8 '(0)) '(p r i ri 4 5 r4 r5)
 '(0 -8 7 1 10 -5 9 -3 -4 6 -11 -2))
=> ((0 -8 7 1 10 -5 9 -3 -4 6 -11 -2)
    (-2 -11 6 -4 -3 9 -5 10 1 7 -8 0)
    (0 4 -5 -11 -2 7 -3 9 8 -6 1 10)
    (10 1 -6 8 9 -3 7 -2 -11 -5 4 0)
    (0 -4 11 5 2 -1 9 -3 -8 6 -7 -10)
    (0 -8 1 7 10 -11 3 -9 -4 6 -5 -2)
    (-10 -7 6 -8 -3 9 -1 2 5 11 -4 0)
    (-2 -5 6 -4 -9 3 -11 10 7 1 -8 0))

(setf intervals (interval-row-variant
                 (gen-repeat 8 '(0)) '(?)
                 '(0 -8 7 1 10 -5 9 -3 -4 6 -11 -2)))
=> ((-2 -5 6 -4 -9 3 -11 10 7 1 -8 0)
    (-2 -5 6 -4 -9 3 -11 10 7 1 -8 0)
    (-10 -7 6 -8 -3 9 -1 2 5 11 -4 0)
    (-10 -7 6 -8 -3 9 -1 2 5 11 -4 0)
    (-2 -5 6 -4 -9 3 -11 10 7 1 -8 0)
    (10 1 -6 8 9 -3 7 -2 -11 -5 4 0)
    (-10 -7 6 -8 -3 9 -1 2 5 11 -4 0)
    (10 1 -6 8 9 -3 7 -2 -11 -5 4 0))

(list-plot intervals :point-radius 2 :style :fill)
