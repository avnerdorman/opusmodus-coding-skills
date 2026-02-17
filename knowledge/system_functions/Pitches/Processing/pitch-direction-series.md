Opusmodus                                                                    pitch-direction-series    1

pitch-direction-series count sequence &key first
                                          section exclude ambitus seed

[Function]

Arguments and Values:
count                     list of integers.
sequence                  list of pitches.
first                     'a (ascending), 'd (descending) or '? (at random) - rst direction.
                          The default is NIL (random selection).
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
ambitus                   instrument name or an integer or pitch list (low high). The default is 'piano.
seed                      NIL or an integer. The default is NIL.


Description:

This function allows a pitch series to be altered by interval size and direction.

(pitch-direction-series '(2 2 3 2 1)
 '(c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4) :first 'd)
=> (c4f3 bb2eb2 bb2f3 c4g4 c4f3 bb2eb2 ab1db1 ab1eb2 bb2f3)
  ; down down   up    up   down down    down up      up


Examples:

It works particularly well with chords. In this preliminary example we'll see the result in
pitches and then intervals. It is important to understand how the direction argument works
with '(2 2 3 2 1).

(pitch-direction-series
 '(2 2 3 2 1)
 '(c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4) :first 'a)
=> (c4g4 d5a5 d5g4 c4f3 c4g4 d5a5 e6b6 e6a5 d5g4)

Examples with '? ('a or 'd):

(pitch-direction-series
 '(2 2 3 2 1)
 '(c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4) :first '?)
=> (c4f3 bb2eb2 bb2f3 c4g4 c4f3 bb2eb2 ab1db1 ab1eb2 bb2f3)
                                                                        fi
Opusmodus                                                      pitch-direction-series   2

Notice the way the third example uses :ambitus to keep the pitch range contained.

(pitch-direction-series
 '(2 2 2 2 2)
 '(c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4)
 :first 'd :ambitus '(-12 24))
=> (c4f3 bb3eb3 bb3f3 c4g4 c4f3 bb3eb3 bb3f3 c4g4 c4f3)

(pitch-to-interval
 (pitch-direction-series
  '(2 2 2 2 2)
  '(c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 4g4 c4g4 c4g4) :first 'd))
=> ((-7) (-7 -7) (7 7) (7 7) (-7 -7) (-7 -7) (7 7) (7 7))

Now let's try some examples with 'a.

(pitch-direction-series
 '(3 1 4 2 1)
 '(c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4 c4g4)
 :first 'a :ambitus '(-12 24))
=> (c4g4 d5a5 e5b5 e5a5 e5b5 gb5b5 e5a5 d5g4 d5a5)

(pitch-direction-series
 '(2 3 4 5 4 3 2)
 '(c4fs4 as4 d5 ds5 f5 d5 as4 a4 f4 d4 c4 g3 fs3 f3)
 :ambitus 'violin)
=> (c4gb4 d4 gb4 g3 a3 gb4 d4 db4 a3 c4 d4 g3 ab3 a3)

(pitch-direction-series
 '((2 3 4) (5 4 3 2))
 '((c4 d4 e4 f4 g4 a4 b4) (b4 a4 g4 f4 e4 d4 c4))
 :first 'a :ambitus '(-5 11))
=> ((c4 d4 e4 eb4 db4 b3 db4) (db4 eb4 f4 g4 ab4 gb4 e4))

OMN:

(pitch-direction-series '((1))
 '((s eb6 b5 bb5 cs6 eb6 d6 c6 d6 fs6 g5 e5 e a5)
   (s fs3 eb3 e2 gs2 bb2 gs2 g2 a2 c3 b2 g2 a5 d6 b5 c5)) :first '?)
=> ((s eb6 g6 fs6 a6 g6 gs6 fs6 gs6 e6 eb7 c7 e f7)
    (s d5 f5 e6 c6 d6 c6 cs6 b5 d6 cs6 f6 eb3 gs3 f3 e4))
