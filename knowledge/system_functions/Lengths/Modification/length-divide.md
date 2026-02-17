Opusmodus                                                                        length-divide   1

length-divide values sequence &key set ignore
                       section exclude omn seed

[Function]

Arguments and Values:
values                  a list of values: (<count><divide> and optional <intervals>).
                        <intervals> types: NIL, '?, ‘r (pitch repeat) or list of intervals.
                        The default is '? at random from (-1 1 -2 2).
sequence                a list of lengths or omn-form list.
set                     'min, 'max or length value.
ignore                  'min, 'max or length value.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.
seed                    NIL or an integer. The default is NIL.
omn                     NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

This function is able to divide number of lengths to a given division value. The :set
and :ignore option increases the control for the desired result. When processing the omn-
form sequence an optional third value allows you to ll intervalic steps (a root
transposition) to new length values derived from the divisions.

(setf rhy '(1/4 1/4 1/4 1/4))

(length-divide '(2 2) rhy)
=> (1/8 1/8 1/4 1/4 1/8 1/8)




(length-divide '(2 4) rhy)
=> (1/4 1/16 1/16 1/16 1/16 1/16 1/16 1/16 1/16 1/4)
                                                  fi
Opusmodus                                                                  length-divide   2

Examples:
(length-divide
 '(1 2) '(1/4 -1/8 1/16 1/16 -1/32 -3/32 1/8 1/1) :seed 34)
=> (1/4 -1/8 1/16 1/32 1/32 -1/32 -3/32 1/8 1)




In the example above only 1 length is divided by 2 - that is the 1/16. In the example below
4 lengths are divided by 2.

(length-divide
 '(4 2) '(1/4 -1/8 1/16 1/16 -1/32 -3/32 1/8 1/1) :seed 34)
=> (1/8 1/8 -1/8 1/16 1/32 1/32 -1/32 -3/32 1/16 1/16 1/2 1/2)




(length-divide
 '(1 2) '(1/4 -1/8 1/16 1/16 -1/32 -3/32 1/8 1/1) :set 'min :seed 34)
=> (1/4 -1/8 1/32 1/32 1/16 -1/32 -3/32 1/8 1)




(length-divide
 '(1 4) '(1/4 -1/8 1/16 1/16 -1/32 -3/32 1/8 1/1) :set 1/8 :seed 34)
=> (1/4 -1/8 1/16 1/16 -1/32 -3/32 1/32 1/32 1/32 1/32 1)




(length-divide
 '((2 3) (1 2)) '((1/4 -1/8 1/16 1/16) (1/32 -3/32 1/8 1/1))
 :ignore 'max :seed 45)
=> ((1/4 -1/8 1/48 1/48 1/48 1/48 1/48 1/48) (1/64 1/64 -3/32 1/8 1))
Opusmodus                                                               length-divide   3

(length-divide '((2 4) (1 2)) '((q -e s s) (s -e. e w))
               :set 'max :ignore 1 :seed 65)
=> ((1/16 1/16 1/16 1/16 -1/8 1/16 1/64 1/64 1/64 1/64)
    (1/16 -3/16 1/16 1/16 1))




OMN:

(setf mat1 '(q c4 d4 e4 f4 g4 a4 b4))

(length-divide '(3 4) mat1 :seed 45)
=> (s d4 bb3 cs4 b3 cs4 eb4 c4 e4 q s g4 e4 eb4 fs4 q g4 a4 b4)




Symbol 'r will apply repeat function:

(length-divide '(3 4 r) mat1 :seed 45)
=> (s c4 c4 c4 c4 d4 d4 d4 d4 q e4 s f4 f4 f4 f4 q g4 a4 b4)




Here we use a set of interval values at the end of the division list:

(length-divide '(3 4 (13 0 1 13)) mat1 :seed 45)
=> (s cs5 c4 cs4 cs5 eb5 d4 eb4 eb5 q e4 s fs5 f4 fs4 fs5 q g4 a4 b4)
Opusmodus                                                               length-divide    4

(setf mat2 '((e c4 p e4 mp g4 he c5 p)
             (q c4 f c4 cs4 mp - d5 p d5)
             (q cs5 mf = - - cs5 p =)))




(length-divide '((1 4) (2 4) (2 5)) mat2 :seed 34)
=> ((e c4 p e4 mp t a4 f4 gs4 fs4 he c5 p)
    (q c4 f s b3 cs4 bb3 d4 q cs4 mp - d5 p s c5 e5 cs5 eb5)
    (q cs5 mf cs5 - - 5q eb5 p b4 c5 d5 eb5 c5 eb5 b4 d5 c5))




In the example below we assign three series of division values to variables s1, s2 and
s3:

(setf
 s1 '(3 4 (6 12 18 24))
 s2 '(3 4 ((13 1 13 0) (13 0 7 1) r))
 s3 '(2 5 ((13 0 13 0 13) ?))
 )

(length-divide (list s1 s2 s3) mat2 :seed 34)
=> ((e c4 p t bb4 mp e5 bb5 e6 cs5 g5 cs6 g6 et fs5 p c6 fs6 c7)
    (q c4 f s cs5 cs4 cs5 c4 q cs4 mp - s eb6 p d5 a5 eb5 d5 d5 d5 d5)
    (5q d6 mf cs5 d6 cs5 d6 q cs5 - - cs5 p 5q d5 eb5 c5 b4 d5))
Opusmodus   length-divide   5
