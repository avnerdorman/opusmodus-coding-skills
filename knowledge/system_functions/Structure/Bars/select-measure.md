     Opusmodus                                                                           select-measure      1

     select-measure measure sequence &key ratio time-signature
     [Function]

     Arguments and Values:
     measure                   A list of two values (<from> <to>) indicating the selection range within
                               the given sequence. Each value can be a number representing a bar (measure)
                               number or a number with a dot representing a beat number within the measure.

     sequence                  An OMN (Opusmodus Notation) form sequence. The sequence must be in
                               a (4 4) time signature format for proper function operation.

     ratio                     The smallest beat value to be used for selecting the measures. This value
                               de nes the granularity of the selection.

     time-signature            The time signature to be applied to the returned sequence after processing.


     Description:

     The SELECT-MEASURE function is used to extract speci c bars and beats from a omn-form
     sequence. It allows for precise selection and transformation of musical measures based on
     given criteria, such as measure range and time signature.


     Examples:

     De ne a Sequence:

     (setf seq '((q c4 db4 ab4 f4 g4 bb4) (e a4 eb4 b4 e4 d4 gb4)
                 (q db4 ab4 f4 g4 bb4 a4) (q eb4 b4 e4 d4 gb4 c4)))

     The sequence is converted to a 4/4 time signature to standardise the format, which is
     required for the function:

     (setf mat (omn-to-time-signature seq '(4 4)))
     => ((q c4 mf db4 ab4 f4) (q g4 mf bb4 e a4 eb4 b4 e4)
         (e d4 mf gb4 q db4 ab4 f4) (q g4 mf bb4 a4 eb4)
         (q b4 mf e4 d4 gb4) (q c4 mf))

     Select Speci c Measures and Beats:

     (select-measure '((2.2 3) (4.2 5)) mat
                     :ratio 1/4 :time-signature '(2 4))
     => ((e a4 mf eb4 b4 e4) (q a4 mf eb4))
fi
           fi
                          fi
                                                           fi
     Opusmodus                                                                  select-measure    2

     In this example, the function extracts notes from the second beat of the second measure to
     the end of the third measure, and from the second beat of the fourth measure to the end of the
       fth measure. The result is transformed into a sequence with a 2/4 time signature.
fi
