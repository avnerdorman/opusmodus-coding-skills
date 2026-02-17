     Opusmodus                                   defun   1

     defun function-name form
     [Macro]

     Arguments and Values:
     function-name            a function name.
     form                     a form.


     Description:

     De ne a function at top level.


     Examples:
     (defun 1~ (list)
       (nth 0 list))

     (1~ '(0 1 2 3))
     => 0

     (defun fib (n)
       (if (or (= n 0) (= n 1))
        1
       (+ (fib (- n 1))
       (fib (- n 2)))))

     (fib 9)
     => 55

     (defun tail (list)
       (cdr list))

     (tail '(0 1 2 3))
     => (1 2 3)
fi
