Opusmodus                                                                       pitch-progression   1

pitch-progression sequence &key step sort rotate section exclude
seed

[Function]

Arguments and Values:
sequence               a pitch or an omn sequence.
step                   an integer. Number of consecutive steps. The default is 2.
sort                   'a (ascending) or 'd (descending) symbol. The default is 'a.
rotate                 an integer (pitch rotation). The default is NIL.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.
seed                   NIL or number. The default is NIL.


Description:

The function PITCH-PROGRESSION allows you to assemble a new sequence by at rst
applying a :sort function (ascending or descending) to a given sequence. The :step
number divides the newly sorted sequence into a number of lists and is followed by a
MATRIX-TRANSPOSE function.

(setf sequence '(c4 d4 fs4 bb4 e4 eb4 f4 gs4 g4 a4 b4 cs4))


                                            2                   3




                                                                    Opusmodus


(pitch-progression sequence)


                                            2               3




                                                                    Opusmodus


(pitch-progression sequence :step 3)


                                            2           3




                                                                    Opusmodus
                                                                                              fi
Opusmodus                                                            pitch-progression    2

Examples:
(setf mat '(c4 d4 fs4 bb4 e4 eb4 f4 gs4 g4 a4 b4 cs4))
(setf pitches (make-omn :length '(s)
                        :pitch (gen-loop 4 mat)
                        :span :pitch)

In the following example we generate four bars each with a different :step value:

(pitch-progression pitches :step '(2 3 4 4))


                                                 2




        3                                    4




                                                                          Opusmodus




In this example we set the sort option to '? (at random). :step numbers are selected at
random from a '(2 3 4) list and :rotate values are selected at random from a '(1 2
3 4) list:

(pitch-progression pitches
                   :sort '?
                   :step (rnd-sample 4 '(2 3 4))
                   :rotate (rnd-sample 4 '(1 2 3 4)))


                                                 2




        3                                    4




                                                                          Opusmodus
Opusmodus                                               pitch-progression   3

(setf mat2 '((s g4 pp e s cs5 c4 -e s fs5 g4 mf q s gs5 mp e)
             (s a3 f g4 pp e s gs5 gs5 -e s a3 gs4 mf q s a5 mp a5)))




        2




                                                            Opusmodus




(pitch-progression mat2 :step '(2 3) :rotate '(1 2))




        2




                                                            Opusmodus




(gen-loop 4 (pitch-progression
            '((s g2 p d3 b3 a3 b3 d3 b3 d3)
              (s g2 d3 b3 a3 b3 d3 b3 d3)) :sort '? :step 3)
          :seed 12)


                                        2




        3                           4




                                                            Opusmodus
