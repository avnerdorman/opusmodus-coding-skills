Opusmodus                                                                         rosette   1

rosette n model1 model2 set &key type chord flatten
[Function]

Arguments and Values:
n                        an integer.
model1                   integer lists
model2                   integer lists
set                      list of integers or pitches (twelve-tone row).
type                     :integer or :pitch. The default is :integer.
chord                    NIL or T. The default is NIL.
flatten                  NIL or T. The default is NIL.


Description:

Work through the examples to see the range of change that can be brought to a pitch or
integer list.


Examples:
(rosette 9 '(12) '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((2 3 4 5 6 1) (8 9 10 11 0 7))

(rosette 9 '(6 6) '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((2 3 4 5 0 1) (8 9 10 11 6 7))

(rosette 9 '(4 4 4) '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((2 3 0 5 6 1) (4 9 10 11 8 7))

(rosette 5 '(4 4 4) '(2 2 2 2 2 2) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((2 1) (0 3) (6 5) (4 7) (10 9) (8 11))

(rosette 8 '(6 3 3) '(3 4 3 2) '(0 1 2 3 4 5 6 7 8 9 10 11))
=> ((1 2 3) (7 4 5 0) (8 6 10) (9 11))

(rosette 9 '((6 2 2 2) (2 6 2 2)) '(6 6)
             '(0 1 2 3 4 5 6 7 8 9 10 11) :type :pitch)
=> ((d4 eb4 e4 f4 c4 db4) (gb4 a4 ab4 b4 bb4 g4))

(rosette 9 '((6 2 2 2) (2 6 2 2)) '(3 3 3 3)
           '(0 1 2 3 4 5 6 7 8 9 10 11) :flatten t)
=> (2 1 4 5 0 7 6 3 8 9 10 11)
