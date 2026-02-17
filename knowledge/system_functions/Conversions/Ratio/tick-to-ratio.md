Opusmodus                                                                    tick-to-ratio   1

tick-to-ratio n &key ratio bpm
[Function]

Arguments and Values:
n                        an integer or list of integers.
ratio                    a ratio. The default is 1/4.
bpm                      an integer. (beat per minute). The default is 60.


Description:

This functions converts tick values to ratios. It is at its most valuable when working away
from the divisive rhythm system of musical notation, for example in electroacoustic scores
where the norms of length notation and duration don't have to apply. All MIDI-based systems
have a tick resolution. OPUSMODUS has 256 ticks to the quarter beat. To create really
experiment or speculative rhythmic groupings ticks are often preferable to ratios.


Examples:
(tick-to-ratio 384)
=> 3/8

(tick-to-ratio '(128 128 128))
=> (1/8 1/8 1/8)

(tick-to-ratio '((76 152 152) (128 128 128)))
=> ((1/13 1/7 1/7) (1/8 1/8 1/8))
