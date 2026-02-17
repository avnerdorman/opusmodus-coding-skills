Opusmodus                                                                 flatten-omn   1

flatten-omn sequence
[Function]

Arguments and Values:
sequence                    omn-form sequence.


Description:

The function FLATTEN-OMN attens to a single list sublists written in omn form.

(flatten-omn '((q c4 cs4 stacc fs4) (e f4 b4 tr2 c4 fermata)))
=> (q c4 cs4 stacc fs4 e f4 b4 tr2 c4 fermata)

(flatten-omn '(((stacc q c4 cs4 fs4)) (e f4 b4 tr2 c4 fermata)))
=> (q c4 stacc cs4 stacc fs4 stacc e f4 b4 tr2 c4 fermata)
                       fl
