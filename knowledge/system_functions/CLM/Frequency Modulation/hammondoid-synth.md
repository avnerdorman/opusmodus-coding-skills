Opusmodus                                                                       hammondoid-synth   1

hammondoid-synth dur freq amp &key bpm
[Function]

Arguments and Values:
dur                       omn-form list or lengths (number, ratio or length-symbol).
freq                      omn-form list, pitches or frequencies (hz).
amp                       omn-form list or velocities.
bpm                       number. Beats per Minute. The default is 60.


Description:

FM instrument, Hammond.


Examples:
(with-sound () (hammondoid-synth 5.0 200.0 0.6))

(progn
 (defparameter omn
   '(((marc e e3 mp eb4 fs3 c3) s g3 stacc e fs2 < marc
       (stacc s g2 < 5q gs2 < d3 < cs4 < e4 < d3 <))
       (e c3 < marc gb2 < marc
       (stacc 5q c3 < d3 < c3 < ab2 < g3 < d3 < cs4 < eb4 < a3 < bb2 <
              d3 < a2 < b2 < bb2 < c4 mf))))

    (with-sound (:reverb jc-reverb)
     (hammondoid-synth omn omn omn :bpm 72))
)


---------------------------------------------------------
CLM instrument: hammondoid.ins
Taken from Perry Cook's Synthesis Toolkit.

(with-sound () (hammondoid 0 5 120.0 0.6))

---------------------------------------------------------
