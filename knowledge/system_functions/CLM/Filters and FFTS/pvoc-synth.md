Opusmodus                                                                      pvco-synth   1

pvco-synth dur file amp &key duration input-start input-end
                  fftsize overlap time-stretch pitch-scaler
                  pitch-scaler-env pitch-offset pitch-offset-env
                  harmonic-mirror-env degree degree-env rev-amt
                  rev-env distance distance-env gate amp amp-env bpm

[Function]

Arguments and Values:
dur                 omn-form list or lengths (number, ratio or length-symbol).
file                a le input (sound- le). The complete pathname of the sound- le
                    you want to use as source material (.aif).
amp                 omn-form list or velocities.
duration            number. The default is NIL.
input-start         number. The default is 0.
input-end           number or NIL. The default is NIL.
fftsize             number. The default is 512.
overlap             number. The default is 4.
time-stretch        number. The default is 1.0.
pitch-scaler        number. The default is 1.0.
pitch-scaler-env    envelope. The default is '(0 1 100 1).
pitch-offset        number (hz). The default is 0.0.
pitch-offset-env    envelope (hz). The default is '(0 0 100 0).
harmonic-mirror-env envelope (hz). The default is NIL.
degree              number. The default is 0.
degree-env          envelope. The default is '(0 .5 100 .5).
rev-amt             number. The default is 0.
rev-env             envelope. The default is '(0 0 100 1).
distance            number. The default is 1.
distance-env        envelope. The default is '(0 1 1 1).
gate                number. The default is 1.
amp-env             envelop. The default is '(0 1 100 1).
bpm                 number. Beats per Minute. The default is 60.


Description:

The PVOC-SYNTH is a complete phase vocoder instrument.
                    fi
                                   fi
                                                                        fi
Opusmodus                                                                          pvco-synth   2

Example:
(with-sound (:scaled-to .99)
 (pvoc-synth
  (rnd-sample 12 '(q h e s w d -q -h))
   "marangona" '(pppp pp ppp f)
   :input-start 0
   :input-end 12
   :pitch-scaler (rnd-sample 12 '(.5 .1 .05 .8 .3 .16))
   :pitch-offset (rnd-sample 20 '(20 100 200 300 440 150 730))
   :pitch-offset-env '(0 0 20 0 50 100 70 100 80 0 100 0)
   :pitch-scaler-env '(0 1 50 2 100 1)
   :amp-env '(0 1 40 0 50 1 60 0 100 1)
   :gate 70))


---------------------------------------------------------
CLM instrument: pvoc.ins
This version of PVOC is by Michael Klingbeil and ported for clm-2 by Marco Trevisani.
Based in part on sms instrument and the phase vocoder section in F. Richard Moore's
"Elements of Computer Music”. Modi cations by Michael Edwards.

(with-sound (:scaled-to .99)
  (pvoc "marangona" 0
        :input-start .145
        :input-end 5.4
        :duration 7
        :harmonic-mirror-env '(0 0 20 0 50 1000 70 1000 80 0 100 0)
        :amp-env '(0 1 40 0 50 1 60 0 100 1)
        :gate 70
        :fftsize 512))

---------------------------------------------------------
                             fi
