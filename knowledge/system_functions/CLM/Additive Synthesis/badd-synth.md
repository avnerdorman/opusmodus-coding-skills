Opusmodus                                                                             badd-synth    1

badd-synth dur freq amp &key ampfun freqfun partials degree
                 reverb-amount distance pvibrate pvibamp
                 rvibrate rvibamp fuzz power powerfun bpm

[Function]

Arguments and Values:
dur                      omn-form list or lengths (number, ratio or length-symbol).
freq                     omn-form list, pitches or frequencies (hz).
amp                      omn-form list or velocities.
ampfun                   envelope. The default is '(0 0 1 1 2 0).
freqfun                  envelope. The default is '(0 0 100 0).
partials                 list of numbers. The default is '(1 1).
degree                   number. The default is 45.
reverb-amount            number. The default is 0.
distance                 number. The default is 1.
pvibrate                 number. The default is 5.0.
pvibamp                  number. The default is 0.012.
rvibrate                 number. The default is 16.0.
rvibamp                  number. The default is 0.005.
fuzz                     number. Each partial is fuzzed by a random frequency increment.
                         FUZZ expresses the bounds of this randomness in divisions of the octave.
                         The default is 36.
power                    POWER is a spectrum brightness control analogous to an fm index.
                         At 0.0 power, the spectrum isn't altered; increasing power causes
                         the amplitudes of individual partials to increase exponentially until,
                         at a power of 1.0, all partials have an amp of 1.0.
                         Powers beyond 1.0 ‘invert’ the spectrum. The default is 0.0.
powerfun                 envelope. The default is AMPFUN envelop.
bpm                      number. Beats per Minute. The default is 60.


Description:

Additive synthesis Instrument.


Examples:

Simple example with 3 values:

(with-sound (:reverb jc-reverb)
  (badd-synth '(q - h w) '(c4 cs5 d4) '(ppp p pp)))
Opusmodus                                                    badd-synth   2

With frequency input and six instruments:

(progn
 (defparameter size 12)
 (setf partials (library 'marangona-partials 'partials nil :random 64))
 (setf mpar (remove-partial partials :type :freq :max 1800.0))
 (setf par (partial :freq mpar))
 (setf freq '(rnd-sample size (flatten par)))
 (defparameter dur '(rnd-sample size '(1 2 3 4 5)))
 (defparameter amp '(rndn size .12 .33))

 (with-sound (:reverb jc-reverb)
   (badd-synth (eval dur) (eval freq) (eval amp))
   (badd-synth (eval dur) (eval freq) (eval amp))
   (badd-synth (eval dur) (eval freq) (eval amp))
   (badd-synth (eval dur) (eval freq) (eval amp))
   (badd-synth (eval dur) (eval freq) (eval amp))
   (badd-synth (eval dur) (eval freq) (eval amp))
   )
 )


---------------------------------------------------------
CLM instrument: badd.ins
Additive synthesis courtesy Doug Fulton.

(with-sound () (badd 0 4 400 .8))
(with-sound () (badd 0 4 2400 .5))
(with-sound () (badd 0 2 1600 .1))

---------------------------------------------------------
