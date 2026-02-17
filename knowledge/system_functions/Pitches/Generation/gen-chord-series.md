Opusmodus                                                                       gen-chord-series   1

gen-chord-series scale root &key width type
                           method chord segment transpose seed

[Function]

Arguments and Values:
scale                   a list: pitches, chord, integers and omn-form list.
root                    a pitch.
width                   an integer or a list of integers (chord ambitus). The default is 30.
type                    an integer: 3, 4, 5 and '? (at random). The default is 5.
method                  an integer: 1, 2 and '? (at random). The default is 1.
chord                   T and NIL. The default is T.
segment                 T, NIL and '? (at random). The default is NIL.
transpose               an integer or list of integers.
seed                    an integer. Ensures the same result each time the code is evaluated.
                        The default is NIL.

Description:

The function GEN-CHORD-SERIES builds chords using a scale in three types of harmonic
steps: fth (default), fourth and third. The scale needs to be in a range between c4 and b4
(0 11) and the root must be an element of the scale.

Method 1

Fifth:
(c4 g4 d5 a5 e6 b6 f7)
(d4 a4 e5 b5 f6 c7 g7)
(e4 b4 f5 c6 g6 d7 a7)
(f4 c5 g5 d6 a6 e7 b7)
(g4 d5 a5 e6 b6 f7 c8)
(a4 e5 b5 f6 c7 g7 d8)
(b4 f5 c6 g6 d7 a7 e8)

Fourth:
(c4 f4 b4 e5 a5 d6 g6)
(d4 g4 c5 f5 b5 e6 a6)
(e4 a4 d5 g5 c6 f6 b6)
(f4 b4 e5 a5 d6 g6 c7)
(g4 c5 f5 b5 e6 a6 d7)
(a4 d5 g5 c6 f6 b6 e7)
(b4 e5 a5 d6 g6 c7 f7)
fi
Opusmodus                                                    gen-chord-series   2



Third:
(c4 e4 g4 b4 d5 f5 a5)
(d5 f5 a5 c6 e6 g6 b6)
(e4 g4 b4 d5 f5 a5 c6)
(f4 a4 c5 e5 g5 b5 d6)
(g4 b4 d5 f5 a5 c6 e6)
(a4 c5 e5 g5 b5 d6 f6)
(b4 d5 f5 a5 c6 e6 g6)

Method 2 (intervals)

Fifth:      (7 7 7 7 7 7 -5 -5 -5 -5 -5)
Fourth:     (5 5 5 5 5 5 5 -7 -7 -7 -7)
Third:      (3 3 3 4 3 3 3 4 3 3 3)

The scale needs to be in a range between c4 and b4 (0 11).
The root must be an element of the scale.

Let’s examine the three types:

