Opusmodus                                                          twelve-tonep   1

twelve-tonep sequence
[Function]

Arguments and Values:
sequence               a list (pitch or integer).


Description:

Return true if sequence is a twelve-tone row, and NIL otherwise.


Examples:
(twelve-tonep '(4 10 1 3 5 2 6 8 9 11 7 0))
=> t

(twelve-tonep '(e4 bb4 cs4 ds4 f4 d4 fs4 gs4 a4 b4 g4 c4))
=> t

(twelve-tonep '(e4 bb4 cs4 ds4 f4 d4 fs4 gs4 a4 b4 f4 c4))
=> nil
