Opusmodus                                                      twelve-tone-segmentp   1

twelve-tone-segmentp sequence
[Function]

Arguments and Values:
sequence               a list (pitch or integer).


Description:

Return true if sequence is a twelve-tone row or segment, and NIL otherwise.


Examples:
(twelve-tone-segmentp '(4 10 1 3 5 2 6 8))
=> t

(twelve-tone-segmentp '(e4 bb4 cs4 ds4 a4 b4 g4 c4))
=> t

(twelve-tone-segmentp '(e4 bb4 cs4 ds4 f4 d4 fs4 gs4 a5))
=> nil
