Opusmodus                                                                                apply    1

apply function arg &rest arguments
[Function]

Arguments and Values:
function                  a function designator.
arguments                 a spreadable argument list designator.


Description:

APPLY function to a list of arguments produced by evaluating arguments in the
manner of list. That is, a list is made of the values of all but the last argument, appended to
the value of the last argument, which must be a list.


Examples:
(setf x '(1 2 3))

x
=> (1 2 3)

(apply '+ '(1 2 3))
=> 6

(apply '- x)
=> -4

(apply 'max x)
=> 3

(apply 'min x)
=> 1