(setf seven '(c4 e4 g4 bb4))


                                       = 120




Fifth:

(gen-chord-series seven 'c4)
=> (c4g4e5bb5)


                                            = 120
Opusmodus                                           gen-chord-series   3



Third:

(gen-chord-series seven 'c4 :type 3)
=> (c4e4g4bb4)


                                       = 120




(gen-chord-series seven 'c4 :type 3 :segment t)
=> (c4g4 e4bb4)


                                       = 120




(gen-chord-series seven seven :type 3 :segment t)
=> (c4g4 e4bb4 e4bb4 g4c5 g4c5 bb4e5 bb4e5 c5g5)


                               = 120




Fourth:

(gen-chord-series seven 'c4 :type 4)
=> (c4bb4e5g5)


                                       = 120
     Opusmodus                                                           gen-chord-series   4



     For example if the root is fs4 and the :type is 5 ( fth) then the map we use is: (f4 c5
     g5 d6 a6 e7 b7). In :method 1 it doesn’t matter whether the notes are natural, sharp,
     or at.

     (setf hexachord '(d4 eb4 fs4 g4 a4 bb4))


                                           = 120




     (gen-chord-series hexachord 'fs4)
     => (fs4g4d5a5eb6bb5)


                                              = 120




     (gen-chord-series hexachord 'fs4 :type 3)
     => (fs4a4eb5g5bb5d6)


                                               = 120




     (gen-chord-series hexachord 'fs4 :type 4)
     => (fs4bb4eb5a5d6g5)


                                               = 120
fl
                                                   fi
Opusmodus                                                            gen-chord-series   5



Examples:

Building chords using a hexachord scale:

(gen-chord-series hexachord 'fs4 :type 3 :segment t)
=> (fs4eb5bb5 a4g5d6)


                                              = 120




With the :segment option set to T we divide the chord into two segments by selecting
every other second note:

(gen-chord-series hexachord '(fs4 fs4)
                  :type 3
                  :width '(30 24)
                  :segment t)
=> (fs4eb5bb5 a4g5d6 fs4eb5bb5 a4g5d5)


                                      = 120




Below the :type is selected at random:

(gen-chord-series hexachord '(fs4 a4 d4)
                  :type '? :segment '? :seed 56)
=> (fs4bb4eb5a5d6g5 a4d5g5fs6bb5eb6 d4a4g5 fs4eb5bb5)


                                   = 120
Opusmodus                                                               gen-chord-series     6

In the next few examples we use a list of :width values (ambitus) - each value assigned
to each chord:

(gen-chord-series hexachord hexachord
                  :type 3 :width '(30 24 36 12))
=> (d4fs4a4eb5g5bb5 eb4g4bb4d5fs5a5 fs4a4eb5g5bb5d6
    g4bb4d4fs4a4eb4 a4eb5g5bb5d6fs6 bb4d5fs5a5eb5g5)


                               = 120




Please note, if the root list length is bigger than the :width list length then the :width
list values will be looped:

(gen-chord-series hexachord hexachord
                  :type 4 :width '(30 24 36 12))
=> (d4g4fs5bb5eb6a5 eb4a4d5g5fs5bb5 fs4bb4eb5a5d6g6
    g4fs4bb4eb4a4d4 a4d5g5fs6bb5eb6 bb4eb5a5d5g5fs5)


                       = 120




                                                                                                 OP
(gen-chord-series hexachord hexachord
                  :width '(30 24 36 12))
=> (d4a4eb5bb5fs6g5 eb4bb4fs5g5d5a5 fs4g4d5a5eb6bb6
    g4d4a4eb4bb4fs4 a4eb5bb5fs6g5d6 bb4fs5g5d5a5eb5)


                               = 120
Opusmodus                                                 gen-chord-series   7

(gen-chord-series hexachord hexachord
                  :type '?
                  :width '(30 24 36 12)
                  :segment t
                  :seed 23)
=> (d4a4g5 fs4eb5bb5 eb4fs5d5 bb4g5a5 fs4eb5d6 bb4a5g6
    g4d4a4 bb4fs4eb4 a4g5d6 eb5bb5fs6 bb4a5g5 eb5d5fs5)


        = 120




  3




                                                                 OPUSMODUS
Building chords using C Major scale:

(setf c-major '(c4 d4 e4 f4 g4 a4 b4))


                                           = 120




(gen-chord-series c-major c-major :width 36)
=> (c4g4d5a5e6b6f6 d4a4e5b5f6c7g6 e4b4f5c6g6d6a6
    f4c5g5d6a6e6b6 g4d5a5e6b6f6c7 a4e5b5f6c7g6d6 b4f5c6g6d6a6e6)


                                   = 120

                                       8           8
Opusmodus                                                      gen-chord-series   8

(gen-chord-series c-major c-major :type 3 :width 36)
=> (c4e4g4b4d5f5a5 d4f4a4c5e5g5b5 e4g4b4d5f5a5c6
    f4a4c5e5g5b5d6 g4b4d5f5a5c6e6 a4c5e5g5b5d6f6 b4d5f5a5c6e6g6)


                                       = 120




(gen-chord-series c-major c-major :type 4 :width 36)
=> (c4f4b4e5a5d6g6 d4g4c5f5b5e6a6 e4a4d5g5c6f6b6
    f4b4e5a5d6g6c7 g4c5f5b5e6a6d6 a4d5g5c6f6b6e6 b4e5a5d6g6c7f6)


                                   = 120

                                               8      8




Here we use transposition values for each chord or segments:

(gen-chord-series c-major '(b4 f4 d4 c4 e4 g4 a4)
                  :type '?
                  :width 36
                  :segment t
                  :seed 45
                 :transpose '(0 6 -1 13))
=> (b4a5g6f6 e5d6c7 b4cs6eb6f6 fs5gs6bb6 cs4gs4eb5bb5 e4b4fs5
    cs5gs5eb6bb6 f5c6fs6 e4f5g6a6 b4c6d6 cs5eb6f6fs6 gs5bb6b6
    gs4eb5bb5e6 b4fs5cs6)


        = 120
                                                                  8




  3




                                                                      OPUSMODUS
Opusmodus                                               gen-chord-series   9

(gen-chord-series c-major (rnd-order c-major :seed 543)
                  :type '?
                  :width '(12 12 18 24 30 36 36)
                  :segment t
                  :seed 5462)
=> (a4e4b4f4 c5g4d4 d4c5b4a4 g4f4e4 e4b4f5c5 g4d5a4 b4c6d5e5
    f5g5a5 c4b4a5g5 f4e5d6 g4a5b6c7 d5e6f6 f4e5d6c7 b4a5g6)


             = 120




                                                                           OPUSMOD
(gen-chord-series c-major '(f4 b4 d4) :width 12 :type 3 :chord nil)
=> ((f4 a4 c5 e4 g4 b4 d4) (b4 d4 f4 a4 c5 e4 g4)
    (d4 f4 a4 c5 e4 g4 b4))


                       = 120




(gen-chord-series c-major '(f4 b4 d4) :width 12 :type 4 :chord nil)
=> ((f4 b4 e4 a4 d4 g4 c5) (b4 e4 a4 d4 g4 c5 f4)
    (d4 g4 c5 f4 b4 e4 a4))


                       = 120




(gen-chord-series c-major '(f4 b4 d4) :width '(36 24 28) :chord nil)
=> ((f4 c5 g5 d6 a6 e6 b6) (b4 f5 c6 g5 d5 a5 e5)
    (d4 a4 e5 b5 f5 c6 g5))



                     = 120
Opusmodus                                              gen-chord-series   10

Some more examples with :method 1 and :method 2:

(setf a-scale '(c4 eb4 e4 g4 gs4 b4))


                                  = 120




First with method 1 (default):

(gen-chord-series a-scale a-scale
                  :type '(4 4 5 5 4 3)
                  :width 36
                  :segment t)
=> (c4eb5g5 b4e5gs5 eb4g4c5 e4gs4b5 e4g4c5 eb4gs4b5
    g4c5eb6 gs4b5e6 gs4c5eb6 g4b5e6 b4e5gs5 eb5g5c6)


                    = 120




                                                                               OPUS
Now with method 2:

(gen-chord-series a-scale a-scale
                  :type '(4 4 5 5 4 3)
                  :method 2
                  :width 36
                  :segment t)
=> (c4eb5e6 g4gs5b6 eb4b4e5 gs4c5g5 e4g5c6 b4gs5eb6
    g4e5eb6 c5b5gs6 gs4b5c7 eb5e6g6 b4c6e6 gs5eb6g6)


                      = 120
                                                   8




                                                                                OP
Opusmodus                                                  gen-chord-series    11

(setf chrom '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 bb4 b4))


                        = 120




(gen-chord-series chrom chrom :method 1 :width 36)



                                        8
          = 120




                                                       8
  2




      8
  3




                                                                   OPUSMODUS
Opusmodus                                                 gen-chord-series    12

(gen-chord-series chrom chrom :method 2 :width 36)



                         8
          = 120




                8                      8
  2




            8                                  8
  3




                                                                  OPUSMODUS
(gen-chord-series chrom chrom :method 1 :width 36 :segment t)


          = 120

                                           8




                                                      8
  3




      8
                         8
  5




                                                                  OPUSMODUS
Opusmodus                                                                gen-chord-series       13

(gen-chord-series chrom chrom :method 2 :width 36 :segment t)



                                                                            8
        = 120




                                                  8
  2




                                  8
  4




                              8
  5




                                                   8
  6




As we can see there are endless possibilities. Just copy a few of the expressions toOPUSMODUS
                                                                                     your
Composer (Editor) and start exploring.
