Opusmodus                                                            cellular-automaton    1

cellular-automaton rule length initial-state
[Function]

Arguments and Values:
rule                    an integer.
length                  an integer.
initial-state           a binary list.


Description:

The CELLULAR-AUTOMATON function returns a list of binary values of the possible
elementary cellular automaton of arbitrary space length and for any given initial-
state. An elementary cellular automaton is a one-dimensional cellular automaton where
there are two possible states (labeled 0 and 1) and the rule to determine the state of a
cell in the next generation depends only on the current state of the cell and its two
immediate neighbours.

(cellular-automaton 10 90 '(0 0 0 0 0 0 1 0 0 0 0 0 0))
=> ((0 0 0 0 0 0 1 0 0 0 0 0 0)
    (0 0 0 0 0 1 0 1 0 0 0 0 0)
    (0 0 0 0 1 0 0 0 1 0 0 0 0)
    (0 0 0 1 0 1 0 1 0 1 0 0 0)
    (0 0 1 0 0 0 0 0 0 0 1 0 0)
    (0 1 0 1 0 0 0 0 0 1 0 1 0)
    (1 0 0 0 1 0 0 0 1 0 0 0 1)
    (1 1 0 1 0 1 0 1 0 1 0 1 1)
    (0 1 0 0 0 0 0 0 0 0 0 1 0)
    (1 0 1 0 0 0 0 0 0 0 1 0 1))
Opusmodus                                              cellular-automaton   2

Examples:
(setf rule30 (cellular-automaton 30 50 '(0 0 0 1 0 1 0 0 0 0)))
=> ((0 0 0 1 0 1 0 0 0 0) (0 0 1 1 0 1 1 0 0 0) (0 1 1 0 0 1 0 1 0 0)
    (1 1 0 1 1 1 0 1 1 0) (1 0 0 1 0 0 0 1 0 0) (1 1 1 1 1 0 1 1 1 1)
    (0 0 0 0 0 0 1 0 0 0) (0 0 0 0 0 1 1 1 0 0) (0 0 0 0 1 1 0 0 1 0)
    (0 0 0 1 1 0 1 1 1 1) (1 0 1 1 0 0 1 0 0 0) (1 0 1 0 1 1 1 1 0 1)
    (0 0 1 0 1 0 0 0 0 1) (1 1 1 0 1 1 0 0 1 1) (0 0 0 0 1 0 1 1 1 0)
    (0 0 0 1 1 0 1 0 0 1) (1 0 1 1 0 0 1 1 1 1) (0 0 1 0 1 1 1 0 0 0)
    (0 1 1 0 1 0 0 1 0 0) (1 1 0 0 1 1 1 1 1 0) (1 0 1 1 1 0 0 0 0 0)
    (1 0 1 0 0 1 0 0 0 1) (0 0 1 1 1 1 1 0 1 1) (1 1 1 0 0 0 0 0 1 0)
    (1 0 0 1 0 0 0 1 1 0) (1 1 1 1 1 0 1 1 0 0) (1 0 0 0 0 0 1 0 1 1)
    (0 1 0 0 0 1 1 0 1 0) (1 1 1 0 1 1 0 0 1 1) (0 0 0 0 1 0 1 1 1 0)
    (0 0 0 1 1 0 1 0 0 1) (1 0 1 1 0 0 1 1 1 1) (0 0 1 0 1 1 1 0 0 0)
    (0 1 1 0 1 0 0 1 0 0) (1 1 0 0 1 1 1 1 1 0) (1 0 1 1 1 0 0 0 0 0)
    (1 0 1 0 0 1 0 0 0 1) (0 0 1 1 1 1 1 0 1 1) (1 1 1 0 0 0 0 0 1 0)
    (1 0 0 1 0 0 0 1 1 0) (1 1 1 1 1 0 1 1 0 0) (1 0 0 0 0 0 1 0 1 1)
    (0 1 0 0 0 1 1 0 1 0) (1 1 1 0 1 1 0 0 1 1) (0 0 0 0 1 0 1 1 1 0)
    (0 0 0 1 1 0 1 0 0 1) (1 0 1 1 0 0 1 1 1 1) (0 0 1 0 1 1 1 0 0 0)
    (0 1 1 0 1 0 0 1 0 0) (1 1 0 0 1 1 1 1 1 0))

(binary-map rule30 's :omn t)
=> ((-s - - = - = - - - -) (-s - = = - = = - - -) (-s = = - - = - = - -)
    (s = - = = = - = = -) (s - - = - - - = - -) (s = = = = - = = = =)
    (-s - - - - - = - - -) (-s - - - - = = = - -) (-s - - - = = - - = -)
    (-s - - = = - = = = =) (s - = = - - = - - -) (s - = - = = = = - =)
    (-s - = - = - - - - =) (s = = - = = - - = =) (-s - - - = - = = = -)
    (-s - - = = - = - - =) (s - = = - - = = = =) (-s - = - = = = - - -)
    (-s = = - = - - = - -) (s = - - = = = = = -) (s - = = = - - - - -)
    (s - = - - = - - - =) (-s - = = = = = - = =) (s = = - - - - - = -)
    (s - - = - - - = = -) (s = = = = - = = - -) (s - - - - - = - = =)
    (-s = - - - = = - = -) (s = = - = = - - = =) (-s - - - = - = = = -)
    (-s - - = = - = - - =) (s - = = - - = = = =) (-s - = - = = = - - -)
    (-s = = - = - - = - -) (s = - - = = = = = -) (s - = = = - - - - -)
    (s - = - - = - - - =) (-s - = = = = = - = =) (s = = - - - - - = -)
    (s - - = - - - = = -) (s = = = = - = = - -) (s - - - - - = - = =)
    (-s = - - - = = - = -) (s = = - = = - - = =) (-s - - - = - = = = -)
    (-s - - = = - = - - =) (s - = = - - = = = =) (-s - = - = = = - - -)
    (-s = = - = - - = - -) (s = - - = = = = = -))
Opusmodus                                              cellular-automaton   3

(let ((shift 0))
 (list-plot
  (mapcar (lambda (x) (x+b x (incf shift)))
          (cellular-automaton 30 10 '(0 0 0 1 0 1 0 0 0 0)))
  :zero-based t :point-radius 2 :style :fill))
