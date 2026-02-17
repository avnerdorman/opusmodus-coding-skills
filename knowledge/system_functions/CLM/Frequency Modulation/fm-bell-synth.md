Opusmodus                                                                        fm-bell-synth   1

fm-bell-synth dur freq amp &key amp-env index-env index
                      degree distance reverb-amount bpm

[Function]

Arguments and Values:
dur                     omn-form list or lengths (number, ratio or length-symbol).
freq                    omn-form list, pitches or frequencies (hz).
amp                     omn-form list or velocities.
amp-env                 amplitude envelope. A list of time-value coordinates that determines
                        the evolution of loudness over time. The time values are relative
                        and are scaled to the duration of the note (for example I usually use
                        a time axis that stretches between 0 and 1).
                        The default is '(0 0 25 1 75 1 100 0).
index-env               envelope. Modulation index envelope. A list of time-value coordinates
                        that determines the evolution of modulation index over time.
                        The modulation index controls the "brightness" of the sound
                        (the higher the index the brighter the resulting sound).
                        The default is '(0 1 25 .4 75 .6 100 0).
index                   number. Modulation index. The scaler for the index envelope.
                        The default is 0.500.
degree                  number. Angle in degrees from where the sound is coming from
                        in a stereo rendition. "0" is left and "90" is right; "45" is right
                        in the middle of the stereo eld. The default is 0.0.
distance                number. Distance in feet from where the sound is coming from.
                        The default is 1.0.
reverb-amount           number. Amount of reverberation added to the sound.
                        For this to work you must have a reverberator loaded
                        and the with-sound call has to specify it. The default is 0.005.
bpm                     number. Beats per Minute. The default is 60.

Description:

The eternal FM bell sounds.


Example:
(progn
 (setf count 50)
 (setf partials (library 'marangona-partials 'partials nil :random 20))
 (setf par (rnd-sample count (partial :freq (flatten partials))))
 (setf freq (gen-divide (rnd-sample count '(1 2 3 4 5)) par))
 (setf dur (list (length-span 42 (rnd-sample count '(w h q w)))))

 (do-timeline
  '(dur (---xx--xx- ---xx---x- --x--xx--- ---x------ x-))
  '(gen-pause x) :time '(w))
                                           fi
Opusmodus                                                     fm-bell-synth   2

    (defparameter vel (rndn count 0.05 0.43))
    (defparameter dist (rndn count 0.5 1.0))

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
     (fm-bell-synth dur freq vel
                    :amp-env (rnd-sample count env)
                    :index-env (rnd-sample count env)
                    :index (rndn count 0.3 0.9)
                    :reverb-amount 0.30
                    :distance dist))
)


---------------------------------------------------------
CLM instrument: bell.ins
(with-sound ()
  (fm-bell 0     5.000 233.046 .028 :distance .5)
  (fm-bell 5.912 2.000 205.641 .019 :distance .650)
  (fm-bell 6.085 5.000 207.152 .017 :distance .750)
  (fm-bell 6.785 7.000 205.641 .010 :distance .650)
  (fm-bell 15.000 .500 880     .060 :distance .500)
  (fm-bell 15.006 6.500 293.66 .1   :distance .500)
  (fm-bell 15.007 7.000 146.5 .1    :distance 1.00)
  (fm-bell 15.008 6.000 110    .1   :distance 1.00)
  (fm-bell 15.010 10.00 73.415 .028 :distance .500)
  (fm-bell 15.014 4.000 698.46 .068 :distance .500))

---------------------------------------------------------
