Opusmodus                                                                       voice-variant      1

voice-variant sequence &key measure tuplet multiply interval
                    variant rest seed

[Function]

Arguments and Values:
sequence              omn-form sequence.
measure               a ratio or an integer (size and time given for each process).
                      The default is the time-signature values taken from the given sequence.
tuplet                an integer or list of integers (lengths are the measures to which
                      the tuplet is applied). The default is 2.
multiply              an integer or list of integers. Multiplication of the divide value.
                      The default is 1 (none).
interval              an integer or list of integers (transposition value applied to
                      the sequence pitches). The default is 0.
variant               'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                      'a (ascending), 'd (descending), 'ad (ascending-descending),
                      'da (descending-ascending), 'ro (random order) or '? (at random).
                      Variant value applied to the sequence pitches before it process.
                      The default is 'p.
rest                  's (start), 'e (end), 'c (centre), 'o (outer), '? (at random), or'n (none)
                      (length-rest distribution in the newly generated length values).
                      The default is 'n (none).
seed                  an integer. Ensure the same result each time the code is evaluated.
                      The default is NIL.


Description:

The function VOICE-VARIANT generates a new sequence by applying a number of
processes and mixing the result with the original material.
Opusmodus                                                                voice-variant     2

Examples:

Starting material:

(setf vec (gen-noise 60 :type :gaussian :seed 45))
(setf pitches (filter-repeat 1 (vector-to-pitch '(e4 g5) vec)))
(setf omn (make-omn :length '(e) :pitch pitches :span :pitch))
(setf mat (omn-to-time-signature omn '(4 4)))


                                  2                         3




     4                5                     6                   7




                                                                               Opusmodus




I.

In the rst example we use the default tuplet 2 value on each of the given lengths (1/8
equal 1/16 1/16) with interval transposition set to 4, for the entier process. Please
note, before applying the function the original material is transposed by one semitone:

(setf mat-transp (pitch-transpose 1 mat))
(setf variant (voice-variant mat-transp :interval 4))

(def-score var1
           (:key-signature 'chromatic
            :flexible-clef t
            :time-signature '(2 4)
            :tempo 86
            :layout (list
                      (treble-layout 'v1 :name "Material" :abbr "M")
                      (treble-layout 'v2 :name "Variant" :abbr "V")))
    (v1 :omn mat :channel 1 :sound ‘gm :program 1)
    (v2 :omn variant :channel 2))
fi
Opusmodus                                                                   voice-variant   3


                  = 86
                                     2                 3            4

       Material




       Variant




           5             6                    7            8            9

       M




       V




           10                                     11

       M




       V




           12                            13                    14

       M




       V



                                                                               Opusmodus




II.

Below the time-signature 4/4 de nes the time for each of the two interval values.
To the rst bar of the original material we applied interval 4, to the second bar we
applied interval 13, and so on. Both values are looped to satisfy the original bar count:

(setf mat-transp (pitch-transpose 1 mat))
(setf variant (voice-variant mat-transp :interval '((4) (13))))

(def-score var2
           (:key-signature 'chromatic
            :flexible-clef t
            :time-signature '(2 4)
            :tempo 86
            :layout (list
                      (treble-layout 'v1 :name "Material" :abbr "M")
                      (treble-layout 'v2 :name "Variant" :abbr "V")))

      (v1 :omn mat :channel 1 :sound 'gm :program 1)
      (v2 :omn variant :channel 2))
fi
                                fi
Opusmodus                                                                  voice-variant     4


             = 86
                               2                  3                    4

  Material




   Variant




       5                  6                   7                    8

  M




  V




       9                       10                        11

  M




  V




       12                           13                        14

  M




  V



                                                                                 Opusmodus



III.

In this example the measure value overwrites the original time-signature 4/4 to
1/4 which in effect will shorten the time by 4 for each interval value. The variant 'i
(inversion) is applied to a measure and to the original material before other processes
happen:

(setf mat-transp (pitch-transpose 1 mat))

(setf variant (voice-variant mat-transp
                             :measure 1/4
                             :interval '((4) (13))
                             :variant ‘i))
Opusmodus                                                                 voice-variant     5

(def-score var3
           (:key-signature 'chromatic
            :flexible-clef t
            :time-signature '(2 4)
            :tempo 86
            :layout (list
                      (treble-layout 'v1 :name "Material" :abbr "M")
                      (treble-layout 'v2 :name "Variant" :abbr "V")))

           (v1 :omn mat :channel 1 :sound 'gm :program 1)
           (v2 :omn variant :channel 2))



                = 86
                                2              3                      4

 Material




  Variant




      5                     6              7                      8

  M




  V




      9                             10                  11

  M




  V




      12                             13                      14

  M




  V



                                                                                Opusmodus
Opusmodus                                                                voice-variant   6

IV.

In the following example we generate two sequences using the same material with equal
processing values. With the :variant set to '? (random) we potentially get a different
result in each of the sequences on every-other measure (1 equal 4/4):

(setf vec (gen-noise 30 :type :gaussian :seed 45))
(setf pitches (filter-repeat 1 (vector-to-pitch '(e1 g6) vec)))

(setf omn (make-omn :length '(q q q q)
                    :pitch pitches
                    :span :pitch))

(setf mat (omn-to-time-signature omn '(4 4)))
(setf mat-transp (pitch-transpose -12 mat))

(setf v1 (voice-variant mat
                        :measure 1
                        :tuplet 5
                        :interval '((0) (13))
                        :variant '(p ?)))

(setf v2 (voice-variant mat-transp
                        :measure 1
                        :tuplet 5
                        :interval '((0) (13))
                        :variant '(p ?)))

(def-score var4
           (:key-signature 'chromatic
            :flexible-clef t
            :time-signature '(2 4)
            :tempo 86
            :layout (list
                      (treble-layout 'v1 :name "Variant1" :abbr "V1")
                      (treble-layout 'v2 :name "Variant2" :abbr "V2")))

  (v1 :omn v1 :channel 1 :sound ‘gm :program 1)
  (v2 :omn v2 :channel 2))
Opusmodus                                                                 voice-variant   7

V.

To create more interesting rhythms, we can set the multiply value to control how the basic
value is divided up. If, for example the length is 1/4 and the divide value is 5, therefore
our basic value is 1/20. If the multiply value is 2 (maximum) the basic value 1/20 is to
be multiplied by either 1 (giving a 1/20 length) or 2 (giving a 1/10 length). We can
therefore create more interesting divisions to a given duration by introducing this form of
variation:

(setf vec (gen-noise 60 :type :gaussian :seed 9847))
(setf pitches (filter-repeat 1 (vector-to-pitch '(e1 g4) vec)))

(setf omn (make-omn :length '(q q q q h h w e e e e e e e e)
                    :pitch pitches
                    :span :pitch))

(setf lv (length-weight omn :weight '(6 1)))
(setf mat (omn-to-time-signature lv '(4 4)))
(setf transp (pitch-transpose 12 mat))

(setf variant (voice-variant transp
                             :tuplet '(2 3 2 2 5 5 4 2 2 2 2 2 2 2 2)
                             :multiply '(2 1 1 2 2 2 1 2 2 1 2 1 1)
                             :rest '?
                             :interval '((0 1 2 3) (13) (3 2 1 0) (13))
                             :variant '?))

(def-score var5
           (:key-signature 'chromatic
            :flexible-clef t
            :time-signature '(2 4)
            :tempo 86
            :layout (list
                      (treble-layout 'v1 :name "Material" :abbr "M")
                      (treble-layout 'v2 :name "Variant" :abbr "V")))

     (v1 :omn mat
         :channel 1
         :sound 'gm
         :program 1)

     (v2 :omn variant
         :channel 2))
Opusmodus                                                                voice-variant   8

VI.

Source material: Right hand part of the variations op.27 by A. Webern:

(setf rh
      '((-s) (e f4e5 pp -s db5)
         (-s) (-s eb4 pp c4d5 -)
         (-s) (-s c4d5 pp eb4 -)
         (-s) (e db5 pp -s f4e5)
         (-s) (s gb4f5 p a5 -)
         (s d4ab4db5 p bb4 -) (-s a5 p gb4f5)
         (-s) (s b5 f gb4g5 -)
         (s a3bb4 f ab4 -) (s c4d5 f> eb4 -)
         (s db5 f> f4e5 -) (-s)
         (s gb4f5 p a5 d4ab4db5 bb4 -) (-s)
         (-s a5 pp gb4f5) (-s)
         (-t b2 f e3 bb3 - d5 c4eb4) (-s)
         (s db3 f - s. g5 -t) (s gb4f5 p)
         (-t a3 mp ab3 mf -s. t db5f5 f c4 -) (s e3e4 p)
         (-t s. d2 f -s ab5 mf) (-s)
         (t gb4a4 p g3 mp - b2 f e3 bb3 e3 a3 eb4 - g5 mf f4ab4 mp)
         (-s) (s f2 f - s. c6 -t) (s b2bb3 p)
         (-s t db5 mp -s. t gb5bb5 f4 f -) (t a3 f ab2 - ab2 a3)
         (-t f4 f gb5bb5 mf) (-t a3 mp d4ab4 c4 p bb5db6 mf)
         (-t b2 f3 b2 -) (t bb5db6 c5 f d4ab4 a3 p)
         (-s) (t b4eb5 p bb3 -)
         (t d4 p db3 - db3 d4) (-t bb3 p b4eb5)
         (-s) (-s eb5 p bb3b4 -) (-s)
         (e d4db5 p -s c5) (-s)
         (e c5 p -s d4db5) (-s)
         (-s bb3b4 p eb5 -) (-s)
         (-s ab3g4 p e4 mf) (-s c4gb4b4 f5)
         (-s db5 mp bb3a4) (-s)
         (-s eb4d5 p gb4) (-s e4 p f3g4)
         (-s b3 p a2bb3) (-s c5db6 pp ab5)
         (-s) (-s e5eb6 p g5 c4f4b4 p> gb4)
         (-s) (-e) (e d5ab5db6 pp)))

(setf augmentation (length-augmentation 4 rh))
(setf mat (omn-to-time-signature augmentation '(4 4)))
(setf mat1 (pitch-transpose 12 mat))
(setf mat2 (pitch-transpose -12 mat))

(setf p1 (voice-variant mat1
                        :measure '(1/2 1 1)
                        :tuplet (rnd-sample 24 '(2 3 5))
                        :rest '(? n n n ?)
                        :interval (rnd-sample 24 '((0) (6) (13)))
                        :variant (rnd-sample 24 '(i r ri))))
Opusmodus                                                   voice-variant   9

(setf p2 (voice-variant mat2
                        :measure '(1/2 1 1)
                        :tuplet (rnd-sample 24 '(1 2))
                        :rest '(? n n n ?)
                        :interval (rnd-sample 24 '((0) (6) (13)))
                        :variant (rnd-sample 24 '(i r ri))))

(setf v1 (length-weight p1 :weight '(7 2)))
(setf v2 (length-weight p2 :weight '(7 1)))

(def-score var6
           (:key-signature 'chromatic
            :flexible-clef t
            :time-signature '(2 4)
            :tempo 86
            :layout (list
                      (treble-layout 'v1 :name "Variant1" :abbr "V1")
                      (treble-layout 'v2 :name "Variant2" :abbr "V2")))

  (v1 :omn v1
      :channel 1
      :sound 'gm
      :program 1)

  (v2 :omn v2
      :channel 2))
