Opusmodus                                                                         integer-variant   1

integer-variant sequence &key variant ambitus section exclude seed
[Function]

Arguments and Values:
sequence               sequence of integers.
variant                'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert)
                       and '? (at random).
ambitus                integers (low high), pitches (low high) or instrument-name.
                       The default is 'piano.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.
seed                   NIL or an integer. The default is NIL.


Description:

This function allows for many different and simultaneous variants to be produced.
The :variant functions include retrograde 'r, inversion 'i, retrograde inversion 'ri
and '? at random.


Example:
(integer-variant '(9 5 -4 10 -7 2 -6 0 1 -3 8 -11 13 12) :variant 'i)
=> (9 13 22 8 25 16 24 18 17 21 10 29 5 6)

(integer-variant
 '((1 -13 8 -11 19 -5 14 10 -7 2 16)
   (19 5 -4 10 -7 2 -6 1 -3 8 -11)) :variant '(r i))

=> ((16 2 -7 10 14 -5 19 -11 8 -13 1)
    (19 33 42 28 45 36 44 37 41 30 11))

At random: '?

(integer-variant
 '((1 -13 8 -11 19 -5 14 10 -7 2 16)
   (19 5 -4 10 -7 2 -6 1 -3 8 -11)) :variant '?)

=> ((1 15 -6 13 -17 7 -12 -8 9 0 -14)
    (-11 8 -3 1 -6 2 -7 10 -4 5 19))
Opusmodus                                                   integer-variant   2

At random with :seed

(integer-variant
 '((1 -13 8 -11 19 -5 14 10 -7 2 16)
   (19 5 -4 10 -7 2 -6 1 -3 8 -11)) :variant '? :seed 43)

=> ((16 2 -7 10 14 -5 19 -11 8 -13 1)
    (-11 8 -3 1 -6 2 -7 10 -4 5 19))
