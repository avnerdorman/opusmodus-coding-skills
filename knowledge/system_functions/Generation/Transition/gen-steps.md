Opusmodus                                                                           gen-steps   1

gen-steps step sequence &key prob seed
[Function]

Arguments and Values:
step                     an integer >1 or list of integers (number of steps).
sequence                 a sequence.
prob                     a oating-point number (probability value) between 0.0 and 1.0.
                         The default is 0.5.
seed                     an integer or NIL. The default is NIL.


Description:

The function GEN-STEPS randomises the order of a sequence and returns it into the original
sequence order, after a given number of steps.

(gen-steps 12 '(0 1 2 3 4 5 6 7 8 9 10 11) :seed 43)
=> (( 4 3 11 8 10 0 9 5 7 2 1 6)
    ( 4 3 2 8 10 0 9 5 7 11 1 6)
    ( 4 3 2 8 10 0 9 7 5 11 1 6)
    ( 4 8 2 3 10 0 9 7 5 11 1 6)
    (10 8 2 3 4 0 9 7 5 11 1 6)
    (10 8 2 3 4 0 9 7 5 6 1 11)
    ( 0 8 2 3 4 10 9 7 5 6 1 11)
    ( 0 8 2 3 4 10 9 7 5 6 1 11)
    ( 0 5 2 3 4 10 9 7 8 6 1 11)
    ( 0 5 2 3 4 1 9 7 8 6 10 11)
    ( 0 5 2 3 4 1 6 7 8 9 10 11)
    ( 0 1 2 3 4 5 6 7 8 9 10 11))


Examples:
(gen-steps 6 '(c4 e4 g4 b4 f4 d4 b3) :seed 56)
=> ((b4 c4 e4 f4 b3 g4 d4) (c4 b4 e4 f4 b3 g4 d4)
    (c4 e4 b4 f4 b3 g4 d4) (c4 e4 f4 b4 b3 g4 d4)
    (c4 e4 f4 b4 b3 d4 g4) (c4 e4 g4 b4 f4 d4 b3))

(gen-steps
 7 '(s c4 ppp d4 pp e4 p f4 mp g4 mf a4 f - b4 ff c5 fff))
=> ((s g4 mf f4 mp c5 fff e4 p d4 pp c4 ppp a4 f - b4 ff)
    (s g4 mf e4 p c5 fff f4 mp d4 pp c4 ppp a4 f - b4 ff)
    (s g4 mf e4 p c5 fff f4 mp d4 pp c4 ppp a4 f b4 ff -)
    (s c4 ppp e4 p c5 fff f4 mp d4 pp g4 mf a4 f b4 ff -)
    (s c4 ppp d4 pp c5 fff f4 mp e4 p g4 mf a4 f b4 ff -)
    (s c4 ppp d4 pp c5 fff f4 mp g4 mf e4 p - b4 ff a4 f)
    (s c4 ppp d4 pp e4 p f4 mp g4 mf a4 f - b4 ff c5 fff))
                    fl
Opusmodus                                                  gen-steps     2

(pitch-variant
 (gen-steps
  '(3 4 5) '(s bb3 p a3 mp g3 a3 f c4 f4 a4 pp -q
              s bb4 c5 p b4 c5 mf d5 eb5 fff f5 eb5 d5))
 :variant '?)




 2




 3




 4




 5




 6




 7




 8




 9




 10




 11




                                                             Opusmodus
