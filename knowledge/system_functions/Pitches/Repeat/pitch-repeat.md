Opusmodus                                                                                 pitch-repeat   1

pitch-repeat count pitch &key offset ratio-low ratio-high
                      transpose flat section exclude omn span seed

[Function]

Arguments and Values:
count                     repeat number (an integer).
pitch                     pitches or lists of pitches.
offset                    using offset (can be a list).
ratio-low                 ratio of offset pitches ...
ratio-high                ... to current pitches.
transpose                 random transposition values (can be a list).
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
seed                      NIL or number. The default is NIL.
omn                       NIL or T. If true force OMN style output. The default is T.

OMN:
flat                      NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                      :length, :pitch or :velocity. The default is :length.


Description:

PITCH-REPEAT allows a pitch series to be algorithmically expanded into either a series of
repeated pitches, or an evolving melodic sequence.

(pitch-repeat 4 '(c4 cs4 fs4 g4 c5))
=> ((c4 = = =) (cs4 = = =) (fs4 = = =) (g4 = = =) (c5 = = =))


Examples:

The most simple use of PITCH-REPEAT is to repeat a series of values:

(pitch-repeat 4 '(c4 d4 e4 f4))
=> ((c4 = = =) (d4 = = =) (e4 = = =) (f4 = = =))

Note that the repetition count is a list, which will repeat to :span the number of pitches in
the series:

(pitch-repeat '(4 2) '(c4 d4 e4 f4))
=> ((c4 = = =) (d4 =) (e4 = = =) (f4 =))
                                                                       fl
     Opusmodus                                                                      pitch-repeat     2

     The resulting sequence can be made more interesting by using the :offset key, which will
     randomly incorporate previous values in the series into the output. So in the below example,
     the rst set of repeats contains only c4 (:offset = 0), the second set could possibly
     consist of d4 and c4 (:offset 1), the third set e4 and d4 (:offset 1) and the nal set
     of f4, e4, d4 and c4 (:offset 4):

     (pitch-repeat '(4 2) '(c4 d4 e4 f4) :offset '(0 1 1 4))
     => ((c4 = = =) (c4 d4) (e4 = d4 =) (c4 e4))

     The probable distribution of offset values in relation to the pitch currently being processed
     can be modi ed using the :ratio-low and :ratio-high keys.

     (pitch-repeat '(4 2 5) '(c4 d4 e4 f4)
      :offset '(0 1 1 4) :ratio-low 2 :ratio-high 5)
     => ((c4 = = =) (c4 =) (e4 = = = =) (f4 = c4 =))

     Since the distributions are randomly assigned, a :seed can be used to ensure a stable result:

     (pitch-repeat '(4 2 5) '(c4 d4 e4 f4)
      :offset '(0 1 1 4) :ratio-low 2 :ratio-high 5 :seed 33)
     => ((c4 = = =) (c4 =) (e4 = = = =) (e4 = f4 =))

     When working with sublists, repeated pitches are randomly drawn from the contents of each
     sublist:

     (pitch-repeat '(3 5) '((c4 d4) (e4 f4 g4)))
     => ((d4 = c4) (e4 f4 g4 e4 f4))

     Further variation can also be created using the :transpose key:

     (pitch-repeat '(3 5) '(c4 c4 c4 c4) :transpose '(12 7 5 -12))
     => ((c4 c5 c4) (c4 = = g4 =) (c4 = f4) (c4 = = = c3))

     Repeat sublists with offsetting:

     (pitch-repeat '(3 5 6) '((c4 d4) (e4 f4 g4) (a4 b4 c5))
      :offset '(0 1 1))
     => ((d4 = =) (g4 d4 f4 = =) (b4 = c5 e4 = =))

     Repeat sublists with offsetting and ratio:

     (pitch-repeat '(3 5 6) '((c4 d4) (e4 f4 g4) (a4 b4 c5))
      :offset '(0 1 1) :ratio-low 2 :ratio-high 4)
     => ((d4 = =) (g4 = = d4 =) (a4 = = f4 = =))
fi
           fi
                                                                                    fi
Opusmodus                                                                   pitch-repeat   3

Apply repeats only to certain sublists:

(pitch-repeat '(3 5 6) '((c4 d4) (e4 f4 g4) (a4 b4 c5))
 :offset '(0 1 1) :ratio-low 2 :ratio-high 4 :section '(1 2))
=> ((c4 d4) (e4 = = c4 =) (a4 = = = e4 =))

Note that when using OMN notation the rhythm is repeated across the output:

(pitch-repeat '(4 2 5) '(q c4 e d4 e4 q f4)
 :offset '(0 1 1 4) :ratio-low 2 :ratio-high 5 :seed 33)
=> ((q c4 e = q) (q c4 e) (e e4 q = e =) (q e4 = e f4 =))

Repeat OMN sublists with offsetting - note the handling of length values:

(pitch-repeat
 '(3 5 6) '((q c4 e d4) (s e4 f4 e g4) (3q a4 b4 c5))
 :offset '(0 1 1))
=> ((q c4 e d4 q) (s d4 = e f4 s c4 =) (3q a4 = g4 = = f4))
