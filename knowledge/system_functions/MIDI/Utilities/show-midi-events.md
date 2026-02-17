Opusmodus                                                                        show-midi-events   1

show-midi-events input &key track-index
[Function]

Arguments and Values:
input                      a score name, an OMN snippet or a Midi le.
track-index                track number. The default is 1 (track or channel number).


Description:

Debugging function to see the midi events for a score, an OMN snippet or a Midi le.

(show-midi-events '(q c4 p d4 f e4 ppp))
=> (#<meta-event :sequence/track-name delta: 0 len: 10 "INSTRUMENT">
    #<meta-event :port-prefix delta: 0 len: 1 #(0)>
    #<midi-event :controller time: 0 delta: 0, chan: 0, (:reset-all-controllers): 0>
    #<midi-event :program-change time: 0 delta: 0, chan: 0, program number: 0>
    #<midi-event :controller time: 0 delta: 0, chan: 0, (:main-volume :msb): 92>
    #<midi-event :controller time: 0 delta: 0, chan: 0, (:pan :msb): 64>
    #<midi-event :note-on time: 0 delta: 0, chan: 0, note number: 60, velocity: 47>
    #<midi-event :note-off time: 256 delta: 256, chan: 0, note number: 60, velocity: 0>
    #<midi-event :note-on time: 256 delta: 0, chan: 0, note number: 62, velocity: 80>
    #<midi-event :note-off time: 512 delta: 256, chan: 0, note number: 62, velocity: 0>
    #<midi-event :note-on time: 512 delta: 0, chan: 0, note number: 64, velocity: 25>
    #<midi-event :note-off time: 768 delta: 256, chan: 0, note number: 64, velocity: 0>
    #<meta-event :end-of-track delta: 0 len: 0 #()>)


MIDI events for a Midi le:

(show-midi-events "~/Opusmodus/MIDI/Jazz/Jazz Trio.mid")

MIDI events for a score:

(show-midi-events 'Stage-29)

MIDI events form the *last-score*:

(show-midi-events *last-score* :track-index 0)
=> (#<meta-event :sequence/track-name delta: 0 len: 10 "SERIAL-MAP">
    #<meta-event :time-signature delta: 0 ts: 1/4 metro: 24/24 32nds: 8>
    #<meta-event :key-signature delta: 0 key: c maj>
    #<meta-event :set-tempo delta: 0 qpm: 96>
    #<meta-event :time-signature delta: 512 ts: 1/16 metro: 24/24 32nds: 8>
    #<meta-event :set-tempo delta: 64 qpm: 72>
    #<meta-event :time-signature delta: 128 ts: 1/4 metro: 24/24 32nds: 8>
    #<meta-event :time-signature delta: 256 ts: 2/4 metro: 24/24 32nds: 8>
    . . .)

(show-midi-events *last-score*)
                 fi
                                                            fi
                                                                                       fi
