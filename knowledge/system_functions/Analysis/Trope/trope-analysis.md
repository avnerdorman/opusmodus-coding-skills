Opusmodus                                                                           trope-analysis   1

trope-analysis sequence
[Function]

Arguments and Values:

sequence                    integer or pitch list (12-tone row).


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

For a more detailed comparison, please refer to the trope scheme.
Further reading: Dominik Šedivý: Serial Composition and Tonality, Vienna 2011, p. 81-90.

Trope 28 (integer notation and graphic notation):
(trope-analysis '(0 5 8 9 7 4 6 11 2 3 1 10))
=> 12-tone Row: (0 5 8 9 7 4 6 11 2 3 1 10)
   Trope: (1 1 3 4 1)
   Number: 28ab
   Integer Chord: (((0 4 7) (5 8) 9) ((6 10 13) (11 14) 15))
   Chord Structure: ((c4e4g4 f4gs4 a4) (fs4as4cs5 b4d5 ds5))
   Voice Layer: (((c4) (e4 f4) (g4 gs4 a4))
                 ((cs4 d4 ds4) (fs4) (as4 b4)))
Opusmodus                                                                         trope-analysis   2




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
Opusmodus                                                                          trope-analysis   3

     Example row:                (0 5 8 9 7 4) (6 11 2 3 1 10)
     Setup of voice layers:      [2-4-2-4]
     Klangreihe:                 (10 10 8 9 9 9) (11 11 11 11 11 10)
                                 (6 6 6 6 7 7) (6 6 6 6 6 6)
                                 (3 5 5 5 5 4) (4 4 2 3 3 3)
                                 (0 0 0 0 0 0) (0 0 0 0 1 1)

(klangreihen 0 '(2 4 2 4) '(0 5 8 9 7 4 6 11 2 3 1 10)
 :type :integer :sort 'd)
=> ((10 6 3 0)
    (10 6 5 0)
    (8 6 5 0)
    (9 6 5 0)
    (9 7 5 0)
    (9 7 4 0)
    (9 6 4 0)
    (11 6 4 0)
    (11 6 2 0)
    (11 6 3 0)
    (11 6 3 1)
    (10 6 3 1))


Trope morphology

The trope system can be well applied if one understands its morphology. Each trope contains
symmetries (transposition and inversion) and/or signi cant intervallic relations on three
different levels, namely relations within a trope’s hexachords, between two halves of one
trope and between whole tropes. In fact, there is no trope that cannot be classi ed through its
symmetries. Based on the knowledge one has about the intervallic properties of a trope, trope
technique enables a composer to transfer these properties to a whole musical composition.

In summary, the most important categories are as follows:

     a)     Tropes with transpositional halves:
            Nos. 1, 4, 10, 17, 28, 29, 41, 44;

     b)     Tropes with mutually inverting halves:
            Nos. 1, 2, 3, 4, 9, 10, 11, 12, 13, 17, 26, 27, 30, 34, 39, 41, 42, 43, 44;

     c)     Tropes with both transpositional and inverting halves:
            Nos. 1, 4, 10, 17, 41, 44;

     d)     Tropes with invertible halves:
            Nos. 1, 4, 7, 8, 10, 14, 17, 32, 35, 36, 40, 41, 44.
                                                   fi
                                                                              fi
Opusmodus                                                                  trope-analysis    4

Trope scheme

The trope scheme depicts the tropes and their relations graphically. Bold numbers indicate
that this trope belongs to category c (tropes with both transpositional and inverting halves).
Tropes that are grouped in brackets indicate 7 pairs which are mutually inverting (5-6, 15-16,
18-22, 19-21, 20-23, 24-25, 28-29, 31-33, 37-38). Tropes marked with an asterisk (*)
indicate category d (tropes with invertible halves; in addition to tropes in bold print). All
other tropes can be assigned to category b (tropes with mutually inverting halves; in addition
to tropes in bold print).
Opusmodus                               trope-analysis   5

The trope scheme in graphic notation:
Opusmodus                                trope-analysis   6

The trope scheme in standard notation:
Opusmodus                                                 trope-analysis   7

Examples:
(trope-analysis '(10 11 7 1 2 5 0 4 3 8 6 9))
=> 12-tone Row: (10 11 7 1 2 5 0 4 3 8 6 9)
   Trope: ((1 2 1 3 2) (1 2 2 1 3))
   Number: (35a 35b)
   Integer Chord: (((0 4 7) (3 6 10)) ((5 9 13) (8 11 14)))
   Chord Structure: ((c4e4g4 ds4fs4as4) (f4a4cs5 gs4b4d5))
   Voice Layer: (((c4) (ds4 e4) (fs4 g4) (as4))
                 ((cs4 d4) (f4) (gs4 a4) (b4)))

(trope-analysis '(a4 ds5 bb4 e5 f4 g4 d5 fs4 b4 c5 cs5 ab4))
=> 12-tone Row: (9 3 10 4 5 7 2 6 11 0 1 8)
   Trope: ((1 1 2 2 1) (1 1 1 4 2))
   Number: (22a 22b)
   Integer Chord: ((11 10 9 (3 5 8)) ((2 4 7) (1 6) 0))
   Chord Structure: ((b4 as4 a4 ds4f4gs4) (d4e4g4 cs4fs4 c4))
   Voice Layer: (((ds4) (f4) (gs4 a4 as4 b4))
                 ((e4) (fs4 g4) (c4 cs4 d4)))

(trope-analysis '(0 8 11 2 4 5 1 9 10 3 6 7))
=> 12-tone Row: (0 8 11 2 4 5 1 9 10 3 6 7)
   Trope: ((1 2 2 1 3) (1 2 1 3 2))
   Number: (35b 35a)
   Integer Chord: (((5 9 13) (8 11 14)) ((0 4 7) (3 6 10)))
   Chord Structure: ((f4a4cs5 gs4b4d5) (c4e4g4 ds4fs4as4))
   Voice Layer: (((cs4 d4) (f4) (gs4 a4) (b4))
                 ((ds4 e4) (fs4 g4) (as4) (c4)))

(trope-analysis '(4 9 5 1 0 2 3 11 9 6 8 7 10))
=> 12-tone Row: (4 9 5 1 0 2 3 11 6 8 7 10)
   Trope: (1 1 2 1 4)
   Number: 29ab
   Integer Chord: (((8 11 15) (7 10) 6) ((2 5 9) (1 4) 0))
   Chord Structure: ((gs4b4ds5 g4as4 fs4) (d4f4a4 cs4e4 c4))
   Voice Layer: (((ds4) (fs4 g4 gs4) (as4 b4))
                 ((e4 f4) (a4) (c4 cs4 d4)))

(trope-analysis '(8 7 9 1 4 10 5 6 0 2 3 11))
=> 12-tone Row: (8 7 9 1 4 10 5 6 0 2 3 11)
   Trope: ((1 1 1 3 3) (1 2 1 2 1))
   Number: (14ba 14a)
   Integer Chord: (((4 7 10) (5 8 11)) (0 1 2 (3 6 9)))
   Chord Structure: ((e4g4as4 f4gs4b4) (c4 cs4 d4 ds4fs4a4))
   Voice Layer: (((e4 f4) (g4 gs4) (as4 b4))
                 ((fs4) (a4) (c4 cs4 d4 ds4)))
