Opusmodus                                                                   integer-invert   1

integer-invert n
[Function]

Arguments and Values:
n                         a list or lists of integers.


Description:

In OPUSMODUS the composer can create highly original pitch and rhythm schemes by
using integers as source material. Use this function to swap positive integers for their
negative equivalents and vice versa. It can be a useful in orchestration or chord-voicing.


Examples:
(integer-invert '(2 -2 0 5 -7 2))
=> (-2 2 0 -5 7 -2)

(setf intervals '(2 -2 0 5 -7 2))

(interval-map 'c4 intervals)
=> (c4 d4 c4 c4 f4 bb3 c4)

When viewing pitch output from interval map remember that the rst pitch will be the
base 0.

(interval-map 'c4 (integer-invert intervals))
=> (c4 bb3 c4 c4 g3 d4 c4)

(interval-map 'd4 (integer-invert intervals))
=> (d4 c4 d4 d4 a3 e4 d4)
                                                              fi
