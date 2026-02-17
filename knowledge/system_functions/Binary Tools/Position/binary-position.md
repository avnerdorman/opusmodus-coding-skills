Opusmodus                                                                 binary-position   1

binary-position number binary
[Function]

Arguments and Values:
number                   a binary number 0 or 1.
binary                   a binary list.


Description:

The function BINARY-POSITION returns a list of position numbers, of numbers 0 or 1.

(binary-position 1 '(0 1 1 0 1 0 1 1))
=> (1 2 4 6 7)

(binary-position 0 '((0 1 1 0) (1 0 1 1)))
=> ((0 3) (1))

This function can be an invaluable partner to scoring and orchestration functions such as
GEN-PAUSE, in fact any function that includes the keyword :section.


Examples:

It can be useful when produced patterning of process action where there may be a long list of
sublists, as it bypasses the need to physically count a large collection of such lists.

(setf white-series
      (vector-to-pitch '(g3 b4) (gen-noise 60 :seed 23)))

(setf w-series (gen-divide '(2 4 5 3 5 4 3) white-series))
=> ((eb4 c4) (c4 b4 b3 eb4) (g3 gs3 e4 d4 bb4) (d4 bb3 a3)
    (gs3 c4 a4 bb4 bb4) (cs4 g3 cs4 bb3) (b4 fs4 b3)
    (cs4 fs4) (bb4 a3 a4 gs4) (d4 gs4 c4 fs4 g4) (g4 g4 gs4)
    (gs3 a4 cs4 a3 bb4) (gs4 cs4 gs4 g4) (eb4 g4 e4) (b3 b3)
    (eb4 fs4 gs3 gs3) (a4 f4))

(setf bin-list
     (gen-binary-rnd 1 (length w-series) 2 1 :seed 12))
=> (1 0 1 0 1 0 1 0 1 1 0 1 0 1 1 0 0)

(setf sect-1 (binary-position 1 bin-list))
=> (0 2 4 6 8 9 11 13 14)

(setf sect-2 (binary-position 0 bin-list))
=> (1 3 5 7 10 12 15 16)
Opusmodus                                                binary-position   2

(setf voice-1 (gen-pause
               (pitch-transpose 12 w-series :section sect-1)
               :section sect-2))
=> ((eb5 c5) (nil) (g4 gs4 e5 d5 bb5) (nil) (gs4 c5 a5 bb5 bb5)
    (nil) (b5 fs5 b4) (nil) (bb5 a4 a5 gs5) (d5 gs5 c5 fs5 g5)
    (nil) (gs4 a5 cs5 a4 bb5) (nil) (eb5 g5 e5) (b4 b4) (nil) (nil))

(setf voice-2 (gen-pause
               (pitch-transpose -12 w-series :section sect-2)
               :section sect-1))

=> ((nil) (c3 b3 b2 eb3) (nil) (d3 bb2 a2) (nil) (cs3 g2 cs3 bb2)
    (nil) (cs3 fs3) (nil) (nil) (g3 g3 gs3) (nil) (gs3 cs3 gs3 g3)
    (nil) (nil) (eb3 fs3 gs2 gs2) (a3 f3))
