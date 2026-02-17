Opusmodus                                                               dotimes    1

dotimes (var count-form [result-form]) declaration* {tag | statement}*
[Macro]

Arguments and Values:
var                   a symbol.
count-form            a form.
result-form           a form.
declaration           a declare expression.
tag                   a go tag.
statement             a compound form.


Description:

Executes forms count-form times. On successive executions, var is bound to the
integers between zero and count-form. Upon completion, result-form is evaluated,
and the value is returned. If result-form is omitted, the result is NIL.


Examples:
(let ((result nil))
 (dotimes (i 10)
  (push (rndn 1 0 8) result))
 result)
=> (3 7 5 4 4 5 6 1 4 3)
