     Opusmodus                                                              ring-modulate-file-synth       1

     ring-modulate-file-synth dur freq amp file &key freq-env
                                                    file-start amp-env channel freq-skew

     [Function]

     Arguments and Values:
     dur                     omn-form list, lengths or NIL. (number, ratio or length-symbol).
                             This is the duration of the output sound in seconds. If the input le ends
                             before the speci ed duration, then that shorter duration will be used. If NIL,
                             the sound le duration is used.
     freq                    omn-form list, pitches, frequencies (hz) or NIL. If you want just a steady-state
                             ring modulation with a single sinewave you can use this parameter.
                             This parameter overrides the freq-env parameter.
                             If NIL the freq-env parameter is used.
     amp                     omn-form list or velocities. The amplitude gain for the sound. 1.0
                             will leave the sound loudness unchanged. 0.5 will make the sound
                             3 dB quieter. Be careful not to distort the sound by having the amp too large.
                             The default value is 1.0.
     file                    name of the sound le to modulate.
     freq-env                envelope. The frequency envelope of the sinewave to modulate with.
                             The default value is '(0 1 100 1) which means a constant- valued
                             sinwave of 1 Hz will be applied in the modulation.
     file-start              number. The start time location in the input sound le, i.e. the offset time into
                             the input sound le. The default is the beginning of the le, 0.0 seconds.
     amp-env                 envelope. A time-varying amplitude value, where the envelope value 1.0
                             is the amp parameter value. Default value is '(0 1 100 1).
     channel                 number. This instrument will only read one channel, so if you have a stereo
                               le, you must choose which channel to input. The default is 0.
     freq-skew               number. Don't change this unless you want to change the meaning of the
                             freq-env values. Default value of 1.0 means that freq-env is an
                             envelope in Hertz.


     Description:

     A ring-modulating instrument. This CLM instrument will apply ring modulation to a sound
       le with a speci ed sinewave. Ring modulation is a fancy name for multiplying the two
     signals together. When you multiply the two sounds together in the time domain, you get the
     sum and difference tones in the frequency domain.

     For example, if you ring modulate the two sinewaves 300 and 100 Hz, this instrument will
     output the sinewaves 200 and 400 Hz (you have to add the originals back in if you want to
     hear them as well).

     Karlheinz Stockhausen has used ring modulation in several of his compositions. See his
     compositions Kontakte, Mixtur, and Mantra for example uses of ring modulation.
fi
                  fi
                       fi
                                fi
                                     fi
                                          fi
                                               fi
                                                                       fi
                                                                             fi
                                                                                      fi
Opusmodus                                            ring-modulate-file-synth   2

Examples:
(with-sound ()
 (ring-modulate-file-synth
  nil nil nil "granis"
  :freq-env '(0 440 25 440 26 220 50 220 51 3 75 5 76 100 100 10000)))

(with-sound ()
 (ring-modulate-file-synth nil 'c8 nil "granis"))

(with-sound ()
 (ring-modulate-file-synth
  10.0 nil 0.5 "granis"
  :freq-env '(0 880 25 920 26 440 50 440 51 6 75 5 76 100 100 50)))

(with-sound ()
 (ring-modulate-file-synth
  '(1 1 1 1) '(ab7 g2 fs6 c8) '(mp pppp p ff) "granis"))


---------------------------------------------------------
CLM instrument: ring-modulate-file.ins
A ring-modulating instrument by Craig Stuart Sapp.

(with-sound () (ring-modulate-file "granis"))

---------------------------------------------------------
