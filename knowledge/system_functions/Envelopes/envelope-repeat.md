               Opusmodus                                                                        envelope-repeat    1

               envelope-repeat env num &optional reflected x-normalized
               [Function]

               Arguments and Values:
               env                       The envelope to be repeated, represented as a list of alternating x and
                                         y coordinates. It is expected to be sorted in increasing x-values.
               num                       The number of times to repeat the envelope.
               reflected                 Optional argument, if non-NIL, the envelope is re ected along
                                         the y-axis before repetition. Each re ection counts as one repetition.
                                         If reflected is not provided, it defaults to NIL.
               x-normalized              Optional argument, if non-NIL, the resulting envelope is rescaled along
                                         the x-axis to match the original envelope's x-range. If x-normalized
                                         is not provided, it defaults to NIL.


               Description:

               The ENVELOPE-REPEAT function repeats an envelope a certain number of times, with
               optional reflection and x-axis normalization.

               The function operates as follows:

               It rst prepares the envelope for repetition. If the reflected option is set, it re ects the
               envelope using the ENVELOPE-REFLECT function. It also adjusts the repetition count to
               account for the re ection. The function then generates the repeated envelope. It starts with
               the rst point of the original envelope. For each repetition, it adds all the points from the
               original envelope, adjusting their x-values to place them at the right position in the repeated
               envelope. If the reflected option is set and the repetition count is odd, it adds a nal
               re ection of the original envelope. If the x-normalized option is set, it rescales the
               resulting envelope along the x-axis using the X-NORM function to match the original
               envelope's x-range.


               Examples:
               (envelope-repeat '(1 10 2 20 3 30) 2)
               => (1 10 2 20 3 30 3.03 10 4.0299997 20 5.0299997 30)

               (envelope-repeat '(1 10 2 20 3 30) 2 t)
               => (1 10 2 20 3 30 4 20 5 10)

               (envelope-repeat '(1 10 2 20 3 30) 2 t t)
               => (3/5 10 6/5 20 9/5 30 12/5 20 3 10)
fl
     fi
          fi
                            fl
                                                                     fl
                                                                                  fl
                                                                                                fl
                                                                                                     fi
Opusmodus                                         envelope-repeat   2

(envelope-repeat '(1 10 2 20 3 30) 3 t)
=> (1 10 2 20 3 30 4 20 5 10 6 20 7 30)


            30
            28
            26
            24
            22
            20
            18
            16
            14
            12
            10
                  2        3        4     5   6          7
