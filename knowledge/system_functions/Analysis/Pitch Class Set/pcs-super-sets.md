Opusmodus                                                                      pcs-super-sets     1

pcs-super-sets n set &optional type
[Function]

Arguments and Values:
n                         an integer or list of integers (cardinal).
set                       an integer set.
type                      :forte, :vector and :pitch. The default is :integer.


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
hyphen is the ORDINAL NUMBER of the set, its position on the list of PRIME-FORMS.

This sub-power function enables the composer to view all the possible sub primes of a pitch
class set. These sub sets can be useful in the analysis of atonal music. Also this function
can be used to explore Z-related classes which share interval-class content.

How many notes we group into a segment is a decision we make in analysing music. The
number of different pcs in a set is another matter. The maximum number is, of course,
twelve -- and there is obviously only one set containing all twelve pcs. Since some
composers liked to avoid hinting at tonality by using all the PCS democratically, the
aggregate, as the 12-pc set is called, can play a central role in atonal pitch structure. (It's
   fl
                                    fl
Opusmodus                                                               pcs-super-sets   2

also the set used in 12-tone music, where the order in which the PCS appear becomes
important.)

The cardinal number needs to be higher then the set count.


Examples:
(pcs-super-sets 6 '(11 0 5 6))
=> ((0 1 2 3 6 7) (0 1 4 5 6 7) (0 1 2 5 6 7) (0 1 2 6 7 8)
    (0 1 2 4 6 7) (0 1 3 5 6 7) (0 1 3 4 6 7) (0 1 2 4 7 8)
    (0 1 4 6 7 8) (0 1 2 5 7 8) (0 1 3 6 7 8) (0 1 3 6 7 9)
    (0 2 3 6 8 9) (0 1 2 3 7 8) (0 1 4 6 7 9))

(pcs-super-sets 6 '(11 0 5 6) :forte)
=> (6-5 6-5b 6-z6 6-7 6-z12 6-z12b 6-z13 6-z17
    6-z17b 6-18 6-18b 6-30 6-30b 6-z38 6-z50)

(pcs-super-sets 8 (pcs '4-9) :forte)
=> (8-1 8-4 8-4b 8-5 8-5b 8-6 8-7 8-8 8-9 8-12 8-12b 8-13
    8-13b 8-14 8-14b 8-z15 8-z15b 8-16 8-16b 8-18 8-18b
    8-20 8-23 8-25 8-27 8-27b 8-28 8-z29 8-z29b)

(pcs-super-sets '(5 7) '(10 0 1 3) :forte)
=> (5-2 5-2b 5-10 5-10b 5-23 5-23b 5-25 5-25b
    7-1 7-2 7-2b 7-3 7-3b 7-4 7-4b 7-5 7-5b 7-8
    7-9 7-9b 7-10 7-10b 7-11 7-11b 7-14 7-14b 7-16 7-16b
    7-z18 7-z18b 7-23 7-23b 7-24 7-24b 7-25 7-25b 7-27
    7-27b 7-29 7-29b 7-31 7-31b 7-32 7-32b 7-34 7-35
    7-z36 7-z36b 7-z38 7-z38b)
