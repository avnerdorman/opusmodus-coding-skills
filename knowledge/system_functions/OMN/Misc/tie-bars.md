Opusmodus                                                                                       tie-bars   1

tie-bars sequence &key section exclude
[Function]

Arguments and Values:
sequence                 a sequence (omn-form lists).
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

The TIE-BARS function inserts a tie attribute at the end of a list (bar) if the last pitch of
the list and the rst pitch of the next list is equal.

(tie-bars '((q c4 d4 e4 f4) (q f4 g4 a4) (q a4 b4 c5 stacc)))
=> ((q c4 d4 e4 f4 tie) (q f4 g4 a4 tie) (q a4 b4 c5 stacc))


Examples:
(setf mat '((e c3 g2 fs2 cs2 c2) (e c2 stacc cs2 fs2 g2 c3)
            (e c3 stacc g2 fs2 cs2 c2) (e c2 ten cs2 fs2 g2 c3)
            (e c3 g2 fs2 cs2 c2)))




(tie-bars mat)
=> ((e c3 g2 fs2 cs2 c2 tie+stacc) (e c2 cs2 fs2 g2 c3 tie+stacc)
    (e c3 g2 fs2 cs2 c2 tie+ten) (e c2 cs2 fs2 g2 c3 tie)
    (e c3 g2 fs2 cs2 c2))
         fi
Opusmodus                                                     tie-bars   2

In the following example we tie bars 2 and 3:

(tie-bars mat :section '(2 3))
=> ((e c3 g2 fs2 cs2 c2) (e c2 stacc cs2 fs2 g2 c3)
    (e c3 stacc g2 fs2 cs2 c2 tie+ten) (e c2 cs2 fs2 g2 c3)
    (e c3 g2 fs2 cs2 c2))
