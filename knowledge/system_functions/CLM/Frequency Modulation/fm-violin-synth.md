Opusmodus                                                               fm-violin-synth       1

fm-violin-synth dur freq amp &key fm-index amp-env
                        periodic-vibrato-rate random-vibrato-rate
                        periodic-vibrato-amplitude
                        random-vibrato-amplitude noise-amount
                        noise-freq ind-noise-freq ind-noise-amount
                        mp-noise-freq amp-noise-amount gliss-env
                        glissando-amount fm1-env fm2-env fm3-env
                        fm1-rat fm2-rat fm3-rat fm1-index fm2-index
                        fm3-index base frobber reverb-amount
                        degree distance degrees no-waveshaping
                        denoise denoise-dur denoise-amp bpm

[Function]

Arguments and Values:
dur                              omn-form list or lengths (number, ratio or length-symbol).
freq                             omn-form list, pitches or frequencies (hz).
amp                              omn-form list or velocities.
fm-index                         number. Overall modulation index. The default is 1.0.
amp-env                          amplitude envelope.
                                 The default is '(0 0 25 1 75 1 100 0).
periodic-vibrato-rate            number. Periodic vibrato frequency. The default is 5.0.
random-vibrato-rate              number. Random noise added to the vibrato.
                                 The default is 16.0.
periodic-vibrato-amplitude       number. Amplitude of the periodic vibrato.
                                 The default is 0.0025.
random-vibrato-amplitude         number. Amplitude of the random vibrato.
                                 The default is 0.005.
noise-amount                     number. Add index and amplitude noise
                                 (internal movement of the sound). The default is 0.0.
noise-freq                       number. Bandwidth of the index and amplitude noise.
                                 The default is 1000.0 (hz).
ind-noise-freq                   number. Bandwidth of index noise. The default is 10.0.
ind-noise-amount                 number. Index noise amount. The default is 0.0.
amp-noise-freq                   number. Bandwidth of amplitude noise. The default is 20.0.
amp-noise-amount                 number. Amplitude noise amount. The default is 0.0.
gliss-env                        envelope. Glissando envelope (pitch envelope).
                                 The default is '(0 0 100 0).
glissando-amount                 number. Scaler for the pitch envelope. The default is 0.0.
fm1-env                          envelope. Index envelope for rst modulator.
                                 The default is '(0 1 25 .4 75 .6 100 0).
fm2-env                          envelope. Index envelope for rst modulator.
                                 The default is '(0 1 25 .4 75 .6 100 0).
fm3-env                          envelope. Index envelope for rst modulator.
                                 The default is '(0 1 5 .4 75 .6 100 0).
fm1-rat                          number. Modulator / carrier frequency ratio for
                                   rst modulator. The default is 1.0.
fm2-rat                          number. Modulator / carrier frequency ratio for
                                   rst modulator. The default is 3.0.
                            fi
                            fi
                                                      fi
                                                      fi
                                                      fi
Opusmodus                                                                   fm-violin-synth   2

fm3-rat                              number. Modulator / carrier frequency ratio for
                                       rst modulator. The default is 4.0.
fm1-index                            number. Modulation index for the rst modulator.
                                     The default is NIL.
fm2-index                            number. modulation index for the second modulator.
                                     The default is NIL.
fm3-index                            number. modulation index for the third modulator.
                                     The default is NIL.
base                                 number. Kind of interpolation to be done between
                                     envelope points. The default is NIL.
frobber                              number. The default is NIL.
reverb-amount                        number. Reverberation amount. The default is 0.01.
degree                               number. The default is NIL.
distance                             number. The default is 1.0.
degrees                              number. The default is NIL.
no-waveshaping                       number. The default is NIL.
denoise                              number. Whether to try to reduce quantization noise
                                     in envelopes. The default is NIL.
denoise-dur                          number. The default is .1.
denoise-amp                          number. The default is .005.
bpm                                  number. Beats per Minute. The default is 60.


Description:

A generic and versatile FM instrument.


