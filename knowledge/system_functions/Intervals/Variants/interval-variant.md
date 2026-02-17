Opusmodus                                                                  interval-variant    1

interval-variant intervals &key variant ambitus
                        section exclude seed

[Function]

Arguments and Values:
intervals           sequence (intervalles).
variant             'p (prime), 'r (retrograde), 'i (inversion), 'ri (retrograde-inversion),
                    and '? (at random).
ambitus             an integer (low high), a pitch symbol (low high) or instrument-name.
section             an integer or list of integers. Selected list or lists to process.
                    The default is NIL.
exclude             an integer or list of integers. Excluded list or lists from process.
                    The default is NIL.
seed                NIL or an integer. The default is NIL.


Description:

The INTERVAL-VARIANT function returns a new sequence of a give :variant.


Example:
(interval-variant '(2 1) :variant 'p)
=> (2 1)

(interval-variant '(2 1) :variant 'r)
=> (-1 -2)

(interval-variant '(2 1) :variant 'i)
=> (-2 -1)

(interval-variant '(2 1) :variant 'ri)
=> (1 2)

(interval-variant '(9 5 -4 10 -7 2 -6 0 1 -3 8 -11 13 12) :variant 'i)
=> (-9 -5 4 -10 7 -2 6 0 -1 3 -8 11 -13 -12)

(interval-variant
 '((1 -13 8 -11 19 -5 14 10 -7 2 16)
   (19 5 -4 10 -7 2 -6 1 -3 8 -11)) :variant '(r i))
=> ((-16 -2 7 -10 -14 5 19 -11 8 -13 1) (19 5 -4 10 -7 2 -6 1 -3 8 -11))

(interval-variant
 '((1 -13 8 -11 19 -5 14 10 -7 2 16)
   (19 5 -4 10 -7 2 -6 1 -3 8 -11)) :variant '?)
=> ((-1 13 -8 11 -19 5 -14 -10 7 -2 -16)
    (11 -8 3 -1 6 -2 7 -10 4 -5 19))
