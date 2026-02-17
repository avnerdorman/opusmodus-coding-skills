Opusmodus                                                                        assemble-seq    1

assemble-seq sequence
[Function]

Arguments and Values:
sequence                   sequence of lists or atoms.


Description:

Use this function to simplify the output of element-lists into a single multiple list structure. In
the example below ASSEMBLE-SEQ replaces the need for a sequence of CAR and CDR
functions to clear the output of unwanted parentheses. The ASSEMBLE-SEQ function is
particularly useful when a composer has collected and named short pieces of musical
material and wishes to evaluate this material within a list.


Examples:

Here's an example from a percussion solo for conga drums where ASSEMBLE-SEQ might be
required:

(setf c-1 '(c4 cs4)
      c-2 '(cs4 c4 d4)
      c-3 '(cs4 c4 cs4 d4)
      b-1 '(ds4 e4)
      b-2 '(ds4 e4 ds4)
      b-3 '(e4 e4 ds4 e4))

(setf p-solo
      (list c-1 c-2 (gen-repeat 2 c-3) '((c4 cs4 cs4) (cs4 d4cs4)) b-3))
=> ((c4 cs4) (cs4 c4 d4) (cs4 c4 cs4 d4 cs4 c4 cs4 d4)
    ((c4 cs4 cs4) (cs4 d4cs4)) (e4 e4 ds4 e4))

(assemble-seq p-solo)
=> ((c4 cs4) (cs4 c4 d4) (cs4 c4 cs4 d4 cs4 c4 cs4 d4)
    (c4 cs4 cs4) (cs4 d4cs4) (e4 e4 ds4 e4))

(assemble-seq c-1 c-2 (gen-repeat 2 ‘(c-3)) '((c4 cs4 cs4) (cs4 d4cs4)))
=> ((c4 cs4) (cs4 c4 d4) (cs4 c4 cs4 d4)
    (cs4 c4 cs4 d4) (c4 cs4 cs4) (cs4 d4cs4))
