Opusmodus                                                                             scale-envelope        1

scale-envelope even scale &optional offset
[Function]

Arguments and Values:
env                      A list representing the envelope. The list is composed of pairs of x and y
                         values, where x typically represents time and y represents amplitude.
                         For instance, an envelope like (0 1 1 0) signi es that at time 0
                         the amplitude is 1, and at time 1 the amplitude is 0.
scale                    A numerical value which the y-values (amplitudes) of the envelope will
                         be multiplied by.
offset                   (optional): An optional numerical value that will be added to all y-values
                         (amplitudes) after scaling. If this parameter is not provided, it defaults to 0,
                         implying no offset will be added.


Description:

This function is designed to modify the amplitude values (y-values) in an envelope structure
by scaling (multiplying) and/or offsetting (adding) them. This can be particularly useful in
applications like digital signal processing, music synthesis, or any context where the
manipulation of amplitude over time is required. The resultant list keeps the temporal
structure of the original envelope, but with different amplitude values based on the
scale and offset.


Examples:
(scale-envelope '(7.0 0.5 10.0 1.0) 2)
=> (7.0 1.0 10.0 2.0)

(scale-envelope
 (envelope-concatenate
  '(0.0 0.0 1.0 1.0)
  '(1.0 1.0 4.0 0.5)
  '(40.0 0.5 47.0 0.0)
  '(7.0 0.5 10.0 0.0)
  '(0.0 0.5 13.0 0.0)) 1.5)
=> (0.0 0.0 1.0 1.5 1.01 1.5 4.01 0.75 4.0200005 0.75 11.02 0.0
    11.030001 0.75 14.030001 0.0 14.040001 0.75 27.04 0.0)
                                                                     fi
