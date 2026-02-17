Opusmodus                                                            metronome   1

metronome sequence &key pitch velocity
[Function]

Arguments and Values:
sequence              omn-form and time-signature-form sequence.
pitch                 a pitch symbol. The default is c4.
velocity              a velocity value. The default is 0.7.


Description:

The function METRONOME returns an omn-form sequence which emulates a metronome
sound when used as an instrument in the DEF-SCORE instance.


Examples:
(setf omn
      '((h. cs3gs2as5cs5cs4as3gs3g3as4gs4g4 f arp)
        (-e g5d5g4 mp arp fs5ds5fs4 arp-down
            g5ds5g4 arp-down gs5e5gs4 arp)
        (-e - a5d5 f c6f5 d5b5 g5d5 gs5ds5 gs5e5)
        (-e h c6d5cs5g4cs4g3d3 p arp-down)))

With omn-form sequence:

(metronome omn)
=> ((q c4 0.8 bb3 0.65 bb3)
    (e c4 0.8 bb3 0.65 bb3 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3)
    (e c4 0.8 bb3 0.65 bb3 bb3 bb3))

With time-signature-form sequence:

(metronome '((3 4 1) (5 8 2) (4 4 1) (5 8 1)))
=> ((q c4 0.8 bb3 0.65 bb3)
    (e c4 0.8 bb3 0.65 bb3 bb3 bb3)
    (e c4 0.8 bb3 0.65 bb3 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3)
    (e c4 0.8 bb3 0.65 bb3 bb3 bb3))
Opusmodus                                                            metronome   2

(metronome '(4 4 32))
=> ((q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3)
    (q c4 0.8 bb3 0.65 bb3 bb3) (q c4 0.8 bb3 0.65 bb3 bb3))

DEF-SCORE with a metronome instrument only using a woodblock (General MIDI)
program:

(def-score metronome
           (:key-signature 'chromatic
            :time-signature '(4 4 32)
            :tempo 60)

  (metronome
    :omn (metronome '(4 4 32))
    :channel 16
    :sound 'gm
    :program 'woodblock)
  )
Opusmodus                                                    metronome   3

Score example with a METRONOME instrument:

(setf phrase-rh
      '((h. cs3gs2as5cs5cs4as3gs3g3as4gs4g4 f arp)
        (-e g5d5g4 mp arp fs5ds5fs4 arp-down
            g5ds5g4 arp-down gs5e5gs4 arp)
        (-e - a5d5 f c6f5 d5b5 g5d5 gs5ds5 gs5e5)
        (-e h c6d5cs5g4cs4g3d3 p arp-down)))

(setf phrase-lh
      '((-h.)
        (-e g3cs3 mp arp fs3b2 arp-down
            g3as2 arp-down gs3as2 arp)
        (-e - fs3c3 f fs3as2 g3cs3 a3as2 gs3c3 gs3cs3)
        (-q._q)))

(def-score metro
           (:key-signature 'chromatic
            :time-signature (get-time-signature phrase-lh)
            :tempo 60
            :layout (harp-grand-layout '(rh lh)))

  (metronome
   :omn (metronome phrase-lh)
   :channel 16
   :sound 'gm
   :program 'woodblock)

  (rh
   :omn phrase-rh
   :channel 1
   :sound 'gm
   :program 'orchestral-harp)

  (lh
    :omn phrase-lh)
  )
