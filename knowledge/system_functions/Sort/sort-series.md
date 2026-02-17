Opusmodus                                                                                  sort-series   1

sort-series sort sequence &key type section exclude seed
[Function]

Arguments and Values:
sort                          A list of sort-types: 'a (ascending) 'd (descending) or '? (at random).
sequence                      a list or lists of any type.
type                          NIL, :pitch, :length or :velocity. The default is NIL (all).
section                       an integer or list of integers. Selected list or lists to process.
                              The default is NIL.
exclude                       an integer or list of integers. Excluded list or lists from process.
                              The default is NIL.
seed                          an integer or NIL. The default is NIL.


Description:

The function SORT-SERIES can be used to sort a series of sublists of any types
according to a template. To sort the rst list into ascending 'a order and the second two
into descending 'd order we could evaluate the following:

(sort-series '(a d) '((4 6 2 3) (8 6 9 2) (4 6 3 7) (6 4 7 1)))
=> ((2 3 4 6) (9 8 6 2) (3 4 6 7) (7 6 4 1))

(sort-series '(a d d) '((4 6 2 3) (8 6 9 2) (4 6 3 7)))
=> ((2 3 4 6) (9 8 6 2) (7 6 4 3))

(sort-series 'd '(gb3 g4ab5))
=> (ab5g4 gb3)

(sort-series '? '(gb3 g4ab5))
=> (gb3 g4ab5) or (ab5g4 gb3)


Examples:

Sort only certain sublists:

(sort-series '(a d) '((4 6 2 3) (8 6 9 2) (4 6 3 7) (6 4 7 1))
              :section '(0 2 3))
=> ((2 3 4 6) (8 6 9 2) (3 4 6 7) (7 6 4 1))

OMN sort:

(sort-series '(a d) '((e c5 gb3 q g4 ab5) (h c4 d4 q e4 f4 e g4 a4)))
=> ((e gb3 g4 q c5 ab5) (h a4 g4 q f4 e4 e d4 c4))
                                     fi
Opusmodus                                                                    sort-series   2

OMN sort :type :length:

(sort-series '(d a) '((e c5 gb3 q g4 ab5) (h c4 d4 q e4 f4 e g4 a4))
             :section '(1) :type :length)
=> ((e c5 gb3 q g4 ab5) (e c4 d4 q e4 f4 h g4 a4))

When composing arpeggio passages for piano or harp this function is likely to prove
invaluable.

(setf white-pitch
      (gen-divide (rndn 10 1 7)
                  (rnd-sample 30 (vector-to-pitch '(g3 b4)
                                 (gen-noise 30)))))

(sort-series '(a d a d a a a d a) white-pitch)
=> ((a3 b3) (g4 a3) (a3 gb4 b4) (b4 eb4 a3)
       (ab3 a3 a3 gb4 b4) (ab3 ab3 a3 eb4 g4)
       (g3 ab3 a3 a3 b3 b4) (gb4 eb4 ab3) (a4))
