Opusmodus                                                                       pattern-map    1

pattern-map map sequence &key otherwise loop type pcs
                 section exclude swallow encode omn

[Function]

Arguments and Values:
map                    a list. (<old><new>).
sequence               a proper sequence. If omn-form a type is required.
otherwise              NIL or an argument. The default is NIL.
loop                   NIL or T. The default is NIL.
type                   :length, :pitch, velocity and :articulation.
                       The default is NIL.
pcs                    NIL or T. The default is NIL.
swallow                NIL or T. The default is NIL.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.
encode                 T or NIL. With :encode T (the default) the function transforms OMN repeat
                       symbols (=) into its values, while :encode NIL returns selections
                       unchanged.
omn                    NIL or T. The default is NIL (T force OMN style output).


Description:

The function PATTERN-MAP returns a copy of a sequence in which every pattern that has
been mapped is replaced by a new pattern.


Examples:

The argument (((0 1 2) (a b c))) means pattern (0 1 2) will be replaced with a
new pattern (a b c).

(pattern-map '(((0 1 2) (a b c)))
             '(0 1 2 3 4 5 6 7 8 9 10 11))
=> (a b c 3 4 5 6 7 8 9 10 11)

The otherwise keyword with an argument 'x replaces all items in the sequence with
'x which are not part of the map.

(pattern-map '(((0 1 2) (a b c)))
             '(0 1 2 3 4 5 6 7 8 9 10 11) :otherwise 'x)
=> (a b c x x x x x x x x x)
Opusmodus                                                                  pattern-map     2

The :encode T (default) encodes omn symbols (length-symbols, repeat-symbols etc...) to
its values. To work with symbols freely (without encoder) you need to set the :encode to
NIL. Most of the time we are working with meaningful musical parameters.

(pattern-map '(((0 1 2) (a b c))
               ((3 4 5) (a a a))
               ((6 7) (b b))
               ((8 9 10) (c c c))
               (11 d))
             '(0 1 2 3 4 5 6 7 8 9 10 11) :encode nil)
=> (a b c a a a b b c c c d)

The symbol 'd in the omn language is a length-symbol of the value 2, therefore the last
pattern (11 d)will encode to value 2:

(pattern-map '(((0 1 2) (a b c))
               ((3 4 5) (a a a))
               ((6 7) (b b))
               ((8 9 10) (c c c))
               (11 d))
             '(0 1 2 3 4 5 6 7 8 9 10 11))
=> (a b c a a a b b c c c 2)

Mapping lengths:

(setf length
      '((1/16 1/16 1/8 1/8 1/8 1/16 1/16 1/8 1/8 1/8)
        (1/16 1/16 1/8 1/8 1/16 1/16 1/4 1/16 1/16 1/8)
        (1/16 1/16 1/8 1/8 1/8 1/16 1/16 1/8 1/8 1/8)
        (1/16 1/16 1/8 1/8 1/8 1/16 1/16 3/8)
        (1/16 1/16 1/16 1/16 1/16 1/16 1/8 1/8 1/8 1/8 1/8)
        (1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/16 1/16)))
Opusmodus                                                         pattern-map   3

(setf lmap
      '(((1/16 1/16 1/8) (1/4))
        ((1/16 1/16 1/4) (3/8))
        ((1/8 1/8 1/8 1/8) (3/8 1/8))))

(pattern-map lmap length)
=> ((1/4 1/8 1/8 1/4 1/8 1/8)
    (1/4 1/8 3/8 1/4)
    (1/4 1/8 1/8 1/4 1/8 1/8)
    (1/4 1/8 1/8 1/16 1/16 3/8)
    (1/16 1/16 3/8 3/8 1/8)
    (3/8 1/8 1/8 1/8 1/8 1/16 1/16))




Mapping pitch-class-set values.

Test: conversion of pitch sequence to pitch-class set:

