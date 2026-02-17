Opusmodus                                                                          trope-intervals   1

trope-intervals row
[Function]

Arguments and Values:
row                         integer or pitch list (12-tone row).


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


Example:
(trope-intervals '(0 5 8 9 7 4 6 11 2 3 1 10))
=> ((1 1 3 4 1) (1 1 3 4 1))

(trope-intervals '(a4 ds5 bb4 e5 f4 g4 d5 fs4 b4 c5 cs5 ab4))
=> ((1 1 2 2 1) (1 1 1 4 2))

(trope-intervals (rnd-row :seed 875))
=> ((1 1 2 3 3) (1 2 1 2 4))
Opusmodus      trope-intervals   2

Trope scheme
