Opusmodus                                                                    ratio-to-tick   1

ratio-to-tick n &key ratio bpm
[Function]

Arguments and Values:
n                        an integer or list of ratios.
ratio                    a ratio. The default is 1/4.
bpm                      an integer. (beat per minute). The default is 60.


Description:

This functions converts ratio to tick values. It is at its most valuable when working away
from the divisive rhythm system of musical notation, for example in electroacoustic scores
where the norms of length notation and duration don't have to apply. All MIDI-based systems
have a tick resolution. OPUSMODUS has 256 ticks to the quarter beat. To create really
experiment or speculative rhythmic groupings ticks are often preferable to ratios.


Examples:
(ratio-to-tick 1/4)
=> 256

(ratio-to-tick 1/16)
=> 64

(ratio-to-tick '(1/20 2/20 2/20))
=> (52 103 103)

(ratio-to-tick '((1/20 2/20 2/20) (1/12 1/12 1/12)))
=> ((52 103 103) (86 86 86))
