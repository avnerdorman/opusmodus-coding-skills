Opusmodus                                                                    lengthp   1

lengthp element
[Function]

Arguments and Values:
element                 an object.


Description:

Return true if element is a length-note or length-rest, and NIL otherwise.


Examples:
(lengthp 'e..)
=> t

(lengthp '-q)
=> t

(lengthp 1/4)
=> t

(lengthp 2)
=> t
