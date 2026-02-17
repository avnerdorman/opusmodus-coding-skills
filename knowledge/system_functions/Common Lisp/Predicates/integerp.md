Opusmodus                                                 integerp   1

integerp object
[Function]

Arguments and Values:
object                  an object.


Description:

Return true if object is an integer, and NIL otherwise.


Examples:
(integerp 4)
=> t

(integerp -4)
=> t

(integerp 'a)
=> nil

(integerp 0.34)
=> nil
