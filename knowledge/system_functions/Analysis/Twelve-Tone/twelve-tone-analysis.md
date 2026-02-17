Opusmodus                                                                    twelve-tone-analysis   1

twelve-tone-analysis row set &key order note
[Function]

Arguments and Values:
row                      a list of integers or pitches (must be a twelve-tone row).
set                      a list of integers or pitches.
order                    NIL or T. The default is NIL.
note                     a string. Annotation.


Description:

The function TWELVE—TONE-ANALYSIS analyses all 48 forms of a row matrix to nd the
given pitch-class set. When found, it will return all the Forms that contain the pitch-class
set in any order.

The initial row is known as the original prime order. There are four basic forms to a row:

P - Prime: Left to Right
I - Inversion: Top to Bottom
R - Retrograde: Right to Left
RI - Retrograde-Inversion: Bottom to Top

(twelve-tone-analysis '(3 11 10 2 1 0 6 4 7 5 9 8) '(2 1 5 3 6 4))
=> Original Prime Order: (3 11 10 2 1 0 6 4 7 5 9 8)
   Pitch: (eb4 b4 bb4 d4 cs4 c4 fs4 e4 g4 f4 a4 gs4)
   Set: (2 1 5 3 6 4)
   Pitch Set: (d4 cs4 f4 eb4 fs4 e4)
   Complement: (0 7 8 9 10 11)
   Pitch Complement: (c4 g4 gs4 a4 bb4 b4)
   PCS: (6-1 6-1)
   Form: (P3 ((6 2 1 5 4 3) (9 7 10 8 0 11)))
         (RI4 ((2 1 5 3 6 4) (10 9 8 0 11 7)))
         (I10 ((1 5 6 2 3 4) (10 0 9 11 7 8)))
         (R9 ((5 6 2 4 1 3) (9 10 11 7 8 0)))
         (P9 ((0 8 7 11 10 9) (3 1 4 2 6 5)))
         (RI10 ((8 7 11 9 0 10) (4 3 2 6 5 1)))
         (I4 ((7 11 0 8 9 10) (4 6 3 5 1 2)))
         (R3 ((11 0 8 10 7 9) (3 4 5 1 2 6)))
                                                                                      fi
Opusmodus                                                          twelve-tone-analysis   2

With the keyword :order T the result of the search will return Form in the given pitch-
class set order.

(twelve-tone-analysis
 '(3 11 10 2 1 0 6 4 7 5 9 8) '(2 1 5 3 6 4) :order t)
=> Original Prime Order: (3 11 10 2 1 0 6 4 7 5 9 8)
   Pitch: (eb4 b4 bb4 d4 cs4 c4 fs4 e4 g4 f4 a4 gs4)
   Set: (2 1 5 3 6 4)
   Pitch Set: (d4 cs4 f4 eb4 fs4 e4)
   Complement: (0 7 8 9 10 11)
   Pitch Complement: (c4 g4 gs4 a4 bb4 b4)
   PCS: (6-1 6-1)
   Form: (RI4 ((2 1 5 3 6 4) (10 9 8 0 11 7)))


Examples:

Schoenberg 'Opus 37' 12-tone row taken from the Opusmodus library:

