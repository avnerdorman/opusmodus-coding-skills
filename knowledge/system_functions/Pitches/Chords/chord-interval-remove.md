Opusmodus                                                               chord-interval-remove     1

chord-interval-remove intervals sequence &key octaves
                                    sort section exclude

[Function]

Arguments and Values:
intervals              a list of intervals to be removed.
sequence               a sequence of pitches or omn form list.
sort                   sort chord. 'a (ascending), 'd (descending) or NIL. The default is 'a.
octaves                NIL or T. If T then interval octaves are add it into the intervals list.
                       The default is NIL.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.


Description:

The function CHORD-INTERVAL-REMOVE removes number of intervals from the
chord.

(chord-interval-remove 11 '(c4d4g4b4))
=> (c4d4g4)

(setf chord '(c5cs4e4fs4a4b4eb6))

(chord-interval-remove '(1 11) chord)
=> (cs4e4fs4a4b4eb6)

(chord-interval-remove '(1 11) chord :sort nil :octaves t)
=> (c5e4fs4a4)

Example with :sort keyword. To audition the output press Cmd-1.

(setf mat '(a3e5c4bb4gs4 c5cs3e3eb3f3
              b3a4g4d6bb4 bb5gs5d6eb4fs4))

(chord-interval-remove '(1 2 11) mat)
=> (a3c4bb4e5 cs3e3c5 b3g4d6 eb4fs4gs5d6)

(chord-interval-remove '(1 2 11) mat :sort 'd)
=> (e5bb4gs4c4a3 c5f3e3eb3cs3 d6bb4a4g4b3 d6bb5gs5fs4eb4)

(chord-interval-remove '(1 2 11) mat :sort nil)
=> (a3e5c4bb4 c5cs3e3 b3a4g4d6 bb5gs5d6eb4fs4)
Opusmodus                                              chord-interval-remove   2

Examples:
(setf row (rnd-row :type :pitch :seed 13465))
=> (c4 gs4 eb4 b4 e4 bb4 g4 f4 fs4 a4 d4 cs4)

(setf rnd-oct (rnd-octaves '(c3 c6) row))
=> (c5 gs4 eb4 b4 e3 bb4 g5 f5 fs5 a3 d5 cs5)

(setf sequence (gen-chord 48 5 5 -12 12
                          (gen-repeat 12 rnd-oct) :seed 24576))


                                         2




       3                             4




       5                                 6




       7                                           8




                                                                Opusmodus
Opusmodus                                              chord-interval-remove   3

(chord-interval-remove '(1 2 11) sequence)



                       2            3              4




       5                   6                 7                8




                                                                  Opusmodus


(chord-interval-remove '(1 2 11) sequence :octaves t)



                       2            3              4




       5                   6                 7                8




                                                                  Opusmodus
