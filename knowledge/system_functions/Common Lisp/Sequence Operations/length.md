Opusmodus                                           length   1

length sequence
[Function]

Arguments and Values:
sequence                a proper sequence.


Description:

Return an integer that is the length of sequence.


Examples:
(length '(a b c d))
=> 4

(length '((a b c d) (e f g h)))
=> 2

(mapcar 'length '((a b c d) (e f g h)))
=> (4 4)
