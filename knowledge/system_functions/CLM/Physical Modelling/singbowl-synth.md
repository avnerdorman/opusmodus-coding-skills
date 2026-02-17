Opusmodus                                                                        singbowl-synth   1

singbowl-synth dur freq amp &key maxa bv vel-env
                        amp-env reverb-amount bpm

[Function]

Arguments and Values:
dur                     omn-form list or lengths (number, ratio or length-symbol).
freq                    omn-form list, pitches or frequencies (hz).
amp                     omn-form list or velocities.
maxa                    number. Max bow velocity. The default is 0.9998.
bv                      number. Bow velocity scaler. The default is 1.0.
vel-env                 envelope. The default is '(0 1.0 .95 1.1 1 1.0).
amp-env                 envelope. The default is '(0 0 0.4 1 1 0.2).
reverb-amount           number. The default is 0.08.
bpm                     number. Beats per Minute. The default is 60.


Description:

Banded Waveguide Tibetan Bowl Instrument.


Examples:

Simple example with 3 values:

(with-sound (:reverb jc-reverb)
  (singbowl-synth '(q - h w) '(c4 cs5 d4) '(ppp p pp)
                  :reverb-amount 0.30))

Here we use partials as the frequency input:

(setf size 120)
(setf partials (library 'marangona-partials 'partials nil :random 50))
(setf par (rnd-sample size (partial :freq (flatten partials))))

(defparameter freq (gen-divide (rnd-sample size '(2 3 4 5)) par))
(defparameter length (rnd-sample size '(w h q e)))
(defparameter velocity (rndn size .05 .43))
Opusmodus                                                                        singbowl-synth    2

(defparameter env
              '((0 0 40 .1000 60 .2000 75 .4000 82 1 90 1 100 0)
                (0 0 60 .1000 80 .2000 90 .4000 95 1 100 0)
                (0 0 10 1 16 0 32 .1000 50 1 56 0 60 0 90 .3000 100 0)
                (0 0 30 1 56 0 60 0 90 .3000 100 0)
                (0 0 50 1 80 .3000 100 0)
                (0 0 40 .1000 60 .2000 75 .4000 82 1 90 1 100 0)
                (0 0 10 1 32 .1000 50 1 90 .3000 100 0)
                (0 0 60 .1000 80 .3000 95 1 100 0)
                (0 0 80 .1000 90 1 100 0)))

(with-sound (:reverb jc-reverb :scaled-to .7 :output "ma-partials")
 (singbowl-synth length freq velocity
                 :amp-env (rnd-sample size env)
                 :reverb-amount 0.30))


---------------------------------------------------------
CLM instrument: bowl.ins
Banded Waveguide Tibetan Bowl Instrument based on Essl, G. and Cook, P. "Banded
Waveguides: Towards Physical Modelling of Bar Percussion Instruments", Proceedings of the
1999 International Computer Music Conference.

Also, Essl, Sera n, Cook, and Smith J.O., "Theory of Banded Waveguides", CMJ, 28:1, pp37-50,
Spring 2004.

This CLM version by Juan Reyes 2004-2005
As with all physical models, initial conditions matter. Frequency range is not too broad. 220Hz is a
good starting point.

(with-sound () (singbowl 0 4 200 0.4))
(with-sound () (singbowl 0 4 220 0.4))
(with-sound () (singbowl 0 4 180 0.2))

---------------------------------------------------------
         fi
