     Opusmodus                                                                         incf   1

     incf place &optional delta
     [Macro]

     Arguments and Values:
     place                   a place.
     delta                   a form; evaluated to produce a delta. The default is 1.


     Description:

     The rst argument is some location holding a number. This number is incremented by the
     second argument, delta, which defaults to 1.


     Examples:
     (setf n 0)

     n
     => 0

     (incf n)
     => 1

     (incf n)
     => 2

     (incf n 0.5)
     => 2.5
fi
