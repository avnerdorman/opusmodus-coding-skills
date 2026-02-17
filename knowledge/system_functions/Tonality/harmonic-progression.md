Opusmodus                                                                harmonic-progression    1

harmonic-progression degree scale &key size step
                                    root row chord flatten base

[Function]

Arguments and Values:
degree                   an integer. (shift of level).
scale                    a pitch list, tonality name or omn-form list.
size                     an integer (chord size). The default is 3.
step                     an integer (step size). The default is 2.
root                     an integer list or a pitch list.
row                      T or NIL. The default is NIL. T removes octaves from the progression.
chord                    T or NIL. The default is T (chord progression).
                         If NIL the result is melodize.
flatten                  T or NIL. The default is T ( atten).
base                     0 or 1. The default is 0.


Description:

The function HARMONICS-PROGRESSION returns a chord progressions from a given scale
or pitch sequence. A chord progression or harmonic progression is a series of musical
chords, or chord changes that 'aims for a de nite goal' of establishing (or contradicting) a
tonality founded on a key, root or tonic chord and that is based upon a succession of
root relationships. A harmonic progression can be thought of as a harmonic simultaneity
succession: it offers an ongoing shift of level that is essential too many musical
traditions.

Simplest form:

(harmonic-progression '(0 3 4 4) '(c major))
=> (c4e4g4 f4a4c5 g4b4d5 g4b4d5)

(harmonic-progression '(1 4 5 5) '(c major) :base 1)
=> (c4e4g4 f4a4c5 g4b4d5 g4b4d5)
                                     fi
                                            fl
Opusmodus                                            harmonic-progression   2

(harmonic-progression '(0 0 3 4) '(c major))
=> (c4e4g4 c4e4g4 f4a4c5 g4b4d5)




(harmonic-progression '(0 3 0 4) '(c major))
=> (c4e4g4 f4a4c5 c4e4g4 g4b4d5)




(harmonic-progression '(0 3 4 3) '(c major))
=> (c4e4g4 f4a4c5 g4b4d5 f4a4c5)




(harmonic-progression '(2 3 4) '(c4 major))
=> (e4g4b4 f4a4c5 g4b4d5)

(harmonic-progression '(3 4 0) '(c4 major))
=> (f4a4c5 g4b4d5 c4e4g4)

(harmonic-progression '(0 1 2 3 4 5 6 7) '(c4 major))
=> (c4e4g4 d4f4a4 e4g4b4 f4a4c5 g4b4d5 a4c5e5 b4d5f5 c5e5g5)

(harmonic-progression '(2 6 5 4) '(a4 minor))
=> (c5e5g5 g5b5d6 f5a5c6 e5g5b5)
Opusmodus                                                            harmonic-progression   3

