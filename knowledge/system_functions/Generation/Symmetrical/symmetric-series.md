Opusmodus                                                                          symmetric-series   1

symmetric-series n &key type seed
[Function]

Arguments and Values:
n                        an integer (integer or MIDI value).
type                     a name.
seed                     an integer ensures the same result each time the code is evaluated.
                         The default is NIL.


Description:

Symmetric series as in Anton Webern.

Type: 66-hth - two chromatic hexachords, the second a transposition of the rst.

(symmetric-series 0 :type '66-hth :seed 56)
=> (3 5 2 4 0 1 9 11 8 10 6 7)

Type: 66-hrh - two chromatic hexachords, the second a transposed retrograde of the first.

(symmetric-series 0 :type '66-hrh :seed 56)
=> (3 5 2 4 0 1 7 6 10 8 11 9)

Type: 66-hih - two chromatic hexachords, the second a transposed inverse of the first.

(symmetric-series 0 :type '66-hih :seed 56)
=> (3 5 2 4 0 1 8 6 9 7 11 10)

Type: 66-hrih - two chromatic hexachords, the second a transposed retrograde inverse of
the first.

(symmetric-series 0 :type '66-hrih :seed 56)
=> (3 5 2 4 0 1 10 11 7 9 6 8)

Type: oo - two basilarly non-chromatic hexachords, the second a transposition of the first.

(symmetric-series 0 :type 'oo :seed 56)
=> (8 3 11 10 7 0 14 9 17 16 13 6)

Type: or - two basilarly non-chromatic hexachords, the second a transposed retrograde of
the first.

(symmetric-series 0 :type 'or :seed 56)
=> (8 3 11 10 7 0 6 13 16 17 9 14)
                                                                              fi
Opusmodus                                                                symmetric-series    2

Type: oi - two basilarly non-chromatic hexachords, the second a transposed inverse of the
first.

(symmetric-series 0 :type 'oi :seed 56)
=> (9 3 6 7 10 0 2 8 5 4 1 11)

Type: ori - two basilarly non-chromatic hexachords, the second a transposed retrograde
inverse of the first.

(symmetric-series 0 :type 'ori :seed 56)
=> (9 3 6 7 10 0 11 1 4 5 8 2)

Type: 444-ooo - three chromatic tetrachords. Last twos transpositions of the first one.

(symmetric-series 0 :type '444-ooo :seed 56)
=> (2 3 1 0 6 7 5 4 10 11 9 8)

Type: 444-oor - three chromatic tetrachords. Second one transposition of the first one and
last one transposed retrograde of first one.

(symmetric-series 0 :type '444-oor :seed 56)
=> (2 3 1 0 6 7 5 4 8 9 11 10)

Type: 444-oro - three chromatic tetrachords. Second one transposed retrograde of the first
one and last one transposition of first one.

(symmetric-series 0 :type '444-oro :seed 56)
=> (2 3 1 0 4 5 7 6 10 11 9 8)

Type: 444-orr - three chromatic tetrachords, last twos transposed retrograde of the first.

(symmetric-series 0 :type '444-orr :seed 56)
=> (2 3 1 0 4 5 7 6 10 11 9 8)

Type: 444-oii - three chromatic tetrachords, last twos transposed inverse of the first.

(symmetric-series 0 :type '444-oii :seed 56)
=> (2 3 1 0 5 4 6 7 9 8 10 11)

Type: 444-oriri - three chromatic tetrachords, last twos transposed retrograde inverse of
the first.

(symmetric-series 0 :type '444-oriri :seed 56)
=> (2 3 1 0 7 6 4 5 11 10 8 9)
Opusmodus                                                             symmetric-series     3

Type: 444-orri - three chromatic tetrachords, second one transposed retrograde and last
one transposed retrograde inverse of the first.

(symmetric-series 0 :type '444-orri :seed 56)
=> (2 3 1 0 4 5 7 6 9 8 10 11)

Type: 444-oir - three chromatic tetrachords, second one transposed retrograde inverse and
last one transposed retrograde of the first.

(symmetric-series 0 :type '444-oir :seed 56)
=> (2 3 1 0 5 4 6 7 8 9 11 10)

Type: 444-ori - three chromatic tetrachords, the second one transposed retrograde and last
one transposed inverse of the first.

(symmetric-series 0 :type '444-ori :seed 56)
=> (2 3 1 0 4 5 7 6 9 8 10 11)

Type: 444-oiri - three chromatic tetrachords, the second one transposed inverse and last
one transposed retrograde inverse of the first.

(symmetric-series 0 :type '444-oiri :seed 56)
=> (2 3 1 0 5 4 6 7 11 10 8 9)

Type: 444-orii - three chromatic tetrachords, the second one transposed retrograde
inverse and last one transposed inverse of the first.

(symmetric-series 0 :type '444-orii :seed 56)
=> (2 3 1 0 7 6 4 5 9 8 10 11)

Type: 444-ooi - three chromatic tetrachords, the second one transposed and last one
transposed inverse of the first.

(symmetric-series 0 :type '444-ooi :seed 56)
=> (2 3 1 0 6 7 5 4 9 8 10 11)

Type: 444-oio - three chromatic tetrachords, the second one inverse and last one
transposition of the first.

(symmetric-series 0 :type '444-oio :seed 56)
=> (2 3 1 0 5 4 6 7 10 11 9 8)

Type: 444-orio three chromatic tetrachords, he second one retrograde inverse and last one
transposition of the first.

(symmetric-series 0 :type '444-orio :seed 56)
=> (2 3 1 0 7 6 4 5 10 11 9 8)
Opusmodus                                                                symmetric-series    4

Type: 444-oori - three chromatic tetrachords, the second one transposition and last one
transposed retrograde inverse of the first.

(symmetric-series 0 :type '444-oori :seed 56)
=> (2 3 1 0 6 7 5 4 11 10 8 9)

Type: ooo - three basilarly non-chromatic tetrachords. Last twos are transpositions of the
first one.

(symmetric-series 0 :type 'ooo :seed 56)
=> (0 7 6 9 4 11 10 13 8 15 14 17)

Type: orr - three basilarly non-chromatic tetrachords. Last twos are transposed retrograde of
the first.

(symmetric-series 0 :type 'orr :seed 56)
=> (0 7 6 9 13 10 11 4 17 14 15 8)

Type: oro - three basilarly non-chromatic tetrachords. Last twos are transposed retrograde
and transposed original of the first.

(symmetric-series 0 :type 'oro :seed 56)
=> (0 7 6 9 13 10 11 4 8 15 14 17)

Type: oor - three basilarly non-chromatic tetrachords. Last twos are transposed original and
transposed retrograde of the first.

(symmetric-series 0 :type 'oor :seed 56)
=> (0 7 6 9 4 11 10 13 17 14 15 8)
Opusmodus                                               symmetric-series   5

Examples:
(integer-to-pitch (symmetric-series 0 :type '66-hth :seed 429))
=> (e4 d4 c4 f4 eb4 cs4 bb4 gs4 fs4 b4 a4 g4)

(midi-to-pitch (symmetric-series 60 :type '66-hth :seed 429))




(midi-to-pitch (symmetric-series 60 :type ’66-hth))




(midi-to-pitch (symmetric-series 60 :type ’66-hih))
