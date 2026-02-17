Opusmodus                                                                         insert-bar   1

insert-bar n new sequence
[Function]

Arguments and Values:
n                         a number or list of numbers.
new                       a sequence.
sequence                  a sequence.


Description:

The ability to be able to print a notated score from OPUSMODUS output makes it much
easier to spot possible alternatives or errors. On the notated score the bars are numbered so it
makes sense to be able to search PLISTs or OMN code. The function INSERT-BAR is a
companion function to FIND-BAR enabling the composer to insert individual bars or indeed
a sequence of bars with additional material or with silence. It can be a powerful
orchestration function.

(setf mat
      '((s c4 db4 ab4 f4 g4 bb4) (s a4 eb4 b4 e4 d4 gb4)
        (s db4 ab4 f4 g4 bb4 a4) (s eb4 b4 e4 d4 gb4 c4)))

(insert-bar 3 '((s c4cs4ds4)) mat)
=> ((s c4 db4 ab4 f4 g4 bb4) (s a4 eb4 b4 e4 d4 gb4)
    (s c4cs4ds4) (s db4 ab4 f4 g4 bb4 a4) (s eb4 b4 e4 d4 gb4 c4))

(insert-bar '(1 3 5) '((s c4cs4ds4)) mat)
=> ((s c4cs4ds4) (s c4 db4 ab4 f4 g4 bb4) (s c4cs4ds4)
    (s a4 eb4 b4 e4 d4 gb4) (s c4cs4ds4)
    (s db4 ab4 f4 g4 bb4 a4) (s eb4 b4 e4 d4 gb4 c4))
