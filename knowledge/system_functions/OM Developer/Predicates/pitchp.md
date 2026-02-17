Opusmodus                                               pitchp   1

pitchp element
[Function]

Arguments and Values:
element                an object.


Description:

Return true if element is a pitch, and NIL otherwise.


Examples:
(pitchp 'c4)
=> t

(pitchp 'gs4)
=> t

(pitchp 'c4g4)
=> nil
