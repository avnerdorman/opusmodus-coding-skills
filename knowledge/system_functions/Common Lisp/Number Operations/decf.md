     Opusmodus                                                                         decf   1

     decf place &optional delta
     [Macro]

     Arguments and Values:
     place                   a place.
     delta                   a form; evaluated to produce a delta. The default is 1.


     Description:

     The rst argument is some location holding a number. This number is decremented by the
     second argument, delta, which defaults to 1.


     Examples:
     (setf n 0)

     n
     => 0

     (decf n)
     => -1

     (decf n)
     => -2

     (decf n 0.5)
     => -2.5
fi
