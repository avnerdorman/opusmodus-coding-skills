     Opusmodus                                                                                 get-ambitus   1

     get-ambitus sequence &key interval type series bar
     [Function]

     Arguments and Values:
     sequence               omn-form list or list of pitches.
     interval               NIL or T. The default is NIL.
     type                   :integer or :pitch. The default is :integer.
     series                 NIL or T. The default is NIL.
     bar                    an integer or list of integers. Selected bar or bars to process.
                            The default is NIL.


     Description:

     The function GET-AMBITUS returns the ambitus (low high) values of the entire or
     speci ed section of the sequence.

     (setf omn-seq
           '((s cs5 p g6 mp mf -) (s cs5 f e g3 ff s p)
             (s cs5 mp g6 mf f -) (-s cs5 ff e g3 p)
             (s g3 mp - e cs5 mf) (s g6 f ff e cs5 p)
             (s g3 mp mf e cs5 f) (s g6 ff p cs5 mp g3 mf)
             (e g3 f s cs5 ff g6 p) (e g6 mp -s cs5 mf)
             (e g3 f -s g3 ff) (s cs5 p e g6 mp s mf)))

     (get-ambitus omn-seq)
     => (-5 31)

     (get-ambitus omn-seq :type :pitch)
     => (g3 g6)

     (get-ambitus omn-seq :interval t)
     => 36
fi
Opusmodus                                                                 get-ambitus   2

Example:

Variationen Fuer Klavier Op.27, I

(setf sequence
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
        (t gb4a4 p g3 mp - b2 f e3 bb3 e3 a3 eb4 - g5 mf f4ab4 mp) (-s)
        (s f2 f - s. c6 -t) (s b2bb3 p)
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

(get-ambitus sequence)
=> (-22 27)

With keyword :type :pitch the function will return the ambitus list in pitch values:

(get-ambitus sequence :type :pitch)
=> (d2 eb6)

With keyword :interval T the function will return the global interval value:

(get-ambitus sequence :interval t)
=> 49
Opusmodus                                                                get-ambitus   3

With keyword :series T the function will return a list of ambitus values for every
sublist (bars) of the sequence:

(get-ambitus sequence :series t)
=> (nil (5 16) nil (0 14) nil (0 14) nil (5 16) nil (6 21) (2 13)
   (6 21) nil (6 23) (-3 10) (0 14) (5 16) nil (2 21) nil (6 21)
   nil (-13 14) nil (-11 19) (6 17) (-4 17) (-8 4) (-22 20) nil
   (-13 19) nil (-19 24) (-13 -2) (5 22) (-16 -3) (5 22) (-3 25)
   (-13 -7) (-3 25) nil (-2 15) (-11 2) (-2 15) nil (-2 15) nil
   (2 13) nil (2 13) nil (-2 15) nil (-4 7) (0 17) (-2 13) nil
   (3 14) (-7 7) (-15 -1) (12 25) nil (0 27) nil nil (14 25))

The NIL means no pitch values are found in the sublist.

Example with series of global intervals:

(get-ambitus sequence :series t :interval t)
=> (0 11 0 14 0 14 0 11 0 15 11 15 0 17 13 14 11 0
    19 0 15 0 27 0 30 11 21 12 42 0 32 0 43 11 17
    13 17 28 6 28 0 17 13 17 0 17 0 11 0 11 0 17
    0 11 17 15 0 11 14 14 13 0 27 0 0 11)

The 0 means no pitch values are found in the sublist.

Here we get the ambitus from the bar 31:

(get-ambitus sequence :bar 31)
=> (-13 19)
