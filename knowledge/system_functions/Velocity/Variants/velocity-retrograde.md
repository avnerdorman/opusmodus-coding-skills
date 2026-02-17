Opusmodus                                                                       velocity-retrograde   1

velocity-retrograde velocity &key section exclude
[Function]

Arguments and Values:
velocity                 velocity symbols or oat numbers.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

This function is able to reverse a list of dynamic values in oating point and OMN notation.

(velocity-retrograde '(mf p pp mp = = =))
=> (mp mp mp mp pp p mf)

(velocity-retrograde '((mf p pp = mp = pppp = ppppp)
                       (mp mf p = = = = pp ppp)))
=> ((ppppp pppp pppp mp mp pp pp p mf)
    (ppp pp p p p p p mf mp))

OMN:

(velocity-retrograde '(q e4 mf f4 f g4 ff))
=> (q e4 ff f4 f g4 mf)

(velocity-retrograde
 '((e c4 f cs5 f d4 f ds5 p f4 p fs5 p c5 p pp)
   (e cs4 p f d4 f eb5 p f4 p eb4 f d3 p ppppp)))
=> ((e c4 pp cs5 p d4 ds5 f4 fs5 f c5 c5)
    (e cs4 ppppp p d4 f eb5 p f4 eb4 f d3 d3 p))
                                      fl
                                                          fl
Opusmodus                                             velocity-retrograde   2

Examples:
(setf source (vector-to-velocity 'ppp 'fff (gen-noise 40)))
(setf ret (velocity-retrograde source)
(setf inv (velocity-invert source))

(velocity-list-plot source)




Source and retrograde:

(velocity-list-plot (list source ret))
Opusmodus                                velocity-retrograde   3

Source and inversion:

(velocity-list-plot (list source inv))




Retrograde and inversion:

(velocity-list-plot (list ret inv))
Opusmodus                                                     velocity-retrograde    4

Source, retrograde and inversion:

(velocity-list-plot (list source ret inv))




Score Example:

VELOCITY-RETROGRADE can be useful in orchestration when in a densely score passage
instrument lines need to be highlighted.

(setf phrase-1 (rndn 20 0 12))
(setf phrase-2 (rndn 20 0 6))
(setf phrase-3 (ambitus-integer '(-12 12)
                (x*y phrase-1 phrase-2)))

(setf
 trio-vel (velocity-retrograde (gen-dim (length phrase-1) 'fff 'p)))

(setf
 t-1 (integer-to-pitch phrase-1)
 t-2 (integer-to-pitch phrase-2)
 t-3 (integer-to-pitch phrase-3))

(setf
  fanfare-rhy
  (gen-length '(1 1 2 1 1 1 1 2 1 1 3 1 2 2 1 1 1 1 4 4) 16))

(setf
 trio-vel-1 (velocity-retrograde (gen-dim (length phrase-1) 'fff 'pp))
 trio-vel-2/3 (gen-dim (length phrase-1) 'fff 'pp))
Opusmodus                                               velocity-retrograde   5

(velocity-list-plot (list trio-vel-1 trio-vel-2/3)
 :style :axis :point-radius 2 :join-points t)




(def-score fanfare
           (:key-signature 'chromatic
            :time-signature '(2 4)
            :tempo '(q 50))

 (horn1
  :length fanfare-rhy :pitch t-1 :velocity trio-vel-1
  :channel 1 :sound 'gm :program 'french-horn :pan 0)

 (horn2
  :length fanfare-rhy :pitch t-2 :velocity trio-vel-2/3
  :channel 2 :pan 64)

 (horn3
  :length fanfare-rhy :pitch t-3 :velocity trio-vel-2/3
  :channel 3 :pan 120))
