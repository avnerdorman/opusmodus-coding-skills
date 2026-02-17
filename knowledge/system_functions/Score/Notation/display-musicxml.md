Opusmodus                                                            display-musicxml   1

display-musicxml score
[Function]

Arguments and Values:
score                   score-name or *last-score*.


Description:

The DISPLAY-MUSICXML function will display score name or the last compiled score
*last-score* in the Notation Viewer window.

(display-musicxml 'score)

To display the last compiled score le:

(display-musicxml *last-score*)

The example below is an excellent model of how to score a short music example. Using
OMN notation in the material section means that you do not have to
specify :pitch, :length or :velocity separately in each part. Look at the short
example below to that these parameters are included in (right :omn rhand) and
(left :omn lhand).


Score Example:
(setf
 rhand '(e g4eb5 f stacc
         (arp e eb4bb4g5 g4eb5bb5 g5bb5eb6 eb5d6g6 g4eb5bb5 q bb4g5eb6)
         -q (acc e d4bb4) q bb5 fz (acc. e g4eb5) h. eb6 ffz)

 lhand '(e c4 f stacc
         (arp e eb4c5g5 g4eb5c6 c5g5eb6 eb5c6g6 g4eb5c6 q c5g5eb6)
         -q (acc e g5d6f6) q g4 fz (acc. e c4 g5 e6) h. c4 ffz))

(def-score arp
           (:title "Arpeggio Test"
            :key-signature '(eb maj)
            :time-signature '(3 4)
            :tempo '("Allegretto" q 76))

 (right :omn rhand :channel 1 :sound 'gm :program 0)
 (left :omn lhand))

(display-musicxml 'arp)
                           fi
