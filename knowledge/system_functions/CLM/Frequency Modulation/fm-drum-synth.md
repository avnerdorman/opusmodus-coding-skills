Opusmodus                                                                         fm-drum-synth   1

fm-drum-synth dur freq amp index &key high degree distance
                        reverb-amount bpm

[Function]

Arguments and Values:
dur                      omn-form list or lengths (number, ratio or length-symbol).
freq                     omn-form list, pitches or frequencies (hz).
amp                      omn-form list or velocities.
index                    number.
high                     NIL or T. The default is NIL.
degree                   number. The default is 0.0.
distance                 number. The default is 1.0.
reverb-amount            number. Amount of sound to be sent to the reverb output stream.
                         The default is .01.
bpm                      number. Beats per Minute. The default is 60.


Description:

FM Instrument, drum.


Example:
(progn
 (defparameter snare '(-q 3q d2 f -q_3h 3q -- :r 2))
 (defparameter bass '(3q c2 ff - = -- = = - = - = = :r 2))

    (with-sound ()
     (fm-drum-synth bass bass bass 1)
     (fm-drum-synth snare snare snare 3))
)


---------------------------------------------------------
CLM instrument: fmex.ins
Jan Mattox's fm drum.

(with-sound ()
  (fm-drum 0 1.5 55 .3 5 :high nil)
  (fm-drum 2 1.5 66 .3 4 :high t))

---------------------------------------------------------
