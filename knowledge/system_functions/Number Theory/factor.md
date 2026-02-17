Opusmodus                                                                            factor    1

factor n
[Function]

Arguments and Values:
n                          an integer.


Description:

This function return a list of the factors of a given integer.

(factor 6)
=> (2 3)

(factor 24)
=> (2 2 2 3)

(factor 45423)
=> (3 3 7 7 103)

A factor, in mathematics, is a number or algebraic expression that divides another number or
expression evenly—i.e., with no remainder. For example, 3 and 6 are factors of 12 because
12 ÷ 3 = 4 exactly and 12 ÷ 6 = 2 exactly. The other factors of 12 are 1, 2, 4, and 12. A
positive integer greater than 1, or an algebraic expression, that has only two factors (i.e.,
itself and 1) is termed prime; a positive integer or an algebraic expression that has more than
two factors is termed composite. The prime factors of a number or an algebraic expression
are those factors which are prime. By the fundamental theorem of arithmetic, except for the
order in which the prime factors are written, every whole number larger than 1 can be
uniquely expressed as the product of its prime factors; for example, 60 can be written as the
product 2·2·3·5.


Examples:

Use the factor function to create phrase patterns based on the number of pitches in a stream
of data.

(setf white-series (vector-to-pitch '(g3 b4) (gen-noise 36 :seed 23)))
=> (eb4 c4 c4 b4 b3 eb4 g3 gs3 e4 d4 bb4 d4 bb3 a3
    gs3 c4 a4 bb4 bb4 cs4 g3 cs4 bb3 b4 fs4 b3 cs4
    fs4 bb4 a3 a4 gs4 d4 gs4 c4 fs4)
Opusmodus                                                           factor   2

(setf white-series-phrases (gen-divide (factor 36) white-series))
=> ((eb4 c4) (c4 b4) (b3 eb4 g3) (gs3 e4 d4) (bb4 d4)
    (bb3 a3) (gs3 c4 a4) (bb4 bb4 cs4) (g3 cs4) (bb3 b4)
    (fs4 b3 cs4) (fs4 bb4 a3) (a4 gs4) (d4 gs4) (c4 fs4))

(setf white-rhy
     (gen-divide (factor 36)
                 (gen-length (mapcar 'length white-series-phrases) 8)))
=> ((1/4 1/4) (3/8 3/8) (1/4 1/4 3/8)
    (3/8 1/4 1/4) (3/8 3/8) (1/4 1/4) (1/4))
