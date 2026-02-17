Opusmodus                                                                        pcs-subcomplex   1

pcs-subcomplex n set &optional type
[Function]

Arguments and Values:
n                        an integer or list of integers (allows cardinal 3 4 5 and 6).
set                      an integer set.
type                     :forte, :pitch and :vector. The default is :integer.


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

This PCS function provides more help in analysing, recognising and devising sets associated
with a single set. The following background comes from the theorist Gary Tucker.

Some theorists have devised means to discuss the similarity of sets and classes according to
shared pc and ic content. The conventions of naming PCS and ics with numbers has helped
these theorists to formalise and quantify measurements of similarity in a mathematical way.
In The Structure of Atonal Music, for instance, Allen Forte recognises similarity relations of a
few degrees between sets of equal size, based on their sharing all but one pc and on their
having maximally or minimally similar pc contents (Forte 1973, 46-60). Other theorists have
   fl
                                   fl
Opusmodus                                                                   pcs-subcomplex   2

proposed their own criteria for determining similarity between sets, as well as ways to
quantify degrees of similarity numerically.

The desire to express relatedness among sets in a work--and set classes in the abstract--has
also led to theorising--especially, again, by Allen Forte--about SET COMPLEXES and SET
GENERA, super-classi cations to which set classes can belong. In both, a single class or a
small group of classes may be held to serve as a "nexus" or to have "generated" a whole web
of classes, principally through inclusion relations (but also through complement and Z
relations). Forte's theory of set complexes occupies the second part of The Structure of
Atonal Music, pp. 93-177. His theory of set genera appeared in "Pitch-Class Set Genera and
the Origin of Modern Harmonic Species," Journal of Music Theory 32 (1988): 187-271.


Examples:
(pcs-subcomplex 3 '(0 1 2 4))
=> ((0 1 2) (0 1 3) (0 2 3) (0 1 4) (0 3 4) (0 2 4))

(pcs-subcomplex 3 '(0 1 2 4) :pitch)
=> ((c4 cs4 d4) (c4 cs4 eb4) (c4 d4 eb4)
    (c4 cs4 e4) (c4 eb4 e4) (c4 d4 e4))

(pcs-subcomplex '(3 4) (pcs '6-30) :forte)
=> (3-2 3-2b 3-3 3-3b 3-5 3-5b 3-7 3-7b 3-8 3-8b 3-10 3-11
    3-11b 4-9 4-12 4-12b 4-13 4-13b 4-z15 4-z15b 4-18 4-18b
    4-25 4-27 4-27b 4-28 4-z29 4-z29b)

(pcs-subcomplex 5 (pcs '6-30) :vector)
=> ((2 1 2 1 2 2) (2 1 2 1 2 2) (1 2 2 2 1 2)
    (1 2 2 2 1 2) (1 1 4 1 1 2) (1 1 4 1 1 2))
                fi
