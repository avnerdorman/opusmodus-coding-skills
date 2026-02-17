Opusmodus                                                         disjoin-attributes    1

disjoin-attributes element
[Function]

Arguments and Values:
element                an object (articulation symbol).


Description:

The function DISJOIN-ATTRIBUTES separates a combined articulations into a list of its
individual attributes.


Examples:
(disjoin-attributes 'leg+ponte)
=> (leg ponte)

(disjoin-attributes 'leg+ponte+stacc)
=> (leg ponte stacc)
