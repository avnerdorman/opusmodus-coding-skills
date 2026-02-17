Opusmodus                                                list   1

list &rest objects
[Function]

Arguments and Values:
object                   an object.


Description:

Return constructs and returns a LIST of its arguments.


Examples:
(list 1)
=> (1)

(list '(a b c) '(e f g))
=> ((a b c) (e f g))

(list 'a 'b 'c)
=> (a b c)

(list (list 'a 'b 'c) (list 'd 'e 'f))
=> ((a b c) (d e f))
