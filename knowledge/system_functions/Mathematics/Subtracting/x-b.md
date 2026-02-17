Opusmodus                                                                                 x-b   1

x-b x b
[Function]

Arguments and Values:
x                         a sequence of numbers.
b                         a number.


Description:

This function returns a list of numbers obtained by subtracting b from each element of x.

(x-b '(4 6 8) 1)
=> (3 5 7)

(x-b '(1/4 1/2 1/8) 1/16)
=> (3/16 7/16 1/16)

(x-b '(0.6 0.7 0.5) 0.2)
=> (0.4 0.5 0.3)

Sometimes such functions can produce interesting and surprising variations. The function
can be used with pitches, note-lengths and velocities.


Score Example:

In this short piece for clarinet and horn a series of melodies are devised from a single integer
list by using the function X-B.

(setf phrase (rndn 20 0 12))
=> (12 3 6 0 1 7 5 11 5 3 2 1 4 11 11 11 5 0 5 2)

(setf motives (gen-divide 5 phrase))
=> ((12 3 6 0 1) (7 5 11 5 3)
    (2 1 4 11 11) (11 5 0 5 2))

(setf motifs-1 (position-remove '(0 1 2) motives :type 'list))
=> ((11 5 0 5 2))

(setf m-1x (x-b (flatten motifs-1) 7))
=> (4 -2 -7 -2 -5)

(setf motifs-2 (position-remove '(0 2 3) motives :type 'list))
=> ((7 5 11 5 3))
Opusmodus                                                         x-b   2

(setf m-2x (x-b (flatten motifs-2) 4))
=> (3 1 7 1 -1)
(setf motives-x (position-replace
                '(1 3) (list m-2x m-1x) motives :type 'list))
=> ((12 3 6 0 1) (3 1 7 1 -1)
    (2 1 4 11 11) (4 -2 -7 -2 -5))

(setf motives-cl (integer-to-pitch motives))
=> ((c5 eb4 fs4 c4 cs4) (g4 f4 b4 f4 eb4)
    (d4 cs4 e4 b4 b4) (b4 f4 c4 f4 d4))

(setf motives-hn (integer-to-pitch motives-x))
=> ((c5 eb4 fs4 c4 cs4) (eb4 cs4 g4 cs4 b3)
    (d4 cs4 e4 b4 b4) (e4 bb3 f3 bb3 g3))

(setf map (gen-binary-change motives-hn))
=> ((1 1 1 1 1) (1 1 1 1 1) (1 1 1 1 0) (1 1 1 1 1))

(setf rhy-x (binary-map (flatten map) 'e))
=> (1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8
    1/8 1/8 1/8 1/8 -1/8 1/8 1/8 1/8 1/8 1/8)

(setf m-edit-cl (binary-map map motives-cl))
=> ((c5 eb4 fs4 c4 cs4) (g4 f4 b4 f4 eb4)
    (d4 cs4 e4 b4) (b4 f4 c4 f4 d4))

(setf m-edit-hn (binary-map map motives-hn))
=> ((c5 eb4 fs4 c4 cs4) (eb4 cs4 g4 cs4 b3)
   (d4 cs4 e4 b4) (e4 bb3 f3 bb3 g3))

(setf dyn (vector-to-velocity
           0.30 0.56 (gen-noise (get-count m-edit-cl :sum t))))
=> (mp p mf p mf pp mf pp mp p mp mp p mp pp mp mf mf p)

(def-score c-duo
             (:key-signature 'chromatic
              :time-signature '(5 8)
              :tempo '(q 90))

(clarinet
 :length rhy-x :pitch m-edit-cl :velocity dyn
 :channel 1 :sound 'gm :program 'clarinet)

(horn
 :length rhy-x :pitch m-edit-hn :velocity '(mp)
 :channel 2 :program 'french-horn))

(display-midi (compile-score 'c-duo))
