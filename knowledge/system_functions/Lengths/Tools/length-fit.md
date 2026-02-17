Opusmodus                                                                                length-fit      1

length-fit lengths &key denominator type
[Function]

Arguments and Values:
lengths                  list of lengths.
denominator              an integer. The default is 8 (list round up to t the time signature measure).
type                     :add or :rest. The default is :add.


Description:

The LENGTH-FIT function will add a length value to the last length value in the list or add
a rest length value at the end of the list to t the time signature measures. This function is
useful especially if tuples are part of random length generator or length modi cation.

(setf lengths '(-e c4 q d4 e4 5h f4 5q g4))

(length-fit lengths)
=> (-e c4 q d4 e4 5h f4 5h. g4)

The type :rest will add a rest length value at the end of the list to t the time signature.

(length-fit lengths :type :rest)
=> (-e c4 q d4 e4 5h f4 5q g4 -5h)


Examples:
(length-fit '(-1/8 1/4 1/4 2/20 1/20))
=> (-1/8 1/4 1/4 1/10 3/20)

(length-fit '(1/20 1/20 1/20 1/4) :type :rest)
=> (1/20 1/20 1/20 1/4 -1/10)

(length-fit '((e a4 q c5 tie e c5 tie 3q c5 b4 3e cs5)
              (q gs4 tie 3q gs4 3e f4 fs5)) :denominator 4 :type :rest)
=> ((e a4 q c5 tie e tie 3q 3q b4 3e cs5 -)
    (q gs4 tie 3q 3e f4 fs5 -3q))
                                       fi
                                                              fi
                                                                       fi
                                                                              fi
