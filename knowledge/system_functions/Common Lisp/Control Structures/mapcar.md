Opusmodus                                                                                     mapcar    1

mapcar function list &rest lists
[Function]

Arguments and Values:
function                 a designator for a function that must take as many arguments as there are lists.
list                     a proper list.
lists                    a proper list.


Description:

MAPCAR operates on successive elements of the lists. First the function is applied to
the CAR of each list, then to the CADR of each LIST, and so on. The iteration terminates
when the shortest LIST runs out, and excess elements in other lists are ignored. The
value returned by MAPCAR is a list of the results of the successive calls to the function.


Examples:
(mapcar 'list '(a b c d))
=> ((a) (b) (c) (d))

(mapcar 'list '(a b c d) '(1 2 3 4))
=> ((a 1) (b 2) (c 3) (d 4))

(mapcar 'abs '(1 -2 3 -4 5))
=> (1 2 3 4 5)
