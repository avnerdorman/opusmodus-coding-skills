Opusmodus                                                function-search   1

function-search &key operation input output intent category
[Function]

Arguments and Values:
operation            a property. The default is NIL.
input                a property. The default is NIL.
output               a property. The default is NIL.
intent               a property. The default is NIL.
category             a property. The default is NIL.


List of property types:

Operation:

analysis apply array call collect condition construct convert define
display distribute evaluation filter find generate import initialize
iterate map position print process reference result select test

Input:

array attribute binary cent chord clauses db decimal degree dictum
element expression file float form function hertz hexachord instrument
integer interval length linear list lists map midi msec name nil null
number object omn pitch place radian random ratio row score sec section
sequence set stream symbol test tick tonality tonality-form tuning
values vector velocity voices

Output:

array articulation attribute binary cent chord data db decimal degree
dynamic element external float form freq function graph group hertz
index integer interval length linear list midi msec nil number object
omn omn-form pitch plot radian ratio row score sec sequence test tick
tuning values velocity voices

Intent:

above absolute accumulate add addition adjust alias align ambitus
anacrusis analysis append apply array asc assemble assign atom attribute
augmentation bar below between binary bind brownian build butlast cadr
car cardinal cartesian case cellular cent centered change chord chordize
class closest cluster collatz collect combination combine compile
complement cond condition cons constant controller convert count create
crossover cube curve db decf dechord decimal decode define delta demix
density desc dictum difference diminution direction disassemble disjoin
Opusmodus                                                                     function-search   2

display dissolve divide division dynamic edit editor element envelope
equal euclidean eval evaluation even everyother expand expansion factor
fibonacci field figurate filter find fit flatten fragment function get
goldbach group harmonics hertz hexachord highest import incf infinity
insert   instrument  instrument-set   integer   interference  interleave
interval inversion invert iterate join klangreihen lambda last layer
legato length letters library linear list live-coding lowest magic make
mandelbrot map mapcar maplist marco markov matrix max melodize merge
messiaen metronome micro midi min minus mix mod modify modus morph
multiplication multiply mutate negative Noergaar noise normal normalize
note nth nthcdr null number octave octaves odd offset omn omn-form order
ornament palindrome pan parallel parameter partial path pattern pause
pcs percent permute pick pitch plot plus polygon pop population position
power-set preserve prime primes prob prog progn progression push
pythagorean quantize quantum radian random range ratio read reduce
reduction relation remove reorder repeat replace respell rest result
retrograde reverse rewrite rhythm rotate round row sample sawtooth scale
score section seed select send sequence series sets signature sine
single-events size smooth sort sound-set span spiral square staccato
step strawinski stream sub-plot subcomplex subdivision subseq substitute
subtraction sum sums surround swallow swap symbol symmetric symmetry
sync syncopate tempo tendency test text thread tie time time-signature
timeline tonality tonnetz transform transition transpose tree triangle
trim trope tuning tuplet ulam unfold-set unique unison variable variance
variant variation vector velocity voice voices walk weight weight when
zigzag

Category:

ambitus analysis array assemble attribute binary chord construct control
convert definition distribute evaluation filter find fractal generate
hexachord integer interval iterate length library map math midi mix
number omn osc partial permutation pitch plot position predicate print
probability quantization random row schillinger score section sequence
series sieve signature sort span structure system text tonality
transform tuning utilities variant vector velocity voice wave


Description:

This function returns a list of functions which satis es the property test.

(function-search :input 'midi :output 'pitch)
.....................................................
input: midi output: pitch
.....................................................
  midi-to-pitch
.....................................................
                                              fi
Opusmodus                                                              function-search   3

To display the function document we place the mouse cursor on to the function name and
press the control/tab keys.


Examples:

Here we search the category with filter properties:

