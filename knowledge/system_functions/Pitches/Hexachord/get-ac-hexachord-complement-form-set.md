Opusmodus                                            get-ac—hexachord-complement-form-set   1

get-ac—hexachord-complement-form-set aggregate
                                                                 &key type form-names

[Function]

Arguments and Values:
aggregate               sequence with two All-Combinatorial Hexachords sets, (H1 and H2).
type                    :integer or :pitch. The default is :integer.
form-names              T or NIL. The default is NIL.


Description:

The function GET-AC—HEXACHORD-COMPLEMENT-FORM-SET returns all form sets with
all combinations of the complement hexachord (H2) set.


Example:
(setf ac-hex '((0 4 5 11 6 10) (7 3 1 2 9 8)))

(get-ac-hexachord-complement-form-set ac-hex)
=> ((9 1 2 8 3 7) (3 7 8 2 9 1)
    (8 7 2 3 1 9) (2 1 8 9 7 3)
    (7 3 2 8 1 9) (1 9 8 2 7 3)
    (8 9 2 1 3 7) (2 3 8 7 9 1))

Here we reverse the hexachords order:

(get-ac-hexachord-complement-form-set (reverse ac-hex))
=> ((10 6 4 5 0 11) (4 0 10 11 6 5)
    (0 4 11 5 6 10) (6 10 5 11 0 4)
    (0 4 6 5 10 11) (6 10 0 11 4 5)
    (10 6 11 5 4 0) (4 0 5 11 10 6))

In the next example we generate the all-combinatorial hexachords with GET-AC-
HEXACHORD function:

(setf hexachords (get-ac-hexachord 'd :seed 965)
=> ((11 5 3 10 9 4) (6 0 2 7 8 1))

(get-ac-hexachord-complement-form-set hexachords)
=> ((8 2 0 7 6 1) (2 8 6 1 0 7)
    (1 6 7 0 2 8) (7 0 1 6 8 2)
    (6 0 2 7 8 1) (0 6 8 1 2 7)
    (1 8 7 2 0 6) (7 2 1 8 6 0))
Opusmodus                                     get-ac—hexachord-complement-form-set   2

To get the form set names we set the keyword :form-names to T:

(get-ac-hexachord-complement-form-set
 (get-ac-hexachord 'c :seed 965) :form-names t)
=> (p6 ri3 i9 r0)

(rnd-octaves '(c2 c6)
 (rnd-order
  (get-form-set (get-ac-hexachord 'c :seed 965)
                '(p6 ri3 i9 r0) :segment '(3 3) :type :pitch)))
=> ((gs3 c5 f5) (eb4 bb2 cs5) (d4 b4 g2) (e3 fs2 a2)
    (cs3 eb5 bb4) (f4 c4 gs2) (e5 fs3 a4) (g2 d3 b3)
    (f2 cs5 gs4) (eb5 bb3 c3) (d4 b4 fs3) (e5 a3 g5)
    (bb2 c4 eb5) (f3 cs4 gs4) (a3 e4 g2) (b2 d4 fs4))
