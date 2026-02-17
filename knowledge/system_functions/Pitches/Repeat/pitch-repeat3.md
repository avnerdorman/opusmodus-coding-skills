Opusmodus                                                                               pitch-repeat3   1

pitch-repeat3 count pitch &key offset-low offset-high
                       ratio-low ratio-high transpose flat
                       section exclude span omn seed

[Function]

Arguments and Values:
count                    an integer.
pitch                    list of pitches.
offset-low               an integer.
offset-high              an integer.
ratio-low                an integer.
ratio-high               an integer.
transpose                an integer or list of integers (transposition value).
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     NIL or number. The default is NIL.
omn                      NIL or T. If true force OMN style output. The default is T.

OMN:
flat                     NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                     :length, :pitch or :velocity. The default is :length.


Description:

The function PITCH-REPEAT3 allows a pitch series to be algorithmically expanded into
either a series of repeated pitches, or an evolving melodic sequence.

(pitch-repeat 6 '(c4 cs4 fs4 g4) :seed 12)
=> ((c4 = = = = =) (cs4 = = = = =)
    (fs4 = = = = =) (g4 = = = = =))

The most simple use of any of the four PITCH-REPEAT functions is to repeat a series of
values. However, the function can be a starting point for the most complex of transformations
and variants of material as the examples below demonstrate.
                                                                     fl
     Opusmodus                                                           pitch-repeat3   2

     Examples:
     (pitch-repeat 6 '(c4 d4 e4 f4))
     => ((c4 = = = = =) (d4 = = = = =)
         (e4 = = = = =) (f4 = = = = =))

     (pitch-repeat2 3 6 '(c4 d4 e4 f4))
     => ((c4 = = =) (d4 = =)
         (e4 = = = =) (f4 = = = = =))

     (pitch-repeat3 3 '(c4 d4 e4 f4))
     => (f4 d4 c4)

     (pitch-repeat3 12 '(c4 d4 e4 f4))
     => (c4 e4 f4 d4 c4 e4 f4 d4 c4 e4 f4 d4)

     Compare the outputs above noticing that PITCH-REPEAT3 has an extend randomised
     shuf e of its source list.

     (pitch-repeat3 12 '(c4 d4 e4 =)
      :transpose 13 :offset-low 1 :offset-high 2)
     => (f5 = e4 d4 db5 c4 eb5 e4 f5 = e4 d4)

     (pitch-repeat3 '(5 7) '((c4 d4 e4) (e4 f4 g4))
      :transpose '(11 6) :ratio-low 1 :ratio-high 2)
     => ((c4 = e4 = db5) (db5 = b4 e4 = g4 bb4))

     (setf mat '((-w)
                 (e c4e4g4 h_e c5)
                 (q c4 = = - - =)
                 (q cs5 = - - = =)
                 (e c4 cs4d4ds4 d4 db4 c4cs4 cs5)
                 (e c4 e4 g4 h_e c5)
                 (q c4 = = - - =)
                 (q cs5 = - - = =)
                 (e c4 cs4d4ds4 d4 db4 c4 cs5)))

     (pitch-repeat3 '(4 7 2 4 6 9 6 7) mat
                    :transpose 13
                    :ratio-low 1
                    :ratio-high 2
                    :seed 2456)
     => ((-w) (e c5 h_e c4e4g4 e db6 h_e db5f5ab5)
         (q c4 = db5 - - = c4 db5 =) (q cs5 =)
         (e db4 = d6 =) (e f5 = g4 h_e e db5 ab5)
         (q c4 db5 = - - c4 db5 c4 db5 - - = c4)
         (q d6 cs5 - - = d6 cs5 d6) (e d4 c4 = db5 cs5 d5 d6))
fl
