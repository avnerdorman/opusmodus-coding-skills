Opusmodus                                                     collect-instrument-controllers   1

collect-instrument-controllers score-name
                                                          &optional instrument-number

[Function]

Arguments and Values:
score-name              a score name.
instrument-number       an integer (instrument number).


Description:

This function returns instrument controller values from a given score (DEF-SCORE).

Examples:

In this example we are loading a score from "~/Opusmodus/Scores" directory:

(load "~/Opusmodus/Scores/Bach/bach-gv-09.opmo")
(collect-instrument-controllers '+imported 1)
=> nil

Instrument number 1 from the imported score does not include any controllers.

(setf mozart (midi-to-score "Mozart/mozart.mid"))
(collect-instrument-controllers mozart 2)
=> (91 ((70)))

In this example, instrument number 2 returns controller 91 with its value ((70)).
