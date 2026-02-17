Opusmodus                                                             quarter-tone-closest   1

quarter-tone-closest sequence
[Function]

Arguments and Values
sequence                  a pitch or omn-form sequence.


Description

This function convert pitches with 3 quarter-tone alteration to 1 quarter-tone alteration.


Examples:
(quarter-tone-closest
 '(cs4 cs4+ as4+d4+ d4 b4- a4+ gb4- ab4- eb4))
=> (cs4 d4- b4-d4+ d4 b4- a4+ f4+ g4+ eb4)

OMN:

(quarter-tone-closest
 '((q cs4 cs4+ e as4+d4+ d4) (s b4- a4+ gb4- ab4- q eb4)))
=> ((q cs4 d4- e b4-d4+ d4) (s b4- a4+ f4+ g4+ q eb4))
