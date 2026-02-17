Opusmodus                                                                             velocity-invert   1

velocity-invert velocity &key section exclude
[Function]

Arguments and Values:
velocity                 a oat or velocity-symbol list(s).
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

This function is able to invert a list of dynamic values in oating point, symbols and OMN
notation.


Examples:
(velocity-invert '(mf p pp mp = = = pppp ppppp))
=> (mp f ff mf mf mf mf ffff fffff)

(velocity-invert '(mp mf p = pp = ppp))
=> (mf mp f f ff ff fff)

(velocity-invert '(0.44 0.07 0.84 0.45))
=> (0.56 0.93 0.16 0.55)

(velocity-invert '((0.44 0.07 0.84 0.45) (0.23 0.34 0.45 0.20)))
=> ((0.56 0.93 0.16 0.55) (0.77 0.66 0.55 0.8))

OMN:

(velocity-invert '(q e4 mf f4 f e4 ff))
=> (q e4 mp f4 p e4 pp)

(velocity-invert
 '((e c4 f cs5 f d4 f ds5 p f4 p fs5 p c5 p pp)
   (e cs4 p f d4 f eb5 p f4 p eb4 f d3 p ppppp)))
=> ((e c4 p cs5 d4 ds5 f f4 fs5 c5 c5 ff)
    (e cs4 f p d4 eb5 f f4 eb4 p d3 f fffff))
                    fl
                                                        fl
Opusmodus                                                              velocity-invert   2

Score Example:

This can be useful when seeking clarity in a densely scored passage.

(setf phrase-1 (rndn 20 0 12))
(setf phrase-2 (rndn 20 0 6))
(setf phrase-3 (ambitus-integer '(-12 12) (x*y phrase-1 phrase-2)))

(setf trio-vel (velocity-invert (gen-dim (length phrase-1) 'fff 'p)))

(setf t-1 (integer-to-pitch phrase-1))
(setf t-2 (integer-to-pitch phrase-2))
(setf t-3 (integer-to-pitch phrase-3))

(setf fanfare-rhy
        (gen-length '(1 1 2 1 1 1 1 2 1 1 3 1 2 2 1 1 1 1 4 4) 16))

(setf trio-vel-2/3 (gen-dim (length phrase-1) 'fff 'pp))
(setf trio-vel-1 (velocity-invert trio-vel-2/3))

(velocity-list-plot (list trio-vel-1 trio-vel-2/3))
Opusmodus                                                 velocity-invert   3

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
