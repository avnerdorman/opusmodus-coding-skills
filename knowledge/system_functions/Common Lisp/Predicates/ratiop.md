Opusmodus                                              ratiop   1

ratiop object
[Function]

Arguments and Values:
object                  an object.


Description:

Return true if object is a ratio, and NIL otherwise.


Examples:
(ratiop 4)
=> nil

(ratiop '(1/8))
=> nil

(ratiop '1/8)
=> t