(function-search :category 'filter)
.....................................................
category: filter
.....................................................
  gen-filter-ambitus
  gen-filter-anacrusis
  gen-filter-change
  gen-filter-euclidean
  gen-filter-remove
  gen-filter-rnd
  filter-exclude
  filter-first
  filter-last
  filter-preserve
  filter-remove
  filter-repeat
  filter-tie

This expression returns all functions with input float:

(function-search :input 'float)
.....................................................
input: float
.....................................................
  random*
  float-to-ratio
  gen-controller
  gen-mutate-population
  gen-mutate
  prob?
  prob-map
  gen-tendency
  micro-quantize
  quantize
  rnd-centered
  rnd-variance
  rndn
  vector-multiply
  vector-offset
  vector-range
  vector-round
  vector-smooth
Opusmodus                                                function-search   4

  vector-to-envelope
  vector-to-envelope2
  gen-accent
  gen-cresc-dim
  gen-cresc
  gen-dim-cresc
  gen-dim

(function-search :input 'float :output 'velocity)
.....................................................
input: float output: velocity
.....................................................
  gen-accent
  gen-cresc-dim
  gen-cresc
  gen-dim-cresc
  gen-dim

(function-search :input 'float :output 'pitch)
.....................................................
input: float output: pitch
.....................................................
  micro-quantize

(function-search :operation 'generate :input 'float :output 'float)
.....................................................
operation: generate input: float output: float
.....................................................
  random*
  gen-mutate
  gen-tendency
  rnd-centered
  rnd-variance
  rndn
  vector-offset
  vector-range
  vector-smooth
  vector-to-envelope
  vector-to-envelope2
  gen-accent
  gen-cresc-dim
  gen-cresc
  gen-dim-cresc
  gen-dim
Opusmodus                                               function-search   5

(function-search :operation 'generate :output 'pitch)
.....................................................
operation: generate output: pitch
.....................................................
  pitch-lsystem
  messiaen-permutation
  gen-cluster
  pitch-fragment
  pitch-repeat
  pitch-repeat2
  pitch-repeat3
  pitch-repeat4
  harmonics
  rnd-form-set
  rnd-row
  klangreihen
  pcs-transpose
  pcs
  gen-trope
  trope-hexachord

(function-search :input 'attribute)
.....................................................
input: attribute
.....................................................
  disjoin-attributes
  join-attributes

(function-search :operation 'test)
.....................................................
operation: test
.....................................................
  ac-hexachordp
  attribute-symbolp
  chordp
  contain-attributep
  event-restp
  length-notep
  length-restp
  lengthp
  omn-formp
  pattern-matchp
  pitchp
  twelve-tone-segmentp
  twelve-tonep
  velocityp
  evenp
  minusp
  oddp
  plusp
  atom
Opusmodus                                               function-search   6

  equal
  integerp
  listp
  null
  numberp
  ratiop
  symbolp
  osc-thread-alive?
  prob?

(function-search :category 'chord)
.....................................................
category: chord
.....................................................
  chord-inner-remove
  chord-interval-add
  chord-interval-remove
  chord-interval-replace
  chord-inversion
  chord-parallel-invert
  chord-pitch-unique
  chord-progression
  chord-variation
  chordize-list
  chordize
  create-chord
  dechord
  expand-chord-name
  expand-chord
  gen-chord-series
  gen-chord
  gen-chord2
  gen-chord3
  gen-cluster

(function-search :intent 'ambitus)
.....................................................
intent: ambitus
.....................................................
  ambitus-form
  gen-ambitus-series
  ambitus
  gen-binary-ambitus
  gen-filter-ambitus
  interval-ambitus
Opusmodus                                               function-search   7

(function-search :category 'structure)
.....................................................
category: structure
.....................................................
  find-bar
  insert-bar
  remove-bar
  replace-bar
  split-lengths
  choralis
  gen-choralis
  assemble-voices
  counterpoint
  dictum-tempo
  gen-dictum
  make-dictum
  density-analysis
  density
  filter-density
  quantum
  gen-group
  gen-unison
  gen-pause
  micropolyphony
  polyphony
  do-section
  do-timeline
  do-timeline2
  section-to-timeline
  timeline-to-section
  tonnetz-analysis
  tonnetz-structure
  tonnetz
  mclist
