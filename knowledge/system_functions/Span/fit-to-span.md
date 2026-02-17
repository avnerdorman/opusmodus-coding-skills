Opusmodus                                                                  fit-to-span      1

fit-to-span span sequence &key extend
[Function]

Arguments and Values:
span                    an integer or ratio.
sequence                omn-form sequence.
extend                  'e (end) or 's (start). The default is 'e.


Description:

The function FIT-TO-SPAN reduces or expands the total length of the sequence to a given
span. If the sequence length is lower than the span value, additional rest values will be
added at the end of the sequence by default. With the :extend keyword set too 's the rest
values will be inserted at the beginning of the sequence.

(fit-to-span 4/4 '(e c4 d4 e4 f4))
=> (e c4 d4 e4 f4 -h)

(fit-to-span 4/4 '(e c4 d4 e4 f4) :extend 's)
=> (-h e c4 d4 e4 f4)


Examples:
(fit-to-span 12 '(h.. g7 pp ws bb6 h.. g6 we b6 ws eb7
                  w fs6 eb6 h... gs6 we c6 h... bb6))
=> (h.. g7 pp ws bb6 h.. g6 we b6 ws eb7
    w fs6 eb6 h... gs6 we c6 h... bb6 -d)
Opusmodus                                                                      fit-to-span    2

(fit-to-span 12 '(h.. g7 pp ws bb6 h.. g6 we b6 ws eb7
                  w fs6 eb6 h... gs6 we c6 h... bb6) :extend 's)
=> (-d h.. g7 pp ws bb6 h.. g6 we b6 ws eb7
    w fs6 eb6 h... gs6 we c6 h... bb6)




(fit-to-span 5 '((h.. g7 pp ws bb6 h.. g6 we b6 ws eb7 w fs6 eb6)
                 (h... gs6 we c6 h... bb6)))
=> ((h.. g7 pp ws bb6 h.. g6 we b6 ws eb7))




(fit-to-span 5 '((h.. g7 pp ws bb6 h.. g6 we b6 ws eb7 w fs6 eb6)
                 (h... gs6 we c6 h... bb6)) :extend 's)
=> ((w fs6 pp eb6) (h... gs6 pp we c6 h... bb6))




This function can be useful by ensuring that all instruments in the score end with the same
span (bar count).

(setf ins1 '((e g5 gs5 f q g5 - fs5)
             (-e gs5 b5 bb5 fs5 q bb5 e gs5)
             (q f5 f e c6 f5 -q cs6)
             (-q fs5 f 3q eb6 fs5 eb6 fs5 cs6 f5)))
Opusmodus                                                    fit-to-span   3

(setf ins2 '((q c4f4b3 b2 f d3 gs4d5)
             (q gs3cs4 g2 bb2 bb4e4)
             (h eb4a4e4eb5 eb3)
             (q d5e4gs4 d3 g2 cs4d4)
             (q e4bb4 bb2 eb3 e4eb5a4)
             (q fs5c5 fs3 bb2 f4e4)))

(setf score-span (get-max-span ins1 ins2))
=> 6

(fit-to-span score-span ins1)
=> ((e g5 gs5 f q g5 - fs5) (-e gs5 f b5 bb5 fs5 q bb5 e gs5)
    (q f5 f e c6 f5 -q cs6) (-q fs5 f 3q eb6 fs5 eb6 fs5 cs6 f5)
    (-d))
