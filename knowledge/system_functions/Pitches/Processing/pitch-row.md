Opusmodus                                                                                 pitch-row    1

pitch-row pitches &key quantize section exclude ambitus
[Function]

Arguments and Values:
pitches                   list of pitches.
quantize                  NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                          The default is NIL (1/2).
ambitus                   instrument name or an integer or pitch list (low high). The default is 'piano.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

This function allows a pitch series to be altered into a unique pitch row (each pitch is quasi a
root).

(setf mat
      (vector-to-pitch
       'piano
       (mod-sine-waves
        4 64 4 0.6
       :modulation (gen-sine 64 1 '(0.5 0.2 0.1) :phase 60))))
=> (f4 cs6 gs7 b7 f7 c7 bb3 g3 e2 a0 bb0 a0 fs4 fs2
    fs2 d6 bb6 c7 a0 b0 bb0 a0 b7 gs7 c7 bb7 bb4 b2
    b4 a0 a0 d1 eb6 bb2 d2 e3 b6 eb4 d3 c2 bb0 cs7
    a0 a2 cs3 f7 c7 e6 d7 eb7 f2 a0 g7 gs7 a7 c5
    cs1 c5 bb7 c8 e6 b2 bb3 fs6)

(pitch-row mat)
=> (f4 cs6 gs7 b7 c7 bb3 g3 e2 a0 fs4 d6 eb6)
Opusmodus                                             pitch-row   2

Examples:
(gen-chord2 12 '(2 3 1 4) (pitch-row mat))
=> (f4cs6 gs7b7c7 bb3 g3e2a0fs4 d6eb6 f4cs6gs7
    b7 c7bb3g3e2 a0fs4 d6eb6f4 cs6 gs7b7c7bb3)




(setf p9 (library 'tbn-cs3-frames 'partials 'p9))

(pitch-row (partial :pitch p9))
=> (fs1 cs3 e3 bb3 eb4 gs4 a4 b4 d5 f5 g5 c6)

(pitch-row (partial :pitch p9 :quantize 1/4))
=> (fs1 fs2+ c3+ e3 a3+ d4+ g4+ a4 as4+ b4+ d5 ds5+
    e5+ f5+ g5 b5 c6 cs6 cs6+ f6 gs6 gs6+ bb6 eb7)
