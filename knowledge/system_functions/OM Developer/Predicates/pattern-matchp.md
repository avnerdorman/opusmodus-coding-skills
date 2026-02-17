Opusmodus                                                         pattern-matchp   1

pattern-matchp sequence pattern
[Function]

Arguments and Values:
sequence              a sequence.
pattern               a pattern.


Description:

Return true if pattern is found in the sequence, and NIL otherwise.


Examples:
(pattern-matchp '(1 2 3 4 5 6 7 8) '(2 ? 3))
=> nil

(pattern-matchp '(1 2 3 4 5 6 7 8) '(2 ? 4))
=> t
