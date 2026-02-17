Opusmodus                                                                          last   1

last list &optional n
[Function]

Arguments and Values:
list                    a list.
n                       a non-negative integer. The default is 1.


Description:

Return the last n conses (not the last n elements!) of a list). If list is (), last returns
().


Examples:
(last '(1 2 3 4 5))
=> (5)

(last '((1 2 3) (4 5) (6 7)))
=> ((6 7))

(last '(a b c) 0)
=> nil

(last '(a b c) 1)
=> (c)

(last '(a b c) 2)
=> (b c)

(last '(a b c) 3)
=> (a b c)

(last '(a b c) 4)
=> (a b c)
