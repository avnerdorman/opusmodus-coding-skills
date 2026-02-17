Opusmodus                                                                             rnd-beat-order   1

rnd-beat-order sequence &key section exclude prob seed
[Function]

Arguments and Values:
sequence                 an omn sequence.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
prob                     a oating point value between 0.0 and 1.0.
                         (an element selected at random, based on the probability value)
                         The default is 0.5.
seed                     NIL or number. The default is NIL.


Description:

This function randomises beats position within a bar.


Examples:
(setf mat '(c4 d4 fs4 bb4 e4 eb4 f4 gs4 g4 a4 b4 cs4))

(setf pitches
      (make-omn :length '(s)
                :pitch (gen-loop 4 mat)
                :span :pitch))

(setf movement
      (pitch-progression pitches
                         :sort '?
                         :step (rnd-sample 5 '(2 3 4))
                         :rotate (rnd-sample 5 '(1 2 3))))


                                                        2




          3                                         4




                                                                                        Opusmodus
                    fl
Opusmodus                           rnd-beat-order   2

(rnd-beat-order movement)


                                2




        3                   4




                                     Opusmodus
