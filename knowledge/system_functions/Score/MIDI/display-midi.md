Opusmodus                                                         display-midi    1

display-midi file-or-midi &key ignore-ports auto-play
[Function]

Arguments and Values:
file-or-midi         an integer (outer interval-size).
ignore-ports         NIL or T. The default is NIL.
auto-play            NIL or T. The default is T.


Description:

The DISPLAY-MIDI function wraps around the COMPILE-SCORE function. It opens the
complied MIDI le and starts the playback in the MIDI Player window.

(display-midi file-or-midi)
             fi
     Opusmodus                                                                 display-midi   2



     It controls whether outboard MIDI ports are used or internal General MIDI sounds.
     The argument :ignore-ports controls whether outboard MIDI ports are used NIL
     (default) or internal General MIDI sounds T.

     (display-midi file-or-midi :ignore-ports t)

     The nal argument :auto-play allows the MIDI Player to open but without starting
     automatically. When the function :auto-play is set to T (default) then the midi player
     will start playing automatically after the compilation has taken place. When :auto-play is
     set to NIL the MIDI player opens but does not play until the play command is give.

     (display-midi file-or-midi :auto-play nil)

     To open and play the last compiled score le:

     (display-midi *last-score*)

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

     (display-midi (compile-score 'arp))
fi
                                       fi
