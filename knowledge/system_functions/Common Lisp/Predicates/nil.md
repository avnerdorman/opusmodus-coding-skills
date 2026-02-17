Opusmodus                                                                               nil   1

nil
[Constant]


Description:

This object represents the logical false value and also the empty list. It can also be written
(). The value of NIL is always NIL.


Examples:
(setf x 'a)

(numberp x)
=> nil

(symbolp x)
=> t

(cond ((numberp x) 'true)
      (t 'false))
=> false
