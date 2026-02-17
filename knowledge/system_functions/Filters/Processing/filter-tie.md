Opusmodus                                                                                 filter-tie   1

filter-tie sequence &key section exclude omn
[Function]

Arguments and Values:
sequence                 a sequence. A list of pitches and lengths (in that order) or omn-form list.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
omn                      NIL or T. The default is NIL.


Description:

The function FILTER-TIE tie sequential pitch repeats and length on count of the repeat.

(filter-tie '(q d4 e4 f4 f4 f4 e g4 -))
=> (q d4 mf e4 h. f4 e g4 -)

(filter-tie '((-e c4 c4) (q d4 e4 f4 f4 f4 e g4 -)))
=> ((-e q c4 mf) (q d4 mf e4 h. f4 e g4 -))


Examples:
(filter-tie '(-q c4 f c4 p gliss d4 p e4 e4 e4 fermata))
=> (-q h c4 p gliss q d4 h. e4 fermata)

(filter-tie '((-q c4 d4 f4 e4) (q e4 f4 g4 a4)
              (e a4 a4 stacc g4 f4 = = q a4) (q a4 d4 f4 e4)))
=> ((-q c4 mf d4 f4 e4 tie) (q e4 mf f4 g4 a4 tie+stacc)
    (q a4 mf e g4 q. f4 q a4 tie) (q a4 mf d4 f4 e4))

Example with pitch and length lists:

(setf mat (filter-tie
           (list '(c4 c4 c4 d4 d4 e4) '(e e e e e e)) :omn t))
=> ((c4 d4 e4) (q. q e))

(1~ mat)
=> (c4 d4 e4)

(2~ mat)
=> (q. q e)
