Opusmodus                                                             chord-interval-replace      1

chord-interval-replace old new sequence &key octaves
                                     sort unique section exclude

[Function]

Arguments and Values:
old                    a list of intervals to be replaced.
new                    a list of intervals to replace with.
sequence               a sequence of pitches or omn form list.
sort                   sort chord. 'a (ascending), 'd (descending) or NIL. The default is 'a.
octaves                NIL or T. If T then interval octaves are add it into the intervals list.
                       The default is NIL.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.


Description:

The function CHORD-INTERVAL-REPLACE replaces number of intervals in the chord.

(chord-interval-replace 11 10 '(c4d4g4b4))
=> (c4d4g4bb4)

(setf chord '(c4cs4e4f4a4))

(chord-interval-replace 1 2 chord)
=> (c4d4e4fs4a4)

(chord-interval-replace '(1 3) '(2 4) chord)
=> (c4d4e4fs4bb4)

Example with :sort keywords. To audition the output press Cmd-1.

(setf chords '(a3e5c4bb4gs4 c5cs3e3eb3f3
               b3a4g4d6bb4 bb5gs5d6eb4fs4))

(chord-interval-replace '(1 3) '(2 4) chords)
=> (a3cs4gs4bb4e5 cs3eb3f3f3c5 b3g4a4b4d6 eb4g4gs5bb5d6)

(chord-interval-replace '(1 3) '(2 4) chords :sort 'd)
=> (e5bb4gs4c4a3 c5f3e3eb3cs3 d6bb4a4g4b3 d6bb5gs5fs4eb4)

(chord-interval-replace '(1 3) '(2 4) chords :sort nil)
=> (a3e5cs4bb4gs4 c5cs3f3eb3g3 b3a4g4d6b4 bb5gs5d6eb4g4)
Opusmodus                                              chord-interval-replace   2

Examples:
(setf row (rnd-row :type :pitch :seed 13465))
=> (c4 gs4 eb4 b4 e4 bb4 g4 f4 fs4 a4 d4 cs4)

(setf rnd-oct (rnd-octaves '(c3 c6) row))
=> (c4 gs4 eb5 b4 e4 bb4 g4 f5 fs4 a4 d4 cs4)

(setf sequence (gen-chord 48 5 5 -12 12
                          (gen-repeat 12 rnd-oct) :seed 24576))


                                            2




       3                                4




       5                            6




       7                                           8




                                                                 Opusmodus
Opusmodus                                                 chord-interval-replace   3

(chord-interval-replace '(1 2 11) '(3 4 9) sequence :sort nil)


                                              2




       3                                  4




       5                              6




       7                                              8




                                                                    Opusmodus




(chord-interval-replace '(1 2 11) '(3 4 9) sequence
                        :octaves t :unique t)


                              2                   3




       4                                      5




       6                          7                           8




                                                                    Opusmodus
Opusmodus                                             chord-interval-replace   4

(chord-interval-replace '(1 2 11) '(3 4 9) sequence
                        :octaves t :sort nil)


                                         2




       3                             4




       5                             6




       7                                              8




                                                                Opusmodus
