Opusmodus                                                                            subseq   1

subseq sequence start &optional end
[Function]

Arguments and Values:
sequence               a proper sequence.
start, end             bounding index designators of sequence.
                       The defaults for start and end are 0 and NIL, respectively.


Description:

Return a copy of a subsequence of sequence starting with element number start and
continuing to the end of sequence or the optional end.


Examples:
(setf list '(1 2 3 4 5 6 7 8 9))

(subseq list 0 5)
=> (1 2 3 4 5)

(subseq list 2 4)
=> (3 4)

(setf string "012345")
=> "012345"

(subseq string 2)
=> "2345"
