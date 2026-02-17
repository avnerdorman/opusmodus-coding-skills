Opusmodus                                                                                   x+y   1

x+y x y
[Function]

Arguments and Values:
x                         a sequence of numbers.
y                         a sequence of numbers.


Description:

This function returns a list of numbers obtained by adding x and y together element by
element.

(x+y '(1 2 3) '(1 2 3))
=> (2 4 6)

(x+y '(1/4 1/2 1/8) '(1/4 1/2 1/8))
=> (1/2 1 1/4)

(x+y '(0.1 0.2 0.3) '(0.1 0.2 0.3))
=> (0.2 0.4 0.6)

Sometimes such functions can produce interesting and surprising variations. The function
can be used with pitches, note-lengths and velocities.


Examples:

In this short piece for clarinet and drone a series of melodies are devised from a single
integer list by using the function X+Y.

(setf phrase (rndn 20 0 12))
=> (4 2 10 10 9 10 7 2 11 11 5 2 6 12 2 2 2 3 11 3)

(setf motives (gen-divide 5 phrase))
=> ((4 2 10 10 9) (10 7 2 11 11) (5 2 6 12 2) (2 2 3 11 3))

Notice how POSITION-REMOVE is used to select individual lists from a list of lists.

(setf motifs-1 (position-remove '(0 1) motives :type 'list))
=> ((5 2 6 12 2) (2 2 3 11 3))

(setf motifs-2 (position-remove '(2 3) motives :type 'list))
=> ((4 2 10 10 9) (10 7 2 11 11))
Opusmodus                                                             x+y   2

(setf a-motives (x+y (1~ motives) (2~ motives)))
=> (14 9 12 21 20)

(setf b-motives (x+y (3~ motives) (4~ motives)))
=> (7 4 9 23 5)

(setf n-motives (list a-motives b-motives))
=> ((14 9 12 21 20) (7 4 9 23 5))

(setf m-lis (assemble-seq motifs-1 n-motives
                          motifs-2 n-motives))
=> ((5 2 6 12 2) (2 2 3 11 3) (14 9 12 21 20) (7 4 9 23 5)
    (4 2 10 10 9) (10 7 2 11 11) (14 9 12 21 20) (7 4 9 23 5))

(setf m-motives (integer-to-pitch m-lis))
=> ((f4 d4 fs4 c5 d4) (d4 d4 eb4 b4 eb4) (d5 a4 c5 a5 gs5)
    (g4 e4 a4 b5 f4) (e4 d4 bb4 bb4 a4) (bb4 g4 d4 b4 b4)
    (d5 a4 c5 a5 gs5) (g4 e4 a4 b5 f4))

The function GEN-BINARY-CHANGE is used to erase all repeated notes.

(setf map (gen-binary-change m-motives))
=> ((1 1 1 1 1) (1 0 1 1 1) (1 1 1 1 1) (1 1 1 1 1)
    (1 1 1 0 1) (1 1 1 1 0) (1 1 1 1 1) (1 1 1 1 1))

The BINARY-MAP does not operate on lists, hence the atten pre x.

(setf rhy-x (binary-map map 'e))
=> ((1/8 1/8 1/8 1/8 1/8) (1/8 -1/8 1/8 1/8 1/8)
    (1/8 1/8 1/8 1/8 1/8) (1/8 1/8 1/8 1/8 1/8)
    (1/8 1/8 1/8 -1/8 1/8) (1/8 1/8 1/8 1/8 -1/8)
    (1/8 1/8 1/8 1/8 1/8) (1/8 1/8 1/8 1/8 1/8))

(setf m-edit (binary-map map m-motives))
=> ((f4 d4 fs4 c5 d4) (d4 eb4 b4 eb4) (d5 a4 c5 a5 gs5)
    (g4 e4 a4 b5 f4) (e4 d4 bb4 a4) (bb4 g4 d4 b4)
    (d5 a4 c5 a5 gs5) (g4 e4 a4 b5 f4))

(setf dyn (vector-to-velocity 0.57 0.87 (gen-noise (length m-edit))))
=> (mf ff ffff ff ff ff f ff)
                                             fl
                                                       fi
Opusmodus                                     x+y   3

Score Example:
(def-score c-duo
           (:key-signature 'chromatic
            :time-signature '(5 8)
            :tempo '(q 90))

 (clarinet
  :length rhy-x
  :pitch m-edit
  :velocity dyn
  :channel 1 :sound 'gm :program 'clarinet)

 (drone
   :length '(40/8)
   :pitch '(c3)
   :velocity '(p)
   :channel 2)
 )

(display-midi (compile-score 'c-duo))
