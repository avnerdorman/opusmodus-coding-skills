Opusmodus                                                                      fm-insect-synth   1

fm-insect-synth dur freq amp amp-env mod-freq mod-skew
                         mod-freq-env mod-index mod-index-env
                         fm-index fm-ratio &key degree distance
                         reverb-amount bpm

[Function]

Arguments and Values:
dur                     omn-form list or lengths (number, ratio or length-symbol).
freq                    omn-form list, pitches or frequencies (hz).
amp                     omn-form list or velocities.
amp-envelope            envelope (list). Amplitude envelope for the whole note.
mod-freq                number.
mod-skew                number.
mod-freq-env            envelope (list).
mod-index               number.
mod-index-env           envelope (list).
fm-index                number.
fm-ratio                number.
degree                  number. The default is 0.0.
distance                number. The default is 1.0.
reverb-amount           number. Amount of sound to be sent to the reverb output stream.
                        The default is .005.
bpm                     number. Beats per Minute. The default is 60.


Description:

FM (frequency modulation synthesis) instrument. Computed sound sounds insect like.


Examples:
(progn
 (defparameter par (library 'tbn-cs3-partials 'partials nil
                            :random 12))

 (defparameter dur '(rnd-sample 12 '(-q q. h -h. -w w. d -d.)))
 (defparameter freq '(rnd-sample 12 (flatten (partial :freq par))))
 (defparameter amp '(rnd-sample 12 '(pppp ppp p mp)))
 (defparameter mod-freq-env '(0 0 40 1 95 1 100 .5))
 (defparameter mod-index-env '(0 1 25 .7 75 .78 100 1))
 (defparameter amp-env '(0 0 25 1 75 .7 100 0))
 (defparameter fm-index '(rndn 12 .01 .6))
 (defparameter mod-skew '(rndn 12 -20.0 -1.0))
 (defparameter mod-freq '(rndn 12 20 60))
Opusmodus                                                       fm-insect-synth   2

    (with-sound '()
     (fm-insect-synth (eval dur) (eval freq) (eval amp) amp-env
                      (eval mod-freq) (eval mod-skew) mod-freq-env
                      500.866 mod-index-env (eval fm-index) .500)

        (fm-insect-synth (eval dur) (eval freq) (eval amp) amp-env
                         (eval mod-freq) (eval mod-skew) mod-freq-env
                         649.490 mod-index-env (eval fm-index) .500)

        (fm-insect-synth (eval dur) (eval freq) (eval amp) amp-env
                         (eval mod-freq) (eval mod-skew) mod-freq-env
                         562.087 mod-index-env (eval fm-index) .500)

        (fm-insect-synth (eval dur) (eval freq) (eval amp) amp-env
                         (eval mod-freq) (eval mod-skew) mod-freq-env
                         300.866 mod-index-env (eval fm-index) .500)
    )
)


---------------------------------------------------------
CLM instrument: insect.ins
(let ((locust '(0 0 40 1 95 1 100 .5))
      (bug_hi '(0 1 25 .7 75 .78 100 1))
      (amp    '(0 0 25 1 75 .7 100 0)))

        (with-sound '()
          (fm-insect 0 1.699 4142.627 .015 amp 60
                     -16.707 locust 500.866 bug_hi .346 .500)
          (fm-insect 0.195 .233 4126.284 .030 amp 60
                     -12.142 locust 649.490 bug_hi .407 .500)
          (fm-insect 0.217 2.057 3930.258 .045 amp 60
                     -3.011 locust 562.087 bug_hi .591 .500)
          (fm-insect 2.100 1.500 900.627 .06 amp 40
                     -16.707 locust 300.866 bug_hi .346 .500)
          (fm-insect 3.000 1.500 900.627 .06 amp 40
                     -16.707 locust 300.866 bug_hi .046 .500)
          (fm-insect 3.450 1.500 900.627 .09 amp 40
                     -16.707 locust 300.866 bug_hi .006 .500)
          (fm-insect 3.950 1.500 900.627 .12 amp 40
                     -10.707 locust 300.866 bug_hi .346 .500)
          (fm-insect 4.300 1.500 900.627 .09 amp 40
                     -20.707 locust 300.866 bug_hi .246 .500)
          ))

---------------------------------------------------------
