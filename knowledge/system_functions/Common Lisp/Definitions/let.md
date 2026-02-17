Opusmodus                                                                           let   1

let ({var | (var [init-form])}*) declaration* form*
let* ({var | (var [init-form])}*) declaration* form*
[Special Form]

Arguments and Values:
var                      a symbol.
init-form                a form.
declaration              a declare expression.
form                     a form.


Description:

LET and LET* create new variable bindings and execute a series of forms that use these
bindings. LET performs the bindings in parallel and LET* does them sequentially.


Examples:
(setf x 20)
=> 20

(let ((x 10) (y (+ x 1)))
  (list x y))
=> (10 21)

(let* ((x 10) (y (+ x 1)))
 (list x y))
=> (10 11)

Let form is no different from de ning parameter to anonymous function.

(let ((x 20) (y (+ 1 1)))
  (+ x y))
=> 22

((lambda (x y) (+ x y)) 20 (+ 1 1))
=> 22

(defun size (list)
  (let ((n (length list)))
   (cond ((lessp n 10) 'smal)
         ((lessp n 100) 'medium)
         (t 'large))))

(size '(1 2 3 4))
=> smal
                          fi
Opusmodus                           let   2

(size '(1 2 3 4 5 6 7 8 9 10 11))
=> medium

(size (gen-integer 1 101))
=> large

(let ((result nil))
  (dotimes (i 10)
  (push (rndn 1 -5 5) result))
   result)
=> (-3 -2 1 4 -1 2 -5 -1 -1 0)
