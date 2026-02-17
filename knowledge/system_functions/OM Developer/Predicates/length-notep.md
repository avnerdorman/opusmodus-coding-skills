Opusmodus                                                     length-notep   1

length-notep element
[Function]

Arguments and Values:
element                an object.


Description:

Return true if element is a length-note, and NIL otherwise.


Examples:
(length-notep 'e..)
=> t

(length-notep 1/4)
=> t

(length-notep 2)
=> t

(length-notep '-q)
=> nil
