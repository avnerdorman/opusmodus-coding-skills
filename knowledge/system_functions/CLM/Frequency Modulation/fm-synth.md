Opusmodus                                                                              fm-synth   1

fm-synth type dur freq amp &key loop bpm
[Function]

Arguments and Values:
type                    modulation type: :out, :ssb, :nsin, :ncos, :nrxysin,
                        :nrxycos, :osc, :osc2, :asy, :saw, :sqr, :tri,
                        :pul, :oz, :op, :tz, :tp, :frm, :firm, :firm2, :poly,
                        :polyw, :dly, :cmb, :not, :alp, :ave, :tab, :ran,
                        :ri, :rndist, :ridist, :env, :amb, :loc, :dup,
                        :dup2 and :dloc.
dur                     omn-form list or lengths (number, ratio or length-symbol).
freq                    omn-form list, pitches or frequencies (hz).
amp                     omn-form list or velocities.
loop                    NIL to T. The default is NIL. If T, the type list is looped.
bpm                     number. Beats per Minute. The default is 60.


Description:

A generic multi-type FM instrument.


Examples:
(with-sound () (fm-synth :ssb 2.0 440.0 1.0))
(with-sound () (fm-synth :saw 'q 'a4 1.0))
(with-sound () (fm-synth '(:ave :saw :poly) 'q '(a4 a4 a4 a4) 1.0))

(with-sound ()
 (fm-synth '(:polyw :dly :ncos :sqr :pul :tri :poly)
           's
           (rnd-sample 64 '(c4 ds5 f4 g3 a5))
           (rnd-sample 64 '(ppp pp pp mf f))
           :bpm 120 :loop t)

 (fm-synth :cmb '(-s e = -e.)
           (rnd-sample 16 '(c3))
           (rnd-sample 16 '(p mf f))
           :bpm 120 :loop t))


---------------------------------------------------------
CLM instrument: ug2.ins
(with-sound () (simple-nsin 0 5 200.0 0.6))

---------------------------------------------------------
