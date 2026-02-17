Opusmodus                                                                    row-variant-segment         1

row-variant-segment transposition variant segment set
                                    &key mod assoc remove group type seed

[Function]

Arguments and Values:
transposition             an integer or a pitch symbol.
variant                   'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert), '4 (4th),
                          'r4 (retrograde-4th), '5 (5th) ,'r5 (retrograde-5th) or '? (at random).
segment                   integer lists.
set                       list of integers (twelve-tone row).
remove                    NIL or T. The default is NIL.
group                     NIL or T. The default is NIL.
mod                       an integer. The default is 12.
assoc                     an integer. The default is 12.
type                      :integer or :pitch. The default is :integer.
seed                      NIL or an integer. The default is NIL.


Description:

This function employs most of the different variants used in transforming 12-note rows.
These include retrograde, inversion, retrograde inversion and all in conjunction with
transposition. It's a kind of 'catch-all' function when preparing pre-compositional material.


Examples:
(row-variant-segment
 0 '(p) '(3 3 3 3) '(0 8 11 10 2 1 4 3 7 6 9 5)
 :type :pitch)
=> (c4 gs4 b4 as4 d4 cs4 e4 ds4 g4 fs4 a4 f4)

(row-variant-segment
 0 '(r p) '(3 3 3 3) '(0 8 11 10 2 1 4 3 7 6 9 5)
 :group t :type :pitch)
=> ((f4 a4 gb4) (bb4 d4 db4) (db4 d4 bb4) (gb4 a4 f4))

(row-variant-segment
 7 '(r p i) '(3 3 3 3) '(0 8 11 10 2 1 4 3 7 6 9 5) :group t)
=> ((0 4 1) (5 9 8) (1 2 10) (6 3 7))

(row-variant-segment
 7 '(?) '(3 3 3 3) '(0 8 11 10 2 1 4 3 7 6 9 5) :group t)
=> ((7 3 6) (10 2 7) (4 3 7) (6 3 7))
