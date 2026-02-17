Opusmodus                                                                         null   1

null object
[Function]

Arguments and Values:
object                  an object.


Description:

Returns true if object is the empty list (), otherwise returns NIL. This is equivalent to
the function not, except that NULL is normally used to check for the empty list and not to
invert.


Examples:
(null ())
=> t

(null nil)
=> t

(null 'a)
=> nil
