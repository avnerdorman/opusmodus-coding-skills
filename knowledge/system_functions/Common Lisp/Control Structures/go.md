Opusmodus                                                            go   1

go (tag)
[Special Form]

Arguments and Values:
tag                      a go tag.


Description:

Transfers control to the position in a TAGBODY referred to by tag.


Examples:
(tagbody
 (setf val 2)
 (go lp)
 (incf val 3)
 lp (incf val 4))
=> nil

val
=> 6

(defun list-reverse (list)
  (prog (out)
    loop
    (and (null list) (return out))
    (setf out (cons (car list) out))
    (setf list (cdr list))
  (go loop)))

(list-reverse '(0 1 2 3 4))
=> (4 3 2 1 0)
