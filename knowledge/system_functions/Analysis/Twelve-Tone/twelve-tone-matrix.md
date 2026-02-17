Opusmodus                                                                         twelve-tone-matrix   1

twelve-tone-matrix row &key type note
[Function]

Arguments and Values:
row                      a list of integers or pitches (must be a 12-tone row).
type                     :integer or :pitch. The default is :integer.
note                     a string. Annotation.


Description:

The function TWELVE—TONE-MATRIX displays all 48 forms of the row at a glance and is
an invaluable tool when composing or analysing Twelve-Tone music.

The initial row is known as the original prime order. There are four basic forms to a row:

P - Prime: Left to Right
I - Inversion: Top to Bottom
R - Retrograde: Right to Left
RI - Retrograde-Inversion: Bottom to Top

(twelve-tone-matrix '(3 11 10 2 1 0 6 4 7 5 9 8))
=> Original Prime Order: (3 11 10 2 1 0 6 4 7 5 9 8)
   Pitch: (eb4 b4 bb4 d4 cs4 c4 fs4 e4 g4 f4 a4 gs4)

                                  I

              0   8   7 11 10     9    3    1   4    2   6    5

        0     3 11 10 2 1 0 6 4 7 5 9 8
        4     7 3 2 6 5 4 10 8 11 9 1 0
        5     8 4 3 7 6 5 11 9 0 10 2 1
        1     4 0 11 3 2 1 7 5 8 6 10 9
        2     5 1 0 4 3 2 8 6 9 7 11 10
 P      3     6 2 1 5 4 3 9 7 10 8 0 11                             R
        9     0 8 7 11 10 9 3 1 4 2 6 5
       11     2 10 9 1 0 11 5 3 6 4 8 7
        8    11 7 6 10 9 8 2 0 3 1 5 4
       10     1 9 8 0 11 10 4 2 5 3 7 6
        6     9 5 4 8 7 6 0 10 1 11 3 2
        7    10 6 5 9 8 7 1 11 2 0 4 3

                                 RI
Opusmodus                                                     twelve-tone-matrix   2

Matrix in pitch:

(twelve-tone-matrix '(3 11 10 2 1 0 6 4 7 5 9 8) :type :pitch)
=> Original Prime Order: (3 11 10 2 1 0 6 4 7 5 9 8)
   Pitch: (eb4 b4 bb4 d4 cs4 c4 fs4 e4 g4 f4 a4 gs4)

                                      I

               0   8   7   11   10    9   3   1   4   2   6   5

       0     eb4 b4 bb4 d4 cs4 c4 fs4 e4 g4 f4 a4 gs4
       4      g4 eb4 d4 fs4 f4 e4 bb4 gs4 b4 a4 cs4 c4
       5     gs4 e4 eb4 g4 fs4 f4 b4 a4 c4 bb4 d4 cs4
       1      e4 c4 b4 eb4 d4 cs4 g4 f4 gs4 fs4 bb4 a4
       2      f4 cs4 c4 e4 eb4 d4 gs4 fs4 a4 g4 b4 bb4
 P     3     fs4 d4 cs4 f4 e4 eb4 a4 g4 bb4 gs4 c4 b4              R
       9      c4 gs4 g4 b4 bb4 a4 eb4 cs4 e4 d4 fs4 f4
      11      d4 bb4 a4 cs4 c4 b4 f4 eb4 fs4 e4 gs4 g4
       8      b4 g4 fs4 bb4 a4 gs4 d4 c4 eb4 cs4 f4 e4
      10     cs4 a4 gs4 c4 b4 bb4 e4 d4 f4 eb4 g4 fs4
       6      a4 f4 e4 gs4 g4 fs4 c4 bb4 cs4 b4 eb4 d4
       7     bb4 fs4 f4 a4 gs4 g4 cs4 b4 d4 c4 e4 eb4

                                     RI
Opusmodus                                                            twelve-tone-matrix   3

Example:

Schoenberg 'Opus 23' 12-tone row taken from the Opusmodus library:

(setf opus-23 (library 'vienna 'schoenberg 'r01))
=> (cs4 a4 b4 g4 gs4 fs4 as4 d4 e4 ds4 c4 f4)

Example with annotation:

(twelve-tone-matrix opus-23 :note "Schoenberg Opus 23")
=> Schoenberg Opus 23
   Original Prime Order: (1 9 11 7 8 6 10 2 4 3 0 5)
   Pitch: (cs4 a4 b4 g4 gs4 fs4 bb4 d4 e4 eb4 c4 f4)

                                 I

             0   8 10   6   7    5   9   1   3   2 11   4

       0     1 9 11 7 8 6 10 2 4 3 0 5
       4     5 1 3 11 0 10 2 6 8 7 4 9
       2     3 11 1 9 10 8 0 4 6 5 2 7
       6     7 3 5 1 2 0 4 8 10 9 6 11
       5     6 2 4 0 1 11 3 7 9 8 5 10
 P     7     8 4 6 2 3 1 5 9 11 10 7 0                      R
       3     4 0 2 10 11 9 1 5 7 6 3 8
      11     0 8 10 6 7 5 9 1 3 2 11 4
       9    10 6 8 4 5 3 7 11 1 0 9 2
      10    11 7 9 5 6 4 8 0 2 1 10 3
       1     2 10 0 8 9 7 11 3 5 4 1 6
       8     9 5 7 3 4 2 6 10 0 11 8 1

                                RI
