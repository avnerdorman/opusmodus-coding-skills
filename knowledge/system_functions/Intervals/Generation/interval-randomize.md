     Opusmodus                                                                 interval-randomize   1

     interval-randomize n intervals &key rnd-order seed
     [Function]

     Arguments and Values:
     n                         an integer - number of lists to produce.
     intervals                 list of intervals.
     rnd-order                 NIL, T or '? (at random). The default is NIL.
     seed                      an integer or NIL. The default is NIL.


     Description:

     INTERVAL-RANDOMIZE will create a number of variations from a list of intervals, chie y
     by randomly inverting their values. Like INTERVAL-EXPANSION-SERIES the composer
     can expand the number of variants of a single interval list. What is unique to this function is
     the rnd-order argument.

     (interval-randomize 4 (pcs '6-Z10))
     => ((0 1 3 -4 -5 -7) (0 1 3 4 -5 -7)
         (0 1 -3 4 -5 -7) (0 1 -3 4 5 -7))

     (interval-randomize 4 (pcs '6-Z10) :rnd-order t)
     => ((-1 0 -3 -7 4 -5) (-1 5 0 -3 -4 -7)
         (5 -4 3 -1 0 7) (7 -1 3 -4 0 -5))



     Examples:
     (interval-randomize 1 '(2 4 2))
     => (2 -4 -2)

     (interval-randomize 2 '(2 4 2))
     => ((2 4 2) (2 -4 2))

     (interval-randomize 2 '(2 4 -2))
     => ((-2 4 -2) (-2 -4 2))

     By default none of the values are shuf ed, but further variation can be introduced by
     shuf ing all values with :rnd-order T:

     (interval-randomize 2 '(2 4 -2) :rnd-order t)
     => ((4 -2 -2) (2 -2 -4))
fl
                                     fl
                                                                                           fl
Opusmodus                                                        interval-randomize   2

Using :rnd-order '? will only shuf e a random number of the output lists:

(interval-randomize 4 '(2 4 -2) :rnd-order '?)
=> ((-4 2 -2) (-2 4 2) (2 2 4) (-2 4 -2))

Use a random :seed to generate consistent results:

(interval-randomize 4 '(2 4 -2) :rnd-order '? :seed 32)
=> ((2 2 4) (-4 -2 -2) (2 4 2) (-2 4 -2))

Multiple lists are processed sequentially:

(interval-randomize 4 '((2 4 -2) (4 2 3)) :rnd-order '? :seed 32)
=> ((2 2 4) (-4 -2 -2) (2 4 2) (-2 4 -2)
    (4 -2 -3) (-2 -4 3) (4 2 -3) (-2 3 -4))
                                  fl
