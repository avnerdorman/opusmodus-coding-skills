Opusmodus                                                   collect-score-instruments   1

collect-score-instruments score-name &optional instrument-number
[Function]

Arguments and Values:
score-name              a score name.
instrument-number       an integer (instrument number).


Description:

This function returns instrument events from a given score (DEF-SCORE).

Examples:

In this example we are loading a score from "~/Opusmodus/Scores" directory:

(load "~/Opusmodus/Scores/Bach/bach-gv-09.opmo")
(collect-score-instruments '+imported 1)
=> ((e b4 a4 b4 c5 d5 a4)
    (e d5 c5 b4 d5 q g5 tie)
    (e g5 s a5 g5 q fs5 e g5 fs5)
    . . .)

In this example we are getting a score from a midi le:

(setf bach (midi-to-score "Bach/bach-gv-var1.mid"))
(collect-score-instruments bach 1)
=> ((-h.) (-q g5 0.95 s b5c6 0.83 e. c6 0.64 tie)
    (e^z c6 0.64 s b5 0.76 a5 0.65 b5 a5 0.61
     g5 0.57 fs5 0.76 q g5 0.67 tie)
    . . .)
                                             fi
