Opusmodus                                                                             maplist   1

maplist function list &rest lists
[Function]

Arguments and Values:
function               a designator for a function that must take as many arguments
                       as there are lists.
list                   a proper list.
lists                  a proper list.


Description:

MAPLIST is like MAPCAR except that function is applied to successive sublists of the
lists. function is rst applied to the lists themselves, and then to the CDR of each
list, and then to the CDR of the CDR of each list, and so on.


Examples:
(maplist 'list '(a b c d))
=> (((a b c d)) ((b c d)) ((c d)) ((d)))

(mapcar 'car '((1 a) (2 b) (3 c)))
=> (1 2 3)

(maplist 'append '(a b c d) '(1 2))
=> ((a b c d 1 2) (b c d 2))
                fi
