Opusmodus                                                                             trope-hexachord   1

trope-hexachord number &key start direction voice type
[Function]

Arguments and Values:
number                      an integer or list of integers from 1 to 44 with additional
                            symbol: a, b, ab or ba.
start                       an integer or pitch symbol. The default is 0 (c4).
direction                   'a (ascending) or 'd (descending). The default is 'a.
voice                       NIL or T. The default is NIL.
type                        :pitch or :integer. The default is :pitch.


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

For more information about TROPE please read the TROPE-ANALYSIS document.
Further reading: Dominik Šedivý: Serial Composition and Tonality, Vienna 2011, p. 81-90.
Opusmodus      trope-hexachord   2

Trope scheme
Opusmodus                                                       trope-hexachord   3

Examples:
(trope-hexachord '20a)
=> (c4 cs4 d4 ds4g4as4)

(trope-hexachord '20a :direction 'd)
=> (c4e4g4 b3 as3 a3)

(trope-hexachord '20a :start 'd3 :voice t)
=> ((d3 ds3 e3 f3) (a3) (c4))

(trope-hexachord '20a :direction 'd :start 'd3)
=> (d3fs3a3 cs3 c3 b2)

(trope-hexachord '20a :direction 'd :start 'd3 :voice t)
=> ((d3) (b2) (g2 fs2 f2 e2))

(trope-hexachord '17ab :type :integer)
=> (((0 4 8) (1 5 9)) ((2 6 10) (3 7 11)))

(trope-hexachord '28ba :direction 'd)
=> ((c4 gs3b3 ds3g3as3) (fs3 d3f3 a2cs3e3))

(trope-hexachord '28ba :start 'd3 :direction 'd)
=> ((d3 as2cs3 f2a2c3) (gs2 e2g2 b1ds2fs2))

(trope-hexachord '(3b 2ab))
=> ((c4e4 cs4f4 fs4 g4) ((c4 cs4 d4 ds4 e4fs4) (f4g4 gs4 a4 as4 b4)))

(trope-hexachord '(33a 4a 42 17))
=> ((c4 b3 ds3fs3gs3as3) (c4fs4 cs4g4 d4gs4)
    ((c4d4 ds4f4g4a4) (e4fs4gs4as4 b4cs5))
    ((c4e4gs4 cs4f4a4) (d4fs4as4 ds4g4b4)))

The function TROPE-SCHEME-NUMBERS returns all possible trope scheme numbers.

(trope-scheme-numbers)
=> (1 1a 1b 1ab 1ba 2 2a 2b 2ab 2ba 3 3a 3b 3ab 3ba . . . 44ba)

(setf trope-series
      (rnd-octaves
       '(c3 g6)
        (assemble-seq
         (trope-hexachord (rnd-sample 10 (trope-scheme-numbers))))))
