Opusmodus                                                                      pcs-cardinal      1

pcs-cardinal number &optional type
[Function]

Arguments and Values:
number                   an integer. Cardinal numbers: 2 3 4 5 6 7 8 9 10.
type                     :forte and :pitch. The default is :integer.


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

This function displays all the sets of the chosen CARDINAL-NUMBER.


Examples:
(pcs-cardinal 3)
=> ((0 1 2) (0 1 3) (0 2 3) (0 1 4) (0 3 4) (0 1 5) (0 4 5)
    (0 1 6) (0 5 6) (0 2 4) (0 2 5) (0 3 5) (0 2 6) (0 4 6)
    (0 2 7) (0 3 6) (0 3 7) (0 4 7) (0 4 8))
   fl
                                   fl
Opusmodus                                                pcs-cardinal   2

(pcs-cardinal 3 :forte)
=> (3-1 3-2 3-2b 3-3 3-3b 3-4 3-4b 3-5 3-5b 3-6
    3-7 3-7b 3-8 3-8b 3-9 3-10 3-11 3-11b 3-12)

(pcs-cardinal 5 :forte)
=> (5-1 5-2 5-2b 5-3 5-3b 5-4 5-4b 5-5 5-5b 5-6 5-6b
    5-7 5-7b 5-8 5-9 5-9b 5-10 5-10b 5-11 5-11b 5-z12
    5-13 5-13b 5-14 5-14b 5-15 5-16 5-16b 5-z17
    5-z18 5-z18b 5-19 5-19b 5-20 5-20b 5-21 5-21b
    5-22 5-23 5-23b 5-24 5-24b 5-25 5-25b 5-26 5-26b
    5-27 5-27b 5-28 5-28b 5-29 5-29b 5-30 5-30b 5-31
    5-31b 5-32 5-32b 5-33 5-34 5-35 5-z36 5-z36b 5-z37
    5-z38 5-z38b)
