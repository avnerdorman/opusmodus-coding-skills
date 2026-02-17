Opusmodus                                                                    tonality-series   1

tonality-series scale &key add remove type variant
                           rotate closest map root ambitus sees

[Function]

Arguments and Values:

scale                    tonality name, pitch list, chord, integer list or OMN list.
add                      an integer (additional intervals).
remove                   a list of integers (remove intervals from the tonality).
type                     prime-form, or NIL. The default is NIL.
variant                  a variant symbol: p, r, i, ri, 4, r4, 5, r5 or ? (at random).
rotate                   and integer (harmonic inversion).
closest                  NIL, down or up. The default is NIL (random).
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

The function TONALITY-SERIES provides a way of collecting or grouping tonality
descriptions.

(tonality-series '((0 2 4 5 7 9 11) (0 2 3 5 7 8 10)) :root '(bb3 ab3))
=> (((0 2 4 5 7 9 11) :root bb3 :ambitus piano)
    ((0 2 3 5 7 8 10) :root ab3 :ambitus piano))

(tonality-series '(major harmonic-minor) :root '(bb3 ab3))
=> ((major :root bb3 :ambitus piano)
    (harmonic-minor :root ab3 :ambitus piano))

These descriptions might be tonalities built into OPUSMODUS such as major or harmonic
minor or lists of integers making bespoke tonalities through algorithmic processes).

In placing a tonality into a series it becomes possible to specify root in addition to a large
number of further arguments. Where pitch material comes from vector generation turned into
integers and then pitch itself, such tonality-series can then be mapped to produce a
Opusmodus                                                                 tonality-series    2

play of tonalities with appropriate roots and additions. Here below is an excellent example of
how TONALITY-SERIES might be used. From a composition for keyboard by Stephane
Boussuge.

(setf path
      (tonality-series
       (rnd-sample 16 '(harmonic-major
                        double-harmonic-major
                        phrygian-locrian-mixed
                        pentatonic-minor
                        diminished1))
       :root (rnd-sample 16 '(d4 f4 e4 a4 c5))
       :ambitus (rnd-sample 16 '(piano (g3 g6) (a1 g3)))
       :map '(step)))

Evaluate the expression above and notice the very particular output:

=> ((harmonic-major :map step :root d4 :ambitus (a1 g3))
    (double-harmonic-major :map step :root f4 :ambitus (g3 g6))
    (phrygian-locrian-mixed :map step :root f4 :ambitus (a1 g3))
    (pentatonic-minor :map step :root c5 :ambitus piano)
    (phrygian-locrian-mixed :map step :root f4 :ambitus piano)
    (diminished1 :map step :root e4 :ambitus (g3 g6))
    (diminished1 :map step :root d4 :ambitus (a1 g3))
    (diminished1 :map step :root f4 :ambitus (a1 g3))
    (phrygian-locrian-mixed :map step :root a4 :ambitus piano)
    (harmonic-major :map step :root f4 :ambitus (a1 g3))
    (double-harmonic-major :map step :root f4 :ambitus (g3 g6))
    (phrygian-locrian-mixed :map step :root d4 :ambitus (a1 g3))
    (phrygian-locrian-mixed :map step :root c5 :ambitus (a1 g3))
    (pentatonic-minor :map step :root e4 :ambitus (g3 g6))
    (double-harmonic-major :map step :root a4 :ambitus (a1 g3))
    (harmonic-major :map step :root f4 :ambitus (a1 g3)))

Generate some material to create arpeggios:

(setf mat1 (gen-accumulate (rnd 400 :low -1.0 :high 1.0)))

Make pitches from the vector stream collected in mat1. Notice the role of TONALITY-MAP
in this expression.

(setf pch1 (filter-repeat 1
            (tonality-map path
             (gen-divide 16
              (integer-to-pitch
               (vector-round 0 24 mat1)))) :omn t))
Opusmodus                                                tonality-series   3

Examples:
(tonality-series
'(chromatic messiaen-mode1 messiaen-mode2 messiaen-mode7))
=> ((chromatic :ambitus piano)
    (messiaen-mode1 :ambitus piano)
    (messiaen-mode2 :ambitus piano)
    (messiaen-mode7 :ambitus piano))

(tonality-series
 '((0 2 4 6 7 9 11)
   (0 2 5 7 9 10)
   (0 3 5 7 9 10))
 :root '(c4 f4 e4 a4 d4 g4 c4))
=> (((0 2 4 6 7 9 11) :root c4 :ambitus piano)
    ((0 2 5 7 9 10) :root f4 :ambitus piano)
    ((0 3 5 7 9 10) :root e4 :ambitus piano)
    ((0 2 4 6 7 9 11) :root a4 :ambitus piano)
    ((0 2 5 7 9 10) :root d4 :ambitus piano)
    ((0 3 5 7 9 10) :root g4 :ambitus piano)
    ((0 2 4 6 7 9 11) :root c4 :ambitus piano))

(tonality-series
 '(chromatic messiaen-mode1 messiaen-mode2 messiaen-mode7)
 :root '(c4 d4 f4 g4 a4 b4)
 :closest '(down)
 :rotate '(nil 1 -1 nil nil)
 :variant '(p r 4 ri i)
 :map '(nil extend step step))
=> ((chromatic :variant p :closest down :root c4 :ambitus piano)
    (messiaen-mode1 :variant r :rotate 1 :closest down
                    :root d4 :ambitus piano)
    (messiaen-mode2 :variant 4 :rotate -1 :closest down :map step
                    :root f4 :ambitus piano)
    (messiaen-mode7 :variant ri :closest down :map step
                    :root g4 :ambitus piano)
    (chromatic :variant i :closest down :root a4 :ambitus piano)
    (messiaen-mode1 :variant p :closest down :root b4 :ambitus piano))
Opusmodus                                                tonality-series   4

(setf tonalities '(e4bb4db4c4 e4bb4c4 f4bb4c4 f4a4c4
                   gb4a4c4 eb4a4c4 eb4b4c4c4 eb4ab4c4
                   e4ab4c4 e4g4c4 e4g4c4db4 e4g4c4d4))

(setf path (tonality-series (rnd-sample 16 tonalities)
            :root (rnd-sample 16 '(d4 f4 e4 a4 c5))
            :map '(step)
            :type '(nil nil nil prime-form)))
=> ((gb4a4c4 :map step :root e4 :ambitus piano)
    (e4g4c4db4 :map step :root a4 :ambitus piano)
    (eb4a4c4 :map step :root f4 :ambitus piano)
    (f4bb4c4 :type prime-form :map step :root c5 :ambitus piano)
    (f4bb4c4 :map step :root e4 :ambitus piano)
    (eb4ab4c4 :map step :root d4 :ambitus piano)
    (gb4a4c4 :map step :root a4 :ambitus piano)
    (eb4ab4c4 :type prime-form :map step :root d4 :ambitus piano)
    (eb4ab4c4 :map step :root c5 :ambitus piano)
    (eb4a4c4 :map step :root d4 :ambitus piano)
    (f4a4c4 :map step :root f4 :ambitus piano)
    (eb4b4c4 :type prime-form :map step :root f4 :ambitus piano)
    (e4g4c4d4 :map step :root e4 :ambitus piano)
    (e4g4c4db4 :map step :root c5 :ambitus piano)
    (f4bb4c4 :map step :root f4 :ambitus piano)
    (e4ab4c4 :type prime-form :map step :root f4 :ambitus piano))
