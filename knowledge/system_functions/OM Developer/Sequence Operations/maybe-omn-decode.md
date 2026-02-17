Opusmodus                                                                    maybe-omn-decode    1

maybe-omn-decode omn sequence
[Function]

Arguments and Values:
omn                     NIL or T. If true, the OMN style output is forced. The default is NIL.
sequence                a sequence.


Description:

Decode symbols into OMN style list.


Examples:
(length-span '1 '(1/4 -1/4 1/16 1/4 5/8 3/8 5/8))
=> (1/4 -1/4 1/16 1/4 3/16)

Same expression with :omn T

(length-span '1 '(1/4 -1/4 1/16 1/4 5/8 3/8 5/8) :omn t)
=> (q - s q e.)

Test:

(maybe-omn-decode t '(1/4 -1/4 1/16 1/4 3/16))
=> (q - s q e.)

Function with embedded MAYBE-OMN-DECODE:

(defun foo-rep (n sequence &key omn)
  (maybe-omn-decode omn
   (gen-repeat n sequence)))

(foo-rep 2 '(c4 c4 d4 d4 e4 e4))
=> (c4 c4 d4 d4 e4 e4 c4 c4 d4 d4 e4 e4)

(foo-rep 2 '(c4 c4 d4 d4 e4 e4) :omn t)
=> (c4 = d4 = e4 = c4 = d4 = e4 =)
