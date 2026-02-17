Opusmodus                                                                  bandedwg-synth   1

bandedwg-synth dur freq amp &key mode maxa bv vel-env amp-env
                       reverb-amount bpm

[Function]

Arguments and Values:
dur                    omn-form list or lengths (number, ratio or length-symbol).
freq                   omn-form list, pitches or frequencies (hz).
amp                    omn-form list or velocities.
mode                   number. Vibration modes: 1 = Tuned Bar, 2 = Glass Harmonica
                       and 3 = Uniform Bar. The default is 3.
maxa                   number. Max bow velocity. The default is 0.9998.
bv                     number. Bow velocity scaler. The default is 1.0.
vel-env                envelope. The default is '(0 1.0 .95 1.1 1 1.0).
amp-env                envelope. The default is '(0 0.0 .95 1.0 .99 0.0).
reverb-amount          number. The default is 0.08.
bpm                    number. Beats per Minute. The default is 60.


Description:

Banded Waveguide Instrument.


Examples:
(with-sound (:reverb jc-reverb)
 (bandedwg-synth '(q - h w) '(c4 cs5 d4) 'mp
                 :reverb-amount 0.30 :mode 1))

(with-sound (:reverb jc-reverb)
 (bandedwg-synth '(q - h w) '(c4 cs5 d4) 'mp
                 :reverb-amount 0.30 :mode 2))

(with-sound (:reverb jc-reverb)
 (bandedwg-synth '(q - h w) '(c4 cs5 d4) 'mp
                 :reverb-amount 0.30 :mode 3))

Example with harmonic progression:

(progn
 (setf row (library 'vienna 'berg 'r11))
 (setf degree '(0 3 4 0 -2 -3 -1 0 -2))

 (setf mat (relative-closest-path
            (gen-loop 6 (harmonic-progression
                         (setf degree (gen-rotate 2 degree)) row))))
Opusmodus                                                                        bandedwg-synth    2

    (setf end1 (relative-closest-path
                (harmonic-progression '(-13 -13) row)))

    (setf end2 (relative-closest-path
                (harmonic-progression '(-12 -12) row)))

    (setf end3 (relative-closest-path
                (harmonic-progression '(-13 -13) row)))

    (setf end4 (relative-closest-path
                (harmonic-progression '(-12) row)))

    (defparameter omn (make-omn
                       :length '((q) (-h))
                       :pitch (assemble-seq mat end1 end2 end3 end4)
                       :velocity '(mp)
                       :span :pitch))

    (with-sound (:reverb jc-reverb)
      (bandedwg-synth omn omn omn :mode 1)
    )
)

---------------------------------------------------------
CLM instrument: bandedwg.ins
Banded Waveguide Instrument based on Essl, G. and Cook, P. "Banded Waveguides: Towards
Physical Modelling of Bar Percussion Instruments", Proceedings of the 1999 International
Computer Music Conference. Also, Essl, Sera n, Cook, and Smith J.O., "Theory of Banded
Waveguides", CMJ, 28:1, pp37-50, Spring 2004.

This CLM version by Juan Reyes 2004-2005
As with all physical models, initial conditions matter. Frequency range is not too broad. 220Hz is a
good starting point.

(with-sound () (bandedwg 0 1 220 0.4))
(with-sound () (bandedwg 0 1 220 0.4 :mode 1))
(with-sound () (bandedwg 0 1 220 0.4 :mode 2))
(with-sound () (bandedwg 0 1.0 220 0.7 :mode 1 :maxa 0.497))

---------------------------------------------------------
                                        fi
