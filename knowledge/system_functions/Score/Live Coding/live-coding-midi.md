Opusmodus                                                            live-coding-midi     1

live-coding-midi file-or-midi &key ignore-ports
[Function]

Arguments and Values:
file-or-midi            an integer (outer interval-size).
ignore-ports            NIL or T. The default is NIL.


Description:

LIVE CODING (sometimes referred to as 'on-the- y programming' or 'just in time
programming') is a programming practice centred upon the use of improvised interactive
programming. Live coding is often used to create sound and image based digital media, and
is popular now in computer music, combining algorithmic composition with improvisation.
OPUSMODUS joins software such as SuperCollider, Chuck, Max and Pure Data in featuring
live coding as a lively addition to its composing and improvising possibilities.

The LIVE CODING function can start by loading a pre-compiled midi- le or, as in the rst
example below, directly from program code.

I.

(setf
 chh (length-divide '(2 2) '(s gb2 ff - - - :repeat 16))
 ohh (length-divide '(2 2) '(-e bb2 f - - :repeat 8))
 snare (length-divide '(2 2) '(-q d2 ff :repeat 8))
 bass (length-divide '(1 1) '(e c2 fff - - = :repeat 8))
 )

(def-score drums1
             (:key-signature '(c maj)
              :time-signature '(4 4)
              :tempo 120
              :start 1 :end 4)

    (chh :omn chh :channel 10 :sound 'gm :program 0 :volume 127)
    (ohh :omn ohh)
    (snare :omn snare)
    (bass :omn bass)
)

(live-coding-midi (compile-score 'drums1))
                                               fl
                                                              fi
                                                                             fi
Opusmodus                                                         live-coding-midi   2

II.

The :output :live-coding option allows you to send the result of a PS function to
‘Live Coding Instrument’ in a live coding performance.

(progn
  (setf
   mat '((-w.)
         (h. eb4 pp q g3 -e q gs4 mf -s a5 p tie)
         (e. a5 -e q bb4 mf -s q cs5 p -s q. e5 mf -e.)
         (q cs5 p h. d5 mf -q c5 pp tie)
         (h c5 pp h. gs3 -e a4 p<)
         (h. fs5 mp q bb3 c5 p e4 mf tie)
         (h e4 -e q cs4 mp h d5 p e f4)
         (q d4 pp s eb4 < leg g4 < leg bb4 < leg a4 q. cs5 mf -e
          3q gs5 > leg fs5 > leg c5 > b4 > leg f4 leg e4)
         (t d4 p< leg eb4 < leg g4 f leg bb4 q. a4 marc
          t fs4 mf leg gs4 leg e. c5 e b4 t f5 leg e5 leg d5 leg eb5
          3q bb5 > a4 > bb5 > e a4 pp stacc -e)))

      (setf
       v1 (filter-density '(0.7 0.1 0.2 0.0 0.2 0.3 0.3) mat :type :length)
       v2 (filter-density '(0.0 0.2 0.0 0.2 0.2 0.4 0.3) mat :type :length)
       v3 (filter-density '(0.2 0.7 0.2 0.2 0.2 0.3 0.2) mat :type :length)
       v4 (filter-density '(0.0 0.2 0.2 0.7 0.2 0.2 0.7) mat :type :length))

      (setf
       vn1 (unfold 'om '(t7 dyn bti vn) v1)
       vn2 (unfold 'om '(t7 ? dyn bti vn) v2)
       vla (unfold 'om '(? ra dyn bti va) v3)
       vlc (unfold 'om '(t-12 t-5 ? a-12-12 dyn bti vc) v4))

      (ps 'gm :sq (list vn1 vn2 vla vlc)
          :tempo 68 :output :live-coding)
      )
Opusmodus                                                             live-coding-midi     3

The LIVE CODING panel will appear in Composer Navigator panel. Press the START
button.




Let the music play for a little and watch in the Counter Display (above) the BARS|BEATS
counter running in Bars, Beats and 1/16ths. The MIN.SEC counter is below, invaluable for
those situations where its essential to synchronise musical tempo to clock time.

The BEAT counter gives a clear indication of where in a bar the quarter beat is. Watch it
coincide with the BARS|BEATS counter. TEMPO is the nal indicator in this list. The LOOP
indicator is set ON but may be disabled by uncheck the ticked box.

Above is the START button and to its right the RESET BUTTON. Press this and the Counter
Display immediately resets itself restarting the music at bar 1.

The MUTE button silences the play of music but does not stop its ow. Useful for punching
in silences. The RANDOM control button select bars or beats at random.
                                                fi
                                                          fl
     Opusmodus                                                                  live-coding-midi      4

     The ORIGINAL TEMPO button re-establishes the Tempo in the Counter Display if a
     CUSTOM TEMPO is set. Clicking on CUSTOM TEMPO makes active the two buttons
     bellow SET TEMPO and the TEMPO NUMERAL button.

     This way of doing things means the composer / improviser can set up a new tempo without
     affecting the existing tempo and then cue the entry to a bar or beat.

     The next four control buttons and the horizontal green indicator are all linked to each other.
     They concern synchronicity - to the beginning of a BAR or to the beginning of a BEAT. The
      rst pair of control buttons give the option to sync the horizontal bar to BAR or BEAT.

     The second pair of control buttons work in a similar way to SET TEMPO and NUMERAL.
     The button BAR/BEAT NUMERAL allows a BAR or BEAT number (which ever is set up on
     the Control buttons above) to be cued up while the music is playing and then activated by
     pressing the SET POSITION button.

     As this group of controls are activated you'll see changes re ected in the position of the grey
     horizontal bar. This can be grapped by a mouse press and moved around to the right or left,
     or it can be clicked upon at any location on the bar and the music will revert instantly to that
     position.
fi
                                                            fl
