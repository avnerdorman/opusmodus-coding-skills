Opusmodus                                                                       interpolation   1

interpolation model row &key flatten type
[Function]

Arguments and Values:
model                            lists of integers.
row                              integer or pitch set.
type                             :integer or :pitch. The default is :integer.
flatten                          NIL or T. The default is NIL.


Description:

INTERPOLATION usually means the adding in of notes to a collection or row. In
Opusmodus the function INTERPOLATION extends this idea by making it it possible for the
outcome of the interpolation of two pitch or integer rows be grouped. This grouping into sets
is set by the composer.

Schoenberg's pupil Adolph Weiss catalogued 9 ways of varying a musical motive:

     1.           changing the intervals and/or notes but holding the rhythms
     2.           changing the rhythm and holding notes and/or intervals
     3.           simultaneous combination of these two
     4.           inversion
     5.           augmentation
     6.           diminution
     7.           elision
     8.           interpolation
     9.           retrograde

Here is a simpli ed example with the sources of the output indicated.

(interpolation
 '((2 2 2) (2 2 2)) '((1 2 3 4 5 6 7 8) (9 10 11 12 13 14 15 16)))
=> ((1 2) (9 10) (3 4) (11 12) (5 6) (13 14) (7 8) (15 16))

(interpolation
 '((2 2 2) (4 4 4)) '((1 2 3 4 5 6 7 8) (9 10 11 12 13 14 15 16)))
=> ((1 2) (9 10 11 12) (3 4) (13 14 15 16) (5 6) (7 8))

(interpolation
 '((2 2 2) (2 2 2)) '((1/4 2/8 4/16 1/4) (6/8 1/2 2/4 1/2)))
=> ((1/4 1/4) (3/4 1/2) (1/4 1/4) (1/2 1/2))
             fi
Opusmodus                                                             interpolation     2

(interpolation
 '((3 2 1) (1 1 2 4))
 '((c4 cs4 d4 e4 fs4 as4 eb4 f4 g4 gs4 a4 b4)
   (gs4 b4 f4 g4 eb4 a4 fs4 cs4 bb4 c4 e4 d4)) :type :pitch)

=> ((c4 db4 d4) (ab4) (e4 gb4) (b4) (bb4) (f4 g4) (eb4 f4 g4)
;    1           2     1        2    1     1       1

         (eb4 a4 gb4 db4) (ab4 a4) (bb4) (b4) (c4) (e4 d4))
;         2                1        2     1    2    2



Examples:
(interpolation
 '((3 2 1 1 1 1 3) (1 1 2 4 1 3))
 '((c4 cs4 d4 e4 fs4 as4 eb4 f4 g4 gs4 a4 b4)
   (gs4 b4 f4 g4 eb4 a4 fs4 cs4 bb4 c4 e4 d4)) :type :pitch)
=> ((c4 db4 d4) (ab4) (e4 gb4) (b4) (bb4) (f4 g4) (eb4)
    (eb4 a4 gb4 db4) (f4) (bb4) (g4) (c4 e4 d4) (ab4 a4 b4))

(interpolation
 '((3 2 1 1 1 1 3) (1 1 2 4 1 3))
 '((c4 cs4 d4 e4 fs4 as4 eb4 f4 g4 gs4 a4 b4)
   (gs4 b4 f4 g4 eb4 a4 fs4 cs4 bb4 c4 e4 d4)) :flatten t)
=> (0 1 2 8 4 6 11 10 5 7 3 3 9 6 1 5 10 7 0 4 2 8 9 11)

(interpolation
 '((3 2 1 1 1 1 3) (1 1 2 4 1 3) (3 1 1 1 1 2 3))
 '((c4 cs4 d4 e4 fs4 as4 eb4 f4 g4 gs4 a4 b4)
   (gs4 b4 f4 g4 eb4 a4 fs4 cs4 bb4 c4 e4 d4)
   (e4 bb4 cs4 eb4 f4 d4 gb4 gs4 a4 b4 g4 c4)))
=> ((0 1 2) (8) (4 10 1) (4 6) (11) (3) (10) (5 7)
    (5) (3) (3 9 6 1) (2) (5) (10) (6) (7) (0 4 2)
    (8 9) (8 9 11) (11 7 0))

(interpolation
 '((4 4 4) (2 2))
 '((c4 cs4 d4 e4 fs4 as4 eb4 f4 g4 gs4 a4 b4)
   (gs4 b4 f4 g4 eb4 a4 fs4 cs4 bb4 c4 e4 d4))
 :flat t :type :pitch)
=> (c4 db4 d4 e4 ab4 b4 gb4 bb4 eb4 f4 f4 g4
    g4 ab4 a4 b4 eb4 a4 gb4 db4 bb4 c4 e4 d4)

Note that the set grouping do not follow sequentially but are picked according to the
algorithm that decides the ow of the INTERPOLATION. This short example below shows
how with atten a single list can be developed.
    fl
                    fl
Opusmodus                                                                      interpolation   3

(setf
 mel-1 (rnd-sample 12 '(c4 cs4 fs4 g4 c5))
 mel-2 (rnd-sample 12 '(c3 f3 fs3 b3 c4))
 )

(interpolation '((1) (3)) (list mel-1 mel-2) :type :pitch :flatten t)

Output with and without atten. As mel-1 is set to a single list only it's possible to see exactly
how the interpolation is arranged.

=> (gb4 c4 b3 g4 gb3 f3 c5 f3 gb3 db4 f3 f3
    g4 b3 f3 db4 c3 b3 c5 c5 c4 c4 c5 db4)

=> ((gb4) (c4 b3 gb3) (g4) (f3 f3 gb3) (c5) (f3 f3 b3) (db4)
    (f3 c3 b3) (g4) (db4) (c5) (c5) (c4) (c4) (c5) (db4))
                   fl
