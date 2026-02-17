Opusmodus                                                                           find-bar      1

find-bar n sequence
[Function]

Arguments and Values:
n                         a number or list of numbers.
sequence                  a sequence.


Description:

The ability to be able to print a notated score from OPUSMODUS output makes it much
easier to spot possible alternatives or errors. On the notated score the bars are numbers so it
makes sense to be able to search PLISTs or OMN code. The function FIND-BARS is able
to do this, and with its companion function REPLACE-BAR can be an invaluable tool.

The function FIND-BAR will return the n bar or bars, of a sequence.

(setf mat
      '((c4 db4 ab4 f4 g4 bb4) (a4 eb4 b4 e4 d4 gb4)
        (db4 ab4 f4 g4 bb4 a4) (eb4 b4 e4 d4 gb4 c4)))

(find-bar 3 mat)
=> ((db4 ab4 f4 g4 bb4 a4))

(find-bar '(1 3) mat)
=> ((c4 db4 ab4 f4 g4 bb4) (db4 ab4 f4 g4 bb4 a4))
