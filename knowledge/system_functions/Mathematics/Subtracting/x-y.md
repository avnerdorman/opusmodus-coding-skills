Opusmodus                                                                            x-y   1

x-y x y
[Function]

Arguments and Values:
x                        a sequence of numbers.
y                        a sequence of numbers.


Description:

This function returns a list of numbers obtained by subtracting elements of y from
corresponding elements of x.

(x-y '(4 6 8) '(1 2 3))
=> (3 4 5)

(x-y '(1/4 1/2 1/8) '(1/16 1/20 2/20))
=> (3/16 9/20 1/40)

(x+y '(0.6 0.7 0.5) '(0.1 0.2 0.3))
=> (0.7 0.9 0.8)

Sometimes such functions can produce interesting and surprising variations. The function
can be used with pitches, note-lengths and velocities.


Score Example:

Here's a short fanfare for 3 trumpets. It's been created from two random generated phrases,
one expanded to cover two octaves, the other just one. The phrase for the third trumpet has
been made from subtracting the difference between phrase-2 and phrase-1 using the function
X-Y.

(setf phrase-1 (rndn 20 0 12))
=> (2 11 8 3 5 8 11 2 10 9 5 9 4 8 9 9 9 10 1 11)

(setf phrase-2 (rndn 20 0 24))
=> (4 23 16 6 10 16 23 3 21 19 11 19 8 16 17 17 18 20 2 21)

(setf phrase-3 (x-y phrase-2 phrase-1))
=> (2 12 8 3 5 8 12 1 11 10 6 10 4 8 8 8 9 10 1 10)

(setf t-1 (integer-to-pitch phrase-1))
=> (d4 b4 gs4 eb4 f4 gs4 b4 d4 bb4 a4
    f4 a4 e4 gs4 a4 a4 a4 bb4 cs4 b4)
Opusmodus                                                           x-y   2

(setf t-2 (integer-to-pitch phrase-2))
=> (e4 b5 e5 fs4 bb4 e5 b5 eb4 a5 g5
    b4 g5 gs4 e5 f5 f5 fs5 gs5 d4 a5)

(setf t-3 (integer-to-pitch phrase-3))
=> (d4 c5 gs4 eb4 f4 gs4 c5 cs4 b4 bb4 fs4
    bb4 e4 gs4 gs4 gs4 a4 bb4 cs4 bb4)

(setf fanfare-rhy
      (gen-length '(1 1 2 1 1 1 1 2 1 1 3 1 2 2 1 1 1 1 4 4) 16))
=> (1/16 1/16 1/8 1/16 1/16 1/16 1/16 1/8 1/16 1/16
    3/16 1/16 1/8 1/8 1/16 1/16 1/16 1/16 1/4 1/4)

(setf dyn
      (position-replace
       (- (length t-1) 1) '0.90
       (vector-to-velocity
        0.57 0.87 (gen-noise (length t-1)) :type :float)))
=> (0.71 0.71 0.76 0.6 0.77 0.69 0.69 0.77 0.83 0.63
    0.81 0.71 0.63 0.77 0.68 0.57 0.85 0.85 0.87 0.9)

(def-score fanfare
           (:key-signature 'chromatic
            :time-signature '(2 4)
            :tempo '(q 60))

 (trumpet1
  :length fanfare-rhy :pitch t-1 :velocity dyn
  :channel 1 :sound 'gm :program 'trumpet)

 (trumpet2
  :length fanfare-rhy :pitch t-2 :velocity dyn
  :channel 2)

 (trumpet3
  :length fanfare-rhy :pitch t-3 :velocity dyn
  :channel 3))

(display-midi (compile-score 'fanfare))
