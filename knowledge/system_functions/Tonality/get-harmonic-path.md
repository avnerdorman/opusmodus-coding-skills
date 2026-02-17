Opusmodus                                                                   get-harmonic-path    1

get-harmonic-path sequence &key time loop
                            unique sort remove row chord seed

[Function]

Arguments and Values:
sequence              omn list (voices).
time                  a list of length symbols or ratios. The default is NIL.
loop                  NIL or T. If T the span values are looped. The default is NIL.
unique                NIL or T. If T no repeats of pitches. The default is NIL.
sort                  'a (ascending) 'd (descending) or '? (at random).
remove                NIL or an integer. Removes a list of a given length. The default is NIL.
row                   NIL or T. If T row is created. The default is NIL.
chord                 NIL or T. If T the output are chords. The default is NIL.
seed                  NIL or an integer. The default is NIL.


Description:

The GET-HARMONIC-PATH function returns a pitch sequence (tonality, scale) made up
of an omn sequence or any number of voices (instruments).

(setf omn '((s c4 e4 g4 bb4) (s f4 a4 c5 eb5) (s g4 b4 d5 f5)))

(get-harmonic-path omn :unique t :chord t :time 'q :loop t)
=> (c4e4g4bb4 f4a4c5eb5 g4b4d5f5)

(setf mat '((s d4 g4 b4 a4 g4 b4 d5 c5 b4 d5 g5 -)
            (s d4 fs4 a4 g4 fs4 a4 c5 b4 a4 d5 fs5 -)
            (s b3 d4 g4 fs4 e4 g4 b4 a4 g4 cs5 e5 -)
            (s a3 d4 fs4 e4 d4 fs4 a4 g4 fs4 a4 e d5)))

(get-harmonic-path mat :unique t :chord t)
=> (d4g4b4a4d5c5g5 d4fs4a4g4c5b4d5fs5
    b3d4g4fs4e4b4a4cs5e5 a3d4fs4e4a4g4d5)

The span option with length-symbols:

(get-harmonic-path mat :row t :chord t :time '(1/4 1/2 1/4) :loop t)
=> (d4g4b4a4 g4b4d5c5 d4fs4a4g4 fs4a4c5b4 a4d5fs5b3g4
    e4g4b4a4 g4cs5e5 a3d4fs4e4g4 fs4a4d5)

The span with ratio values:

(get-harmonic-path mat :row t :chord t :time '(1/4 1/2 1/4) :loop t)
=> (d4g4b4a4 g4b4d5c5 d4fs4a4g4 fs4a4c5b4 a4d5fs5b3g4
    e4g4b4a4 g4cs5e5 a3d4fs4e4g4 fs4a4d5)
Opusmodus                                                          get-harmonic-path   2

The :remove option remove any chord of two pitches and below.

(get-harmonic-path mat :row t :chord t :remove 2
                       :time '(1/4 3/8 5/8) :loop t)
=> (d4g4b4a4 g4b4d5c5 g5d4fs4a4c5b4 a4d5fs5
    b3d4g4fs4e4 b4a4g4cs5e5d4fs4 d4fs4a4g4 fs4a4d5)

The example below shows us how a number of voices can be joined into a harmonic path
series. Here we are taking three voices from the OPUSMODUS library:

(get-harmonic-path
 (list
  (library 'bach-gv18 'gv18 'v1)
  (library 'bach-gv18 'gv18 'v2)
  (library 'bach-gv18 'gv18 'v3))
 :chord t)


Examples:

Below the examples shows how the path can be used with HARMONIC-PATH and
TONALITY-MAP function.

Here the :time is a list of three ratios 1/4, 3/8 and 5/8 with the optional :loop T.
The :loop T will create a span list (1/4 3/8 5/8 1/4 3/8 5/8 . . .). The
sum of the :time values equals the span of the sequence.

(setf mat '((s d4 g4 b4 a4 g4 b4 d5 c5 b4 d5 g5 -)
            (s d4 fs4 a4 g4 fs4 a4 c5 b4 a4 d5 fs5 -)
            (s b3 d4 g4 fs4 e4 g4 b4 a4 g4 cs5 e5 -)
            (s a3 d4 fs4 e4 d4 fs4 a4 g4 fs4 a4 e d5)))

(setf path
      (get-harmonic-path mat
                         :row t
                         :chord t
                         :remove 2
                         :time '(1/4 3/8 5/8)
                         :loop t))
Opusmodus                                               get-harmonic-path   3

With HARMONIC-PATH function:

(setf pitch (gen-loop 12 (rnd-row :type :pitch)))
(setf length (gen-loop 12 (gen-repeat 12 '(s))))
(setf omn (make-omn :length length :pitch pitch :velocity '(mf)))

(harmonic-path path omn
               :time '(1/4 3/8 5/8)
                 :loop t
               :type '?
                 :octave '?)
Opusmodus                                               get-harmonic-path   4

With TONALITY-MAP function:

(setf scale (tonality-series :map 'step))
(tonality-map scale omn :time '(1/4 3/8 5/8) :loop t)
