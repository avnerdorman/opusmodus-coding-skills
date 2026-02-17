Opusmodus                                                                 omn-merge-ties   1

omn-merge-ties sequence
[Function]

Arguments and Values:
sequence                 omn sequence.


Description:

This function merge ties tie in phrases of omn into a single note or chord.

(omn-merge-ties '(q c4 p d4 f - - e e4g4 tie q. e4g4))
=> (q c4 p d4 f - - h e4g4)


Examples:
(omn-merge-ties
 '((e g6 f stacc ab5 mp ten c4 mf ten cs5 ff)
   (e c3 p tie s c3 tie c3 e eb3 mf stacc s bb4 pp tie bb4)))
=> ((e g6 f stacc ab5 mp ten c4 mf ten cs5 ff)
    (q c3 p e eb3 mf stacc bb4 pp))

(omn-merge-ties
 '(s c4 tie s c4 tie s c4 tie s c4 s d4 tie s d4 tie
   s d4 tie s d4 s e4 tie s e4 tie s e4
   t gs5 g5 fs5 f5 e5 -t s g4 tie s g4 tie
   s g4 tie s g4 tie s g4 tie s g4))
=> (q c4 d4 e. e4 t gs5 g5 fs5 f5 e5 - q. g4)
