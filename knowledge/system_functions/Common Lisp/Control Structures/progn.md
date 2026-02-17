Opusmodus                                                                       progn   1

progn (forms*)
[Special Form]

Arguments and Values:
forms                   an implicit progn.


Description:

PROGN evaluates forms, in the order in which they are given. The values of each form but
the last are discarded. If PROGN appears as a top level form, then all forms within that
PROGN are considered by the compiler to be top level forms.


Examples:
(progn)
=> nil

(progn 1 2 3)
=> 3

(progn (values 1 2 3))
=> 1, 2, 3

(setf a 1)
=> 1

(if a
 (progn (setf a nil) 'here)
 (progn (setf a t) 'there))
=> here

a
=> nil
