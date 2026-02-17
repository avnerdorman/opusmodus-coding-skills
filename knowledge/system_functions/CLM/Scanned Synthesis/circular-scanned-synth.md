Opusmodus                                                                 circular-scanned-synth   1

circular-scanned-synth dur freq amp &key amp-env reverb-amount
                                       pts recompute-samps wave tension
                                       rampcentering cycles di a b c d bpm

[Function]

Arguments and Values:
dur                      omn-form list or lengths (number, ratio or length-symbol).
freq                     omn-form list, pitches or frequencies (hz).
amp                      omn-form list or velocities.
amp-env                  envelope. The default is '(0 0 10 1.0 90 1.0 100 0.0).
reverb-amount            number. Reverb. The default is 0.05.
pts                      number. Number of masses in string. The default is 128.
recompute-samps          number. The default is 192.
wave                     number. Waveforms: 1 = Full cycle Cosine, 2 = Triangular,
                         3 = Pulse and 4 = Overtones.
tension                  T or NIL. The default is T (tension ON).
rampcentering            T or NIL. The default is T (centering ON).
cycles                   number. Panning factors. The default is 1.
di                       number. Distance from speakers. The default is 1.
a                        number. Butter y intensity panning parameters. The default is 2.1.
b                        number. The default is 6.
c                        number. The default is 7.
d                        number. The default is 30.
bpm                      number. Beats per Minute. The default is 60.

Description:

Scanned synthesis Instrument with reverb and intensity panning (Butter y) parameters.


Examples:
(with-sound ()
  (circular-scanned-synth '(w d -q 3) '(c4 g4 eb4 a4) '(p pp mp)
                          :wave 1 :cycles 3))

(with-sound ()
  (circular-scanned-synth '(w d -q 3) '(c4 g4 eb4 a4) '(p pp mp)
                          :wave 2 :cycles 3))

(with-sound ()
  (circular-scanned-synth '(w d -q 3) '(c4 g4 eb4 a4) '(p pp mp)
                          :wave 3 :cycles 3))

(with-sound ()
  (circular-scanned-synth '(w d -q 3) '(c4 g4 eb4 a4) '(p pp mp)
                          :wave 4 :cycles 3))
                                fl
                                                                     fl
Opusmodus                                                circular-scanned-synth   2

Example with two instruments:

(progn
 (defparameter size 24)
 (setf partials1 (library 'tbn-cs3-partials 'partials nil :random 50))
 (setf partials2 (library 'tbn-cs3-partials 'partials nil :random 50))
 (setf par1 (rnd-sample size (partial :freq (flatten partials1))))
 (setf par2 (rnd-sample size (partial :freq (flatten partials2))))
 (defparameter dur1 (rnd-sample size '(1 2 3 4 5)))
 (defparameter dur2 (rnd-sample size '(1 2 3 4 5)))
 (defparameter freq1 (gen-divide (rnd-sample size '(2 3 4 5)) par1))
 (defparameter freq2 (gen-divide (rnd-sample size '(2 3 4 5)) par2))
 (defparameter amp1 (rndn size .05 .43))
 (defparameter amp2 (rndn size .05 .43))
 (defparameter env
               '((0 0 40 .1000 60 .2000 75 1 90 1 100 0)
                 (0 0 60 .1000 80 .2000 90 1 100 0)
                 (0 0 10 1 16 0 32 .1000 50 1 100 0)
                 (0 0 30 1 56 0 60 0 90 .3000 100 0)
                 (0 0 50 1 80 .3000 100 0)
                 (0 0 40 .1000 60 .2000 82 1 100 0)
                 (0 0 10 1 32 .1000 50 1 100 0)
                 (0 0 60 .1000 80 .3000 95 1 100 0)
                 (0 0 80 .1000 90 1 100 0)))

    (with-sound (:reverb jc-reverb)
     (circular-scanned-synth
      dur1 freq1 amp1
      :wave (rnd-sample size '(1 2 3 4))
      :recompute-samps (rnd-sample size '(14 222 32 162 211 72))
      :pts (rnd-sample size '(192 256 512))
      :cycles (rnd-sample size '(1 2 3))
      :amp-env (rnd-sample size env))

        (circular-scanned-synth
         dur2 freq2 amp2
         :wave (rnd-sample size '(1 2 3 4))
         :recompute-samps (rnd-sample size '(14 222 32 162 211 72))
         :pts (rnd-sample size '(192 256 512))
         :cycles (rnd-sample size '(1 2 3))
         :amp-env (rnd-sample size env))
    )
)
     Opusmodus                                                               circular-scanned-synth         3

     ---------------------------------------------------------
     CLM instrument: circular-scanned.ins
     This is a scanned synthesis clm instrument with reverb and intensity panning (Butter y)
     parameters. The scanned synthesis algorithm is based on Bill's scheme code, which is a
     simpli cation of the underlying table- lling routine for "scanned synthesis" and a uniform-circular-
     string. Waveforms can alter the string to some extend.

     For more info read Bill Verplank and Max Mathews paper "Scanned Synthesis", Proc. of
     ICMC-2001 Berlin. This instrument by Juan Reyes with help from Bill Schottstaedt.

     (with-sound () (circular-scanned 0 4 400 .5))
     (with-sound () (circular-scanned 0 2 400 .5 :cycles 3))
     (with-sound () (circular-scanned 0 8 400 0.4 :cycles 2 :wave 3))
     (with-sound () (circular-scanned 0 8 400 0.5 :wave 2))
     (with-sound (:reverb jc-reverb) (circular-scanned 0 8 100 0.5 ))
     (with-sound (:reverb jc-reverb) (circular-scanned 0 8 400 0.5 :wave 4))

     ---------------------------------------------------------
fi
                                   fi
                                                                                     fl
