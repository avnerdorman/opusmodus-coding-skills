Opusmodus                                                                      return     1

return (result)
[Macro]

Arguments and Values:
result                  a form evaluated. The default is NIL.


Description:

Used to RETURN from a block or from constructs such as do and PROGN. Returns from a
block named NIL, and the block as a whole returns the value of result. If result is not
supplied, NIL is returned.


Examples:
(block nil (return) 1)
=> nil

(block nil (return 1) 2)
=> 1

(defun get-pos (position list)
 (prog (result element)
  (dotimes (i (length position))
   (setf element (nth (- (car position) 1) list))
   (setf position (cdr position))
   (setf result (cons element result)))
 (return (nreverse result))))

(get-pos '(2 4) '(a b c d e f g))
=> (b d)
