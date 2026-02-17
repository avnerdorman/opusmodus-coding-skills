Opusmodus                                                                               expsrc-synth   1

expsrc-synth dur file amp exp-ratio src-ratio
                         &key reverb-amount file-start bpm

[Function]

Arguments and Values:
dur                        omn-form list or lengths (number, ratio or length-symbol).
file                       a le input (sound- le).
amp                        omn-form list or velocities.
exp-ratio                  number or list of numbers. Expansion ratio.
src-ratio                  number or list of numbers. Source ratio.
file-start                 number. The default is 0.0.
reverb-amount              number. The default is 0.0.
bpm                        number. Beats per Minute. The default is 60.


Description:

Granulate generator in conjunction with sampling rate conversion (mimic phase vocoder).


Examples:
(with-sound ()
 (expsrc-synth '(5 5 5 5) "granis" 0.5
               '(1 2 3.2 2) '(0.4434 0.7 0.3 .1))
 (expsrc-synth 20 "granis" 0.5 1 0.5))


---------------------------------------------------------
CLM instrument: expsrc.ins
(with-sound () (expsrc 0 20 0.5 "granis" 1 0.5))

---------------------------------------------------------
                    fi
                                      fi
