Opusmodus                                                                         gen-trope   1

gen-trope row &key type voice
[Function]

Arguments and Values:

row                      integer or pitch set (twelve-tone row).
type                     :integer or :pitch. The default is :pitch.
voice                    NIL or T. The default is NIL.


Description:

A system of 44 tropes was invented by the Austrian composer Joseph Hauer in the 1920s.
The 44 tropes are a system that allows one to gain a thorough overview of all existing
twelve-tone rows (479,001,600) and to classify them with regard to common properties.
Knowing the tropes and their applications can provide full control over the intervallic
material.

Generally, a twelve-note set is divided into two complementary groups of six tones. These
two groups are then examined with regard to their intrinsic and mutual interval relations.
Therefore, the particular order of tones within each hexachord is irrelevant. Any existent six-
note set can be associated with a particular half of a trope. Since the mutual relations of
intervals are the key information of tropes, it would be a misinterpretation of the trope
system to identify tropes with (hexatonic) scales nor with chords. Likewise, tropes are
neither pitch-class sets nor interval-class sets. A trope is a framework of contextual interval
relations, its key information is the relational structure of all its intervals.

Similar to Klangreihen, tropes can be viewed from the perspective of voice layers as well. In
fact, one can view the layer structure of a whole trope on the one hand and of its separated
halves on the other hand.

Trope 28 (integer notation and graphic notation):

(trope-analysis '(0 5 8 9 7 4 6 11 2 3 1 10))
=> 12-tone Row: (0 5 8 9 7 4 6 11 2 3 1 10)
     Trope: (1 1 3 4 1)
     Number: 28ab
     Integer Chord: (((0 4 7) (5 8) 9) ((6 10 13) (11 14) 15))
     Chord Structure: ((c4e4g4 f4gs4 a4) (fs4as4cs5 b4d5 ds5))
     Voice Layer: (((c4) (e4 f4) (g4 gs4 a4))
                   ((cs4 d4 ds4) (fs4) (as4 b4)))
Opusmodus                                                                          gen-trope     2




Here above is the trope 28 in one of Hauer’s unqiue graphic notations. This notation
eliminates the need for accidentals. Hauer often used an eight-line staff, where all the lines
represented the black keys of the keyboard and the spaces the white keys.

We can easily see from these two images above that the hexachords of this trope are
structurally identical. In fact, hexachord b is a transposition of hexachord a (by 6 = tritone).
If we choose a twelve-tone row from this trope that also consists of two transposing halves
e.g.: (0 5 8 9 7 4 6 11 2 3 1 10), we can even create Klangreihen re ecting this
symmetry within the harmonic structure, provided that the correct setup of voice layers is
being chosen. The example below will work well with voice layers such as [3-3-3-3],
[2-4-2-4] and [4-2-4-2].
                                                                             fl
Opusmodus                                                                                  gen-trope     3

     Example row:                 (0 5 8 9 7 4) (6 11 2 3 1 10)
     Setup of voice layers:       [2-4-2-4]
     Klangreihe:                  (10 10 8 9 9 9) (11 11 11 11 11 10)
                                  (6 6 6 6 7 7) (6 6 6 6 6 6)
                                  (3 5 5 5 5 4) (4 4 2 3 3 3)
                                  (0 0 0 0 0 0) (0 0 0 0 1 1)

For more information about TROPES please read the TROPE-ANALYSIS document.
Further reading: Dominik Šedivý: Serial Composition and Tonality, Vienna 2011, p. 81-90.

(gen-trope '(gb4 g4 a4 bb4 db5 eb5 ab4 b4 c5 d5 e5 f5))
=> ((c4e4g4 ds4fs4as4) (f4a4cs5 gs4b4d5))

(gen-trope '(gb4 g4 a4 bb4 db5 eb5 ab4 b4 c5 d5 e5 f5) :type :integer)
=> (((0 4 7) (3 6 10)) ((5 9 13) (8 11 14)))

(gen-trope '(7 9 10 1 3 8 11 6 0 2 4 5) :start 'e4)
=> ((e4g4a4 f4as4 b4) (c4 cs4 d4 ds4fs4gs4))

(gen-trope '(7 9 10 1 3 8 11 6 0 2 4 5) :start 'b3)
=> ((b3d4e4 c4f4 fs4) (g3 gs3 a3 as3cs4ds4))


Examples:

Dominic Sedivy says in his authoritative book Serial Compostion and Tonality that 'A trope
is not just a set of intervals it consists of, but the relational structure of its intervals.' Here is
an example of the two hexachords from Trope 4.

(trope-hexachord 4)
=> ((c4fs4 cs4g4 d4gs4) (ds4a4 e4as4 f4b4))

This 'trope' allows for transposition (by minor third and major sixth) and inversion of both
hexachords. Transposition and inversion can take place inside both hexachords.

(setf tr-4
      (gen-trope '(f4 b4 fs4 bs4 g4 cs5 ab4 d5 a4 ds5 bb4 e5)
      :type :integer))
=> (((0 6) (1 7) (2 8)) ((3 9) (4 10) (5 11)))

(setf tr-4p
      (gen-trope '(f4 b4 fs4 bs4 g4 cs5 ab4 d5 a4 ds5 bb4 e5)))
=> ((c4fs4 cs4g4 d4gs4) (ds4a4 e4as4 f4b4))

Look at the examples above and compare the output to Hauer's trope-4. The trope function
automatically groups the 12-tones of trope-4 into a pair of hexachord (chords). This means
Opusmodus                                                                        gen-trope   4

that we could explore any 12-note series (don't try more or less than 12) using the trope
mechanism.

(setf my-trope (rnd-air :seed 45))
=> (0 3 10 8 7 4 9 11 5 1 2 6)

(gen-trope my-trope :type :integer :start 'as4)
=> (((10 14) (6 8 11 15)) ((0 4 7 9) (1 5)))

(gen-trope my-trope :start 'as4)
=> ((as4d5 fs4gs4b4ds5) (c4e4g4a4 cs4f4))

The example above shows how the interval groupings are made. Lets analyse ‘My-trope’
with TROPE-ANALYSIS function:

(trope-analysis '(0 3 10 8 7 4 9 11 5 1 2 6))
=> 12-tone Row: (0 3 10 8 7 4 9 11 5 1 2 6)
     Trope: ((1 2 2 3 1) (1 3 1 3 2))
     Number: 13ba
     Integer Chord: (((10 14) (6 8 11 15)) ((0 4 7 9) (1 5)))
     Chord Structure: ((as4d5 fs4gs4b4ds5) (c4e4g4a4 cs4f4))

Try changing the random :seed on the example and explore different outcomes. Use
the :voice T keyword to melodize the chordal groupings and reveal different interval
possibilities. Use inversion, retrograde and retrograde-inversion (variants).

(gen-trope my-trope :voice t)
=> ((as4 d5 fs4 gs4 b4 ds5) (c4 e4 g4 a4 cs4 f4))
