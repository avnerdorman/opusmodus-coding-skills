Opusmodus                                           funcall   1

funcall function &rest arguments
[Function]

Arguments and Values:
function              a function designator.
arguments             arguments to the function.


Description:

Call function with the given arguments.


Examples:

FUNCALL applies function to individual arguments.

(funcall '+ 1 2 3)
=> 6

(funcall 'max 1 2 3)
=> 3

APPLY applies function to a list of arguments.

(apply '+ '(1 2 3))
=> 6
