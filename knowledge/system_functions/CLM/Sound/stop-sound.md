Opusmodus                                                           stop-sound   1

stop-sound ()
[Function]

Arguments and Values:
None

Description:

The function STOP-SOUND will stop any sound computed with WITH-SOUND macro.


Examples:
(with-sound ()
 (grani-synth 8 "marangona" 0.8
               :grain-duration 0.06
               :grain-density 40
               :grain-density-spread 5
               :grain-start '(0 0.3 1 0.4)))

(stop-sound)

or press Cmd/ESC keys.

To listen to the last computed sound again:

(play)
