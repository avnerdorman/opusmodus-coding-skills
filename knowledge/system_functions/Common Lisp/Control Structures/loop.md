Opusmodus                                                                            loop   1

loop {forms*}
[Macro]

Arguments and Values:
forms                    loop compound-form.


Description:

LOOP repeatedly evaluates forms and will continue until explicitly terminated by a throw,
RETURN, or GO. A set of extensions to LOOP is documented in Common Lisp: The
Language, chapter 26.


Examples:
(loop
  (format t "~%Hello world")
  (return t))
=> Hello world

Another way to make a LOOP is to use PROG LOOP ... GO LOOP structure:

(defun list-reverse (list)
  (prog (out)
    loop
    (and (null list) (return out))
    (setf out (cons (car list) out))
    (setf list (cdr list))
  (go loop)))

(list-reverse '(0 1 2 3 4))
=> (4 3 2 1 0)

Another example of the extended form of loop.

(loop for n from 1 to 10
     when (oddp n)
     collect n)
=> (1 3 5 7 9)
