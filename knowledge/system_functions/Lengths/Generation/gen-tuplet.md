Opusmodus                                                                               gen-tuplet   1

gen-tuplet low high divide rest measure tuplet &key times omn seed
[Function]

Arguments and Values:
low                      lower multiplier.
high                     upper multiplier.
divide                   'n (none), 'd (divide) or '? (at random).
rest                     length-rest position: 's (start), 'e (end), 'c (centre), 'o (outer),
                         '? (at random) or'n (none).
measure                  tuplet span.
tuplet                   tuplet size.
times                    NIL or an integer (multiplication).
omn                      NIL or T. If true force OMN style output. The default is NIL.
seed                     NIL or an integer (random seed). The default is NIL.


Description:

GEN-TUPLET allows for the generation of complex rhythms based on division of larger
values into tuplets. This is a further function like GEN-LENGTH-CARTESIAN allowing
complex note-length phrases to be constructed, particularly when synchronising with pitch
phrases.

(setf pitch (gen-divide '(2 5 7) (rnd-sample 20 '(c4 cs4 fs4 g4 c5))))
=> ((g4 fs4) (cs4 cs4 g4 cs4 c5)
    (cs4 fs4 c5 g4 c5 fs4 fs4)
    (c5 c5) (g4 c4 c4 cs4))

(gen-tuplet 1 1 'n 'n 'q (mclength pitch)) ;(2 5 7 2 4)
=> ((1/8 1/8)
    (1/20 1/20 1/20 1/20 1/20)
      (1/28 1/28 1/28 1/28 1/28 1/28 1/28)
      (1/8 1/8)
      (1/16 1/16 1/16 1/16))


Examples:

This code will create a single triplet 3 from a quarter-length note (measure) 'q:

(gen-tuplet 1 1 'n 'n 'q 3)
=> (1/12 1/12 1/12)
Opusmodus                                                                        gen-tuplet      2

We could also create a quintuplet:

(gen-tuplet 1 1 'n 'n 'q 5)
=> (1/20 1/20 1/20 1/20 1/20)

Note that GEN-TUPLET can also create rests within the tuple. You can specify where you
would like the rests by changing the rest position argument. Currently it is 'n (none). To
have rests on the outside of the tuple we could change it to 'o (outer):

(gen-tuplet 1 1 'n 'o 'q 5)
=> (-1/20 1/20 1/20 1/20 -1/20)

Or in the centre:

(gen-tuplet 1 1 'n 'c 'q 5)
=> (1/20 1/20 -1/20 1/20 1/20)

Note that in the above examples, the divide argument is set to 'n (no division). In the above
example, this will only ever yield a quintuplet.

To make more interesting rhythms, we can set this to 'd to control how the basic tuplet is
divided up. To do this, we need to add the low and high arguments. If, for example we use
low = 1 and high = 2 on our quintuplet this allows our basic value (1/20) to be multiplied
by either 1 (giving a 1/20 length) or 2 (giving a 1/10 length). We can therefore create
more interesting tuplets to a given duration by introducing this form of variation:

(gen-tuplet 1 2 'd 'n 'q 5)
=> (1/20 1/10 1/10)

We can also use lists for many of the arguments. For example, here is a series of quarter-
notes variously divided:

(gen-tuplet 1 1 'n 'n 'q '(5 3 4))
=> ((1/20 1/20 1/20 1/20 1/20)
      (1/12 1/12 1/12)
      (1/16 1/16 1/16 1/16))

And here is the same series, but with more interesting divisions, using the 'd    ag:

(gen-tuplet 1 3 'd 'n 'q '(5 3 4))
=> ((1/10 1/10 1/20) (1/12 1/6) (1/16 3/16))

We could also use a list for the denominator values, here an alternating series of quarter and
half lengths are divided by 5, 3 and 4:

(gen-tuplet 1 3 'd 'n '(q h) '(5 3 4))
=> ((1/10 1/10 1/20) (1/3 1/6) (1/16 3/16))
                                                                          fl
Opusmodus                                                                             gen-tuplet          3

A list can also be introduced to control the distribution of rests:

(gen-tuplet 1 3 'd '(s c o) '(q h) '(5 3 4))
=> ((-1/20 -1/20 1/20 1/10) (1/6 -1/6 1/6)
    (-1/16 -1/16 1/16 -1/16))

The above examples have all used very simple length values as denominators, but any
fraction can be used:

(setf rhythms (gen-tuplet 1 1 'n 'n '(1/4 3/8 1/2) '(5 3 5)))
=> ((1/20 1/20 1/20 1/20 1/20) (1/8 1/8 1/8)
    (1/10 1/10 1/10 1/10 1/10))

One powerful use of GEN-TUPLET is to generate pre-compositional rhythmic material. For
example, quickly creating many variations on a given rhythmic phrase:

(gen-tuplet 1 5 'd '? '(q q h)
            '((4 3 4) (5 4 7) (2 5 8) (5 5 5)))
=> ((3/16 -7/48 1/6 1/4 -1/4) (-1/5 1/20 1/8 -19/56 1/7 1/7)
    (-1/8 1/8 3/20 -1/10 1/16 3/16 1/16 -1/16 1/8)
    (-1/10 3/20 1/20 -1/20 3/20 -3/10 1/10 1/10))

Generate variations using random divisions of tuplets in OMN-style output:

(gen-tuplet 1 3 'd 'n 'q '(5 3 4) :omn t :seed 254)
=> ((5h 5qqq) (3q 3h) (e. s))

Multiply factors to create variations:

(gen-tuplet 1 3 'd 'n 'q '(5 3 4) :times 2 :omn t :seed 345)
=> ((5hhh 5w) (3h 3w) (q. e))

(gen-tuplet 1 3 'd
              '(s n e n e n n ? n n s n n s n s s)
              '(q q q e e q q q q q q e e q q q q)
              '(5 1 8 4 0 3 0 5 1 1 5 4 4 3 3 5 5)
              :times 2 :seed 45)

            5        5   2        3                4        5   6        3   7    8   5            5




   9            10           11   5            5       12           13       14                3




  15                     3            16   5                5       17   5                5




                                                                                              Opusmodus
Opusmodus                                                                                                      gen-tuplet          4

(setf length
        (gen-tuplet 1 3
                  '((d n (n d)) n n n d d d n n n d n n d)
                    '((s n (s n)) e n n ? n n s o n s n s s)
                    '((q q (e e)) e q q q q q e e q q q q q)
                    '((3 1 (5 5)) 3 4 0 5 5 3 5 4 4 0 3 5 5)
                    :times '(1 2 1) :seed 45))

                                          5          5             3
               5        5                                 2                  3              4        5     5             5




                                      3                        5
  6                5        7                  8                             9                  10




                                                                        5                       5
  11                   12             3             13                                 14                            5




                                                                                                                     Opusmodus




(length-list-plot (flatten length)
 :point-radius 2 :style :fill)


      3/83/8

      1/41/4

      1/81/8

       00
                       55       10
                                 10           15
                                               15        20
                                                          20           25
                                                                        25       30
                                                                                  30    35
                                                                                         35          40
                                                                                                      40       45
                                                                                                                45           50
                                                                                                                              50
  -1/8-1/8

  -1/4-1/4

  -3/8-3/8

  -1/2-1/2
