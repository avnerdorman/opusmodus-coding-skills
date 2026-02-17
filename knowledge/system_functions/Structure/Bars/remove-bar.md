Opusmodus                                                             remove-bar    1

remove-bar n sequence
[Function]

Arguments and Values:
n                     a number or list of numbers.
sequence              a sequence.


Description:

The function REMOVE-BAR is a companion function to FIND-BAR enabling the composer
to remove individual bars or indeed a sequence of bars.

(setf sequence '((d3 b3 a3) (b3 d3 b3) (d3 g2 d3)
                 (b3 a3 b3) (d3 b3 d3)))

(remove-bar 2 sequence)
=> ((d3 b3 a3) (d3 g2 d3) (b3 a3 b3) (d3 b3 d3))

(remove-bar '(2 3) sequence)
=> ((d3 b3 a3) (b3 a3 b3) (d3 b3 d3))
