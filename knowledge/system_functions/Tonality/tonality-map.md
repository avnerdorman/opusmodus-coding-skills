Opusmodus                                                                                 tonality-map   1

tonality-map tonality-form sequence &key time loop section exclude
[Function]

Arguments and Values:
tonality-form            a list (scale &key add remove type variant
                         rotate closest map root ambitus seed)

sequence                 a list of pitches or omn-form list.
time                     a list of length symbols or ratios.
                         The default is the time-signature of a given sequence.
loop                     NIL or T. If T the time values are looped. The default is NIL.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.

Tonality Form:

scale                    tonality name, pitch list, chord, integer list or OMN list.
add                      an integer (additional intervals).
remove                   a list of integers (remove intervals from the tonality).
type                     prime-form or NIL. The default is NIL.
variant                  a variant symbol: p, r, i, ri, 4, r4, 5, r5 or ? (at random).
rotate                   and integer (harmonic inversion).
closest                  down, up or oating-point number (probability value) between 0.0 and 1.0.
                         The default is 0.5.
map                      octave, step, spectra, extend or NIL. The default is NIL.
root                     pitch symbol or an integer.
ambitus                  instrument-name or list (low high).
seed                     NIL or an integer. The default is NIL.

Tonality types:

chord name:      m7
tonality name:   major
chord:           (c4d4e4a4)
pitches:         (c4 d4 e4)
integers:        (1 2 5 8)
omn-form:        (q c4 e4 g4)


Description:

The function TONALITY-MAP can be used to map tonalities on to a chromatic pitch series.
There are ve types of map: octave, step, spectra, extend and NIL. The step map
use the sequence interval steps (harmonic inversion) to map the tonalities on to the sequence.
    fi
                                fl
Opusmodus                                                                    tonality-map    2

The spectra map use the sequence octave numbers to map the tonalities on to the
sequence. The octave map use the scale values (one octave) and then the sequence
octave numbers to map the tonalities on to the sequence. The extend map extends the
scale steps to all octaves with the closest step to map the tonalities on to the sequence. The
default map NIL use the closest step to map the tonalities on to the sequence.

