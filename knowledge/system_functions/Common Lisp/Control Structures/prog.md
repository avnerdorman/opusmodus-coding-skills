Opusmodus                                                                           prog     1

prog ({var | (var [init-form])}*) declaration* {tag | statement}*
[Macro]

Arguments and Values:
var                      variable name.
init-form                a form.
declaration              a declare expression.
tag                      a go tag.
statement                a compound form.


Description:

PROG binds the vars to the values of the inits in parallel (or to NIL for vars with no
corresponding init), and then executes the statements. The entire PROG form is
implicitly surrounded by a block named NIL (so that return may be used at any time to exit
from the construct), and the body is a TAGBODY. PROG returns NIL.


Examples:
(prog ((x 10) (y 5))
  (return (+ x y)))
=> 15

(prog () 'no-return-value)
=> nil
