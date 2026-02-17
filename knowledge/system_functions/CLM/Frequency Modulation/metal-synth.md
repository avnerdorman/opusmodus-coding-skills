Opusmodus                                                                           metal-synth   1

metal-synth dur freq amp &key bpm
[Function]

Arguments and Values:
dur                    omn-form list or lengths (number, ratio or length-symbol).
freq                   omn-form list, pitches or frequencies (hz).
amp                    omn-form list or velocities.
bpm                    number. Beats per Minute. The default is 60.


Description:

FM instrument, heavy metal.


Examples:
(with-sound () (metal-synth 5.0 200.0 0.6))

(progn
 (setf size 200)
 (setf sine-modu
       (add-sine-waves
        4 size 1 0.6
        :modulation
        (gen-sine size 1 (sort-asc '(0.5 0.4 0.3 0.6 0.2 0.9))
                  :modulation (gen-sine size 1 0.9 :phase 180))))

    (setf pitch (gen-divide 4 (vector-to-pitch '(c2 gs6) sine-modu)))
    (setf len1 (gen-loop 2 (rnd-sample 20 '((6q = = = = =)))))

    (setf len2 (gen-loop 2 (rnd-sample 20 '((q) (3q = =) (q)
                                            (e =) (3q= =) (q) (3q ==)))))

    (setf dur (assemble-seq '(q) '(3q= =) '(3q = =)
                            '(3q = =) (1~ len1) (2~ len1)))

    (setf vel (gen-cresc-dim (get-count dur :sum t) 'pp 'mf))

    (defparameter omn (make-omn
                       :length dur
                       :pitch (filter-repeat 1 (flatten pitch))
                       :velocity vel
                       :flat t))

    (with-sound (:reverb jc-reverb)
     (metal-synth omn omn omn :bpm 96))
)
Opusmodus                                                   metal-synth   2

---------------------------------------------------------
CLM instrument: metal.ins
Taken from Perry Cook's Synthesis Toolkit.

(with-sound () (metal 0 5 200.0 0.6))

---------------------------------------------------------
