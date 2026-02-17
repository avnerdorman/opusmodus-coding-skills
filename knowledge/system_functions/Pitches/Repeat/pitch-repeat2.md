Opusmodus                                                                              pitch-repeat2   1

pitch-repeat2 low high pitch &key offset-low offset-high
                     ratio-low ratio-high transpose flat
                     section exclude span omn seed

[Function]

Arguments and Values:
low                     an integer.
high                    an integer.
pitch                   list of pitches.
offset-low              an integer.
offset-high             an integer.
ratio-low               an integer.
ratio-high              an integer.
transpose               an integer or list of integers (transposition value).
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.
seed                    NIL or number. The default is NIL.
omn                     NIL or T. If true force OMN style output. The default is T.

OMN:
flat                    NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                    :length, :pitch or :velocity. The default is :length.


Description:

The function PITCH-REPEAT2 allows a pitch series to be algorithmically expanded into
either a series of repeated pitches, or an evolving melodic sequence.

(pitch-repeat2 6 7 '(c4 d4 e4))
=> ((c4 = = = = =) (d4 = = = = =) (e4 = = = = = =))


Examples:

In the example below this version of PITCH-REPEAT transpose can be linked to the offset
feature.

(pitch-repeat2 6 7 '(c4 d4 e4) :ratio-low 1 :ratio-high 2 :transpose 13)
=> ((c4 db5 c4 = db5 c4)
    (d4 eb5 d4 = eb5 = d4)
    (e4 = f5 e4 f5 =))
                                                                     fl
     Opusmodus                                                                   pitch-repeat2   2

     The resulting sequence can be made more interesting by using the :offset key, which will
     randomly incorporate previous values in the series into the output. So in the below example,
     the rst set of repeats contains only c4 (:offset = 0), the second set could possibly
     consist of d4 and c4 (:offset 1), the third set e4 and d4 (:offset 1) and the nal set
     of f4, e4, d4 and c4 (:offset 4):

     (pitch-repeat2 4 2 '(c4 d4 e4 f4) :seed 56)
     => ((c4 c4) (d4 d4 d4) (e4 e4 e4 e4) (f4 f4))

     (pitch-repeat2 1 3 '((c4 d4 e4) (e4 f4 g4))
      :offset-low 1 :offset-high 2 :transpose '(11 6))
     => ((c4) (d4 =) (e4) (e4) (f4 =) (g4 = db5))

     (pitch-repeat2 1 7 '(c4 d4 e4)
      :ratio-low 1 :ratio-high 4 :transpose 13)
     => ((c4 = db5 = = c4) (d4 = = = eb5 =) (e4))

     In the example below the low and high parameters allow for lists between 1 and 7 in
     length. The length of lists themselves is governed by the number of pitches in the three
     combined pitch lists.

     (pitch-repeat2
      1 7 '((c4 d4 e4 f4 g4) (f4 g4 a4 b4) (f4 g4 a4 b4))
      :offset-low 1 :offset-high 2
      :ratio-low 1 :ratio-high 4 :transpose '((11 -11) (1 11)))
     => ((c4 = =) (d4 eb3 = c4 = = d4) (e4 = eb5 =)
           (gb3 = = = d4 = =) (e4 g4 = f4) (f4 =)
           (g4 = gb5 = f4 =) (a4) (a4 = bb5 = = b4 a4) (f4 =)
           (ab3 g4 = f4 = ab3 =) (a4) (b4))

     (pitch-repeat2 1 7 '((c4 d4 e4 f4 g4) (f4 g4 a4 b4) (f4 g4 a4 b4))
      :ratio-low 1 :ratio-high 3
      :transpose '((11 -11) (1 11)) :span :length :section '(1 2))
     => ((c4 d4 e4 f4 g4) (d4) (e4 eb5 e4))

     Notice in the example above how the :section argument is used and how the result
     appears in the output.

     (pitch-repeat2 1 7
      (make-omn
       :length '(1/4 1/2 1/4 1/1)
       :pitch '((c4 d4 e4 f4 g4) (f4 g4 a4 b4) (f4 g4 a4 b4)))
      :ratio-low 1 :ratio-high 3 :transpose '((11 -11) (1 11)))
     => ((q c4) (h d4 q eb3 w q d4 h q w eb3) (q e4 h q f4 w e4) (q f4))
fi
                                                                                   fi
Opusmodus                                                   pitch-repeat2   3

(pitch-repeat2 1 7
 (make-omn
  :length '(1/4 1/2 1/4 1/1)
  :pitch '((c4 d4 e4 f4 g4) (f4 g4 a4 b4) (f4 g4 a4 b4)))
 :ratio-low 1 :ratio-high 3
 :transpose '((11 -11) (1 11))
 :span :length :section '(0 3))
=> (q c4 h q w b4)
