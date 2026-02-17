Opusmodus                                                            length-note-unique   1

length-note-unique length
[Function]

Arguments and Values:
length                  a sequence of length or OMN form sequence.


Description:

This function returns a list of unique length note values.

(length-note-unique
 '((1/16 1/4 1/16 3/16 1/16 -1/4 1/8)
   (1/16 1/8 1/16 1/8 1/8 -1/8 1/8 -1/4)))
=> (1/16 1/8 3/16 1/4)

(length-note-unique
 '((e. s == e. - 5q == = =)
   (s ==== s - = - = s - = - = =)))
=> (1/20 1/16 1/10 1/8 3/16 1/4)


Examples:
(setf mixed-len
      (gen-tuplet 1 5 'd '? '(q q h) '((4 3 4) (5 4 7) (2 5 8) (5 5 5))
                  :seed 45 :omn t))
=> ((e. -s -3q - = e - - -)
    (5qqq -5q = -s e. 7hhhhh -7h -)
    (-e = 5qqq -5q - s = - - - - e)
    (5q = - - - - - - - = 5w -5h - -))

(length-note-unique mixed-len)
=> (1/20 1/16 1/12 1/8 3/20 3/16 1/5 5/14)

OMN:

(length-note-unique
 '(e. g3 s b3 - d4 g4 s a4 s e
   s - g4 - fs4 e4 e. fs4 s g4 - a4))
=> (1/16 1/8 3/16)
