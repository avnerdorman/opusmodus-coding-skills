Opusmodus                                                                                 x+b   1

x+b x b
[Function]

Arguments and Values:
x                         a sequence of numbers.
b                         a number.


Description:

This function returns a list of numbers obtained by adding b to each element of x.

(x+b '(1 2 3) 2)
=> (3 4 5)

(x+b '(1/4 1/2 1/8) 2)
=> (9/4 5/2 17/8)

(x+b '(0.1 0.2 0.3) 0.2)
=> (0.3 0.4 0.5)

Sometimes such functions can produce interesting and surprising variations. The function
can be used with pitches, note-lengths and velocities.


Score Example:

In this short piece for clarinet and horn a series of melodies are devised from a single integer
list by using the function X+B.

(setf phrase (rndn 20 0 12))
=> (12 3 6 0 1 7 5 11 5 3 2 1 4 11 11 11 5 0 5 2)

(setf motives (gen-divide 5 phrase))
=> ((12 3 6 0 1) (7 5 11 5 3) (2 1 4 11 11) (11 5 0 5 2))

(setf motifs-1 (position-remove '(0 1 2) motives :type 'list))
=> ((2 10 9 5 9))

(setf m-1x (x+b (flatten motifs-1) -7))
=> (-5 3 2 -2 2)

(setf motifs-2 (position-remove '(0 2 3) motives :type 'list))
=> ((5 0 5 2 11))
Opusmodus                                                         x+b   2

(setf m-2x (x+b (flatten motifs-2) -4))
=> (1 -4 1 -2 7)

(setf motives-x (position-replace
                 '(1 3) (list m-2x m-1x) motives :type 'list))
=> ((1 4 11 11 11) (1 -4 1 -2 7)
    (8 3 5 8 11) (-5 3 2 -2 2))

(setf motives-cl (integer-to-pitch motives))
=> ((cs4 e4 b4 b4 b4) (f4 c4 f4 d4 b4)
    (gs4 eb4 f4 gs4 b4) (d4 bb4 a4 f4 a4))

(setf motives-hn (integer-to-pitch motives-x))
=> ((cs4 e4 b4 b4 b4) (cs4 gs3 cs4 bb3 g4)
    (gs4 eb4 f4 gs4 b4) (g3 eb4 d4 bb3 d4))

(setf map (gen-binary-change motives-hn))
=> ((1 1 1 0 0) (1 1 1 1 1)
    (1 1 1 1 1) (1 1 1 1 1))

(setf rhy-x (binary-map (flatten map) 'e))
=> (1/8 1/8 1/8 -1/8 -1/8 1/8 1/8 1/8 1/8 1/8
    1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8)

(setf m-edit-cl (binary-map map motives-cl))
=> ((cs4 e4 b4) (f4 c4 f4 d4 b4)
    (gs4 eb4 f4 gs4 b4) (d4 bb4 a4 f4 a4))

(setf m-edit-hn (binary-map map motives-hn))
=> ((cs4 e4 b4) (cs4 gs3 cs4 bb3 g4)
    (gs4 eb4 f4 gs4 b4) (g3 eb4 d4 bb3 d4))

(setf dyn (vector-to-velocity
           0.30 0.56 (gen-noise (get-count m-edit-cl :sum t))))
=> (mp mf p mp mp mf pp mf p pp p pp mp p mp mp mp mf)

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
