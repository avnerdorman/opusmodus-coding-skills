     Opusmodus                                                                    variant-analysis      1

     variant-analysis pattern sequence &key melodize name
     [Function]

     Arguments and Values:
     pattern                  a pattern (length, pitch, interval and velocity).
     sequence                 a sequence (omn-form).
     melodize                 NIL or T. The default is NIL.
     name                     a name (a string).


     Description:

     This function is designed to scan a given sequence for a speci c pattern and its
     variants. Once the search is completed, the output is presented in the form of two lists. The
      rst list includes two values: the bar number and the starting position of the
     pattern. The second list contains the pattern itself.


     Examples:
     (setf GV '(#|1|# (h d4 0.54 a4 0.5)
                #|2|# (h f4 0.54 d4 0.5)
                #|3|# (h db4 0.54 q d4 0.5 e4)
                #|4|# (h f4 0.54 tie e e g4 0.5 f4 e4)
                #|5|# (q d4 0.54 e4 0.5 f4 g4)
                #|6|# (q a4 0.54 e a3 0.5 b3 c4 a3 q f4 tie)
                #|7|# (e f4 b3 0.53 q. e4 0.5 e f4 e4 d4)
                #|8|# (q e4 0.54 gb4 0.5 h g4 tie)
                #|9|# (e g4 a4 0.53 g4 0.5 f4 h e4)
                #|10|# (w d4)))

                       2         3               4                    5           6




       7                                 8                       9                     10




                                                                                            Opusmodus
fi
                                                                      fi
Opusmodus                                               variant-analysis   2

(variant-analysis '(d4 e4 f4) GV :name "Analisi re-mi-fa")
--------------------------------------------------------------
Score: Analisi re-mi-fa
Pitches: (d4 e4 f4)
--------------------------------------------------------------
P:   4 (((3 1/2) (d4 e4 f4)) ((5 0) (d4 e4 f4)) ((6 1/4) (a3 b3 c4))
        ((8 0) (e4 gb4 g4)))
R:   3 (((4 3/4) (f4 e4 d4)) ((7 5/8) (f4 e4 d4)) ((9 3/8) (f4 e4 d4)))
I:   2 (((4 5/8) (g4 f4 e4)) ((9 1/4) (g4 f4 e4)))
RI: 4 (((3 0) (db4 d4 e4)) ((3 3/4) (e4 f4 g4)) ((5 1/4) (e4 f4 g4))
        ((8 1/4) (gb4 g4 a4)))
--------------------------------------------------------------


(variant-analysis '(f4 b3) GV :name "Analisi re-si")
--------------------------------------------------------------
Score: Analisi re-si
Pitches: (f4 b3)
--------------------------------------------------------------
P:   1 (((6 3/4) (f4 b3)))
R:   0
I:   0
RI: 1 (((6 3/4) (f4 b3)))
--------------------------------------------------------------


(variant-analysis '(2 1) GV :name "tricordo minore melodico ascendente")
--------------------------------------------------------------
Score: tricordo minore melodico ascendente
Intervals: (2 1)
--------------------------------------------------------------
P:   4 (((3 1/2) (2 1)) ((5 0) (2 1)) ((6 1/4) (2 1)) ((8 0) (2 1)))
R:   3 (((4 3/4) (-1 -2)) ((7 5/8) (-1 -2)) ((9 3/8) (-1 -2)))
I:   2 (((4 5/8) (-2 -1)) ((9 1/4) (-2 -1)))
RI: 4 (((3 0) (1 2)) ((3 3/4) (1 2)) ((5 1/4) (1 2)) ((8 1/4) (1 2)))
--------------------------------------------------------------


(variant-analysis '(q e) GV :name "GV - q e")
--------------------------------------------------------------
Score: GV - q e
Lengths: (1/4 1/8)
--------------------------------------------------------------
P:   1 (((6 0) (1/4 1/8)))
R:   0
I:   0
RI: 2 (((4 7/8) (1/8 1/4)) ((7 7/8) (1/8 1/4)))
--------------------------------------------------------------
