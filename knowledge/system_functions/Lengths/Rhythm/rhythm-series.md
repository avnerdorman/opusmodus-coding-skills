Opusmodus                                                                        rhythm-series        1

rhythm-series num number-of-notes span &key length prob seed
[Function]

Arguments and Values:
num                      a number of generated lists.
number-of-notes          a number of length-notes in a list.
span                     size (duration) of a list (bar time signature).
length                   a list of length values used in a series. The default is '(h q. q e. e s).
prob                     a oating point value between 0.0 and 1.0. The default is 0.5.
seed                     an integer - ensure the same result each time the code is evaluated.
                         The default is NIL.


Description:

This function returns a list of successive rhythmic series derived from a span (overall
duration), length values, and a number of length-notes per bar. The length-
notes within each bar are positioned at random. If the num (number) is negative, it will
return a length-rest equal to the span value.


Examples:
Simple examples:

(rhythm-series 4 3 3/8)
=> ((-1/16 1/8 -1/16 1/16 1/16) (1/16 3/16 1/8)
    (1/8 3/16 1/16) (3/16 1/16 1/8))

                                          2            3         4




(rhythm-series 4 5 3/8)
=> ((1/16 1/16 1/16 1/8 1/16) (-1/16 1/16 1/16 1/16 1/16 1/16)
    (1/16 1/16 1/16 -1/16 1/16 1/16) (1/16 1/16 1/16 1/16 -1/16 1/16))

                                   2               3                 4



                                                                                                          Opu
                    fl
Opusmodus                                                                                  rhythm-series         2

(rhythm-series 4 3 1/4)
=> ((1/16 1/8 1/16) (1/16 1/16 1/8)
    (1/16 1/8 1/16) (1/16 1/8 1/16))

                                               2       3       4




Examples with given length values:

(rhythm-series 4 3 1 :length '(q. e. s))
=> ((-1/4 1/16 1/16 1/16 -9/16) (1/8 3/16 -5/16 3/8)
    (1/16 3/16 -3/8 3/8) (3/16 -1/16 3/8 3/8))

                               2                           3                           4



                                                                                                                     Opusmodu




(rhythm-series 6 5 3/8 :length '(q. e. e s 3q) :prob 0.1)
=> ((1/16 1/16 1/16 1/16 1/8) (1/8 1/16 1/16 1/16 1/16)
    (1/16 1/8 1/16 1/16 1/16) (1/16 1/8 1/16 1/16 1/16)
    (1/16 1/16 1/16 1/16 1/16 -1/16) (1/16 1/16 1/16 1/8 1/16))

                                       2                                           3




  4                        5                                           6



                                                                                                     Opusmodus




(rhythm-series 6 5 3/8 :length '(q. e. e s 3q) :prob 0.9)
=> ((1/12 1/12 1/12 1/12 1/24) (1/24 1/12 1/12 1/12 1/12)
    (1/16 1/16 1/16 1/16 1/16 -1/16) (1/16 1/16 -1/16 1/16 1/16 1/16)
    (1/16 1/16 1/16 -1/16 1/16 1/16) (1/16 1/16 1/16 1/16 -1/16 1/16))

            3      3      3            2   3       3               3           3




  4                                5                                       6



                                                                                                     Opusmodus
Opusmodus                                                                                                             rhythm-series              3

In this example the num value -1 will generate an empty bar(-1/2):

(rhythm-series '(1 4 -1 2) '(7 5 2 7) '(3/8 3/8 1/2 3/4))
=> ((1/32 1/32 -3/32 1/32 -1/32 1/32 1/32 1/32 -1/32 1/32)
    (1/16 1/16 1/16 1/16 -1/16 1/16) (-1/16 1/16 1/16 1/16 1/16 1/16)
    (1/8 1/16 1/16 1/16 1/16) (1/16 1/16 1/16 1/8 1/16) (-1/2)
    (-1/16 1/16 1/8 1/16 1/16 -1/8 1/16 1/16 1/8)
    (1/16 1/8 -1/8 1/16 1/8 1/16 1/8 1/16)
    (1/32 -1/32 1/16 1/16 1/32 1/16 1/32 1/16))

                                             2                           3                                    4




  5                  6       7                                   8                                    9



                                                                                                                                     Opusmodus




In the following example, we generate unique rhythms for each of the generated series:

(rhythm-series '(1 4 3 2)
               '(7 5 7 7)
               '(3/8 3/8 1/2 3/4)
               :prob '(.4 .6 .7 .1)
               :length '(q. e. e s 5q 3q)
               :seed 34)
=> ((1/20 1/20 1/20 1/20 1/20 1/20 1/40 -1/20)
    (1/24 1/12 1/12 1/12 1/12)
    (1/20 -1/20 1/20 -1/20 1/20 1/20 1/40 -1/20)
    (1/16 1/16 1/16 1/16 1/8)
    (1/16 1/16 1/8 1/16 1/16)
    (1/20 1/20 1/20 1/20 1/20 -1/20 1/20 -1/20 1/20 -1/20)
    (-1/20 -1/20 1/20 1/20 -1/20 1/20 1/20 1/20 1/20 1/20)
    (-1/20 1/20 -1/20 1/20 1/20 1/20 1/20 1/20 -1/20 1/20)
    (-1/16 1/16 1/16 1/16 -1/8 1/16 -1/16 1/16 1/16 1/16 -1/16)
    (1/12 -1/12 -1/12 1/12 1/12 1/12 1/12 1/12 1/12))

             5           5               5                                                   5                    5            5
                                                     2   3           3           3   3




  4                                  5                                       6           5                                 5




         5                       5               5                                                        3
  7              5       8                                   9                                   10                    3       3




                                                                                                                                   Opusmodus
Opusmodus                                             rhythm-series         4

(make-omn
 :length (rhythm-series '(1 4 3 2)
                        '(7 5 7 7) 1/2
                        :prob '(.4 .6 .7 .1)
                        :length '(q. e. e s)
                        :seed 34)
 :pitch (gen-chord3 '((cs4 g4 a5) (c4 gs3 a4)
                      (b5 f5 gs5) (b4 fs4 bb5)
                      (cs5 c6 gs4) (e5 g3 a5))
                    '((6 8 11) (3 5 13) (2 7 11))))




                                                  2




  3                                      4




  5                              6




  7                                  8




  9                                          10




                                                                Opusmodus
