Opusmodus                                                                    scanned-synth      1

scanned-synth dur freq amp &key pts recompute-samps scale wave
                      tension rampcentering damp-env cent-env bpm

[Function]

Arguments and Values:
dur                     omn-form list or lengths (number, ratio or length-symbol).
freq                    omn-form list, pitches or frequencies (hz).
amp                     omn-form list or velocities.
pts                     number. Number of masses in string. The default is 256.
recompute-samps         number. The default is 192.
scale                   number. The default is 1.
wave                    number. Waveforms: 1 = Full cycle Cosine, 2 = Full Cycle Sine,
                        3 = Simple Pluck 4 = Triangular, 5 = Pulse, 6 = Unidirectional Pulse,
                        7 = Another Pulse, 8 = Sawtooth, 9 = Inverted Sawtooth,
                        10 = Exponential, 11 = Random Centering, 12 = Overtones
                        and 13 = Henon. The default is 1.
tension                 T or NIL. The default is T (tension ON).
rampcentering           T or NIL. The default is T (centering ON).
damp-env                envelope. Damping envelope.
                        The default is '(0 0 25 75 50 5 100 20).
cent-env                envelope. Centering envelope. The default is '(0 0 50 1.25 100 0).
bpm                     number. Beats per Minute. The default is 60.


Description:

Scanned synthesis Instrument.


Examples:
(with-sound ()
  (scanned-synth '(e = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 1))

(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 2))

(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 3))
(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 4))

(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 5))

(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 7))
Opusmodus                                                       scanned-synth   2

(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 8))

(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 9))

(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 10))

(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 11))

(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 12))

(with-sound ()
  (scanned-synth '(q = = =) '(c4 g4 eb4 a4) '(p pp mp p) :wave 13))

Example with two instruments:

(progn
 (defparameter size 120)
 (setf partials1 (library 'tbn-cs3-partials 'partials nil :random 64))
 (setf partials2 (library 'tbn-cs3-partials 'partials nil :random 64))
 (setf freq1 (rnd-sample size (partial :freq (flatten partials1))))
 (setf freq2 (rnd-sample size (partial :freq (flatten partials2))))
 (defparameter dur1 (rnd-sample size '(s s s s)))
 (defparameter dur2 (rnd-sample size '(q e s s s -s)))
 (defparameter amp1 (rndn size .005 .13))
 (defparameter amp2 (rndn size .005 .13))
 (defparameter waves '(1 2 3 4 5 6 7 8 9 10 11 12 13))

    (with-sound (:reverb jc-reverb)
     (scanned-synth dur1 freq1 amp1
                    :wave (rnd-sample size waves) :bpm 96
                    :pts (rnd-sample size '(192 256 512)))

        (scanned-synth dur2 freq2 amp2
                       :wave (rnd-sample size waves) :bpm 96
                       :pts (rnd-sample size '(192 256 512)))
    )
)
Opusmodus                                                                       scanned-synth      3

---------------------------------------------------------
CLM instrument: scanned.ins
Scanned synthesis Instrument: This is a simpli cation of the underlying table- lling routine for
"scanned synthesis" based on Bill Verplank and Max Mathews paper "Scan Synthesis", Proc. of
ICMC-2001 Berlin. This instrument by Juan Reyes with help from Bill Schottstaedt, Craig Sapp,
Fernando Lopez-Lezcano.

(with-sound() (scanned 0 4 400 .8))
(with-sound() (scanned 0 4 2400 .5))
(with-sound() (scanned 0 2 1600 .8))
(with-sound() (scanned 0 5 100 .8 :recompute-samps 192))
(with-sound() (scanned 0 5 400 .8 :recompute-samps 72.0))
(with-sound() (scanned 0 5 160 .8 :wave 4 :recompute-samps 67 :pts 512))
(with-sound() (scanned 0 1.25 1960 .5 :wave 6 :recompute-samps 14))
(with-sound() (scanned 0 1.25 2940 .5 :wave 5 :recompute-samps 224))
(with-sound() (scanned 0 12 243.125 .5 :wave 2 :recompute-samps 134))
(with-sound() (scanned 0 .06 8271 .5 :wave 7 :recompute-samps 96))
(with-sound() (scanned 0 5.06 1002 .5 :wave 7 :recompute-samps 32))
(with-sound() (scanned 0 4 4900 .8 :wave 10 :recompute-samps 61))
(with-sound() (scanned 0 5.5 406 .5 :wave 9 :recompute-samps 162))
(with-sound() (scanned 0 5 99.5 .8 :wave 7 :recompute-samps 221))

---------------------------------------------------------
                                       fi
                                                                      fi
