Opusmodus                                                              get—form-set   1

get—form-set row form &key segment type
[Function]

Arguments and Values:
row                     a twelve-tone row.
form                    a form or list of forms.
segment                 an integer or list of integers.
type                    :integer or :pitch. The default is :integer.


Description:

The function GET-FORM-SET returns twelve-tone row of a given form.

Forms:

Prime:                   P 0-11
Inversion:               I 0-11
Retrograde:              R 0-11
Retrograde Inversion:    RI 0-11

(get-form-set '(0 4 9 10 5 3 8 7 1 2 11 6) 'r7)
=> (1 6 9 8 2 3 10 0 5 4 11 7)

(get-form-set '(0 4 9 10 5 3 8 7 1 2 11 6) 'r7 :type :pitch)
=> (cs4 fs4 a4 gs4 d4 eb4 bb4 c4 f4 e4 b4 g4)


Examples:
(get-form-set '(0 4 9 10 5 3 8 7 1 2 11 6) '(r5 p4 ri3))
=> ((11 4 7 6 0 1 8 10 3 2 9 5)
    (4 8 1 2 9 7 0 11 5 6 3 10)
    (9 4 1 2 8 7 0 10 5 6 11 3))

(get-form-set
 '(0 4 9 10 5 3 8 7 1 2 11 6) '(r7 ri9 p5) :segment '(6 3 3))
=> ((1 6 9 8 2 3) (10 0 5) (4 11 7)
    (3 10 7 8 2 1) (6 4 11) (0 5 9)
    (5 9 2 3 10 8) (1 0 6) (7 4 11))

(get-form-set (rnd-row) '(p0 r9 i3 ri5))
=> ((0 9 5 4 2 3 7 10 11 6 1 8)
    (5 10 3 8 7 4 0 11 1 2 6 9)
    (3 6 10 11 1 0 8 5 4 9 2 7)
    (9 4 11 6 7 10 2 3 1 0 8 5))
Opusmodus                                                   get—form-set   2

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
