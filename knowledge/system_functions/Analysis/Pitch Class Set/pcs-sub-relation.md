Opusmodus                                                                 pcs-sub-relation       1

pcs-sub-relation n sets &optional type
[Function]

Arguments and Values:
n                        an integer or list of integers (cardinal).
sets                     two sets of integers.
type                     :forte, :integer, :pitch and :vector. The default is :integer.


Description:

Allen Forte's unique notation system commonly known as Forte Notation in which he
extrapolates from the serial theory of Milton Babbitt, proposes a musical SET THEORY of
pitch-class-set analysis analogous to mathematical set theory. This has the avowed intention
of providing a method for the analysis of serial or non-serial atonal music. Forte's system is
equally at home describing Ives and Stravinsky as it is Schoenberg and Webern.

In the integer model of pitch, all pitch classes and intervals between pitch classes are
designated using the numbers 0 through 11. It is a common analytical and compositional
tool when working with chromatic music, including twelve tone, serial, or otherwise atonal
music. Such a system able to deal with intervallic relationships from pitch class
extrapolations of material has a potential within Opusmodus to be itself a generator of pitch
series.

Pitch-class, one of the 12 pitch-classes designated by integers 0 11. Pitch-class 0 refers to
all notated pitches C, B-sharp, D-double- at. Pitch-class 1 refers to all notated pitches C-
sharp, D- at, B-double-sharp, and so on.

The name of PCS consisting of two numerals separated by a hyphen. The numeral to the left
of the hyphen is the CARDINAL-NUMBER of the set, the numeral to the right of the
hyphen is the ORDINAL-NUMBER of the set, its position on the list of PRIME-FORMS.

There are three difference forms of relation in Forte's Pitch Class approach: invariance,
inclusive and complementary relation. The function PCS-SUB-RELATION enables the
composer to explore the variance or invariance of a particular pair of pitch-class sets. Using
this function lets you see something of the possible symmetry between pitch-classes.

Composers often appear to make use of variance and invariance properties among sets of the
same class. For instance, partial pc invariance among sets can be a marker that certain PCS
(the invariant ones) are being stressed or made salient or that these PCS are acting as links
   fl
                                   fl
Opusmodus                                                               pcs-sub-relation   2

among different sets. Conversely, a composer can avoid unwanted stress on PCS by making
sure that pc content changes among different sets.

In tonal music we already experience the concrete effects of controlled pc invariance. Think
of how sets of class 7-35 (0 1 3 5 6 8 10) --the diatonic scale class--preserve 6 of
their 7 PCS when transposed by a perfect 4th or perfect 5th. That's why in tonal music the
subdominant and dominant keys are so closely related to the tonic key.


Examples:
(pcs-sub-relation 3 '((10 11 1 4) (0 1 3 11 4)))
=> ((0 1 3) (0 2 5))

(pcs-sub-relation 3 '((10 11 1 4) (0 1 3 11 4)) :forte)
=> (3-2 3-7)

(pcs-sub-relation '(3 4) '((10 11 1 3 4) (10 0 1 3 4)) :forte)
=> (3-2 3-2b 3-5b 3-7 3-7b 3-10 4-13b)

(pcs-sub-relation '(3 4) '((10 11 1 3 4) (10 0 1 3 4)))
=> ((0 1 3) (0 2 3) (0 5 6) (0 2 5) (0 3 5) (0 3 6)) (0 3 5 6))

(pcs-sub-relation 3 (pcs '(5-10 7-3)) :pitch)
=> ((c4 cs4 eb4) (c4 d4 eb4) (c4 cs4 e4) (c4 eb4 e4)
    (c4 cs4 fs4) (c4 d4 f4) (c4 eb4 f4) (c4 e4 fs4) (c4 eb4 fs4))

(pcs-sub-relation 3 (pcs '(5-10 7-3)) :vector)
=> ((1 1 1 0 0 0) (1 1 1 0 0 0) (1 0 1 1 0 0)
    (1 0 1 1 0 0) (1 0 0 0 1 1) (0 1 1 0 1 0)
    (0 1 1 0 1 0) (0 1 0 1 0 1) (0 0 2 0 0 1))
