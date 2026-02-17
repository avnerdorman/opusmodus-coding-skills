Opusmodus                                                                          grani-synth     1

grani-synth dur file amp &key bpm input-channel grains amp-envelope
                 grain-envelope grain-envelope-end
                 grain-envelope-transition
                 grain-envelope-array-size
                 grain-duration grain-duration-spread
                 grain-duration-limit srate srate-spread
                 srate-linear srate-base srate-error
                 grain-start grain-start-spread
                 grain-start-in-seconds grain-density
                 grain-density-spread reverb-amount reverse
                 where-to grain-distance grain-distance-spread
                 grain-degree grain-degree-spread bpm

[Function]

Arguments and Values:
dur                                   omn-form list or lengths (number, ratio or length-symbol).
file                                  a le input (sound- le). The complete pathname of
                                      the sound- le you want to use as source material for
                                      the grains (.aif).
amp                                   omn-form list or velocities.
amp-envelope                          envelope. Amplitude envelope for the whole note.
grain-envelope                        envelope. Amplitude envelope for each individual grain.
grain-envelope-end                    envelope or NIL. A second amplitude envelope for each
                                      individual grain.
                                      If speci ed, grain-envelope-transition can be used
                                      to interpolate between both envelopes over the duration
                                      of the note.
grain-envelope-transition             envelope. Interpolation envelope for the grain envelope
                                      (used only if grain-envelope-end has been speci ed).
grain-duration                        number or envelope. Random deviation from
                                      grain-duration.
grain-duration-spread                 number. Minimum duration in seconds of a grain.
grain-duration-limit                  number or envelope. Sample rate conversion factor.
srate                                 number or envelope. Sample rate conversion factor.
                                      The value for each grain is either a constant if the parameter
                                      is a number or is determined by the value of the envelope
                                      at the point in time where the grain starts. The sample rate
                                      conversion factor is a constant within the grain.
                                      If not overriden by the sampling rate conversion factor is
                                      speci ed in semitones (positive values transpose the sound
                                      up and negative values transpose down).
srate-spread                          number or envelope. Random deviation the value of srate.
srate-linear                          T or NIL. De nes the type of envelope used for the sampling
                                      rate conversion factor: NIL (the default): "srate" is expressed
                                      in fractional semitones above or below the original sampling
                                      rate (0 = no change in sampling rate conversion).
                                      The exponential envelope is approximated by a linear segment
                                      representation. The error bounds of the approximation can be
                                      set by srate-error. The base of the exponential curve can
                            fi
                                 fi
                                      fi
                                           fi
                                                fi
                                                     fi
                                                                                     fi
Opusmodus                                                                             grani-synth     2

                                       be changed by srate-base. T: “srate" is the linear
                                       sampling rate conversion factor
                                       (1 = no change in sampling rate).
srate-error                            number. Error bound for the exponential conversion.
srate-base                             number. Base for the exponential conversion. "2" will express
                                       the envelope in octaves. "(expt 2 (/ 12))” will express
                                       the envelope in semitones.
grain-start                            number or envelope. Point in the input le where the samples
                                       are going to be read from. "0" represents the start of the input
                                       sound le, "1" represents the end. An envelope can be used to
                                       produce arbitrary mappings over time.
grain-start-spread                     number or envelope. Random deviation from the value
                                       of grain-start.
grain-density                          number or envelope. Number of grains per second
                                       that will be created.
grain-density-spread                   number or envelope. Random deviation from the value
                                       of grain-density.
reverse                                T or NIL. T means the input sound- le will be read backwards
                                       (each grain will read backwards but of course this is
                                       independent from grain-start, for example we could be
                                       advancing forwards in the le but reading the samples
                                       backwards).
reverb-amount                          number. Amount of sound to be sent to the reverb
                                       output stream.
grain-distance                         number or envelope. Distance to the listener
                                       position (for locsig).
grain-distance-spread                  number or envelope. Random deviation from
                                       the value of grain-distance.
grain-degree                           number or envelope. Angular position (for locsig).
grain-degree-spread                    number or envelope. Random deviation from
                                       the value of grain-degree.
bpm                                    number. Beats per Minute. The default is 60.


Description:

The GRANI-SYNTH is a comprehensive granular synthesis instrument geared towards
granulation of sound- les.


Examples:

Smaller grains:

