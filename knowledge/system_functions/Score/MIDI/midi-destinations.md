Opusmodus                                                      midi-destinations   1

 midi-destinations ()
[Function]


Description:

The MIDI-DESTINATION returns a list of names and numbers of your port setup.

(midi-destinations)
=> ((0 . "Bus 1") (1 . "Bus 2") (2 . "Bus 3")
    (3 . "Bus 4") (4 . "Session 1") (5 . "vPacarana"))


Example:
(right :omn rhand
       :port 0
       :channel 1
       :sound 'gm
       :program 0)

with port name:

(right :omn rhand
       :port "Bus 1"
       :channel 1
       :sound 'gm
       :program 0)
