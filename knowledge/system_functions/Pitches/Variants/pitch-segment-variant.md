Opusmodus                                                                   pitch-segment-variant     1

pitch-segment-variant sequence &key segment size position type
                                     variant omit transpose flatten
                                     initial section exclude seed

[Function]

Arguments and Values:
sequence               a list of pitches or omn-form sequence.
segment                an integer (number of segments).
size                   an integer (percent value), if NIL, random number between 0 and 100).
                       The default is NIL.
position               's (start), 'e (end), '? (random position). The default is NIL (s, e or ?).
type                   an integer: 1 or 2. The type 1 applies the variant to the original sequence.
                       The type 2 applies the variant after the segmentation. The default is 1.
variant                'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                       'a (ascending), 'd (descending), 'ad (ascending-descending),
                       'da (descending-ascending), 'ro (random order) or '? (at random).
                       The default is NIL.
omit                   a list of variants to omit. The default is NIL.
transpose              an integer or list of integers (transposition value).
flatten                T or NIL. The T atten segment series. The default is NIL.
initial                T or NIL. The T retains initial pitch series. The default is NIL.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.
seed                   NIL or number. The default is NIL.


Description:

This function returns a number of :segments of a sequence from an existing list or lists
with a de ned variant. The segment is de ned by the :size value (percent) and the
number of returned segments. The segment start :position is de ned by
the :position value.

(pitch-segment-variant '(c4 d4 e4 f4 g4 a4 b4)
                        :size 50
                        :segment 1
                        :position 's
                        :variant 'r)
=> (b4 a4 g4 f4)
   fi
                                fl
                                        fi
                                                                       fi
Opusmodus                                                      pitch-segment-variant   2

Examples:

In the following example the :segment count is set to 2. The rst :segment is 50
percent in size with a retrograde :variant, while the second :segment is 30
percent in size with an inversion :variant:

(pitch-segment-variant '(c4 d4 e4 f4 g4 a4 b4)
                        :size '(50 30)
                        :segment 2
                        :position 'e
                        :variant '(r i))
=> ((f4 e4 d4 c4) (eb3 cs3))

To retain the initial sequence in the result we set the :initial option to T.
The :flatten option set to T will flatten the entire process:

(pitch-segment-variant '(c4 d4 e4 f4 g4 a4 b4)
                       :size '(50 30) :segment 2
                       :position 'e :variant '(r i)
                       :initial t :flatten t)
=> (c4 d4 e4 f4 g4 a4 b4 f4 e4 d4 c4 eb3 cs3)

(setf omn
     (omn-to-time-signature
      (make-omn
       :length '(s)
       :pitch (vector-to-pitch '(c2 c5) (gen-sine 64 5 .4))
       :span :pitch) '(4 4)))




    2




    3




    4




                                                                           Opusmodus
                                                      fi
Opusmodus                                                                                 pitch-segment-variant          3

The following expression will return 4 segments each 15 percent in size taken from
every bar. Each segment is transposed by 13 semitones. The total of return bars is 16
(4 bars x 4 segments):

(pitch-segment-variant
 omn :size 15 :segment 4 :position '? :variant '? :transpose 13
 :seed 32)


                       2                 3            4             5             6             7            8




       9     10            11                12           13            14                 15       16




                                                                                                         Opusmodus


(pitch-segment-variant
 omn :size 15 :segment 4 :position '? :variant '? :transpose 13
 :seed 32 :type 2)


                  2              3                4                 5        6        7                  8




   9              10            11           12                13        14                15       16




                                                                                                             Opusmodus


(pitch-segment-variant
 omn :size '((20) (30) (40) (100)) :segment '(1 2 3 4)
 :position '? :variant '? :transpose '((0) (13)) :seed 32)


                                     2                                        3




                                                                                      8



       4




                                                                                                         Opusmodus
Opusmodus                                                       pitch-segment-variant   4

In this example every :segment in each bar has its own :size,
start :position, :variant and transposition value:

(setf percent '((30 50 20) (20 50 70) (40 60 70) (50 20 70)))
(setf transp '((0 0 0) (13 0 0) (0 0 13) (0 0 13)))

(pitch-segment-variant
 omn
 :size percent
 :segment 3
 :position '?
 :variant '?
 :transpose transp
 :seed 32)



                                                  2




                                                      8
    3                         4             5




    6                                  7




    8                                   9




    10                            11        12




                                                                           Opusmodus
Opusmodus                                                         pitch-segment-variant   5

(pitch-segment-variant
 omn
 :size (gen-loop 3 (rnd-sample 3 '(40 50 60 80 20 70)) :seed 45)
 :segment 3
 :position '?
 :variant '?
 :omit '(a d ad da p)
 :transpose (gen-loop 3 (rnd-sample 3 '(0 13)) :seed 35)
 :seed 45)




    2                                       3                        4




    5                         6




    7                                   8




                      8                                       8


    9                                           10




                                                          8

    11                                               12




                       8                                                     Opusmodus
Opusmodus                                                                   pitch-segment-variant          6

More examples:
(progn
 (init-seed 53)

    (setf segments
          (quantize
           (pitch-segment-variant
            (library 'maderna 'serenata-per-un-satellite nil :random 12)
            :size 20 :segment '(1 2 1 2 1 2)
            :position '? :variant '? :transpose 6)
          '(1 2 3 4 5 6 7 8)))

    (ps 'gm :treble (list segments)
            :tempo 72)

    (init-seed nil)
)


            = 72 (Pattern 5)
                    8
                                    2                        3                  4




                        (Pattern 7)
      5                                 6


                                                     3




      7


                        5                                5
                                                     5



                                                                                            (Pattern 12)
      8                                                           9                 10



                                7




                                                             (Pattern 10)
                                                 8
                                                                            8            (Pattern 11)
      11                                    12


                            7


                                                                                            Opusmodus
Opusmodus                                                     pitch-segment-variant     7

(progn
 (init-seed 34)

    (setf segments
          (quantize
           (pitch-segment-variant
            (library 'maderna 'serenata-per-un-satellite nil :random 12)
            :size 20
            :segment '(1 2 1 2 1 2)
            :position '?
            :variant '?
            :transpose 6)
           '(1 2 3 4 5 6 7 8)))

    (ps 'gm :treble (list segments)
            :tempo 72)

    (init-seed nil)
)


            = 72 (Pattern 8)




      2                                              3        4




               3
      5                                          6       7          8


                               3




      9                                10




                                   7


                                                         (Pattern 13)
      11                                    12


                                                                        3
                                                             3

                                                                            Opusmodus