(setf opus-37 (library 'vienna 'schoenberg 'r24))
=> (d4 cs4 a4 bb4 f4 eb4 e4 c4 gs4 g4 fs4 b4)

(twelve-tone-analysis
  opus-37 '((2 1 9 10 5 3) (7 8 0 11 4 6))
  :note "Schoenberg Opus 37, Fourth String Quartet")
=> Schoenberg Opus 37, Fourth String Quartet
   Original Prime Order: (2 1 9 10 5 3 4 0 8 7 6 11)
   Pitch: (d4 cs4 a4 bb4 f4 eb4 e4 c4 gs4 g4 fs4 b4)
   Set: ((2 1 9 10 5 3) (7 8 0 11 4 6))
   Pitch Set: ((d4 cs4 a4 bb4 f4 eb4) (g4 gs4 c4 b4 e4 fs4))
   Complement: ((0 4 6 7 8 11) (1 2 3 5 9 10))
   Pitch Complement: ((c4 e4 fs4 g4 gs4 b4) (cs4 d4 eb4 f4 a4 bb4))
   PCS: (6-16 6-16b 6-16b 6-16)
   Form: (P0 ((2 1 9 10 5 3) (4 0 8 7 6 11)))
         (RI5 ((10 3 2 1 9 5) (6 4 11 0 8 7)))
         (I5 ((7 8 0 11 4 6) (5 9 1 2 3 10)))
         (R0 ((11 6 7 8 0 4) (3 5 10 9 1 2)))
         (I5 ((7 8 0 11 4 6) (5 9 1 2 3 10)))
         (R0 ((11 6 7 8 0 4) (3 5 10 9 1 2)))
         (P0 ((2 1 9 10 5 3) (4 0 8 7 6 11)))
         (RI5 ((10 3 2 1 9 5) (6 4 11 0 8 7)))
Opusmodus                                                         twelve-tone-analysis   3

Let us test the result of the above:

(twelve-tone-matrix
 opus-37 :note "Schoenberg Opus 37, Fourth String Quartet")
=> Schoenberg Opus 37, Fourth String Quartet
   Original Prime Order: (2 1 9 10 5 3 4 0 8 7 6 11)
   Pitch: (d4 cs4 a4 bb4 f4 eb4 e4 c4 gs4 g4 fs4 b4)

                                   I

             0 11    7    8   3    1   2 10   6   5   4   9

      0      2 1 9 10 5 3 4 0 8 7 6 11
      1      3 2 10 11 6 4 5 1 9 8 7 0
      5      7 6 2 3 10 8 9 5 1 0 11 4
      4      6 5 1 2 9 7 8 4 0 11 10 3
      9     11 10 6 7 2 0 1 9 5 4 3 8
 P   11      1 0 8 9 4 2 3 11 7 6 5 10                        R
     10      0 11 7 8 3 1 2 10 6 5 4 9
      2      4 3 11 0 7 5 6 2 10 9 8 1
      6      8 7 3 4 11 9 10 6 2 1 0 5
      7      9 8 4 5 0 10 11 7 3 2 1 6
      8     10 9 5 6 1 11 0 8 4 3 2 7
      3      5 4 0 1 8 6 7 3 11 10 9 2

                                  RI


The hexachordally combinatorial pairs:

(twelve-tone-analysis '(0 8 7 11 10 9 3 1 4 2 6 5) '(5 1 0 4 3 2))
=> Original Prime Order: (0 8 7 11 10 9 3 1 4 2 6 5)
   Pitch: (c4 gs4 g4 b4 bb4 a4 eb4 cs4 e4 d4 fs4 f4)
   Set: (5 1 0 4 3 2)
   Pitch Set: (f4 cs4 c4 e4 eb4 d4)
   Complement: (6 7 8 9 10 11)
   Pitch Complement: (fs4 g4 gs4 a4 bb4 b4)
   PCS: (6-1 6-1)
   Form: (P5 ((5 1 0 4 3 2) (8 6 9 7 11 10)))
         (RI6 ((1 0 4 2 5 3) (9 8 7 11 10 6)))
         (I0 ((0 4 5 1 2 3) (9 11 8 10 6 7)))
         (R11 ((4 5 1 3 0 2) (8 9 10 6 7 11)))
         (P11 ((11 7 6 10 9 8) (2 0 3 1 5 4)))
         (RI0 ((7 6 10 8 11 9) (3 2 1 5 4 0)))
         (I6 ((6 10 11 7 8 9) (3 5 2 4 0 1)))
         (R5 ((10 11 7 9 6 8) (2 3 4 0 1 5)))
Opusmodus                                            twelve-tone-analysis   4

The trichordal combinatoriality:

(twelve-tone-analysis '(0 4 5 2 3 7 1 9 8 11 10 6)
                      '((0 4 5) (2 3 7) (1 9 8) (11 10 6)))
=> Original Prime Order: (0 4 5 2 3 7 1 9 8 11 10 6)
   Pitch: (c4 e4 f4 d4 eb4 g4 cs4 a4 gs4 b4 bb4 fs4)
   Set: ((0 4 5) (2 3 7) (1 9 8) (11 10 6))
   Pitch Set: ((c4 e4 f4) (d4 eb4 g4) (cs4 a4 gs4) (b4 bb4 fs4))
   Complement: ((1 2 3 6 7 8 9 10 11) (0 1 4 5 6 8 9 10 11)
                (0 2 3 4 5 6 7 10 11) (0 1 2 3 4 5 7 8 9))
   Pitch Complement: ((cs4 d4 eb4 fs4 g4 gs4 a4 bb4 b4)
                      (c4 cs4 e4 f4 fs4 gs4 a4 bb4 b4)
                      (c4 d4 eb4 e4 f4 fs4 g4 bb4 b4)
                      (c4 cs4 d4 eb4 e4 f4 g4 gs4 a4))
   PCS: (3-4b 3-4 3-4 3-4b 9-4 9-4b 9-4b 9-4)
   Form: (P0 ((0 4 5) (2 3 7) (1 9 8) (11 10 6)))
         (R6 ((0 4 5) (2 3 7) (1 9 8) (11 10 6)))
         (RI1 ((7 3 2) (5 4 0) (6 10 11) (8 9 1)))
         (I7 ((7 3 2) (5 4 0) (6 10 11) (8 9 1)))
         (RI7 ((1 9 8) (11 10 6) (0 4 5) (2 3 7)))
         (I1 ((1 9 8) (11 10 6) (0 4 5) (2 3 7)))
         (P6 ((6 10 11) (8 9 1) (7 3 2) (5 4 0)))
         (R0 ((6 10 11) (8 9 1) (7 3 2) (5 4 0)))
         (P6 ((6 10 11) (8 9 1) (7 3 2) (5 4 0)))
         (R0 ((6 10 11) (8 9 1) (7 3 2) (5 4 0)))
         (RI7 ((1 9 8) (11 10 6) (0 4 5) (2 3 7)))
         (I1 ((1 9 8) (11 10 6) (0 4 5) (2 3 7)))
         (RI1 ((7 3 2) (5 4 0) (6 10 11) (8 9 1)))
         (I7 ((7 3 2) (5 4 0) (6 10 11) (8 9 1)))
         (P0 ((0 4 5) (2 3 7) (1 9 8) (11 10 6)))
         (R6 ((0 4 5) (2 3 7) (1 9 8) (11 10 6)))

(twelve-tone-analysis '(0 4 5 2 3 7 1 9 8 11 10 6)
                      '((0 4 5) (2 3 7)))
=> Original Prime Order: (0 4 5 2 3 7 1 9 8 11 10 6)
   Pitch: (c4 e4 f4 d4 eb4 g4 cs4 a4 gs4 b4 bb4 fs4)
   Set: ((0 4 5) (2 3 7))
   Pitch Set: ((c4 e4 f4) (d4 eb4 g4))
   Complement: ((1 2 3 6 7 8 9 10 11) (0 1 4 5 6 8 9 10 11))
   Pitch Complement: ((cs4 d4 eb4 fs4 g4 gs4 a4 bb4 b4)
                      (c4 cs4 e4 f4 fs4 gs4 a4 bb4 b4))
   PCS: (3-4b 3-4 9-4 9-4b)
   Form: (P0 ((0 4 5) (2 3 7) (1 9 8 11 10 6)))
         (R6 ((0 4 5 2 3 7) (1 9 8) (11 10 6)))
         (RI1 ((7 3 2 5 4 0) (6 10 11) (8 9 1)))
         (I7 ((7 3 2) (5 4 0) (6 10 11 8 9 1)))
         (P6 ((6 10 11) (8 9 1) (7 3 2 5 4 0)))
         (R0 ((6 10 11 8 9 1) (7 3 2) (5 4 0)))
         (RI7 ((1 9 8 11 10 6) (0 4 5) (2 3 7)))
         (I1 ((1 9 8) (11 10 6) (0 4 5 2 3 7)))
Opusmodus                                            twelve-tone-analysis   5

Example with smaller segments:

(twelve-tone-analysis '(0 6 1 5 2 4 3 7 11 8 10 9)
                      '((0 6 1) (5 2 4) (3 7) (11 8 10) (9)))
=> Original Prime Order: (0 6 1 5 2 4 3 7 11 8 10 9)
   Pitch: (c4 fs4 cs4 f4 d4 e4 eb4 g4 b4 gs4 bb4 a4)
   Set: ((0 6 1) (5 2 4) (3 7) (11 8 10) (9))
   Pitch Set: ((c4 fs4 cs4) (f4 d4 e4) (eb4 g4) (b4 gs4 bb4) (a4))
   Complement: ((2 3 4 5 7 8 9 10 11) (0 1 3 6 7 8 9 10 11)
                (0 1 2 4 5 6 8 9 10 11) (0 1 2 3 4 5 6 7 9)
                (0 1 2 3 4 5 6 7 8 10 11))
   Pitch Complement: ((d4 eb4 e4 f4 g4 gs4 a4 bb4 b4)
                      (c4 cs4 eb4 fs4 g4 gs4 a4 bb4 b4)
                      (c4 cs4 d4 e4 f4 fs4 gs4 a4 bb4 b4)
                      (c4 cs4 d4 eb4 e4 f4 fs4 g4 a4)
                      (c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 bb4 b4))
   PCS: (3-5 3-2b 2-4 3-2b singleton 9-5b 9-2 10-4 9-2 nil)
   Form: (P0 ((0 6 1) (5 2 4) (3 7) (11 8 10) (9)))
         (P9 ((9 3 10) (2 11 1) (0 4) (8 5 7) (6)))
         (RI6 ((9) (8 10 7) (11 3) (2 4 1) (5 0 6)))
         (I9 ((9 3 8) (4 7 5) (6 2) (10 1 11) (0)))
         (R0 ((9) (10 8 11) (7 3) (4 2 5) (1 6 0)))
         (R0 ((9) (10 8 11) (7 3) (4 2 5) (1 6 0)))
         (P0 ((0 6 1) (5 2 4) (3 7) (11 8 10) (9)))
         (RI9 ((0) (11 1 10) (2 6) (5 7 4) (8 3 9)))
         (I6 ((6 0 5) (1 4 2) (3 11) (7 10 8) (9)))
         (R9 ((6) (7 5 8) (4 0) (1 11 2) (10 3 9)))

(12tone-analysis '(6 3 2 5 4 8 9 10 11 1 7 0) '(3 4 5))
=> Form: SET not found in any of the forms.
