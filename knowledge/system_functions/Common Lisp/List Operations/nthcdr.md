Opusmodus                                        nthcdr   1

nthcdr n list
[Function]

Arguments and Values:
n                      a non-negative integer.
list                   a list.


Description:

Performs the CDR function n times on a list.


Examples:
(nthcdr 0 '())
=> nil

(nthcdr 3 '())
=> nil

(nthcdr 0 '(a b c d))
=> (a b c d)

(nthcdr 1 '(a b c d))
     => (b c d)

(nthcdr 2 '(a b c d))
=> (c d)

(nthcdr 3 '(a b c d))
=> (d)

(nthcdr 4 '(a b c d))
=> nil