(with-sound ()
  (grani-synth 8 "marangona" .8
               :grain-duration 0.06
               :grain-density 40
               :grain-density-spread 5
               :grain-start '(0 .3 1 0.4)))
               fi
                                  fi
                                                          fi
                                                                    fi
                                                                         fi
Opusmodus                                                                    grani-synth    3

Smaller grains, downsampled by an octave:

(with-sound ()
  (grani-synth 8 "marangona" .8
               :grain-duration 0.06
               :grain-density 40
               :grain-density-spread 5
               :grain-start '(0 .1 1 .22)
               :srate -12))

Smaller grains, downsampled by a 0.3x factor. Note that we change the position were we
start sampling the input le and create a big spread there so that we are actually jumping
around randomly:

(with-sound ()
  (grani-synth 8 "marangona" .8
               :grain-duration .06
               :grain-density 40
               :grain-density-spread 5
               :grain-start '(0 .1 1 .22)
               :grain-start-spread .2
               :srate -12))

Example with one basic sound- le oboe.aif:

(progn
  (let ((dur '(q h w d -q -h))
        (amp '(ff p pp f mp)))

  (with-sound (:reverb jc-reverb :reverb-channels 2)
    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :grain-envelope '(0 0 .2 .2 .5 1 .8 .2 1 0))

     (grani-synth (rnd-sample 12 dur) "oboe"
                  (rnd-sample 12 amp)
                  :grains 10)

     (grani-synth (rnd-sample 12 dur) "oboe"
                  (rnd-sample 12 amp)
                  :grain-start '(0 .1 .3 .1 1 .6)
                  :amp-envelope '(0 1 1 1)
                  :grain-density 8
                  :grain-envelope '(0 0 .2 .2 .5 1 .8 .2 1 0)
                  :grain-envelope-end '(0 0 .01 1 .99 1 1 0)
                  :grain-envelope-transition '(0 0 .4 1 .8 0 1 0))
                 fi
                        fi
Opusmodus                                                     grani-synth   4

    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :grain-start '(0 0 1 1)
                 :amp-envelope '(0 1 1 1)
                 :grain-density 20
                 :grain-duration '(0 .003 .2 .01 1 .3))

    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :grain-start '(0 0 1 1)
                 :amp-envelope '(0 1 1 1)
                 :grain-density 20
                 :grain-duration '(0 .003 .2 .01 1 .3)
                 :grain-duration-limit .02)

    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :amp-envelope '(0 1 1 1)
                 :grain-density 40
                 :grain-start '(0 .1 .3 .1 1 .6))

    (grani-synth (rnd-sample 12 dur)"oboe"
                 (rnd-sample 12 amp)
                 :amp-envelope '(0 1 1 1)
                 :grain-density 40
                 :grain-start '(0 .1 .3 .1 1 .6)
                 :grain-start-spread .01)

    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :grain-start '(0 0 1 1)
                 :grain-start-spread 0.01
                 :amp-envelope '(0 1 1 1)
                 :grain-density 40
                 :srate '(0 0 .2 0 .6 5 1 5))

    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :grain-start '(0 0 1 1)
                 :grain-start-spread .01
                 :amp-envelope '(0 1 1 1)
                 :grain-density (rnd-sample 12 '(40 30 20))
                 :srate-base 2
                 :srate '(0 0 .2 0 .6 -1 1 -1))
Opusmodus                                                       grani-synth   5

    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :grain-start '(0 0 1 1)
                 :grain-start-spread .01
                 :amp-envelope '(0 1 1 1)
                 :grain-density (rnd-sample 12 '(40 30 20))
                 :srate-linear t
                 :srate (list 0 1 .2 1 .6
                              (expt 2 5/12) 1 (expt 2 5/12)))

    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :grain-start '(0 0 1 1)
                 :grain-start-spread .01
                 :amp-envelope '(0 1 1 1)
                 :grain-envelope '(0 0 .2 .2 .5 1 .8 .2 1 0)
                 :grain-density (rnd-sample 12 '(40 30 20))
                 :grain-duration '(0 .02 1 0.1)
                 :grain-duration-spread '(0 0 .5 .1 1 0))

    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :grain-start '(0 0 1 1)
                 :grain-start-spread 0.01
                 :amp-envelope '(0 1 1 1)
                 :grain-density (rnd-sample 12 '(40 30 20))
                 :grain-degree '(0 0 1 90)
                 :grain-degree-spread 10)

    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :grain-duration .06
                 :grain-density 20
                 :grain-density-spread 2
                 :srate 0)

    (grani-synth (rnd-sample 12 dur) "oboe"
                 (rnd-sample 12 amp)
                 :grain-duration .08
                 :grain-density (rnd-sample 12 '(40 30 20))
                 :grain-density-spread 2
                 :srate 5
                 :grain-degree 0
                 :grain-envelope '(0 0 .2 .2 .5 1 .8 .2 1 0)
                 :grain-envelope-end '(0 0 .01 1 .99 1 1 0))
Opusmodus                                                        grani-synth   6

     (grani-synth (rnd-sample 12 dur) "oboe"
                  (rnd-sample 12 amp)
                  :grain-duration .05
                  :grain-density 35
                  :grain-density-spread 3
                  :srate -5
                  :grain-degree 90
                  :srate (list 0 1 .3 1 .3
                               (expt 2 5/12) 1 (expt 2 5/12)))
     )))


---------------------------------------------------------
CLM instrument: grani.ins
A granular synthesis instrument by Fernando Lopez-Lezcano.

(with-sound () (grani 0 4 1 "oboe"))

(with-sound (:reverb jc-reverb :reverb-channels 1)
  (grani 0 1 .5 "oboe"
         :grain-envelope '(0 0 0.2 0.2 0.5 1 0.8 0.2 1 0)))

---------------------------------------------------------
