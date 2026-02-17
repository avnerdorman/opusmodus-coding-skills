Opusmodus                                                     length-restp   1

length-restp element
[Function]

Arguments and Values:
element                 an object.


Description:

Return true if element is a length-rest, and NIL otherwise.


Examples:
(length-restp '-e..)
=> t

(length-restp -1/4)
=> t

(length-restp -2)
=> t

(length-restp 'q)
=> nil
