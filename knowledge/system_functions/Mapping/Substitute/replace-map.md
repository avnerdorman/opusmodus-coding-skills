Opusmodus                                                                              replace-map   1

replace-map map sequence &key otherwise section exclude
[Function]

Arguments and Values:
map                   a list. (<old><new>).
sequence              a proper sequence.
section               an integer or list of integers. Selected list or lists to process.
                      The default is NIL.
exclude               an integer or list of integers. Excluded list or lists from process.
                      The default is NIL.
otherwise             NIL or an argument. The default is NIL.


Description:

REPLACE-MAP returns a copy of sequence in which each element that has been mapped
is replaced with a new item.

(replace-map '((1 a) (2 b) (3 c)) '(1 2 3 4 5 4 5 3 2 3))
=> (a b c 4 5 4 5 c b c)

(replace-map '((1 a) (2 b) (3 c)) '(1 2 3 4 5 4 5 3 2 3)
             :otherwise 'd)
=> (a b c d d d d c b c)


Examples:

The argument ((1 2) a) means number 1 and 2 will be replaced with a.

(replace-map '(((1 2) a) ((3 4 5) b)) '(1 2 3 4 5 4 5 3 2 3))
=> (a a b b b b b b a b)

The :otherwise keyword with an argument 'd replaces all items in the sequence with
'd which are not mapped.

(replace-map '(((1 2) a) ((3 4 5) b) ((6 11) c))
             '((0 1 2 3 4 5) (6 7 8 9 10 11))
             :otherwise 'd)
=> ((d a a b b b) (c d d d d c))
