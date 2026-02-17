Opusmodus                                                                   pitch-transpose-series   1

pitch-transpose-series transpose sequence
                                          &key ambitus section exclude

[Function]

Arguments and Values:
transpose                integer or pitch, can be a list.
ambitus                  instrument name or an integer or pitch list (low high).
                         The default is 'piano.
sequence                 a list or list of pitches.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

The function PITCH-TRANSPOSE-SERIES can be used to transpose pitch values in
either pitch lists or OMN notation in a sequence of repetitions. The count of the repetition
equals the length of the transpose lists.

(setf omn '((s c4 d4 e4 f4) (s g4 a4) (s b4 c5)))


                                        = 120




(pitch-transpose-series '((0) (1 2 3) (0 -1)) omn)                               OPUSMODUS
=> ((s c4 d4 e4 f4) (s gs4 bb4) (s a4 b4)
    (s bb4 c5) (s b4 c5) (s bb4 b4))


                        = 120




                                                                                      OPUSMODUS
Opusmodus                                                         pitch-transpose-series    2

(setf sequence '((s b3 fs3) (s d4 g3 fs3 cs4)
                 (s cs4 bb3 g3 bb3) (s e4 cs4 bb3)
                 (s b3 f4 cs4)))

(pitch-transpose-series '((0) (1 2 3) (0 -1)) sequence)
=> ((s b3 fs3)
    (s eb4 gs3 g3 d4) (s e4 a3 gs3 eb4) (s f4 bb3 a3 e4)
    (s cs4 bb3 g3 bb3) (s c4 a3 fs3 a3)
    (s e4 cs4 bb3)
    (s c4 fs4 d4) (s cs4 g4 eb4) (s d4 gs4 e4))

Here’s a more detailed explanation of the output shown above. Notice that the transpose /
repeat-list repeats on itself.

=> (0)     = (s b3 fs3)
=> (1 2 3) = (s eb4 gs3 g3 d4) (s e4 a3 gs3 eb4) (s f4 bb3 a3 e4)
=> (0 -1) = (s cs4 bb3 g3 bb3) (s c4 a3 fs3 a3)
=> (0)     = (s e4 cs4 bb3)
=> (1 2 3) = (s c4 fs4 d4) (s cs4 g4 eb4) (s d4 gs4 e4)


Examples:
(pitch-transpose-series '((0 11 6) (0 1 0) (0 -1 -2)) sequence)
=> ((s b3 fs3) (s bb4 f4) (s f4 c4)
    (s d4 g3 fs3 cs4) (s eb4 gs3 g3 d4) (s d4 g3 fs3 cs4)
    (s cs4 bb3 g3 bb3) (s c4 a3 fs3 a3) (s b3 gs3 f3 gs3)
    (s e4 cs4 bb3) (s eb5 c5 a4) (s bb4 g4 e4)
    (s b3 f4 cs4) (s c4 fs4 d4) (s b3 f4 cs4))

(pitch-transpose-series '((0 11 6)) sequence :section '(2))
=> ((s b3 fs3) (s d4 g3 fs3 cs4)
    (s cs4 bb3 g3 bb3) (s c5 a4 fs4 a4) (s g4 e4 cs4 e4)
    (s e4 cs4 bb3) (s b3 f4 cs4))

Microtonal transposition:
0.5 = 1/4 tone
0.25 = 1/8 tone

(pitch-transpose-series
 '((0) (1 2.5 3) (0 -1.5))
 '((q a4 a4+ as4) (as4+ b4 b4-) (bb4 bb4- a4)))
=> ((q a4 a4+ bb4) (q b4+ c5 b4+) (q cs5 cs5+ cs5)
    (q cs5+ d5 cs5+) (q bb4 a4+ a4) (q gs4+ gs4 g4+))
Opusmodus                                              pitch-transpose-series   3

Score Example:
(progn
 (setf i0 (library 'prog-models 'v-i-maj 'i0))
 (setf i3-7 (library 'prog-models 'v-i-maj 'i3-7))
 (setf i3-9 (library 'prog-models 'v-i-maj 'i3-9))
 (setf t-i0 (pitch-transpose 'c5 i0))
 (setf t-i3-7 (pitch-transpose 'g4 i3-7))
 (setf t-i3-9 (pitch-transpose 'e3 i3-9))
 (setf prog-i0 '(-1 -2 -3 -5 -6 -8))
 (setf prog-i3-7 '(-2 -3 -5 -7 -8 -9))
 (setf prog-i3-9 '(1 2 3 4 6 8))

    (setf chords (pitch-transpose-series
                  (list prog-i0 prog-i3-7 prog-i3-9)
                  (list t-i0 t-i3-7 t-i3-9)))

    (setf rh (make-omn :length '(s)
                       :pitch (melodize chords)
                       :span :pitch))

    (setf lh (pitch-transpose -12 (make-omn :length '(q)
                                            :pitch chords
                                            :span :pitch
                                            :velocity '(p))))

    (ps 'gm :p (list rh lh)
        :tempo 112)
)
