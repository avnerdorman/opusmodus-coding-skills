Opusmodus                                                                         listp   1

listp object
[Function]

Arguments and Values:
object                 an object.


Description:

Returns true if object is a cons or the empty list (), otherwise returns false.


Examples:
(listp '(a b c))
=> t

(listp '())
=> t

(listp 'a)
=> nil
