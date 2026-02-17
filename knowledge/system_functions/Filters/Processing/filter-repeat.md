     Opusmodus                                                                                 filter-repeat        1

     filter-repeat n sequence &key seq position section exclude
                                                       type flat span omn

     [Function]

     Arguments and Values:
     n                          An integer specifying the maximum number of allowed repetitions.
     sequence                   A list of items to be ltered.

     seq                        (optional): An integer representing the number of sequential elements to
                                consider as a single group. Default is 1.

     position                   (optional): A Boolean value (NIL or T). If T, the parameter n controls the
                                occurrence position of the element in the sequence. Default is NIL.

     section                    (optional): Either an integer or a list of integers. Speci es sections of the
                                sequence to process. Default is NIL.

     exclude                    (optional): An integer or list of integers indicating sections of the sequence to
                                exclude from processing. Default is NIL.

     OMN:
     type                       (optional): Speci es the attribute to consider for repetition
                                (:pitch, :length, or :velocity). Default is :pitch.

     flat                       (optional): A Boolean value (NIL or T). If T, attens the sequence structure.
                                Default is NIL.

     span                       (optional): Speci es the attribute to preserve during ltering
                                (:pitch, :length, or :velocity). Default is :length.

     omn                        (optional): A Boolean value (NIL or T). If T, indicates that the sequence is in
                                OMN format. Default is T.


     Description:

     The FILTER-REPEAT is a function designed to control the frequency and distribution of
     repeated values within a sequence, useful in composition and generative algorithms. It
     modi es sequences by reducing consecutive repetitions to a speci ed limit or
     managing the positions of elements based on their rst occurrence. The :position
     option, when set to T, shifts the function’s focus from limiting repetitions to managing the
     distinct positions of the rst occurrences up to the number speci ed by n.
fi
                           fi
                                         fi
                                         fi
                                              fi
                                                             fi
                                                                        fl
                                                                             fi
                                                                                  fi
                                                                                       fi
                                                                                        fi
Opusmodus                                                                        filter-repeat       2

Examples:

Basic Usage:

(setf pattern (rnd-sample 24 '(a4 b4) :seed 56))
=> (a4 a4 a4 a4 a4 b4 b4 b4 a4 a4 a4 a4
    b4 b4 a4 a4 b4 b4 a4 b4 b4 a4 b4 a4)

Limits each note to two consecutive repetitions:

(filter-repeat 2 pattern)
=> (a4 a4 b4 b4 a4 a4 b4 b4 a4 a4 b4 b4 a4 b4 b4 a4 b4 a4)

Treats pairs of elements as groups, enforcing uniqueness for each pair within the sequence:

(filter-repeat 1 '(a4 gs4 a4 gs4 a4 fs4 gs4 g5 bb5 g5 gs4) :seq 2)
=> (a4 gs4 a4 fs4 gs4 g5 bb5 g5 gs4)

(filter-repeat 1 '(gs4 fs3 a4 fs3 a4 bb5 a4 gs4) :seq 2)
=> (gs4 fs3 a4 bb5 a4 gs4)

Treats 3 elements as groups, enforcing uniqueness for each 3 elements within the sequence:

(filter-repeat 1 '(gs4 fs3 a4 fs3 fs3 a4 fs3 a4 bb5 a4 gs4) :seq 3)
=> (gs4 fs3 a4 fs3 a4 bb5 a4 gs4)

This example demonstrates how the function applies repetition ltering within each nested
sublist individually. It limits each note within the sublists to a single occurrence, resulting in
the removal of repeated c4 and g4 notes within their respective sublists:

(filter-repeat 1 '((c4 c4 c4) (d4 e4 f4) (f4 g4 g4) (g4 a4 b4)))
=> ((c4) (d4 e4 f4) (f4 g4) (g4 a4 b4))

Filtering OMN Forms by Default Attribute:

(filter-repeat
 1 '(q c4 c4 d4 d4 d4 e4 h f4 s f4 f4 g4 e g4 g4 a4 b4))
=> (q c4 d4 e4 f4 g4 a4 h b4 s c4 d4 e4 e f4 g4 a4 b4)

Filters repeated lengths while preserving pitches, applying the lter across the sequence
based on speci ed type and span settings:

(filter-repeat
 1 '(q c4 c4 d4 d4 d4 e4 h f4 s f4 f4 g4 e g4 g4 a4 b4)
 :type :length :span :pitch)
=> (q c4 h s d4 e q h e4 s f4 e q h g4 s e q a4 h b4)
        fi
                                                           fi
                                                                fi
Opusmodus                                                                       filter-repeat   3

Controls the appearance of elements based on their initial positions, maintaining the rst
occurrences up to ve unique elements:

(filter-repeat 5 '(1 2 2 3 1 4 5 2 1 6 4 3 4 2 2 3 1 1 3) :position t)
=> (1 2 3 4 5 2 1 6 4 3 2 1)

(filter-repeat 5 '(b5 b5 f5 b5 f5 a5 gs5 a5 fs5 bb5) :position t)
=> (b5 f5 a5 gs5 fs5 bb5)

In this example, the FILTER-REPEAT function lters based on length while maintaining
the position of the elements as dictated by the :position t option. It ensures that each
note length occurs no more than three times while looping through the pitch list to satisfy
the length requirements. This process results in a sequence that preserves the overall
structure of lengths while distributing pitches across these lengths:

(filter-repeat 3 '(q c4 c4 d4 e4 e4 e4 f4 f4 f4 g4 g4 g4 a4 b4)
               :position t)
=> (q c4 d4 e4 f4 g4 a4 b4 c4 d4 e4 f4 g4 a4 b4)

With the :span option set to :pitch, this function con guration emphasises pitch
uniqueness within the sequence, allowing each pitch to appear up to three times
irrespective of their durations. This results in a sequence where the pitches are ltered
based on their occurrences while their speci c durations and rhythmic positions are
maintained, effectively simplifying the pitch content while retaining rhythmic complexity:

(filter-repeat 3 '(q c4 c4 d4 e4 e4 e4 f4 f4 f4 g4 g4 g4 a4 b4)
               :position t :span :pitch)
=> (q c4 d4 e4 f4 g4 a4 b4)
            fi
                                     fi
                                           fi
                                                   fi
                                                                           fi
                                                                                 fi
