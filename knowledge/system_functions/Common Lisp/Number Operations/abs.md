Opusmodus                                         abs   1

abs number
[Function]

Arguments and Values:
number                  a number.


Description:

ABS returns the absolute value of number.


Examples:
(abs 0)
=> 0

(abs 12/16)
=> 3/4

(abs -1.09)
=> 1.09

(abs -12)
=> 12

(mapcar 'abs '(1 -3 5 -7 8))
=> (1 3 5 7 8)

(setf n-lists '((1 -3 5 -7 8) (3 -11 4 6 -13)))

(mapcar #'(lambda (x) (mapcar 'abs x)) n-lists)
=> ((1 3 5 7 8) (3 11 4 6 13))
