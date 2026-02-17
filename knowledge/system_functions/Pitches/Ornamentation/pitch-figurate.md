Opusmodus                                                                          pitch-figurate     1

pitch-figurate count sequence &key interval ambitus variant omit
                          parallel-invert section exclude seed

[Function]

Arguments and Values:
count                    and integer or list of integers.
sequence                 omn sequence or pitch sequence.
interval                 NIL, '? or list of intervals. The default is '? at random
                         from (-1 1 -2 2).
ambitus                  instrument name or an integer or pitch list (low high). The default is 'piano.
parallel-invert          NIL or T. The default is NIL. Invert added chord if parallel.
variant                  'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                         'a (ascending), 'd (descending), 'ad (ascending-descending),
                         'da (descending-ascending), 'ro (random order) or '? (at random).
                         The default is NIL (random).
omit                     list of variants to omit. The default is NIL.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     NIL or number. The default is NIL.


Description:

The function PITCH-FIGURATE inserts an interval (:interval or at random '(-1 1
-2 2)) to a count of pitches that are selected at random.

(pitch-figurate 2 '(c4 as3 b3 fs4 e4 f4) :seed 65)
=> (c4 as3 b3 fs4 e4 fs4 f4 fs4)

The length value of the selected pitch is divided by 2 (the bar length is unchanged).

(pitch-figurate 2 '(q c4 as3 b3 fs4 e4 f4) :seed 65)
=> (q c4 as3 b3 fs4 e e4 fs4 f4 fs4)

Applying ornamentation to pitches with an upward, downward or mixed appoggiatura is a
common device. The function PITCH-FIGURATE ful ls this requirement as well as
offering novel variations in other situations. See below the example.
                                                    fi
Opusmodus                                                 pitch-figurate   2

Examples:
(setf mat (gen-repeat 5 '((c4 as3 b3 fs4 e4 f4))))

(pitch-figurate 2 mat :interval '(1 -1) :seed 23)
=> ((c4 cs4 as3 b3 bb3 fs4 e4 f4)
    (c4 as3 b3 c4 fs4 e4 eb4 f4)
    (c4 as3 b3 b3 fs4 f4 e4 f4)
    (c4 as3 b3 c4 fs4 e4 f4 e4)
    (c4 cs4 as3 b3 fs4 e4 f4 e4))

(setf omn (gen-repeat 5 '((q c4 as3 b3 fs4 e4 f4))))

(pitch-figurate '(2 3) omn :seed 42 :interval '((1 -1) (1 2 -1)))
=> ((e c4 cs4 as3 a3 q b3 fs4 e4 f4)
    (q c4 as3 b3 e fs4 g4 e4 fs4 f4 e4)
    (e c4 cs4 q as3 b3 e fs4 f4 q e4 f4)
    (e c4 cs4 q as3 e b3 cs4 q fs4 e4 e f4 e4)
    (e c4 cs4 q as3 b3 fs4 e4 e f4 e4))




(setf omn2 (gen-repeat 5 '((q c4 as3 stacc b3 e fs4 leg e4 q f4))))

(pitch-figurate '(2 3) omn2 :seed 87 :interval '((1 -1) (1 2 -1)))
=> ((e c4 cs4 as3 stacc a3 stacc q b3 e fs4 leg e4 q f4)
    (q c4 e as3 stacc b3 stacc b3 cs4 fs4 leg e4 f4 e4)
    (q c4 as3 stacc e b3 c4 fs4 leg s e4 eb4 q f4)
    (e c4 cs4 q as3 stacc b3 s fs4 leg gs4 leg e4 eb4 q f4)
    (q c4 as3 stacc b3 s fs4 leg g4 leg e4 eb4 q f4))
Opusmodus                                                  pitch-figurate   3

(pitch-figurate '(2 3) omn2
 :seed 87 :interval '((1 -1) (1 13 -13)) :variant '?)
=> ((e c4 cs4 bb3 stacc a3 stacc q b3 e fs4 leg e4 q f4)
    (q fs4 e f4 stacc fs4 stacc e4 f5 c4 leg b3 bb3 a2)
    (q f4 e4 stacc e fs4 g4 b3 leg s bb3 a3 q c4)
    (e bb3 b3 q stacc c4 s e4 leg f5 leg f4 e3 q fs4)
    (q f4 fs4 stacc e4 s b4 leg c5 leg c5 b4 q bb4))
