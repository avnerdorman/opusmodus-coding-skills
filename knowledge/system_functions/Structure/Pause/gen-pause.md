Opusmodus                                                                         gen-pause    1

gen-pause sequence &key section exclude
[Function]

Arguments and Values:
sequence                  sequence of events.
section                   a list of integers (sublists to process).
exclude                   a list of integers (sublists excluded form process).


Description:

This function silences with a pause pitch and/or length lists in a composition.

(gen-pause '((c4 d4 e4 gb4) (c4 b3 gb4 c4)
             (c4 b3 g4 ab4) (c4 d4b3 e4gb4g4)) :section '(0 3))
=> ((nil) (c4 b3 gb4 c4) (c4 b3 g4 ab4) (nil))

Such a function is an invaluable aid to orchestration 'on-the- y'. It allows non-destructive
experimentation with the pitch or length contents of a list. You can effectively pause the
sounding out of a list.


Examples:
(gen-pause '((c4 cs4) (fs4 g4) (c5 f5) (fs5 b5)) :section '(0))
=> ((nil) (fs4 g4) (c5 f5) (fs5 b5))

(gen-pause '((q c4 d4 e4) (s f4 = - = -)
             (q ds4 e d5) (h c3)) :section '(0 3))
=> ((-h.) (s f4 = - = -) (q ds4 e d5) (-h))

(gen-pause '((q c4 d4 e4) (s f4 = - = -)
             (q ds4 e d5) (h c3)) :exclude '(0 3))
=> ((q c4 d4 e4) (-qs) (-q.) (h c3))

(gen-pause '((q c4 d4 e4) (s f4 = - = -)
             (q ds4 e d5) (h c3)))
=> ((-h.) (-qs) (-q.) (-h))

(gen-pause '((mp) (p) (mp) (pp ppp) (p mp)) :section '(0 2 4))
=> (nil (p) nil (pp ppp) nil)

(gen-pause '((-1/8 1/8) (1/4 1/8) (1/2 1/8)
             (1/8 1/4) (-1/8 1/2 -1/8)) :section '(0 2 4))
=> ((-1/4) (1/4 1/8) (-5/8) (1/8 1/4) (-3/4))
                                                            fl
     Opusmodus                                                                            gen-pause      2

     (gen-pause '((-1/8 1/8) (1/4 1/8) (1/2 1/8)
                  (1/8 1/4) (-1/8 1/2 -1/8)) :exclude '(0 2 4))
     => ((-1/8 1/8) (-3/8) (1/2 1/8) (-3/8) (-1/8 1/2 -1/8))


     Score Example:

     Many composers using OPUSMODUS think of a 'list' as they would a bar. When
     orchestrating it's often easier to ll the instrumental parts with musical content and then
     gradually erase sections of that content to achieve the required timbre mix. The function
     GEN-PAUSE allows the sounding out of musical activity to be managed across an ensemble
     of instruments.

     In the score example below a sextet of mixed instrumentation is used to demonstrate how a
      ve note pitch series is developed into a short toccata-like opening playing in unisons and
     octaves. Its orchestration is entirely managed by list of 'pauses' as, in effect, all instruments
     could play the same musical material all the time. Instead, each having their own list of
     pauses, hey play in a variety of different groupings as the music proceeds.

     Notice in this example how the orchestration is created by a series of binary lists created by
     GEN-BINARY-CHANGE.

     (setf motif '(c4 cs4 fs4 g4 c5))
     (setf mel (gen-loop 12 (rnd-sample (rndn 1 3 12) motif)))
     (setf mel-t (pitch-transpose '(0 1 6 1 7 6 1 0 -1 -6 -1 0) mel))
     (setf mel-t12 (pitch-transpose 12 mel-t))
     (setf mel-t-12 (pitch-transpose -12 mel-t))

     (setf rhy (gen-binary-change mel-t))
     (setf rhy-1 (binary-map rhy 's))

     (setf
      pn-rhy (gen-pause rhy-1 :section '(0 3 6 8 9 10 11))
      ma-rhy (gen-pause rhy-1 :section '(0 1 3 9 10))
      af-rhy (gen-pause rhy-1 :section '(0 4 8 9 11))
      bc-rhy (gen-pause rhy-1 :section '(0 10 11))
      vn-rhy (gen-pause rhy-1 :section '(0 1 10 11))
      vc-rhy (gen-pause rhy-1 :section '(0 7 10 11)))

     (setf
      rh-p (gen-pause mel-t :section '(0 3 6 8 9 10 11))
      lh-p (gen-pause mel-t-12 :section '(0 3 6 8 9 10 11))
      ma-p (gen-pause mel-t :section '(0 1 3 9 10))
      af-p (gen-pause mel-t :section '(0 4 8 9 11))
      bc-p (gen-pause mel-t-12 :section '(0 10 11))
      vn-p (gen-pause mel-t-12 :section '(0 1 10 11))
      vc-p (gen-pause mel-t12 :section '(0 7 10 11)))
fi
                                fi
Opusmodus                                                     gen-pause   3

(def-score sextet
           (:key-signature '(c maj)
            :time-signature (get-time-signature rhy-1)
            :tempo '(q 100))

     (piano-rh
      :omn (make-omn :length pn-rhy :pitch rh-p :velocity '(mf))
      :channel 1 :sound 'gm :program 'acoustic-grand-piano)

     (piano-lh
      :omn (make-omn :length pn-rhy :pitch lh-p :velocity '(mf))
      :channel 1 :program 'acoustic-grand-piano)

     (marimba
      :omn (make-omn :length ma-rhy :pitch ma-p :velocity '(mf))
      :channel 2 :program 'marimba :pan 100)

     (alto-flute
      :omn (make-omn :length af-rhy :pitch af-p :velocity '(mp))
      :channel 3 :program 'flute :pan 20)

     (bass-clarinet
      :omn (make-omn :length bc-rhy :pitch bc-p :velocity '(p))
      :channel 4 :program 'clarinet :pan 40)

     (violin
      :omn (make-omn :length vn-rhy :pitch vn-p :velocity '(mp))
      :channel 5 :program 'violin :pan 90)

     (violoncello
      :omn (make-omn :length vc-rhy :pitch vc-p :velocity '(mf))
      :channel 6 :program 'cello :pan 80))
