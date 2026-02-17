Opusmodus                                                                    find-closest   1

find-closest n list &key seed
[Function]

Arguments and Values:
n                        a number.
list                     a list of numbers.
seed                     NIL or T. The default is NIL.


Description:

This function returns the closest number to a given n value.

(find-closest 5 '(1 6 10))
=> 6

Where two values might potentially be closest, a random function is used.

(find-closest 5 '(1 4 6 10))
=> 6

(find-closest 5 '(1 4 6 10))
=> 4

To get the same result each time the :seed number is used.

(find-closest 5 '(1 4 6 10) :seed 32)
=> 6


Examples:

One use of this function might be to create a drone-like part from a list of pitches.

(setf flute-mel (gen-loop 5 (rnd-sample 10 '(c4 cs4 fs4 g4 c5))))
=> ((g4 cs4 fs4 c4 fs4 c4 g4 g4 c4 g4)
    (c4 c5 fs4 c4 fs4 fs4 cs4 c5 fs4 c5)
    (fs4 cs4 c4 c4 c5 cs4 cs4 fs4 c4 cs4)
    (c4 c5 fs4 g4 cs4 cs4 g4 c5 fs4 g4)
    (cs4 fs4 c5 fs4 fs4 cs4 cs4 fs4 c5 cs4))
Opusmodus                                                            find-closest   2

(setf bassoon-mel
     (gen-loop 5 (find-closest
                  (rnd-pick '(3 4 5 6 7 8))
                   (pitch-to-integer
                    (rnd-sample 10 '(c4 cs4 fs4 g4 c5))))
               :seed 32))
=> (6 7 1 6 1)

(setf bassoon-drone
     (pitch-transpose -12 (mclist (integer-to-pitch bassoon-mel))))
=> ((gb3) (g3) (db3) (gb3) (db3))

The list ute-mel will play ve phrases of ten notes each. In the bassoon-drone list a
single pitch that is the closest to a random pitch chosen from a list '(3 4 5 6 7 8)
by RND-PICK will form a drone-like bass line for each phrase of the ute-mel.
  fl
                    fi
                                                         fl
