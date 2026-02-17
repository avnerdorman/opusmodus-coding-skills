Opusmodus                                                                 pitch-expansion-series       1

pitch-expansion-series size interval count pitch
                                          &key max-interval ambitus seed

[Function]

Arguments and Values:
size                      an integer (process count).
interval                  an integer (list of intervals).
count                     an integer (number of pitches to process).
pitch                     list of pitches or chords.
max-interval              an integer (maximum interval size).
ambitus                   instrument name or an integer or pitch list (low high). The default is 'piano.
seed                      NIL or number. The default is NIL.


Description:

This function allows a pitch series to be expanded by interval size and direction. In this
preliminary example we'll see the result in pitches and then intervals.

(pitch-expansion-series
 4 '(1 -1 2 2) '(1 2) '(c4 g4 g4 db5 ab5))
=>      ((c4 g4 = db5 ab5) (c4 a4 g4 c5 ab5)
; step    original          0 2 0 -1 0
; count                     2
         (c4 a4 ab4 c5 g5) (c4 a4 ab4 d5 g5))
; step    0 0    1 0 -1     0 0 0     2 0
; count 2                   1


Examples:

In this preliminary example we'll see the result in pitches and then intervals. It is important to
understand how the direction argument works. with '(1 -1 2 2) - see below.

(pitch-expansion-series
 4 '(1 -1 2 2) '(2 3) '(c4 g4 g4 db5 ab5))
=>      (c4 g4 = db5 ab5) (d4 g4 = eb5 ab5)
; step   original          2 0 0 2      0
; count                    2
        (db4 g4 a4 eb5 ab5) (db4 a4 b4 eb5 bb5))
; step   -1 0 2 0       0    0   2 2 0      2
; count   2                  3
Opusmodus                                          pitch-expansion-series   2

It works particularly well with chords.

(pitch-expansion-series
 10 '(1 -1 2 -2) '(1 2 3) 'c4g4g4cs5gs5 :max-interval 6)
=> ((c4 g4 = db5 ab5) (db4 f4 g4 db5 g5) (d4 f4 g4 db5 g5)
    (d4 gb4 a4 db5 g5) (d4 e4 bb4 db5 g5) (c4 e4 bb4 db5 g5)
    (d4 e4 bb4 db5 g5) (c4 e4 bb4 db5 g5) (c4 gb4 b4 db5 g5)
    (c4 gb4 b4 = f5))

(pitch-expansion-series
 10 '(1 -1 2 -2) '(1 2 3) 'c4g4g4cs5gs5)
=> ((c4 g4 db5 ab5) (bb3 gb4 db5 ab5) (b3 ab4 c5 ab5)
    (c4 ab4 c5 ab5) (c4 ab4 b4 ab5) (c4 ab4 c5 ab5)
    (db4 ab4 c5 ab5) (eb4 g4 c5 a5) (eb4 g4 db5 bb5)
    (eb4 g4 eb5 b5))
