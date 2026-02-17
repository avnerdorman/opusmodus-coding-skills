Opusmodus                                                                      dolist   1

dolist (var list-form [result-form]) declaration* {tag | statement}*
[Macro]

Arguments and Values:
var                     a symbol.
list-form               a form.
result-form             a form.
declaration             a declare expression.
tag                     a go tag.
statement               a compound form.


Description:

Evaluates list-form, which produces a list, and executes the body once for every element
in the list. On each iteration, var is bound to successive elements of the list. Upon
completion, result-form is evaluated, and the value is returned. If result-form is
omitted, the result is NIL.


Examples:
(setf temp2 '())
=> nil

(dolist (temp1 '(1 2 3 4) temp2)
 (push temp1 temp2))
=> (4 3 2 1)

(setf temp2 0)
=> 0

(dolist (temp1 '(1 2 3 4))
 (incf temp2))
=> nil

temp2
=> 4
