Opusmodus                                                                            push     1

push item place
[Macro]

Arguments and Values:
item                     an object.
place                    a place, the value of which may be any object.


Description:

PUSH prepends item to the list that is stored in place, stores the resulting list in place,
and returns the list.


Examples:
(setf x '(a (b c) d))

x
=> (a (b c) d)

(push 2 (second x))
=> (2 b c)

and now:

x
=> (a (2 b c) d)

(let ((out nil))
  (dotimes (i 10)
    (push (rndn 1 0 11)
          out))
  out)
=> (8 1 7 6 3 1 3 10 5 2)
