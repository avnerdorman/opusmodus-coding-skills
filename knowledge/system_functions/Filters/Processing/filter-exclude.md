Opusmodus                                                                     filter-exclude    1

filter-exclude length sequence
[Function]

Arguments and Values:
length                    exclusions lengths of lists to exclude.
sequence                  lists of items.


Description:

FILTER-EXCLUDE will count the number of items in each of a series of given lists. It will
then exclude those that match a speci ed series of lengths. This function is particularly
useful when composing multi-part music from a single source list.

Remove lists with 2 or 3 items:

(filter-exclude '(2 3) '((a) (a b) (a b c) (a b c d)))
=> ((a) (a b c d))

These lists could be pitches, lengths, and so on:

(filter-exclude
 '(2 3) '((c4) (d4 e4) (f4 g4 a4) (b4 c5 d5 e5)))
=> ((c4) (b4 c5 d5 e5))

To remove selected values from lists, see POSITION-REMOVE.


Examples:

Here's an example of how FILTER-EXCLUDE might be used to produce a polyphony of
rhythm in a string quartet texture. Imagine all lists are to play within the same bar length,
let's say 2/4.

(setf motifs
     (gen-divide '(1 2 3 4)
                 (rnd-sample 30 '(c4 d4 e4 fs4 gs4) :seed 23)))
=> ((e4) (d4 d4) (gs4 d4 e4) (c4 c4 e4 e4)
    (gs4) (e4 d4) (c4 c4 d4) (gs4 gs4 gs4 d4)
    (c4) (d4 c4) (gs4 fs4 d4) (e4 fs4 gs4 c4))

(setf vn1 (filter-exclude '(1 2) motifs))
=> ((gs4 d4 e4) (c4 c4 e4 e4) (c4 c4 d4)
    (gs4 gs4 gs4 d4) (gs4 fs4 d4) (e4 fs4 gs4 c4))
                                    fi
Opusmodus                                       filter-exclude   2

(setf vn2 (filter-exclude '(1 3) motifs))
=> ((d4 d4) (c4 c4 e4 e4) (e4 d4)
    (gs4 gs4 gs4 d4) (d4 c4) (e4 fs4 gs4 c4))

(setf va (filter-exclude '(2 3) motifs))
=> ((e4) (c4 c4 e4 e4) (gs4) (gs4 gs4 gs4 d4)
    (c4) (e4 fs4 gs4 c4))

(setf vc (filter-exclude '(3 4) motifs))
=> ((e4) (d4 d4) (gs4) (e4 d4) (c4) (d4 c4))
