Opusmodus                                                                 nth   1

nth n list
[Function]

Arguments and Values:
n                       a non-negative integer.
list                    a list.


Description:

NTH returns the n element of list where the CAR is the zero-th element.


Examples:
(nth 0 '(a b c d))
=> a

(nth 1 '(a b c d))
=> b

(nth 3 '(a b c d))
=> d

(nth 4 '(a b c d))
=> nil
