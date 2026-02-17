Opusmodus                                                                    length-rest-series         1

length-rest-series rest-position sequence &key swallow
                                  section exclude omn flat span

[Function]

Arguments and Values:
rest-position             an integer list. 0-base.
sequence                  lists of lengths or OMN sequence form.
swallow                   swallow omn-form items that align with rest-length. The default is T.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
omn                       NIL or T. If true, the OMN style output is forced. The default is NIL.

OMN:
flat                      NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                      :length, :pitch or :velocity. The default is :length.


Description:

This function allows the composer to generate very precise lists of lengths with rest-lengths
inserted according to a list of rest position. In example 1 notice that the list of rest positions
'(2 2 2 2) ows through the combined lists in series.

(length-rest-series '(2 2 2 2)
 '((s = = = = = = =) (e = = = = = = =) (q = = = = = = =)))
=> ((1/16 1/16 -1/16 1/16 1/16 -1/16 1/16 1/16)
    (-1/8 1/8 1/8 -1/8 1/8 1/8 1/8 1/8)
    (1/4 1/4 1/4 1/4 1/4 1/4 1/4 1/4))


Examples:

The example below shows that existing length-lists can be used instead of the generation
argument.

(length-rest-series
 '(1 2 1 3 2 4)
 '((1/8 1/8 1/8) (1/4 1/4 1/4 1/4 1/4) (1/16 1/16 1/16 1/16)))
=> ((1/8 -1/8 1/8) (1/4 -1/4 1/4 -1/4 1/4) (1/16 1/16 -1/16 1/16))
             fl
                                                                   fl
Opusmodus                                                              length-rest-series   2

(length-rest-series '(3 4 3 4 4 6)
 '((s = = = = = = =) (e = = = = = = =) (q = = = = = = =)))
=> ((1/16 1/16 1/16 -1/16 1/16 1/16 1/16 1/16)
    (-1/8 1/8 1/8 1/8 -1/8 1/8 1/8 1/8)
    (1/4 -1/4 1/4 1/4 1/4 1/4 -1/4 1/4))

Here is how one might create novel length syncopations starting with a pitch list.

(setf mel-1 (gen-divide '(2 5 7)
             (rnd-sample 20 '(c4 cs4 fs4 g4 c5) :seed 34)))
=> ((g4 fs4) (cs4 cs4 g4 cs4 c5) (cs4 fs4 c5 g4 c5 fs4 fs4)
    (c5 c5) (g4 c4 c4 cs4))

(setf len-2 (gen-length-cartesian 1 1 'm 'n 4 '(2 3)
             (mclength mel-1) '(1 2 3 4) :seed 12))
=> ((q q) (e e q e e) (3q 3q 3q s s s s) (q q) (e e e e))

(length-rest-series '(3 4 3 2 2) len-2)
=> ((1/4 1/4) (1/8 -1/8 1/4 1/8 1/8)
                     3
    (1/12 -1/12 1/12 1/16 1/16 -1/16 1/16)
             4                   3
    (1/4 -1/4) (1/8 1/8 -1/8 1/8))
           2              2

OMN:

(length-rest-series
 '(0 2 3) '(s c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4))
=> (-s cs4 d4 - e4 f4 fs4 - gs4 a4 bb4 b4)

With :swallow NIL

(length-rest-series
 '(0 2 3) '(s c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4) :swallow nil)
=> (-s c4 cs4 - d4 ds4 e4 - f4 fs4 g4 gs4)
