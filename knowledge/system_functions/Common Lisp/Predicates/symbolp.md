Opusmodus                                               symbolp   1

symbolp object
[Function]

Arguments and Values:
object                 an object.


Description:

Return true if object is a symbol, and NIL otherwise.


Examples:
(symbolp 'a)
=> t

(symbolp 'ab)
=> t

(symbolp 4)
=> nil

(symbolp '(a))
=> nil
