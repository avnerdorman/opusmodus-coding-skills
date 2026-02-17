Opusmodus                                                                 piano-synth      1

piano-synth dur freq amp &key pedal-down release-time-margin amp
                 detuningfactor detuningfactor-table
                 stiffnessfactor stiffnessfactor-table
                 pedalpresencefactor longitudinalmode
                 strikepositioninvfac singlestringdecayratefactor
                 loudpole softpole loudgain softgain
                 strikeposition detuning2 detuning3
                 stiffnesscoefficient singlestringdecayrate
                 singlestringzero singlestringpole
                 releaseloopgain drytapfiltcoeft60
                 drytapfiltcoeftarget drytapfiltcoefcurrent
                 drytapampt60 sustainpedallevel
                 pedalresonancepole pedalenvelopet60
                 soundboardcutofft60 drypedalresonancefactor
                 unacordagain bpm

[Function]

Arguments and Values:
dur                           omn-form list or lengths (number, ratio or length-symbol).
freq                          omn-form list, pitches or frequencies (hz).
amp                           omn-form list or velocities.
pedal-down                    NIL or T. T sets sustain pedal down. The default is NIL.
release-time-margin           number. The default is 0.75. Extra compute time
                              allowed beyond duration.
amp-noise                     number. Scale of noise inputs. The default is 0.5.
detuningfactor                number. The default is 1.0.
detuningfactor-table          a list of numbers. The default is '().
stiffnessfactor               number. The default is 1.0.
stiffnessfactor-table         a list of numbers. The default is '().
pedalpresencefactor           number. The default is 0.3.
longitudinalmode              number. The default is 10.5.
strikepositioninvfac          number. The default is -0.9.
singlestringdecayratefactor   number. The default is 1.0.
loudpole                      numbers. The default is
                              (loudpole-table default-loudpole-table).
softpole                      numbers. The default is
                              (softpole-table default-softpole-table).
loudgain                      numbers. The default is
                              (loudgain-table default-loudgain-table).
softgain                      numbers. The default is
                              (softgain-table default-softgain-table).
strikeposition                numbers. The default is
                              (strikeposition-table
                                default-strikeposition-table).
detuning2                     numbers. The default is
                              (detuning2-table default-detuning2-table).
detuning3                     numbers. The default is
                              (detuning3-table default-detuning3-table).
Opusmodus                                                                 piano-synth   2

stiffnesscoefficient                   numbers. The default is
                                       (stiffnesscoefficient-table
                                        default-stiffnesscoefficient-table).
singlestringdecayrate                  numbers. The default is
                                       (singlestringdecayrate-table
                                        default-singlestringdecayrate-table).
singlestringzero                       numbers. The default is
                                       (singlestringzero-table
                                        default-singlestringzero-table).
singlestringpole                       numbers. The default is
                                       (singlestringpole-table
                                        default-singlestringpole-table).
releaseloopgain                        numbers. The default is
                                       (releaseloopgain-table
                                        default-releaseloopgain-table).
drytapfiltcoeft60                      numbers. The default is
                                       (drytapfiltcoeft60-table
                                        default-drytapfiltcoeft60-table).
drytapfiltcoeftarget                   numbers. The default is
                                       (drytapfiltcoeftarget-table
                                        default-drytapfiltcoeftarget-table).
drytapfiltcoefcurrent                  numbers. The default is
                                       (drytapfiltcoefcurrent-table
                                        default-drytapfiltcoefcurrent-table).
drytapampt60                           numbers. The default is
                                       (drytapampt60-table
                                        default-drytapampt60-table).
sustainpedallevel                      numbers. The default is
                                       (sustainpedallevel-table
                                        default-sustainpedallevel-table).
pedalresonancepole                     numbers. The default is
                                       (pedalresonancepole-table
                                        default-pedalresonancepole-table).
pedalenvelopet60                       numbers. The default is
                                       (pedalenvelopet60-table
                                        default-pedalenvelopet60-table).
soundboardcutofft60                    numbers. The default is
                                       (soundboardcutofft60-table
                                        default-soundboardcutofft60-table).
drypedalresonancefactor                numbers. The default is
                                       (drypedalresonancefactor-table
                                        default-drypedalresonancefactor-table).
unacordagain                           numbers. The default is
                                       (unacordagain-table
                                        default-unacordagain-table).
bpm                                    number. Beats per Minute. The default is 60.


Description:

Piano physical modelling instrument.
Opusmodus                                                     piano-synth   3

Examples:
(progn
 (setf frames1 (library 'marangona-partials 'partials nil :random 48))
 (setf frames2 (library 'marangona-frames 'partials nil :random 48))
 (setf par1 (remove-partial frames1 :type :freq :min 27.5 :max 4186))
 (setf par2 (remove-partial frames2 :type :freq :min 27.5 :max 4186))
 (setf freq1 (rnd-order
              (gen-collect
               (rnd-sample 24 '(3 5 6 7 8)) (partial :freq par1))))

 (setf freq2 (rnd-order
              (gen-collect
               (rnd-sample 38   '(2 3 4)) (partial :freq par2))))

 (with-sound (:reverb jc-reverb)
  (piano-synth '(3e) (flatten freq1) '(.2 .3 .4)
               :bpm 72
               :drypedalresonancefactor .25
               :singlestringdecayrate-table
               '(21 -5 24.000 -5.000 36.000 -5.4
                 41.953 -5.867 48.173 -7.113 53.818 -8.016
                 59.693 -8.875 66.605 -9.434 73.056 -10.035
                 78.931 -10.293 84.000 -12.185)
               :singlestringpole-table
               '(21 .8 24 0.7 36.000 .6 48 .5
                 60 .3 84 .1 96 .03 108 .03)
               :stiffnesscoefficient-table
               '(21.000 -0.920 24.000 -0.900 36.000 -0.700
                 48.000 -0.250 60.000 -0.100 75.179 -0.040
                 82.986 -0.040 92.240 .3 96.000 .5
                 99.000 .7 108.000 .7))
  (piano-synth '(e) freq2 '(0.1 0.2 0.3)
               :bpm 72
               :drypedalresonancefactor .55
               :detuningfactor-table
               '(24 5 36 7.0 48 7.5 60 12.0 72
                 20 84 30 96 100 108 300)))
  )
Opusmodus                                                     piano-synth   4

---------------------------------------------------------
CLM instrument: piano.ins
Scott Van Dyne's piano physical modeling instrument in clm.

(with-sound ()
  (loop for i from 0 to 7 do
    (pno
     (* i .5)
     :duration .5
     :keynum (+ 24 (* 12 i))
     :strike-velocity .5
     :amp-noise .4
     :drypedalresonancefactor .25
     )))

---------------------------------------------------------
