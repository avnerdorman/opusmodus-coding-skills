Opusmodus                                                                      pcs-analysis      1

pcs-analysis sequence
[Function]

Arguments and Values:
sequence                 integer or pitch list.


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
all notated pitches C, B-sharp, D-double- at. Pitch-Class 1 refers to all notated pitches C-
sharp, D- at, B-double-sharp, and so on.

The name of PCS consisting of two numerals separated by a hyphen. The numeral to the left
of the hyphen is the CARDINAL-NUMBER of the set, the numeral to the right of the
hyphen is the ORDINAL-NUMBER of the set, its position on the list of PRIME-FORMS.
   fl
                                     fl
Opusmodus                                      pcs-analysis   2

Examples:
(pcs-analysis '(7 10 3 8 11 5 2))
=> Original Prime Order: (7 10 3 8 11 5 2)
   Pitch: (g4 bb4 eb4 gs4 b4 f4 d4)
   Inversion: (5 2 9 4 1 7 10)
   Complement: (0 1 4 6 9)
   Normal Order: (2 3 5 7 8 10 11)
   Prime Form: (0 1 3 5 6 8 9)
   Forte: 7-32b
   Directed Interval Vector: (1 2 2 1 2 1 3)
   Interval Vector: (3 3 5 4 4 2)
   Interval Class: (3 5 5 3 6 3)

(pcs-analysis '(1 4 7 8 10 3))
=> Original Prime Order: (1 4 7 8 10 3)
   Pitch: (cs4 e4 g4 gs4 bb4 eb4)
   Inversion: (11 8 5 4 2 9)
   Complement: (0 2 5 6 9 11)
   Normal Order: (1 3 4 7 8 10)
   Prime Form: (0 2 3 6 7 9)
   Forte: 6-z29
   Directed Interval Vector: (2 1 3 1 2 3)
   Interval Vector: (2 2 4 2 3 2)
   Interval Class: (3 3 1 2 5)

(pcs-analysis '(e4 cs4 eb4 b4 g4 c4))
=> Original Prime Order: (4 1 3 11 7 0)
   Pitch: (e4 cs4 eb4 b4 g4 c4)
   Inversion: (8 11 9 1 5 0)
   Complement: (2 5 6 8 9 10)
   Normal Order: (11 0 1 3 4 7)
   Prime Form: (0 1 2 4 5 8)
   Forte: 6-15
   Directed Interval Vector: (1 1 2 1 3 4)
   Interval Vector: (3 2 3 4 2 1)
   Interval Class: (3 2 4 4 5)