Example:
(progn
 (setf size 10)
 (setf count 50)

 (setf glc-v1
       (gen-length-cartesian
        1 3 'd '? 'w 3 (rnd-sample size '(13 11 10 8)) '(1 2 3 4 5)))

 (setf glc-v2
       (gen-length-cartesian
        1 3 'd '? 'w 3 (rnd-sample size '(13 11 10 8)) '(1 2 3 4 5)))

 (setf glc-va
       (gen-length-cartesian
        1 3 'd '? 'w 3 (rnd-sample size '(13 11 10 8)) '(1 2 3 4 5)))

 (setf glc-vc
       (gen-length-cartesian
        1 3 'd '? 'w 3 (rnd-sample size '(13 11 10 8)) '(1 2 3 4 5)))
                               fi
                                                              fi
Opusmodus                                                  fm-violin-synth   3

 (setf gu-sq (gen-unison (list glc-v1 glc-v2 glc-va glc-vc)))
 (setf l-v1 (1~ gu-sq))
 (setf l-v2 (2~ gu-sq))
 (setf l-va (3~ gu-sq))
 (setf l-vc (4~ gu-sq))

 (setf l-max
       (first
        (sort-desc
         (list (get-count l-v1 :length :note :sum t)
               (get-count l-v2 :length :note :sum t)
               (get-count l-va :length :note :sum t)
               (get-count l-vc :length :note :sum t)))))

 (setf
  intervals
  '((0 7) (0 0) (11 5) (-4 5) (-5 5) (0 13) (-5 18)
    (-36 13) (-13 13) (8) (-18 7) (-1 17) (-17 17)
    (-26 13) (-27 23) (-19 19) (-23 23) (18) (0) (7)
    (-14) (13) (-23 5) (-23 2) (-2 2) (6 2) (6 5)
    (19) (-10) (-17 11) (-11 11) (-11 5) (-24 13)
    (1 14) (-14 14) (-29 1) (-1 1) (7 0) (12 6)
    (-21 7) (-7 7) (-18 0) (1 13) (0 1) (-14 13)
    (-10 5) (-14 8) (0 6) (6) (-20 6) (-5 1) (17) (1)
    (-17 5) (-1 5) (-10 16) (-12 8) (0 8) (1 11)
    (-24 4) (-18 16) (-17) (-6 6) (-18 18) (-15 3)
    (-6 31) (-2 5) (-29 6) (-6 13) (-13 6) (7 13)))

 (setf pcount (gen-repeat 2 (get-count l-v1 :length :note)))
 (setf gr (gen-repeat (length pcount) (list intervals)))
 (setf gm-v1 (gen-markov gr :size pcount))
 (setf gm-v2 (gen-markov gr :size pcount))
 (setf gm-va (gen-markov gr :size pcount))
 (setf gm-vc (gen-markov gr :size pcount))
 (setf im-v1 (interval-map nil (append-sublist gm-v1)))
 (setf im-v2 (interval-map nil (append-sublist gm-v2)))
 (setf im-va (interval-map nil (append-sublist gm-va)))
 (setf im-vc (interval-map nil (append-sublist gm-vc)))
 (setf s-v1 (span l-v1 im-v1))
 (setf s-v2 (span l-v2 im-v2))
 (setf s-va (span l-va im-va))
 (setf s-vc (span l-vc im-vc))
 (setf ra-v1 (rnd-octaves 'violin s-v1))
 (setf ra-v2 (rnd-octaves 'violin s-v2))
 (setf ra-va (rnd-octaves 'viola s-va))
 (setf ra-vc (rnd-octaves 'cello s-vc))
 (setf p-v1 (ambitus 'violin ra-v1 :type :invert))
 (setf p-v2 (ambitus 'violin ra-v2 :type :invert))
 (setf p-va (ambitus 'viola ra-va :type :invert))
 (setf p-vc (ambitus '(a2 c5) ra-vc :type :invert))
 (setf weight '(29 19 8 8 17))
Opusmodus                                                fm-violin-synth   4

 (setf vel '(0.07 0.1 0.15 0.2 0.25 0.35))
 (setf v-v1 (gen-weight l-max (mapcar 'list vel weight)))
 (setf v-v2 (gen-weight l-max (mapcar 'list vel weight)))
 (setf v-va (gen-weight l-max (mapcar 'list vel weight)))
 (setf v-vc (gen-weight l-max (mapcar 'list vel weight)))
 (setf vln1 (make-omn :length l-v1 :pitch p-v1 :velocity v-v1))
 (setf vln2 (make-omn :length l-v2 :pitch p-v2 :velocity v-v2))
 (setf vla (make-omn :length l-va :pitch p-va :velocity v-va))
 (setf vlc (make-omn :length l-vc :pitch p-vc :velocity v-vc))

 (do-timeline
  '(vln1 (---x---x-- ---x-x-x-- --x--xx--- ---x------ x-)
    vln2 (---x---x-- ---x---x-- --x--xx--- ---x------ x-)
    vla (---x---x-- ---x---x-- --x--xx--- ---x------ --)
    vlc (---x---x-- ---x---xx- --x--xx--- ---x------ --))
  '(gen-pause x) :time '(h h. w))

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

 (with-sound (:reverb jc-reverb :scaled-to .7)
  (fm-violin-synth vln1 vln1 vln1
                   :bpm 30
                   :degree (rndn count 45 85)
                   :fm-index (rndn count 0.10 1.0)
                   :reverb-amount 0.30
                   :noise-amount (rndn count 0.00 0.004)
                   :amp-env (rnd-sample count env)
                   :glissando-amount (rndn count 0.00 0.8))

  (fm-violin-synth vln2 vln2 vln2
                   :bpm 30
                   :degree (rndn count 45 85)
                   :fm-index (rndn count 0.03 1.0)
                   :reverb-amount 0.30
                   :noise-amount (rndn count 0.00 0.004)
                   :amp-env (rnd-sample count env)
                   :glissando-amount (rndn count 0.00 0.8))
Opusmodus                                                             fm-violin-synth   5

  (fm-violin-synth vla vla vla
                   :bpm 30
                   :degree (rndn count 45 85)
                   :fm-index (rndn count 0.10 1.0)
                   :reverb-amount 0.30
                   :noise-amount (rndn count 0.00 0.004)
                   :amp-env (rnd-sample count env)
                   :glissando-amount (rndn count 0.00 0.8))

  (fm-violin-synth vlc vlc vlc
                   :bpm 30
                   :degree (rndn count 45 85)
                   :fm-index (rndn count 0.70 1.0)
                   :reverb-amount 0.30
                   :noise-amount (rndn count 0.00 0.004)
                   :amp-env (rnd-sample count env)
                   :glissando-amount (rndn count 0.00 0.8)))
  )


---------------------------------------------------------
CLM instrument: v.ins
A generic and versatile fm instrument created by Bill Schottstaedt.

(with-sound ()
  (fm-violin 0 1 440 .1)
  (fm-violin 0.1 1.5 660 .1))

---------------------------------------------------------
