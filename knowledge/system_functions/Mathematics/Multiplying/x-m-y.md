Opusmodus                                                                               x*y   1

x*y x y
[Function]

Arguments and Values:
x                         a sequence of numbers.
y                         a sequence of numbers.


Description:

This function returns a list of numbers obtained by multiplying elements of y from
corresponding elements of x and y.

(x*y '(1 2 3) '(1 2 3))
=> (1 4 9)

(x*y '(1/4 1/2 1/8) '(1/4 1/2 1/8))
=> (1/16 1/4 1/64)

(x+y '(0.1 0.2 0.3) '(0.1 0.2 0.3))
=> (0.2 0.4 0.6)

Sometimes such functions can produce interesting and surprising variations. The function
can be used with pitches, note-lengths and velocities.


Score Example:

Here's a short fanfare for 3 horns. It's been created from two random-generated phrases, one
expanded to cover one octaves, the other just a tritone. The phrase for the third horn has been
made from multiplying the elements of phrase-1 with phrase-2 using the function X*Y.
However, notice the use of the function AMBITUS-INTEGER in the expression.

(setf phrase-1 (rndn 20 0 12))
=> (2 11 8 3 5 8 11 2 10 9 5 9 4 8 9 9 9 10 1 11)

(setf phrase-2 (rndn 20 0 6))
=> (1 6 4 2 2 4 6 1 5 5 3 5 2 4 4 4 5 5 1 5)

(setf phrase-3
      (ambitus-integer '(-12 12) (x*y phrase-1 phrase-2)))
=> (2 6 8 6 10 8 6 2 2 9 3 9 8 8 12 12 9 2 1 7)

(setf t-1 (integer-to-pitch phrase-1))
=> (d4 b4 gs4 eb4 f4 gs4 b4 d4 bb4 a4
    f4 a4 e4 gs4 a4 a4 a4 bb4 cs4 b4)
Opusmodus                                                           x*y   2

(setf t-2 (integer-to-pitch phrase-2))
=> (cs4 fs4 e4 d4 d4 e4 fs4 cs4 f4 f4
    eb4 f4 d4 e4 e4 e4 f4 f4 cs4 f4)

(setf t-3 (integer-to-pitch phrase-3))
=> (d4 fs4 gs4 fs4 bb4 gs4 fs4 d4 d4
    a4 eb4 a4 gs4 gs4 c5 c5 a4 d4 cs4 g4)

(setf fanfare-rhy
      (gen-length '(1 1 2 1 1 1 1 2 1 1 3 1 2 2 1 1 1 1 4 4) 16))
=> (1/16 1/16 1/8 1/16 1/16 1/16 1/16 1/8 1/16 1/16
    3/16 1/16 1/8 1/8 1/16 1/16 1/16 1/16 1/4 1/4)

(setf dyn
      (position-replace
       (- (length dyn) 1) 'ffff
       (vector-to-velocity
        0.57 0.87 (gen-noise (length t-1) :seed 65))))
=> (mf f ffff ffff ffff ff mf ff f ffff
    fff f ff fff ffff f fff fff ff ffff)

(def-score fanfare
             (:key-signature 'chromatic
              :time-signature '(2 4)
              :tempo '(q 50))

 (horn1
  :length fanfare-rhy :pitch t-1 :velocity dyn
  :channel 1 :sound 'gm :program 'french-horn)

 (horn2
  :length fanfare-rhy :pitch t-2 :velocity dyn
  :channel 2)

 (horn3
  :length fanfare-rhy :pitch t-3 :velocity dyn
  :channel 3))

(display-midi (compile-score 'fanfare))
