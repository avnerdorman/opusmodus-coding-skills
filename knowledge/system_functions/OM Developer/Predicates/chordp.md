Opusmodus                                               chordp   1

chordp element
[Function]

Arguments and Values:
element                an object.


Description:

Return true if element is a chord, and NIL otherwise.


Examples:
(chordp '(c 7))
=> t

(chordp 'c4d4)
=> t

(chordp 'c4)
=> nil