(modus '((c6 cs4 a4 e3 d6 f4) (b4 gs3 bb4 eb4 g5 fs6))
=> ((0 1 9 4 2 5) (11 8 10 3 7 6))

Mapping pitch-class-set patterns to pitch sequence the :pcs keyword must be set
to T:

(pattern-map
 '(((0 1 9 4 2 5) (0 4 2 1 9 5))
   ((11 8 10 3 7 6) (10 8 11 3 7 6)))
 '((c6 cs4 a4 e3 d6 f4) (b4 gs3 bb4 eb4 g5 fs6)) :pcs t)
=> ((c6 e4 d4 cs3 a6 f4) (bb4 gs3 b4 eb4 g5 fs6))
Opusmodus                                            pattern-map   4

Mapping intervals:

(setf pitch
      '((g5 fs5 g5 c5 ds5 g5 fs5 g5 a5 d5)
        (g5 fs5 g5 a5 c5 d5 ds5 d5 c5 as4)
        (ds5 d5 ds5 g4 gs4 f5 ds5 f5 a4 as4)
        (g5 f5 g5 b4 c5 d5 ds5 f5)
        (ds5 d5 c5 as4 gs4 g4 f4 gs5 g5 f5 ds5)
        (d5 ds5 f5 b4 c5 d5 b4 c5 g5)))




(setf intervals (pitch-to-interval pitch))
=> ((-1 1 -7 3 4 -1 1 2 -7)
    (5 -1 1 2 -9 2 1 -1 -2 -2)
    (5 -1 1 -8 1 9 -2 2 -8 1)
    (9 -2 2 -8 1 2 1 2)
    (-2 -1 -2 -2 -2 -1 -2 15 -1 -2 -2)
    (-1 1 2 -6 1 2 -3 1 7))

Example with wildcard:

(setf imap '(((-1 ?) 3) ((1 -2) 2) ((1 1) (3 3))))

(setf new-intervals (pattern-map imap intervals))
=> ((3 -7 3 4 3 2 -7)
    (5 3 2 -9 2 1 3 -2)
    (5 3 -8 1 9 -2 2 -8 1)
    (9 -2 2 -8 1 2 1 2)
    (-2 3 -2 -2 3 15 3 -2)
    (3 2 -6 1 2 -3 1 7))
Opusmodus                                                pattern-map   5

(interval-to-pitch new-intervals :start 'g5)
=> ((g5 bb5 eb5 fs5 bb5 cs6 eb6 gs5)
    (cs6 e6 fs6 a5 b5 c6 eb6 cs6)
    (fs6 a6 cs6 d6 b6 a6 b6 eb6 e6)
    (cs7 b6 cs7 f6 fs6 gs6 a6 b6)
    (a6 c7 bb6 gs6 b6 gs5 f5 g5)
    (e5 d5 gs5 g5 f5 gs5 g5 c5))




(setf imap2 '(((-1 ?) 3) ((1 -2) 2) ((-2 ?) (-4 -4))))

(pattern-map imap2 intervals)
=> ((3 -7 3 4 3 2 -7)
    (5 3 2 -9 2 1 3 -2)
    (5 3 -8 1 9 -4 -4 -8 1)
    (9 -4 -4 -8 1 2 1 2)
    (-4 -4 -4 -4 3 15 3 -2)
    (3 2 -6 1 2 -3 1 7))

(pattern-map imap2 intervals :otherwise '(13 -11))
=> ((3 13 -11 13 3 -11 13)
    (13 3 -11 13 -11 13 3 -11)
    (13 3 -11 13 -11 -4 -4 13 -11)
    (13 -4 -4 -11 13 -11 13 -11)
    (-4 -4 -4 -4 3 13 3 -11)
    (3 13 -11 13 -11 13 -11 13))
Opusmodus                                                             pattern-map   6

Mapping articulation to lengths:

(setf lengths
      '((-11/16 1/16 -1/4)
        (-3/4 1/12 -1/12 1/12)
        (1/16 1/8 1/16 1/16 1/16 1/8)
        (1/20 -1/20 1/20 -1/20 1/20 1/20 1/20 1/20 1/20 1/20)
        (-1/16 1/16 1/16 1/16 1/16 1/16 1/8)
        (1/16 1/16 -1/8 1/16 1/16 1/16 1/16)))

The swallow keyword T (true) swallows items that align with length-rest values.
This keyword should be used if a sequence contains lengths and the map is an
articulation:

(pattern-map
 '(((1/8 1/4) leg)
   ((1/16 1/16 1/16 1/16) (leg leg leg))
   (1/12 stacc)
   ((1/20 1/20) (stacc stacc)))
 lengths :swallow t :otherwise '-)

=> ((-) (stacc stacc) (- - - - - -)
    (- - stacc stacc stacc stacc stacc stacc)
    (leg leg leg - - -) (- - leg leg leg -))

OMN examples:
(setf omn '((s c4 d4 e4 f4 g4 a4 b4 c5)
            (5q c4 d4 e4 f4 g4 g4 f4 e4 d4 c4)))




If the sequence is an omn-form we must specify the type
(:pitch, :length, :velocity) to which parameter the function will be applied.
Opusmodus                                                               pattern-map    7

(pattern-map
  '(((c4 d4 e4) (cs4 ds4 f4))
    ((f4 g4) (eb4 fs4))) omn
  :type :pitch)
=> ((s cs4 ds4 f4 eb4 fs4 a4 b4 c5)
    (5q cs4 ds4 f4 eb4 fs4 g4 f4 e4 d4 c4))




The keyword :loop t (true) processes one list and one pattern at a time.
In the expression below the rst pattern ((c4 d4 e4) (cs4 ds4 f4)) applies to the rst
list only, the second pattern ((f4 g4) (eb4 fs4)) to the second list and so on:

(pattern-map
  '(((c4 d4 e4) (cs4 ds4 f4))
    ((f4 g4) (eb4 fs4))) omn
  :type :pitch :loop t)
