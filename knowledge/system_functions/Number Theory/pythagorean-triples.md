Opusmodus                                                              pythagorean-triples     1

pythagorean-triples c
[Function]

Arguments and Values:
c                         an integer.


Description:

PYTHAGOREAN-TRIPLES will generate triples up to a given n value. A Pythagorean triple
consists of three positive integers a, b, and c, such that a^2 + b^2 = c^2, for example: (3 4 5)
= (3^2 + 4^2 = 5^2) = (9 + 16 = 25).

The simplest Pythagorean triple: a^2 + b^2 = c^2




(pythagorean-triples 9)
=> ((3 4 5))

(pythagorean-triples 10)
=> ((3 4 5) (6 8 10))

(pythagorean-triples 16)
=> ((3 4 5) (5 12 13) (6 8 10) (9 12 15))
Opusmodus                                                  pythagorean-triples   2

Examples:

There are 16 primitive Pythagorean triples with c ≤ 100:

(pythagorean-triples 100)
=> ((3 4 5) (5 12 13) (6 8 10) (7 24 25) (8 15 17)
    (9 12 15) (9 40 41) (10 24 26) (11 60 61) (12 16 20)
    (12 35 37) (13 84 85) (14 48 50) (15 20 25) (15 36 39)
    (16 30 34) (16 63 65) (18 24 30) (18 80 82) (20 21 29)
    (20 48 52) (21 28 35) (21 72 75) (24 32 40) (24 45 51)
    (24 70 74) (25 60 65) (27 36 45) (28 45 53) (28 96 100)
    (30 40 50) (30 72 78) (32 60 68) (33 44 55) (33 56 65)
    (35 84 91) (36 48 60) (36 77 85) (39 52 65) (39 80 89)
    (40 42 58) (40 75 85) (42 56 70) (45 60 75) (48 55 73)
    (48 64 80) (51 68 85) (54 72 90) (57 76 95) (60 63 87)
    (60 80 100) (65 72 97))

(list-plot (flatten (pythagorean-triples 100))
 :join-points t :point-radius 2
 :line-width 0.5 :zero-based t)
