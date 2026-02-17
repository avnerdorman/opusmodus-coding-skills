Opusmodus                                                                         tubebell-synth   1

tubebell-synth dur freq amp &key base bpm
[Function]

Arguments and Values:
dur                      omn-form list or lengths (number, ratio or length-symbol).
freq                     omn-form list, pitches or frequencies (hz).
amp                      omn-form list or velocities.
base                     number. The default is 32.
bpm                      number. Beats per Minute. The default is 60.


Description:

FM instrument, tubular bell.


Examples:
(with-sound () (tubebell-synth 5.0 200.0 0.6))

I.
(progn
 (defparameter omn
   '((-3e c4 pp< pizz+stacc stacc -e - 5e f5 mf< arco a5 e6 fs6 bb6)
     (-e q. g5 < trem+harm) (q g5 trem+harm -s f4e5 ff stacc+pizz -e)))

    (with-sound (:reverb jc-reverb)
     (tubebell-synth omn omn omn))
)

II.
(progn
 (setf count 120 length '(s t t t e))
 (setf partials (library 'marangona-partials 'partials nil :random 30))
 (setf par (rnd-sample count (partial :freq (flatten partials))))
 (defparameter freq (gen-divide (rnd-sample count '(1 2 3)) par))
 (defparameter dur (list (length-span 42 (rnd-sample count length))))
 (defparameter vel (rndn count 0.05 0.43))

    (with-sound (:reverb jc-reverb :scaled-to .7)
     (tubebell-synth dur freq vel))
)
Opusmodus                                                   tubebell-synth   2

---------------------------------------------------------
CLM instrument: tubebell.ins
Taken from Perry Cook's Synthesis Toolkit.

(with-sound () (tubebell 0 5 754.0 0.6))

---------------------------------------------------------