(setf scale '(c4 e4 f4 g4 a4))
(setf voice '(s b4 c5 b5 ds4))

(tonality-map '(scale) voice)




(tonality-map '(scale :map 'extend) voice)




(tonality-map '(scale :map octave) voice)




(tonality-map '(scale :map step) voice)
Opusmodus                                                                    tonality-map   3


(tonality-map '(scale :map spectra) voice)




Here we use extended tonality with full register (-60 67) to map the tonalities on to the
sequence. In spectra, octave and NIL map the closest option by default is set to
0.5.

In the following example we use the tonality with closest option: down, up and
probability value:

(setf seq-1 '(c4 f5 cs4 fs5 d4 g5 cs4 gs5 eb4 as5 f4 a5 e4 gs5 c4 gs5))




(tonality-map '(major) seq-1)
                                       2         3         4




(tonality-map '(major :map 'extend) seq-1)




(tonality-map '(major :closest down :map 'extend) seq-1)
Opusmodus                                                       tonality-map   4

(tonality-map '(major :closest up :map 'extend) seq-1)




(tonality-map '(major :map spectra :closest .7) seq-1)




(tonality-map '(major :map octave :closest up) seq-1)




The closest option has no effect with step map on the result:

(tonality-map '(major :map step) seq-1)


                                                  8   8




(setf mat '(s c4 f4 cs4 fs4 d4 g4 cs4 gs4 eb4 bb4))

(assemble-seq
 (gen-loop 2 (tonality-map '(major :rotate 1 :variant 'i) mat))
 (gen-loop 2 (tonality-map '(minor) mat))
 (gen-loop 2 (tonality-map '(major :rotate 2 :variant 'r) mat))
 (gen-loop 2 (tonality-map '(minor :rotate 1 :variant 'i) mat))
 )

(assemble-seq
 (gen-loop 2 (tonality-map '(major :root 'a3 :map step
                             :rotate 1 :variant 'i) mat))
 (gen-loop 2 (tonality-map '(minor :root 'e4 :map step) mat))
 (gen-loop 2 (tonality-map '(major :root 'd4 :map step
                             :rotate 1 :variant 'ri) mat))
 (gen-loop 2 (tonality-map '(minor :root 'fs4 :map step) mat))
 )
Opusmodus                                                    tonality-map   5

Examples:
(tonality-map '(natural-minor :closest down :map 'extend)
              '(e f4 g4 a4 bb4 c5 d5 e5))
=> (e f4 g4 gs4 bb4 c5 d5 eb5)




(tonality-map '(natural-minor :closest up :map 'extend)
              '(e f4 g4 a4 bb4 c5 d5 e5))
=> (e f4 g4 bb4 bb4 c5 d5 f5)




In the following examples we use the type prime-form:

(setf seq-2 (rnd-row :type :pitch :seed 345))
=> (c4 d4 g4 f4 cs4 b4 gs4 e4 fs4 a4 bb4 eb4)

(tonality-map
 '(b4a4g4cs5e5 :map step :type prime-form :rotate 1 :variant 'i) seq-2)
=> (eb4 gs4 gs5 eb5 fs4 fs6 bb5 c5 fs5 c6 eb6 bb4)

(tonality-map '(b4a4g4cs5e5 :type prime-form
                            :rotate 1 :variant ‘ri) seq-2)
=> (eb4 eb4 fs4 fs4 eb4 c5 gs4 eb4 fs4 gs4 bb4 eb4)

(tonality-map
 '(b4a4g4cs5e5 :map spectra
               :type prime-form :rotate 1 :variant ‘ri) seq-2)
=> (c5 bb4 fs4 fs4 bb4 bb4 gs4 eb4 fs4 gs4 bb4 eb4)
Opusmodus                                                     tonality-map     6

In the following examples we use omn-form sequence:

(setf seq-3
      (list
        (chord-variation '(e c2 c3e3g3 c3e3g3 c3e3g3))
        (chord-variation '(e f2 c3f3a3 c3f3a3 c3f3a3))
        (chord-variation '(e e2 e3g3c4 e3g3c4 e3g3c4))
        (chord-variation '(e gs2 e3b3 e3b3 e3b3 g2
                             d3g3b3 d3g3b3 d3g3b3)))
      )




  4




                                                                   OPUSMODUS

(tonality-map '((minor :closest up :map 'extend)
                (natural-minor :closest down :map 'extend)
                (messiaen-mode2 :map step)
                (messiaen-mode1 :map step))
              seq-3)


                                                          8    8




                                                      8
                           8

  4




                                                                   OPUSMODUS
Opusmodus                                                                   tonality-map     7

The function carries with many and diverse arguments. Tonality mapping can often be at its
most effective when working with integers.

(setf source (rnd-sample 24 (rndn 10 0 12)))
=> (0 11 3 3 8 8 2 11 5 5 5 11 2 5 11 5 11 5 3 5 11 0 5 2)

(setf motifs (gen-divide 6 source))
=> ((0 11 3 3 8 8) (2 11 5 5 5 11)
    (2 5 11 5 11 5) (3 5 11 0 5 2))

(setf pitch (integer-to-pitch motifs))
=> ((c4 b4 eb4 eb4 gs4 gs4) (d4 b4 f4 f4 f4 b4)
    (d4 f4 b4 f4 b4 f4) (eb4 f4 b4 c4 f4 d4))

(setf my-tonal '(0 3 4 7 8 10))

(tonality-map '(my-tonal :map 'extend) pitch)
=> ((c4 bb4 eb4 eb4 gs4 gs4) (eb4 bb4 e4 e4 e4 bb4)
    (eb4 e4 c5 e4 bb4 e4) (eb4 e4 bb4 c4 e4 eb4))




I this example we are adding two more intervals to our tonality.                       OPUSMODUS


(tonality-map '(my-tonal :add '(2 11) :map 'extend) pitch)
=> ((c4 b4 eb4 eb4 gs4 gs4) (d4 b4 e4 e4 e4 b4)
    (d4 e4 b4 e4 b4 e4) (eb4 e4 b4 c4 e4 d4))




Here we remove two intervals (3 8) from the tonality:                                            OPUSM

(tonality-map '(my-tonal :remove '(3 8) :map 'extend) pitch)
=> ((c4 c5 e4 e4 g4 g4) (c4 bb4 e4 e4 e4 bb4)
    (c4 e4 bb4 e4 c5 e4) (e4 e4 c5 c4 e4 c4))




                                                                                                  OPUS
Opusmodus                                                             tonality-map   8

Examples with a degree (root) of the transposed tonality:

(tonality-map '(major :root 2 :map 'extend) '(f4 e4 d4 c4))
=> (g4 fs4 e4 d4)




Constrain a mapping to a given range (ambitus) using a pitch range:

(setf seq-3 '((e c4 cs4 d4 eb4) (e4 f4 fs4 gs4)
              (bb4 b4 g4 gs4) (q a4)))

(tonality-map
 '(dorico-flamenco :root 5 :ambitus '(a4 a5) :map step) seq-3)




Example with tonality series:

(setf tonality
      (tonality-series
       (rnd-sample 12 '(harmonic-major
                        double-harmonic-major
                        phrygian-locrian-mixed
                        pentatonic-minor
                        diminished1) :seed 3125)
       :root '(0 1 2 3 4 5 6 7 8 9 10 11)
       :ambitus 'piano
       :map 'step))

(setf pitch (gen-loop 12 (rnd-row :type :pitch)))

(setf omn (make-omn :length '(s)
                    :pitch pitch
                    :span :pitch))
Opusmodus                         tonality-map   9

(tonality-map tonality omn)




  3




  5




  7




                                     8
  9




                              8     8
 11




                                     OPUSMODUS
Opusmodus                                                               tonality-map   10

Here we use GET-HARMONIC-PATH to create a tonality with a de ned time '(1/4 3/8
5/8).

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




(setf scale (tonality-series path :map 'step))
=> ((d4g4b4a4 :map step :ambitus piano)
    (g4b4d5c5 :map step :ambitus piano)
    (g5d4fs4a4c5b4 :map step :ambitus piano)
    (a4d5fs5 :map step :ambitus piano)
    (b3d4g4fs4e4 :map step :ambitus piano)
    (b4a4g4cs5e5d4fs4 :map step :ambitus piano)
    (d4fs4a4g4 :map step :ambitus piano)
    (fs4a4d5 :map step :ambitus piano))

Here the :time is a list of three ratios 1/4, 3/8 and 5/8 with the optional :loop T.
The :loop T will create a time list (1/4 3/8 5/8 1/4 3/8 5/8 . . .).
The sum of the :time list equals the span of the sequence.

(setf pitch (gen-loop 8 (rnd-row :type :pitch)))
(setf length (gen-loop 8 (gen-repeat 8 '(s))))
(setf omn (make-omn :length length :pitch pitch :velocity '(mf)))
                                                          fi
Opusmodus                                                   tonality-map    11

(tonality-map scale omn :time '(1/4 3/8 5/8) :loop t :map 'extend)




  4




  6




                                                                OPUSMODUS



Relevant Functions
---------------------------------------------------------
TONALITY-SERIES
