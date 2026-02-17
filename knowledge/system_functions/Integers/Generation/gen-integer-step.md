Opusmodus                                                                        gen-integer-step   1

gen-integer-step start n step &key remove
[Function]

Arguments and Values:
start                  an integer.
n                      an integer.
step                   a list of integers.
remove                 an integer or a list of integers. Removes integer from the list.


Description:

GEN-INTEGER-STEP generates integer list in accordance to the step values.

(gen-integer-step 0 12 1)
=> (0 1 2 3 4 5 6 7 8 9 10 11)

(gen-integer-step 0 12 1 :remove 7)
=> (0 1 2 3 4 5 6 8 9 10 11)

(gen-integer-step 0 12 '(1 -2 3 1))
=> (0 1 -1 2 3 4 2 5 6 7 5 8)

(gen-integer-step 0 12 '(1 1 2 2 -2 -2 -1 -1))
=> (0 1 2 4 6 4 2 1 0 1 2 4)


Examples:
(setf arp1
      (make-omn
       :pitch (ambitus '(c3 c6)
                       (integer-to-pitch
                        (gen-integer-step
                         0 32
                         (rnd-sample 4 '(1 2 3 -1 -2 -3) :seed 41))))
       :length (gen-repeat 32 '(s))))
=> (s c4 cs4 d4 cs4 e4 f4 fs4 f4 gs4 a4 bb4 a4 c5 cs5 d5 cs5
      e5 f5 fs5 f5 gs5 a5 bb5 a5 c6 cs5 d5 cs5 e5 f5 fs5 f5)

Select the expression above and AUDITION with Cmd-1 key command.
Opusmodus                                                 gen-integer-step   2

Score Example:
(setf length
      (length-weight
       (binary-map
        (gen-binary-euclidean 23 '(16 16) 12 16) '1/16)
       :weight '(8 1)))

(setf pitch
      (integer-to-pitch
       (gen-loop 23 (gen-integer-step
                     0 (rnd-pick '(8 32 16 12))
                     (rnd-sample 4 '(1 2 3 4 5 6 -1 -2 -3))))))

(setf velocity
      (get-velocity
       (vector-range 0.3 0.7 (gen-noise 512))
       :type :symbol))

(setf omn
      (make-omn
       :length length
       :pitch pitch
       :velocity velocity))

(setf clar-solo
      (filter-tie
       (ambitus '(d3 c6)
                (pitch-transpose
                  '(0 1 -2 3 -4 5 -6 7 -8 9 -10 11
                    -10 9 -8 7 -6 5 -4 3 -2 1 0)
                  omn))))

(def-score clar
           (:key-signature 'atonal
            :time-signature '(4 4)
            :tempo '(160))

  (clarinet
    :omn clar-solo
    :channel 1
    :sound 'gm
    :program 'clarinet
    :pan 64)
  )

(display-midi (compile-score 'clar))
