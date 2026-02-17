Opusmodus                                                                           gong-synth   1

gong-synth dur freq amp &key degree distance reverb-amount bpm
[Function]

Arguments and Values:
dur                    omn-form list or lengths (number, ratio or length-symbol).
freq                   omn-form list, pitches or frequencies (hz).
amp                    omn-form list or velocities.
degree                 number. The default is 0.0.
distance               number. The default is 1.0.
reverb-amount          number. Amount of sound to be sent to the reverb output stream.
                       The default is .005.
bpm                    number. Beats per Minute. The default is 60.



Description:

FM Instrument, gong.


Example:
(with-sound ()
 (gong-synth 's
             (rnd-sample 48 '((c4 =) (ds5 =) (f4 =) (g3 =) (a5 =)))
             'ff
             :bpm 120)
 (fm-synth :cmb '(-s e = -e.)
           (rnd-sample 16 '(c3))
           'ff
           :bpm 120
           :loop t))


---------------------------------------------------------
CLM instrument: fmex.ins
Paul Weineke's gong.

(with-sound () (gong 0 3 261.61 .6))

---------------------------------------------------------
