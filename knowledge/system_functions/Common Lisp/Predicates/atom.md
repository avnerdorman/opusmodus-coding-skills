Opusmodus                                              atom   1

atom object
[Function]

Arguments and Values:
object                 an object.


Description:

Return true if object is an atom, and NIL otherwise.


Examples:
(atom 'a)
=> t

(atom 5)
=> t

(atom '(1 3))
=> nil

(atom '())
=> t

Empty list is an ATOM because () equal NIL.
