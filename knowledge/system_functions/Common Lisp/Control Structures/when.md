     Opusmodus                                                                      when   1

     when test-from forms
     [Macro]

     Arguments and Values:
     test-form               a form.
     forms                   an implicit progn.


     Description:

     If the rst argument is true, the rest of the forms are evaluated as a PROGN.


     Examples:
     (when t 'hello)
     => hello

     (when nil 'hello)
     => nil

     (when t)
     => nil

     (when nil (+ 2 3))
     => nil

     (when t (+ 2 3))
     => 5

     (when t (prin1 1) (prin1 2) (prin1 3))
     => 123
     => 3
fi
