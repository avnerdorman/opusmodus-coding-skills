Opusmodus                                                                             t   1

t
[Constant]


Description:

The general truth value in COMMON LISP. T is a constant, a class, a stream, and a type. The
value of T is always T.


Examples:
(setf x 'a)

(numberp x)
=> nil

(symbolp x)
=> t

(cond ((numberp x) 'true)
      (t 'false))
=> false
