     Opusmodus                                                               interval-invert   1

     interval-invert intervals &key mod assoc
     [Function]

     Arguments and Values:
     intervals                list of intervals.
     assoc                    an integer (assoc value). The default is 12.
     mod                      an integer (mod value). The default is 12.


     Description:

     INTERVAL-INVERT will invert a list of intervals according to the scheme shown in
     the rst example.

     (interval-invert '(0 1 2 3 4 5 6 7 8 9 10 11))
     => (0 -11 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1)

     This will preserve PITCH-CLASS, but will result in large intervals replacing small ones and
     vice-versa. For example, the intervals '(2 2) can be interpreted as follows:

     (interval-map 'c4 '(2 2))
     => (c4 d4 e4)


     Examples:

     But inverted gives us a rapid movement through the octaves:

     (interval-map 'c4 (interval-invert '(2 2)))
     => (c4 d3 e2)

     Example with mixed lists:

     (setf row-2 (interval-invert
                  '((4 6 0 (-8 5) 4 6) (13 -6 0 (-10 2) 4 6))))
     => ((-8 -6 0 (4 -7) -8 -6) (-1 6 0 (2 -10) -8 -6))

     (setf row-2p (interval-to-pitch row-2))
     => ((c4 e3 bb2 bb2 d3g2 b1 f1) (e1 bb1 bb1 c2d1 bb1 e2))
fi
