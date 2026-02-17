Opusmodus                                                             join-attributes   1

join-attributes list
[Function]

Arguments and Values:
list                   a list of attributes (articulation symbols).


Description:

The function JOIN-ATTRIBUTES merges a list of attributes into one articulation.


Examples:
(join-attributes '(leg ponte))
=> leg+ponte

(join-attributes '(leg+ponte stacc))
=> leg+ponte+stacc
