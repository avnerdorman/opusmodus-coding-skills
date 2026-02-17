Opusmodus                                                                get-tuning   1

get-tuning frequency
[Function]

Arguments and Values:
frequency              a list of frequency values.


Description:

The function GET-TUNING returns the difference of a frequency value to the closest
tempered pitch.

1.0 = 1 semitone
0.5 = 1/2 semitone (quarter tone)
0.25 = 1/4 semitone
etc…

(setf partials (library 'tbn-cs3-partials 'partials 'p200))
=> (0.637211 1428.8441 3.01E-4 0.649705 1428.0863
    2.72E-4 0.6622 1423.5563 2.48E-4 0.674694 . . .)

(setf tempered (partial :pitch partials :quantize 1/2))
=> (f6 f6 f6 f6 f6 f6 f6 f6 f6 f6 f6 f6 f6 f6
    f6 fs6 fs6 fs6 fs6 . . .)

This tuning list below can be used in a DEF-SCORE instrument :tuning option for
microtonal composition.

(setf tuning (get-tuning (partial :freq partials)))
=> (0.39 0.38 0.33 0.27 0.23 0.23 0.21 0.17 0.47 0.23 0.36
    0.46 0.47 0.42 0.43 -0.48 -0.33 -0.33 -0.38 -0.46 0.5
    0.27 0.29 0.29 0.3 -0.41 -0.37 -0.36 -0.38 -0.49 0.26
    0.19 0.18 0.16 0.29 0.37 0.35 0.22 0.45 -0.24 -0.25
    -0.28 -0.3 -0.28 -0.2 -0.14 -0.13 -0.12 -0.13 -0.15
    -0.16 0.09 -0.12 -0.46 -0.43 -0.47 0.49 0.41 0.31 0.29
    0.25 0.21 -0.46 -0.48 -0.49 -0.41 -0.42 -0.5 0.49 -0.45
    -0.41 -0.39 -0.39 -0.41 -0.47 -0.46 -0.33 -0.29 -0.24
    -0.29 -0.05 -0.07 -0.12 -0.12 -0.09 -0.1 -0.14 -0.25
    -0.3 -0.44 0.5 0.46 0.24 0.25 0.26 0.25 0.29 0.4 0.4
    0.38 0.3 -0.31 -0.12 -0.09 0.13 0.15 0.14 0.04 -0.06
    -0.03 0.01 0.03 0.06 0.11 0.2 0.16 0.08 -0.14 -0.16
    -0.19 -0.22 -0.18 -0.12 -0.11 -0.12 -0.44 -0.44 -0.42
    -0.44 -0.44 -0.42 -0.39 -0.27 -0.24 -0.29 -0.43 0.46
    0.37 0.37 0.4 0.41 0.32 -0.45 -0.25 -0.08 -0.08)
Opusmodus                                                     get-tuning   2

Examples:
(setf len '(1/8 1/14 1/16 1/20))
(setf span (gen-repeat 2 '(3 4 5 9 7 8)))
(setf picc-span (rnd-order span))
(setf picc-par (library 'tbn-cs3-partials 'partials 'p200))
(setf picc-d1 (length-span (gen-repeat (1~ picc-span) '(1))
                           (vector-to-length
                            (rnd-pick len) 1 5 picc-par)))

(setf picc-p1 (partial :pitch picc-par :quantize 1/2))
(setf picc-v1 (vector-to-velocity 'p 'mf picc-par))

(setf picc (make-omn
            :length picc-d1
            :pitch picc-p1
            :velocity picc-v1))

(setf picc-tuning (get-tuning (span picc (partial :freq picc-par))))

(def-score tuning
           (:title "tuning"
            :key-signature 'chromatic
            :time-signature (get-time-signature picc)
            :tempo 120
            :layout (piccolo-layout 'picc))

  (picc :omn picc :tuning picc-tuning
   :channel 1 :sound 'gm :program 'piccolo))