=> ((s cs4 ds4 f4 f4 g4 a4 b4 c5)
    (5q c4 d4 e4 eb4 fs4 g4 f4 e4 d4 c4))




Mapping the pitch-class-set pattern to an omn-form sequence, the :type must
be set to :pitch and the :pcs keyword needs to be set to T:

(setf mat '((q c6 cs4 a4 e3 d6 f4) (q b4 gs3 bb4 eb4 g5 fs6)))
                    fi
                                                                          fi
Opusmodus                                                    pattern-map   8

(modus mat)
=> ((0 1 9 4 2 5) (11 8 10 3 7 6))

(pattern-map
 '(((0 1 9 4 2 5) (0 4 2 1 9 5))
   ((11 8 10 3 7 6) (10 8 11 3 7 6))) mat :type :pitch :pcs t)
=> ((q c6 e4 d4 cs3 a6 f4) (q bb4 gs3 b4 eb4 g5 fs6))




(pattern-map
 '(((0 1 9) (10 8 11))
   ((11 8 10) (0 1 9))) mat :type :pitch :pcs t :loop t)
=> ((q bb6 gs4 b4 e3 d6 f4) (q c4 cs3 a4 eb4 g5 fs6))
Opusmodus                                                      pattern-map   9

Score Example:
(progn
  (setf lengths
        (binary-rhythm
         (gen-repeat 4 '(16 12 8 10 8 8 12))
         (gen-repeat 4 '( 8 5 7 5 6 6 6))
         (gen-repeat 4 '( s 3q s 5q s s 3e))
         :type '? :variant '?
         :rotate (rnd-sample 24 '(-2 -1 1 0 1 2))))

  (setf articulations
        (pattern-map
         '(((1/8 1/4) leg)
           ((1/16 1/8) leg)
           ((1/12 1/12 1/12) (leg leg))
           ((1/16 1/16 1/16 1/16 1/16)
            (stacc stacc stacc stacc stacc))
           ((1/20 1/20 1/20 1/20 1/20) (leg leg leg leg))
           ((1/20 1/20) (stacc stacc))
           ((3/8 5/16 5/16) (leg leg)))
         lengths :swallow t :otherwise '-))

  (setf pitches
        (rnd-octaves
         '(g3 c7)
         (interval-to-pitch
          (rnd-sample 128 '(0 -1 1 6 -6))
          :start 'a3)))

  (setf omn
        (make-omn
         :pitch pitches
         :length lengths
         :velocity '(f)
         :articulation articulations))

  (def-score solo-violin
             (:title "Violin Solo"
              :composer "OPMO"
              :copyright "Copyright © 2016 Opusmodus"
              :key-signature 'chromatic
              :time-signature (get-time-signature omn)
              :tempo 96
              :layout (violin-layout 'vln))

       (vln :omn omn :channel 1 :sound 'gm :program 'violin)
   )

  (display-midi 'solo-violin)
  )
Opusmodus   pattern-map   10
