Opusmodus                                                                               gen-rubin   1

gen-rubin n divide low high offset type direction intervals
                    &key ambitus seed

[Function]

Arguments and Values:
n                          an integer - size.
divide                     an integer - zone count.
low                        an integer - lowest zone.
high                       an integer - highest zone.
offset                     a list of integers - zone offset.
type                       'm (melody), 'c (chord) or '? (at random).
direction                  'd (descending) 'a (ascending) or '? (at random).
intervals                  a list of intervals.
ambitus                    instrument name or an integer list (low high). The default is 'piano.
seed                       NIL or integer. The default is NIL.


Description:

The RUBIN FUNCTIONS are based on composition by Ernesto Rubin de Curvin Op.6 per
pianoforte (1966). The piano range and the velocity is divided to 4 zones. They are made up
of 7 different sizes of pitch cluster: 3-4, 4-5, 7, 13-15, 5, 20-22, 31-33, each cluster requires a
different technique - st, open hand, elbow etc... The composition is divided to 94 lines
(section) with duration of 15 sec each. The score is beautifully realised in graphic notation.




                          (Ernesto Rubin de Curvin Op.6, Line 30, fragment)
               fi
Opusmodus                                                                       gen-rubin    2

This is a good example of how a composer's technique can be incorporated into
OPUSMODUS. This kind of function with so many arguments takes a little time and
experiment to learn - but it can be a most rewarding exercise.


Examples:
(gen-rubin 7 8 1 3 -6 'm 'd '(1 2 3) :ambitus 'violin :seed 8)
=> (c5 b4 bb4 g4 fs4 eb4 cs4)

(gen-rubin 12 8 1 3 -6 'm 'd '(1 2 3) :ambitus 'viola :seed 8)
=> (f4 e4 eb4 d4 cs4 bb3 g3 fs3 f3 e3 eb3 d3)

(gen-rubin 14 8 1 3 -6 'm 'd '(1 2 3) :ambitus 'violin :seed 8)
=> (c5 b4 bb4 a4 gs4 g4 e4 eb4 d4 cs4 c4 b3 bb3 a3)

(gen-rubin 7 8 1 3 -6 'm 'd '(1 2 3) :ambitus 'violin :seed 8)
=> (c5 b4 bb4 g4 fs4 eb4 cs4)

(gen-rubin 12 4 3 3 -1 'm 'd '(1 2 3) :ambitus 'piano :seed 8)
=> (c6 b5 gs5 g5 e5 cs5 c5 a4 gs4 f4 d4 cs4)

Here the function produce 12 pitches. It uses 4 of the 7 zones. The 3 3 argument restricts
the operation to just the third zone. The offset -1 argument gives a little tolerance to
enable the generator to go outside the range. The type is set to row and the direction is
down. The interval set '(1 2 3) allows for a semi-tone, a tone and a minor third.

(gen-rubin 12 5 1 5 -2 'm 'a '(1 3 4) :ambitus 'piano :seed 9865)
=> (bb2 d3 eb3 g3 gs3 a3 cs4 f4 fs4 bb4 d5 e5)

The example above shows how by having a larger range of zones so the music has a wider
register.

At random direction and type:

(gen-rubin 12 5 1 5 -2 '? '? '(1 3 4) :ambitus 'piano :seed 9865)
=> (cs4 f4 fs4 bb4 b4 c5 e5 gs5 a5 cs6 f6 g6)
