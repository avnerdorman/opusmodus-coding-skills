     Opusmodus                                                         row-group-modification    1

     row-group-modification n model set &key type chord flatten
     [Function]

     Arguments and Values:
     n                        an integer.
     model                    integer lists.
     set                      list of integers (twelve-tone row).
     type                     :integer or :pitch. The default is :integer.
     chord                    NIL or T. The default is NIL.
     flatten                  NIL or T. The default is NIL.


     Description:

     This function continues in the same vein as the model, combination, parallel and
     modi cation versions. Look at the difference between these two functions:

     (row-group-combination
      4 '(6 6) '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
     => ((5 4 3 2 1 0) (11 10 9 8 7 6))

     (row-group-modification
      4 '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
     => ((3 4 5 0 1 2) (9 10 11 6 7 8))

     Again the output here has a template model that is useful for constructing background
     harmony to a row. It is important to remember that the rst argument can control the direct of
     the hexagram row.


     Examples:
     (row-group-modification
      2 '(4 4 4) '(0 1 2 3 4 5 6 7 8 9 10 11))
     => ((1 2 3 0) (5 6 7 4) (9 10 11 8))

     (row-group-modification
      2 '(3 3 3 3) '(0 1 2 3 4 5 6 7 8 9 10 11))
     => ((1 2 0) (4 5 3) (7 8 6) (10 11 9))

     (row-group-modification
      2 '(6 2 2 2) '(0 1 2 3 4 5 6 7 8 9 10 11))
     => ((1 2 3 4 5 0) (7 6) (9 8) (11 10))
     (row-group-modification
      2 '(2 6 2 2) '(0 1 2 3 4 5 6 7 8 9 10 11) :type :pitch)
     => ((db4 c4) (eb4 e4 f4 gb4 g4 d4) (a4 ab4) (b4 bb4))
fi
                                                     fi
Opusmodus                                          row-group-modification   2

(row-group-modification
 2 '(2 2 2 2 2) '(0 1 2 3 4 5 6 7 8 9 10 11) :flatten t)
=> (1 0 3 2 5 4 7 6 9 8 11 10)

(row-group-modification
 6 '(6 5 1) '(0 1 2 3 4 5 6 7 8 9 10 11) :flatten t)
=> (5 0 1 2 3 4 6 7 8 9 10 11)