Examples:
(setf scale '(c4 d4 e4 f4 g4 a4))

(harmonic-progression '(0 1 2 3 4 5 6 7) scale)
=> (c4e4g4 d4f4a4 e4g4c5 f4a4d5 g4c5e5 a4d5f5 c5e5g5 d5f5a5)

In the following example the second shift level is pared with step (2 1).

(harmonic-progression '(0 1 2 3 4 5 6 7) scale :step '(2 (2 1) 2))
=> (c4e4g4 d4f4g4 e4g4c5 f4a4d5 g4c5d5 a4d5f5 c5e5g5 d5f5g5)

The count of the chord progressions depends on the count of the shift levels, and
the :step, :size and :root options are trimmed to a required size (shift count):

'(0 1     2 3 4     5 6 7    ) <- shift
'(2 (2 1) 2 2 (2 1) 2 2 (2 1)) <- steps

(harmonic-progression '(0 3 4 0 -2 -3 -1 0 -2) scale)
=> (c4e4g4 f4a4d5 g4c5e5 c4e4g4 g3c4e4 f3a3d4 a3d4f4 c4e4g4 g3c4e4)

With a :size option:

(harmonic-progression '(0 3 4 0 -2 -3 -1 0 -2) scale
                      :size '(3 3 4 5 4 4 3 3 3))
=> (c4e4g4 f4a4d5 g4c5e5g5 c4e4g4c5e5
    g3c4e4g4 f3a3d4f4 a3d4f4 c4e4g4 g3c4e4)

(harmonic-progression '(0 3 4 0 -2 -3 -1 0 -2) scale
                      :step '(2 2 1 2 (1 2) 2 2 2 1))
=> (c4e4g4 f4a4d5 g4a4c5 c4e4g4
    g3a3d4 f3a3d4 a3d4f4 c4e4g4 g3a3c4)

Example with the :root option. The :root values can be a pitch list or an integer list:

(harmonic-progression '(0 3 4 0 -2 -3 -1 0 -2) scale
                      :root '(-6 -2 3 -3 2 -1 0))
=> (fs3bb3cs4 eb4g4c5 bb4eb5g5 a3cs4e4
    a3d4fs4 e3gs3cs4 a3d4f4 fs3bb3cs4 f3bb3d4)
Opusmodus                                                        harmonic-progression   4

(harmonic-progression '(0 3 4 0 -2 -3 -1 0 -2) scale
                      :size '(3 3 4 5 4 4 3 3 3)
                      :step '(2 2 1 2 (2 1) 2 (1 2) 2 (1 2))
                      :root '(c4 g4 a4 bb4 c5 ds5 e4 e5 bb4))
=> (c4e4g4 c5e5a5 e5fs5a5b5 bb4d5f5bb5d6 g4c5d5f5
    gs4c5f5gs5 cs4e4gs4 e5gs5b5 f4g4c5)




The option :row T (true) will remove octaves from each of the chord progression:

(harmonic-progression '(0 3 4 0 -2 -3 -1 0 -2) scale
                      :size '(3 3 4 5 4 4 3 3 3)
                      :step '(2 2 1 2 (2 1) 2 (1 2) 2 (1 2))
                      :root '(c4 g4 a4 bb4 c5 ds5 e4 e5 bb4)
                      :row t)
=> (c4e4g4 c5e5a5 e5fs5a5b5 bb4d5f5 g4c5d5f5
    gs4c5f5 cs4e4gs4 e5gs5b5 f4g4c5)




Example with 12-tone row:

(setf row (library 'vienna 'berg 'r11))




(harmonic-progression '(0 3 4 0 -2 -3 -1 0 -2) row)
=> (f4gs4c4 bb4d4eb4 c4fs4e4 f4gs4c4 b3f4gs4
    a3cs3g4 cs3g4bb4 f4gs4c4 b3f4gs4)
Opusmodus                                                          harmonic-progression   5

In the following example the expression is evaluated 6 times in succession showing the
different paths with RELATIVE-CLOSEST-PATH function:

(relative-closest-path
 (harmonic-progression '(0 3 4 0 -2 -3 -1 0 -2) row))




Examples with tonality-form scale:

(harmonic-progression '(0 3 4 2) '(c4 maj :add (1 3)))
=> (c4eb4g4 e4c5eb5 g4cs5e5 eb4g4cs5)

(harmonic-progression '(0 3 4 4) '(cb3 messiaen-mode6 :rotate 1))
=> (b2eb3f3 e3g3bb3 f3a3b3 f3a3b3)

(harmonic-progression '(0 3 4 4) '(cb3 messiaen-mode6 :rotate 2))
=> (eb3f3a3 g3bb3cs4 a3b3eb4 a3b3eb4)
Opusmodus                                             harmonic-progression   6

(harmonic-progression '(0 3 4 0 -2 -3 -1 0 -2) row
                      :size '(3 4)
                      :root '(-6 -2 3 -3 2 0 3 -2))
=> (fs3a3cs3 eb4g3gs3d4 bb3e4d4 a3c4e3bb3 gs3d4f4
    e3gs2d4f4 b2f4gs4 bb3cs4f3b3 c3fs3a3)




Scale build from a partials:

(setf p45 (partial-row (library 'tbn-cs3-frames 'partials 'p45)))




(harmonic-progression '(1 4 5 1 3 4 2 4 3) p45
                      :size '(3 4)
                      :root '(-6 -2 3 -3 2 0 3 -2))
=> (c4a4b5 b5f6c7fs7 gs6d7g7 eb4c5d6gs6 f5g6cs7
    cs6g6d7gs7 cs5e6bb6 b5f6c7fs7 a4b5f6)
Opusmodus                                                harmonic-progression   7

The :chord option set to NIL will melodize the result:

(pitch-variant
 (harmonic-progression '(1 4 5 1 3 4 2 4 3) p45
                       :size '(3 4)
                       :root '(-6 -2 3 -3 2 0 3 -2)
                       :chord nil
                       :flatten nil)
 :variant '? :seed 8634)
=> ((c4 a4 b5) (fs7 c7 f6 b5) (gs6 d6 a5) (eb4 c5 d6 gs6)
    (cs7 g7 f6) (cs6 g6 d7 gs7) (bb6 e7 cs6) (b5 f6 c7 fs7) (f6 b5 a4))




(harmonic-progression '(0 3 5 4) '((c4 major) (c3 lydian)))
(harmonic-progression '((0 3 5 4) (4 5 3 4)) '((c4 major) (c3 lydian)))

(harmonic-progression '((1 3 4 2))
                      '((cb3 messiaen-mode6 :rotate 1)
                        (b3 messiaen-mode6 :rotate 4)
                        (bb3 messiaen-mode4)))

(setf partials
      (partial-row
       (library 'tbn-cs3-frames 'partials nil :random 4)))

(harmonic-progression '(1 4 5 1 3 4 2 4 3) partials
                      :size '((3 4) (3 5))
                      :root '(-6 -2 3 -3 2 0 3 -2))
Opusmodus                                             harmonic-progression   8

(relative-closest-path
 (harmonic-progression '(1 4 5 1 3 4 2 4 3) partials
                        :size '((3 4) (3 5))
                        :root '((-6 -2 3) (-3 2 0) (3 -2)))
 :start '(c7 c3 c6 c2))




Score Example:
(setf degree '(0 3 4 0 -2 -3 -1 0 -2))

(setf mat (relative-closest-path
           (gen-loop 6 (harmonic-progression
                        (setf degree (gen-rotate 2 degree))
                        '(a minor)))))

(setf omn (make-omn
           :length '((q) (-h))
           :pitch mat
           :velocity '(f)
           :span :pitch))
Opusmodus                                             harmonic-progression   9

(def-score chord-progression
           (:title "chord-progression"
            :copyright "Copyright © 2016 Opusmodus"
            :key-signature 'chromatic
            :time-signature '(2 8)
            :tempo 88
            :layout (grand-layout 'pno)
            )

  (pno
    :omn omn
    :sound 'gm
    :channel 1
    :program 0)
  )
