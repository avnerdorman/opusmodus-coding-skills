Opusmodus                                                                          midi-to-score   1

midi-to-score midi &key velocity include-tracks quantize
[Function]

Arguments and Values:
midi                       a Midi le.
velocity                   controls how velocities will be represented.
                           :float - as a oating point number, :symbol - as a velocity symbol.
                           It loses precision. NIL - not imported at all. The default is :float.
include-tracks             is a track or list of tracks to import. It can be a track number,
                           a track name (string), or T, for all tracks. The default is T.
quantize                   a list of integers. The default is '(1 2 4).

Quantize Values:

1 = 1/4
2 = 1/8
3 = 1/12
4 = 1/16
5 = 1/20
7 = 1/28
8 = 1/32


Description:

Convert a MIDI instance into a SCORE instance.


Examples:
(midi-to-score "Bach/Cello/bach-cello1.mid" :velocity :symbol)

Example with quantize:

(midi-to-score "~/Opusmodus/Media/MIDI/Bach/GV/bach-gv-aria.mid"
                :quantize '(1 2 4 8))

Saving the score in the ‘Score’ directory:

(compile-score
 (midi-to-score "Bach/Cello/bach-cello1.mid" :velocity :symbol)
 :output :score :file "Bach/bach-cello1" :score-name 'bach-cello1)

(compile-score
 (midi-to-score "~/Opusmodus/Media/MIDI/Bach/GV/bach-gv-aria.mid"
                :quantize '(1 2 4 8))
 :output :score :file "Bach/GV-Aria" :score-name 'GV-Aria)
                          fi
                                  fl
