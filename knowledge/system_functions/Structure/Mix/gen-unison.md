Opusmodus                                                                             gen-unison   1

gen-unison lists &key unison prob section exclude seed
[Function]

Arguments and Values:
lists                   lists of items
unison                  NIL or list of integers. The default is NIL (random unison number).
prob                    a oating-point number (probability value) between 0.0 and 1.0.
                        The default is 0.5.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.
seed                    NIL or integer. The default is NIL.


Description:

The function GEN-UNISON will generate series of groups based on the random distribution
of values from a lists. With an :unison value of (1), all four groups will output in
unison.

(setf v1 '(c4 e4 g4 c5))
(setf v2 '(e4 c4 g5 e5))
(setf v3 '(g4 e4 c4 c5))
(setf v4 '(c5 g4 e4 c4))

(gen-unison (list v1 v2 v3 v4) :unison '(1))
=> ((c4 e4 g4 c5)
    (c4 e4 g4 c5)
    (c4 e4 g4 c5)
    (c4 e4 g4 c5))

(gen-unison (list v1 v2 v3 v4) :unison '(1 2))
=> ((c4 e4 g4 c5)
    (c4 c4 g4 c5)
    (c4 e4 g4 c5)
    (c4 c4 g4 c5))

(gen-unison (list v1 v2 v3 v4) :unison '(1 3))
=> ((c4 e4 c4 c4)
    (c4 g4 c4 e5)
    (c4 e4 c4 e5)
    (c4 c4 c4 c5))
                   fl
Opusmodus                                                                        gen-unison   2



Examples:

In these examples lists are created with integers as well as pitches. This is to illustrate
how GEN-UNISON function works and how it can be used to create unison voices.

(setf
 v1 '(1 2 3 4)
 v2 '(5 6 7 8)
 v3 '(9 10 11 12)
 v4 '(13 14 15 16))

(gen-unison (list v1 v2 v3 v4))
=> (( 1 14 15 12)
    ( 9 6 11 16)
    (13 2 3 4)
    ( 5 14 3 8))

In the example above see how the function rearranges each list to produce unison moments.

(gen-unison
 (list
  '((c5) (cs4) (d4) (eb4))
  '((e4) (f4) (g4) (gs4))
  '((a4) (bb4) (b4) (c5))
  '((cs5) (d5) (eb5) (e5)))
 :unison '(1 2 3 1) :seed 125)
=> (((a4) (f4) (d4) (gs4))
    ((a4) (f4) (eb5) (gs4))
    ((a4) (bb4) (b4) (gs4))
    ((a4) (bb4) (d4) (gs4)))

In this example above the composer has control over the frequency and position of unisons.
At the present time this function can only address instruments of a similar pitch. The
examples shown here for four violins would not work with a string quartet.
