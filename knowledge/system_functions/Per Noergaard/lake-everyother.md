     Opusmodus                                                                          lake-everyother       1

     lake-everyother size start step sequence &key direction series
     [Function]

     Arguments and Values:
     size                     Integer. The total size of the sequence for which positions are to be calculated..
     start                    Integer. The starting position in the sequence.
     step                     Integer. The step size between positions.
     sequence                 Sequence. The list from which elements are to be picked.
     direction                The direction in which to calculate the positions.'f (forward)
                              or 'b (backwards). The default is 'f.
     series                   Boolean. The default is NIL.


     Description:

     This function generates a sequence of elements from the given sequence list based on
     speci ed start positions. These positions are calculated based on provided parameters. The
     function supports both forward and reverse directions.


     Examples:
     (setf seq (gen-integer 0 30))
     => (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
         17 18 19 20 21 22 23 24 25 26 27 28 29 30)

     (lake-everyother 20 0 3 seq)
     => (0 3 6 9 12 15 18)

     (lake-everyother 20 0 3 seq :direction 'b)
     => (0 17 14 11 8 5 2)

     (lake-everyother 20 0 3 seq :series t)
     => (0 3 6 9 12 15 18 21 24 27 30 2 5 8 11 14 17 20 23 26)

     (lake-everyother 20 0 3 seq :direction 'b :series t)
     => (0 28 25 22 19 16 13 10 7 4 1 29 26 23 20 17 14 11 8 5)
fi
Opusmodus                                                 lake-everyother   2

Example with in nity series:

(setf i1 (infinity-series 666 '(0 1 -2)
                          :pattern '(i p p)
                          :root 'c5
                          :tonality 'chromatic
                          :scale-step 1))

(lake-everyother 666 0 3 i1)     ; inverted
(lake-everyother 666 0 9 i1)     ; prime
(lake-everyother 666 0 27 i1)    ; inverted
(lake-everyother 666 0 81 i1)    ; prime
(lake-everyother 666 1 3 i1)     ; prime 1 semi up
(lake-everyother 666 1 9 i1)     ; inverted 1 semi up
(lake-everyother 666 2 3 i1)     ; prime 2 semi down
(lake-everyother 666 2 9 i1)     ; inverted 2 semi down
(lake-everyother 666 3 27 i1)    ; prime 1 semi down
(lake-everyother 666 3 9 i1)     ; inverted 1 semi down
(lake-everyother 666 4 9 i1)     ; prime 2 semi up
(lake-everyother 666 4 27 i1)    ; inverted 2 semi up
(lake-everyother 666 8 9 i1)     ; prime 4 semi down
(lake-everyother 666 8 27 i1)    ; inverted 4 semi down
(lake-everyother 666 11 27 i1)   ; inverted 5 semi down
(lake-everyother 666 11 81 i1)   ; prime 5 semi down
            fi
