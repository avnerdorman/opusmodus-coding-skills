Opusmodus                                                                        init-seed      1

init-seed n
[Function]

Arguments and Values:
n                        an integer.


Description:

Initialise random seed to all the other functions which may also use random seed.

(init-seed 32)
=> 32


Examples:

INIT-SEED can be used at the start of algorithmic compositions employing high degrees of
randomness in order to create consisted results, without having to worry about supplying
seed n values to all the other functions which may also use random generation.

(init-seed 32)

(rnd-pick '(a b c))

… will always pick c

The function initialise sequential seed numbers which give us greater control if a seed needs
to be changed or a new one added. All other init-seeds stay unchanged and in the same
sequential position. It is important to reset the INIT-SEED to NIL again (init-seed
NIL) otherwise the INIT-SEED will continue to initialise random seeds to all the other
functions with seed NIL.
Opusmodus                                            init-seed   2

INIT-SEED test:
(progn
  (init-seed 1)
  (rnd-sample 4 '(1 2 3 4))
  (gen-loop 4 (rnd-sample 4 '(1 2 3 4)) :seed 567)
  (rnd-sample 4 '(1 2 3 4))
  (rnd-sample 4 '(1 2 3 4) :seed 67538)
  (rnd-sample 4 '(1 2 3 4) :seed 345)
  (rnd-sample 4 '(1 2 3 4))
  (rnd-sample 4 '(1 2 3 4))
  (rnd-pick '(1 2 3 4) :seed 9756)
  (rnd-pick '(1 2 3 4))
  (rnd-pick '(1 2 3 4))
  (rnd-pick '(1 2 3 4))
  (init-seed nil)
  )

Result:
? init-seed state: 1
rnd-sample n: 4 seed: 1
gen-loop count: 4 seed: 567
rnd-sample n: 4 seed: 3
rnd-sample n: 4 seed: 67538
rnd-sample n: 4 seed: 345
rnd-sample n: 4 seed: 6
rnd-sample n: 4 seed: 7
rnd-pick seed: 9756
rnd-pick seed: 9
rnd-pick seed: 10
rnd-pick seed: 11
init-seed state: nil
Opusmodus                                                       init-seed   3

Score Example:
;; Initialise random seed
(init-seed 98)

(setf row (library 'vienna 'berg 'r11))
(setf degree '(0 3 4 0 -2 -3 -1 0 -2))

(setf mat
      (gen-loop 6 (harmonic-progression
                   (setf degree (gen-rotate 2 degree)) row
                   :relative t)))

(setf end1 (harmonic-progression '(-13 -13) row :relative t))
(setf end2 (harmonic-progression '(-12 -12) row :relative t))
(setf end3 (harmonic-progression '(-13 -13) row :relative t))
(setf end4 (harmonic-progression '(-12) row :relative t))

(setf omn (make-omn
            :length '((q) (-h))
            :pitch (assemble-seq mat end1 end2 end3 end4)
            :velocity '(f)
            :span :pitch))

(def-score init-seed
           (:key-signature 'chromatic
            :time-signature '(2 8)
            :tempo 88
            :layout (grand-layout 'pno))

  (pno
    :omn omn
    :sound 'gm
    :channel 1
    :program 0)
  )

;; At the end of the score we reset the init-seed to nil again.
(init-seed nil)
