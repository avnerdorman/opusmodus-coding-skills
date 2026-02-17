Opusmodus                                                                             length-invert       1

length-invert sequence &key swap flat span omn section exclude
[Function]

Arguments and Values:
sequence                 A list of lengths or an OMN sequence. Represents the musical note lengths
                         and rests to be processed.

swap                     (NIL or T): Determines whether the positions of the shortest and longest note
                         lengths are swapped before inversion. Default is NIL.

section                  An integer or list of integers specifying sections of the sequence to process.
                         Default is NIL.

exclude                  An integer or list of integers specifying sections of the sequence to exclude
                         from processing. Default is NIL.

omn                      Forces output in OMN style notation when set to T. Default is NIL.

OMN:
flat                     (NIL or T): Flattens OMN single type lists when set to T. Default is NIL.
span                     (:length, :pitch, or :velocity): Speci es the aspect to span in OMN
                         notation. Default is :length.


Description:

LENGTH-INVERT function transforms note lengths into rests and vice versa within a given
sequence. The :swap parameter facilitates the inversion of positions between the shortest
and longest note lengths prior to applying length inversion, thus enabling creative rhythmic
alterations. The integrity of the rhythmic structure is preserved by maintaining the original
span of the sequence unchanged.


Examples:
(length-invert '(1/8 1/8 -1/8 1/4 1/4 -1/8))
=> (-1/8 -1/8 1/8 -1/4 -1/4 1/8)

(length-invert '(1/8 1/8 -1/8 1/4 1/4 -1/8) :swap t)
=> (1/8 1/8 1/4 -1/8 -1/8 1/4)

(length-invert '(1/20 -1/20 1/20 2/20 1/1))
=> (-1/20 1/20 -1/20 -1/10 -1)

(length-invert '(1/20 -1/20 1/20 2/20 1/1) :swap t)
=> (1/10 1 1/10 1/20)
                                                                 fi
Opusmodus                                                                           length-invert        2

(length-invert '((1/2 1/4) (-1/2 1/2 -1/4 1/4)))
=> ((-1/2 -1/4) (1/2 -1/2 1/4 -1/4))

(length-invert '((1/2 1/4) (-1/2 1/2 -1/4 1/4)) :swap t)
=> ((1/4 1/2) (1/2 -1/2 1/4 -1/4))

(setf theme '((-e eb4 stacc s gb3 d3 -e)
              (e eb4 stacc s gb3 e. d3 stacc -e)
              (-s e eb4 stacc s gb3 d3 -e s eb4 tie+stacc)
              (t eb4 -t s gb3 d3 stacc gb3 eb4 a3 -e)
              (-e eb4 stacc s gb3 d3 -e)
              (e eb4 stacc s gb3 q d3 stacc -s)
              (-s -e eb4 stacc s gb3 d3 -)
              (-s e eb4 stacc s gb3 d3 stacc gb3 eb4 a3)))


                                            2                       3




   4                                                            5




   6                            7                               8




                                                                                             Opusmodus




(length-invert theme)

                                        2               3                       4




   5                        6                   7                               8



                                                                                             Opusmodus




(length-invert theme :swap t)

                                    2                       3               4




   5                    6                           7                   8




                                                                                             Opusmodus
     Opusmodus                                                                     length-invert   3

     In this example, the LENGTH-INVERT function transforms the given sequence of note
     lengths and pitches into their respective rests and vice versa. Notably, some pitches are
     truncated to maintain the original span of the sequence. This ensures the integrity of the
     rhythmic structure is kept intact, even if it means altering the pitch sequence to t the
     predetermined span.

     (length-invert '(q c4 d4 -e - q e4 f4))
     => (-q - e c4 d4 -q -)

     In contrast to the rst example, setting the :span parameter to :pitch instructs the
     LENGTH-INVERT function to extend the resulting phrase to include all pitches. This
     modi cation allows the sequence to encompass a broader range of pitches, altering the span
     of the sequence.

     (length-invert '(q c4 d4 -e - q e4 f4) :span :pitch)
     => (-q - e c4 d4 -q - - - e e4 f4)

     This output demonstrates the function's ability in adjusting the rhythmic structure to
     incorporate all speci ed pitches, consequently extending the sequence's span. To achieve
     this, a loop mechanism is employed, iterating over the sequence to ensure that every pitch
     from the original sequence is accounted for.
fi
                 fi
                      fi
                                                                              fi
