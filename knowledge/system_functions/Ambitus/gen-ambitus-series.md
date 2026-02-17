Opusmodus                                                                gen-ambitus-series   1

gen-ambitus-series ambitus list1 list2
[Function]

Arguments and Values:
ambitus                 instrument name or an integer or pitch list (low high).
list1                   a list of oating numbers or vector.
list2                   a list of oating numbers or vector.


Description:

One of the features of the OPUSMODUS approach is its ability to respond to the demands of
composers working with standard acoustic instruments in serial and post-serial strategies
where interval relationships may need to be expressed in a variety of ways. The function
GEN-AMBITUS-SERIES generates a series of range lists derived from two vectors, and is a
companion to the AMBITUS function.

(gen-ambitus-series
 '(-30 42)
 (vector-smooth 0.2 (gen-noise 12 :seed 23))
 (vector-smooth 0.2 (gen-noise 12 :seed 24)))
=> ((8 27) (8 27) (-3 13) (-11 5) (17 42) (14 24)
    (25 42) (-7 24) (-30 0) (-30 -15) (-10 -5) (16 26))


Examples:
(setf mat '((c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4)
            (c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4)
            (c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4)
            (c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4)))

(setf range (gen-ambitus-series '(-20 30) (rndn 4) (rndn 4)))
=> ((-20 -9) (-20 29) (17 28) (30 30))

(ambitus range mat)
=> ((c3 cs3 d3 eb3 e2 f2 fs2 g2 gs2 a2 bb2 b2)
    (c4 cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4)
    (c6 cs6 d6 eb6 e6 f5 fs5 g5 gs5 a5 bb5 b5)
    (fs6 fs6 fs6 fs6 fs6 fs6 fs6 fs6 fs6 fs6 fs6 fs6))




(setf ambitus
                         fl
                         fl
Opusmodus                                                gen-ambitus-series   2

        (gen-ambitus-series
         '(-30 42)
         (add-sine-waves 4 64 4 0.6
                         :modulation (gen-triangle 64 1 0.4 :phase 60))
         (add-sine-waves 2 64 4 0.4
                         :modulation (gen-triangle 64 5 0.1 :phase 45))))

The visualisation of the ambitus series:

(pitch-list-plot
 (flatten (chordize (integer-to-pitch ambitus)))
 :point-radius 2
 :join-chords t)


    c8c8
    fs7fs7
    c7c7
    fs6fs6
    c6c6
    fs5fs5
    c5c5
    fs4fs4
    c4c4
    fs3fs3
    c3c3
    fs2fs2
    c2c2
    fs1fs1
    c1c1
                10
                 10       20
                           20       30
                                     30    40
                                            40   50
                                                  50    60
                                                         60       70
                                                                   70




Score Example:
(setf ambitus1
      (gen-ambitus-series '(-30 42)
       (add-sine-waves
        4 64 4 0.6 :modulation (gen-triangle 64 1 0.4 :phase 60))
       (add-sine-waves
        2 64 4 0.4 :modulation (gen-triangle 64 5 0.1 :phase 45))))

(setf ambitus2
      (gen-ambitus-series '(-30 42)
       (add-sine-waves
        4 64 4 0.6 :modulation (gen-triangle 64 1 0.4 :phase 30))
       (add-sine-waves
        2 64 4 0.4 :modulation (gen-triangle 64 5 0.1 :phase 90))))
(setf origen (rnd 5))
Opusmodus                                              gen-ambitus-series   3


(setf pitches1 (vector-to-pitch ambitus1 (gen-mutate 64 origen)))
(setf pitches2 (vector-to-pitch ambitus2
                                (gen-mutate 64 origen :prob 0.6)))

(setf fib (fibonacci 8 23))

(setf length1
      (assemble-seq
       (gen-loop 2 (binary-rhythm
                    (rnd-sample 16 '(8 4 12 10) :seed 65)
                    (rnd-order fib)
                    (rnd-sample 16 '(s e 3q 5q) :seed 65)
                    :type (rnd-sample 16 '(1 2 3)) :variant '?))))

(setf length2
      (assemble-seq
       (gen-loop 2 (binary-rhythm
                    (rnd-sample 16 '(8 4 12 10) :seed 45)
                    (rnd-order fib)
                    (rnd-sample 16 '(s e 3q 5q) :seed 45)
                    :type (rnd-sample 16 '(1 2 3)) :variant '?))))

(setf vel (vector-to-velocity 'pp 'fff (gen-mutate 64 origen)))

(setf in1 (make-omn :length length1
                    :pitch pitches1
                    :velocity vel
                    :flat t))

(setf in2 (make-omn :length length2
                    :pitch pitches2
                    :velocity vel
                    :flat t))

(def-score ambitus-series
           (:copyright "© MMXVI Opusmodus"
            :key-signature 'chromatic
            :time-signature '(4 4)
            :tempo 96)

  (in1 :omn in1
       :sound 'gm
       :channel 1
       :program 0)

  (in2 :omn in2
       :channel 2
       :program 0)
  )
