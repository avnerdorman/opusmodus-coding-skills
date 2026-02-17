Opusmodus                                                                      do-section   1

do-section section function sequence
[Function]

Arguments and Values:
section                 a list (binary list or a list if symbols 'x and '-).
function                a function.
sequence                a sequence.


Description:

DO-SECTION distributes an operation over a range of lists. Binary list section returns a
processed list if 1. If 0 the list is unchanged. A list section with symbols '- and 'x
returns a processed list if 'x. If '- the list is unchanged.

(do-section '(- x) '(sort-asc x) '((7 2 4 5 3) (3 5 1 4 7 2 6)))
=> ((7 2 4 5 3) (1 2 3 4 5 6 7))

(do-section '(0 1) '(rnd-order x)
                   '((c4 d4 e4 f4 g4 a4) (c4 d4 e4 f4 g4 a4)))
=> ((c4 d4 e4 f4 g4 a4) (a4 c4 f4 g4 e4 d4))

Same as above:

(do-section '(- x) '(rnd-order x)
                   '((c4 d4 e4 f4 g4 a4) (c4 d4 e4 f4 g4 a4)))
=> ((c4 d4 e4 f4 g4 a4) (a4 c4 f4 g4 e4 d4))


Examples:
(do-section
 '(0 1 1 0) '(pitch-transpose 12 x)
 '((a3 cs4 bb4 eb4 g3 cs4) (cs4 bb4 eb4 g3 cs4 c4)
   (bb4 eb4 g3 cs4 c4 b4 gs4 bb4 gs3) (eb4 g3 cs4 c4)))
=> ((a3 cs4 bb4 eb4 g3 cs4) (cs5 bb5 eb5 g4 cs5 c5)
    (bb5 eb5 g4 cs5 c5 b5 gs5 bb5 gs4) (eb4 g3 cs4 c4))

(do-section '(- x x x) '(pitch-invert x)
            '((a3 cs4 bb4 eb4 g3 cs4)
              (cs4 bb4 eb4 g3 cs4 c4)
              (bb4 eb4 g3 cs4 c4 b4 gs4 bb4 gs3)
              (eb4 g3 cs4 c4)))
=> ((a3 cs4 bb4 eb4 g3 cs4) (cs4 e3 b3 g4 cs4 d4)
    (bb4 f5 cs6 g5 gs5 a4 c5 bb4 c6) (eb4 b4 f4 fs4))
