Opusmodus                                                                           length-staccato       1

length-staccato sequence &key value section exclude omn
[Function]

Arguments and Values:
sequence                   A list of note lengths or an OMN (Opusmodus Notation) sequence.

value                      A length symbol, ratio, or oating-point number ranging from 0.0 to 1.0.
                           If a ratio (e.g., 1/16), each note length in the sequence is reduced to this xed
                           value, and the remainder of the original length is converted into a rest.
                           If a oating-point number (e.g., 0.25), each note length is proportionally
                           scaled by this value, and the remainder of the original length is converted into
                           a rest. Default is 1/16 (a xed value).

section                    An integer or a list of integers indicating which sections of the sequence to
                           process. If provided, only the speci ed sections are processed. Default is NIL,
                           meaning all sections are processed.

exclude                    An integer or a list of integers indicating which sections of the sequence to
                           exclude from processing. If provided, the speci ed sections are excluded from
                           processing. Default is NIL, meaning no sections are excluded.

omn                        A boolean value (NIL or T). If T (true), the output is formatted in OMN style.
                           Default is NIL.


Description:

The function LENGTH-STACCATO decreases the lengths of notes in a sequence to a given
length value, and the remainder of each decreased length is converted into rest values.

(length-staccato '(1/4 -1/4 1/4 1/4))
=> (1/16 -3/16 -1/4 1/16 -3/16 1/16 -3/16)


Examples:

This example processes a sequence of quarter notes. Each note is decreased to 1/32, and the
remainder of the original length is converted to a rest:

(length-staccato '(1/4 -1/4 1/4 1/4) :value 1/32)
=> (1/32 -7/32 -1/4 1/32 -7/32 1/32 -7/32)

Here, each length is scaled by 0.25, and the remainder is converted to a rest:

(length-staccato '(1/4 -1/4 1/4 1/4) :value 0.25)
=> (1/16 -3/16 -1/4 1/16 -3/16 1/16 -3/16)
                      fl
                                              fi
                                               fl
                                                       fi
                                                                   fi
                                                                                              fi
Opusmodus                                                                 length-staccato           2

This example processes a nested list of OMN sequence form. The OMN style output is
forced:

(length-staccato '((-e -s = q) (3h -3q 5h -5h. -e q.)) :omn t)
=> ((-e -s = = -e.) (3q - - 5q - -5h. -e s -qs))

Each length is scaled by 0.5, and the OMN style output is forced:

(length-staccato '((-e -s = q) (3h -3q 5h -5h. -e q.))
                 :value 0.5 :omn t)
=> ((-e -s t - e -) (3q - - 5q - -5h. -e q -e))

This example processes a list of lengths and note symbols. Each note length is decreased to a
sixteenth note, and the remainder is converted to a rest:

(length-staccato '(e e4 mp f4 fs3 -e g4 gs5))
=> (s e4 mp - f4 - fs3 - -e s g4 - gs5 -)

Each note length is scaled by 0.25, and the remainder is converted to a rest:

(length-staccato '(e e4 mp f4 fs3 -e g4 gs5) :value 0.25)
=> (t e4 mp -s. t f4 -s. t fs3 -s. -e t g4 -s. t gs5 -s.)

(setf omn '((e. c4 eb4 fs4 q.. a4 tie)
            (s a4 e. cs4 e4 g4 e bb4 tie)
            (e bb4 e. d4 f4 gs4 s b4)))

                                         2               3




This example uses a prede ned OMN sequence and processes it with the default value:

(length-staccato omn)

                                    2                          3




                                                                                        Opusmodus
                    fi
Opusmodus                                                         length-staccato          3

Processes the OMN sequence with each length scaled by 0.5:

(length-staccato omn :value 0.5)

                                             2




      3


                                                                               Opusmodus




Processes only the rst section (second bar) of the OMN sequence with each length
scaled by 0.5:

(length-staccato omn :value 0.5 :section 1)

                                   2




  3


                                                                              Opusmodus
            fi
