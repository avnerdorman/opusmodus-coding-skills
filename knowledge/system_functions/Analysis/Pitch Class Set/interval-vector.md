Opusmodus                                                                  interval-vector       1

interval-vector set
[Function]

Arguments and Values:
set                      an interval set.


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

In musical set theory, an interval vector is an array of natural numbers which summarize the
intervals present in a set of pitch classes.

While primarily an analytic tool, interval vectors can also be useful for composers, as they
quickly show the sound qualities that are created by different collections of pitch class. That
is, sets with high concentrations of conventionally dissonant intervals (i.e., seconds and
sevenths) sound more dissonant, while sets with higher numbers of conventionally consonant
intervals (i.e., thirds and sixths) sound more consonant. While the actual perception of
consonance and dissonance involves many contextual factors, such as register, an interval
vector can nevertheless be a helpful tool.
   fl
                                     fl
Opusmodus                                                                       interval-vector   2

In twelve-tone equal temperament, an interval vector has six digits, with each digit
representing the number of times an interval class appears in the set. Because interval classes
are used, the interval vector for a given set remains the same, regardless of the set's
permutation or vertical arrangement. The interval classes designated by each digit ascend
from left to right.

That is:
     1.     minor seconds/major sevenths (1 or 11 semitones)
     2.     major seconds/minor sevenths (2 or 10 semitones)
     3.     minor thirds/major sixths (3 or 9 semitones)
     4.     major thirds/minor sixths (4 or 8 semitones)
     5.     perfect fourths/perfect fths (5 or 7 semitones)
     6.     tritones (6 semitones) (The tritone is inversionally related to itself.)

Interval class 0, representing unisons and octaves, is omitted.


Examples:
(interval-vector '(0 2 3 6 9))
=> (1 1 4 1 1 2)

(interval-vector '(0 5 6 2 4 7 9))
=> (3 5 4 3 5 1)
                  fi
