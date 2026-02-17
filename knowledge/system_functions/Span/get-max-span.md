Opusmodus                                                               get—max-span   1

get—max-span &rest lists
[Function]

Arguments and Values:
lists                  lists.


Description:

This function returns the largest span value from given lists. The GET-MAX-SPAN is a
companion to FIT-TO-SPAN function and can be useful by ensuring that all instruments in
the score end with the same span (bar count).


Examples:
(setf ins1 '((e g5 gs5 f q g5 - fs5)
             (-e gs5 b5 bb5 fs5 q bb5 e gs5)
             (q f5 f e c6 f5 -q cs6)
             (-q fs5 f 3q eb6 fs5 eb6 fs5 cs6 f5)))

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
