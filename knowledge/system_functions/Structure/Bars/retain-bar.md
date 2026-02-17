Opusmodus                                                                            retain-bar    1

retain-bar bar-numbers sequence
[Function]

Arguments and Values:
bar-numbers           A number or a list of numbers representing the bar indices to be retained.
sequence              omn form sequence.


Description:

The RETAIN-BAR function takes a omn sequence and retains only the bars speci ed by
the bars parameter. The bars that are not retained are replaced with pauses.

(setf sequence '((s d3 b3 a3) (e b3 d3 b3) (s d3 g2 d3)
                 (s b3 a3 b3) (s d3 b3 d3)))

(retain-bar 2 sequence)
=> ((-e.) (e b3 d3 b3) (-e.) (-e.) (-e.))

(retain-bar '(2 3) sequence)
=> ((-e.) (e b3 d3 b3) (s d3 g2 d3) (-e.) (-e.))




                                                                                      fi
