Opusmodus                                                                        replace-bar   1

replace-bar n new sequence
[Function]

Arguments and Values:
n                         a number or list of numbers.
new                       bars.
sequence                  a sequence.


Description:

The ability to be able to print a notated score from OPUSMODUS output makes it much
easier to spot possible alternatives or errors. On the notated score the bars are numbered so it
makes sense to be able to search PLISTs or OMN code. The function REPLACE-BAR is a
companion function to FIND-BAR enabling the composer to replace individual bars or
indeed a sequence of bars with new material or with silence. It can be a powerful
orchestration function.

The function REPLACE-BAR can be used to replace n bar or bars in a sequence, with
another bar or bars.

(setf mat
     '((s c4 db4 ab4 f4 g4 bb4) (s a4 eb4 b4 e4 d4 gb4)
       (s db4 ab4 f4 g4 bb4 a4) (s eb4 b4 e4 d4 gb4 c4)))

(replace-bar 3 '((e a4 eb4 b4)) mat)
=> ((s c4 db4 ab4 f4 g4 bb4) (s a4 eb4 b4 e4 d4 gb4)
    (e a4 eb4 b4) (s eb4 b4 e4 d4 gb4 c4))
