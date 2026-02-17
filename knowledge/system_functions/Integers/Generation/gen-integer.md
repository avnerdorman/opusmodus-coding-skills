Opusmodus                                                                    gen-integer      1

gen-integer a &optional b step
[Function]

Arguments and Values:
a                          an integer.
b                          an integer (optional end at).
step                       an integer (optional step).


Description:

GEN-INTEGER will generate a series of integers between two values.

(gen-integer 12)
=> (0 1 2 3 4 5 6 7 8 9 10 11 12)

With optional b:

(gen-integer -3 12)
=> (-3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12)

With optional b and step:

(gen-integer -3 12 2)
=> (-3 -1 1 3 5 7 9 11)

(gen-integer '(-3 -3) '(12 11) '(1 2))
=> ((-3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12)
    (-3 -1 1 3 5 7 9 11))


Examples:

Although we can also include lists, for example to generate two lists ranging from -3 to 12
and -3 to -12 respectively:

(gen-integer -3 '(12 -12))
=> ((-3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12)
    (-3 -4 -5 -6 -7 -8 -9 -10 -11 -12))

Pairs of lists can also be used:

(gen-integer '(-3 3) '(12 -12))
=> ((-3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12)
    (3 2 1 0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10 -11 -12))
Opusmodus                                                                    gen-integer   2

List pairs do not have to be equal in length:

(gen-integer '(-3 3) '(12 -12 6 -6))
=> ((-3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12)
    (3 2 1 0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10 -11 -12)
    (-3 -2 -1 0 1 2 3 4 5 6)
    (3 2 1 0 -1 -2 -3 -4 -5 -6))

The use of integers as a building block for musical material is a fundamental aspect of
OPUSMODUS. At a symbolic level integers have a powerful characteristic for the composer.
Whereas pitch symbols are constrained by the octave, integers have no such constraints. This
enables the composer to think, for example, beyond the tonality of the chromatic scale and
fashion, using algorithmic means, a tonality series over any pitch area.

Let's invent a 2-octave tonality with integers.

(setf init-scale (gen-integer 24))
=> (0 1 2 3 4 5 6 7 8 9 10 11 12 13
    14 15 16 17 18 19 20 21 22 23 24)

(setf n-scale (append '(0) (rnd-sample 14 (gen-integer 0 24) :seed 45)))
=> (0 8 4 20 20 19 19 13 4 23 23 10 4 12 24)

(filter-repeat 1
 (tonality-map '(n-scale :root eb3) (integer-to-pitch init-scale)))
=> (eb3 g3 b3 cs4 eb4 e4 bb4 b4 d5 eb5)

(create-tonality 2-octave-dominant
 '(eb3 g3 b3 cs4 eb4 e4 bb4 b4 d5 eb5))
