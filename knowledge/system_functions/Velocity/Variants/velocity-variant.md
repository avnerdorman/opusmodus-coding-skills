Opusmodus                                                                     velocity-variant   1

velocity-variant sequence &key variant omit prob
                           section exclude omn

[Function]

Arguments and Values:
sequence                 list(s) of velocities or omn-form lists.
variant                  'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                         'a (ascending), 'd (descending), 'ad (ascending-descending),
                         'da (descending-ascending), 'ro (random order) or '? (at random).
                         The default is ? (random).
omit                     list of variants to omit. The default is NIL.
prob                     a oating-point number (probability value) between 0.0 and 1.0.
                         The default is 0.5.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
omn                      NIL or T. If true force OMN style output. The default is T.


Description:

This function can process a sequence of common variant forms on lists of velocities.

(velocity-variant '(ppp p mf ff p<>f < <) :variant 'i)
=> (fff f mp pp f><p > >)

(velocity-variant '(ppp p mf ff p<>f < <) :variant 'r)
=> (> > f><p ff mf p ppp)

(velocity-variant '(ppp p mf ff p<>f < <) :variant 'a)
=> (ppp p mf mf mf f ff)

(velocity-variant '(ppp p mf ff p<>f < <) :variant 'da)
=> (ff mf mf ppp p mf f)

The variant processes included in this function are all standard forms used throughout most
composition practice. The function does not use any speculative or random-based processes.
All the function processes used can be found in OPUSMODUS as standalone functions.

(setf velocity (gen-repeat 6 '((ppp p mf ff p<>f < <))))

(velocity-variant velocity :variant '(p r i ri a d))
=> ((ppp p mf ff p<>f < <) (> > f><p ff mf p ppp)
    (fff f mp pp f><p > >) (< < p<>f pp mp f fff)
    (ppp p mf mf mf f ff) (ff f mf mf mf p ppp))
                    fl
Opusmodus                                               velocity-variant   2

Examples:
(velocity-variant
 '(p<>mf p<>ff fff><ff pppp<ff>ppp p>ppp<f 0<mp) :variant 'i)
=> (f><mp f><pp ppp<>pp ffff>pp<fff f<fff>p mf>0)

(velocity-variant
 '(p<>mf p<>ff fff><ff pppp<ff>ppp p>ppp<f 0<mp) :variant 'ri)
=> (0<mf p<fff>f fff>pp<ffff pp><ppp pp<>f mp<>f)

OMN:

(velocity-variant '(q e4 mf f4 f g4 ff) :seed 5)
=> (q e4 pp f4 p g4 mp)

(velocity-variant
 '((e c4 f cs5 f d4 f ds5 p f4 p fs5 p c5 p pp)
   (e cs4 p f d4 f eb5 p f4 p eb4 f d3 p ff)) :variant '(r i))
=> ((e c4 pp cs5 p d4 ds5 f4 fs5 f c5 c5)
    (e cs4 f p d4 eb5 f f4 eb4 p d3 f pp))

(velocity-variant
 '((e c4 fff cs5 f d4 f ds5 p f4 p fs5 p c5 p pp)
   (e cs4 p f d4 f eb5 p f4 p eb4 f d3 p ff)))
=> ((e c4 pp cs5 p d4 ds5 f4 fs5 f c5 c5 fff)
    (e cs4 p f d4 eb5 p f4 eb4 f d3 p ff))
   . . .
Opusmodus                                                                                 velocity-variant       3

(setf omn '((h. eb4 pp tasto q g3 0<pp>0 ponte)
            (-e) (q gs4 fp tasto) (-s) (q a5 ffp)
            (-e) (q bb4 fffp) (-s) (q cs5 pf)
            (-s q. e5 fp -e.) (q cs5 p h. d5 pfp)
            (-q h. c5 pp) (h. gs3 0<ppp>0 ponte -e a4 p< tasto)
            (h. fs5 mp q bb3 0<pp>0 ponte)
            (q c5 p tasto h. e4 pfp) (-e)
            (q cs4 fp h d5 pp>pppp) (h. f4 pp>pppp)))



                             sul pont.                      sul tasto
            sul tasto                     2             3               4            5           6




   7               8               9           10                                   11




                                   sul pont.        sul tasto                sul pont.   sul tasto
   12                        13                                 14                       15




   16                   17                                              18




                                                                                                     Opusmodus
Opusmodus                                                                             velocity-variant     4

(velocity-variant omn :variant '(ri i r p))



                                               sul tasto
            sul tasto sul pont. 2         3                4        5        6          7




   8             9                  10                                  11




                                                   sul pont.                                sul tasto
   12                                         13




                             sul pont.             sul tasto
   14                                    15                                      16




   17                                                          18




                                                                                               Opusmodus
