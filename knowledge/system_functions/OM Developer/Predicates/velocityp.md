Opusmodus                                                  velocityp   1

velocityp element
[Function]

Arguments and Values:
element                an object.


Description:

Return true if element is a velocity, and NIL otherwise.


Examples:
(velocityp 'p)
=> t

(velocityp 'ff)
=> t

(velocityp 0.34)
=> t

(velocityp 2)
=> nil
