Opusmodus                                                                         gen-morph    1

gen-morph step set1 set2 &key seed
[Function]

Arguments and Values:
step                      an integer.
set1                      a list.
set2                      a list.
seed                      an integer or NIL. The default is NIL.


Description:

This function is used to gradually replace items in one list with items from another.

(gen-morph 3 '(c4 cs4 fs4 g4 c5) '(b2 c3 f3 fs3 b3))
=> ((c4 cs4 fs4 g4 c5)
    (b2 c3 fs4 g4 c5)
    (b2 c3 f3 fs3 b3))

This technique is commonly known as morphing and is used in special visual effects. The
function has similarities with GEN-CROSSOVER.


Examples:
(gen-morph 7 '(1 2 3 4 5 6) '(a b c d e f))
=> ((1 2 3 4 5 6)
    (a 2 3 4 5 6)
    (a 2 3 4 e 6)
    (a 2 3 d e 6)
    (a 2 c d e 6)
    (a 2 c d e f)
    (a b c d e f))

(gen-morph 7 '(c4 d4 e4 f4 g4 a4) '(cs4 ds4 fs4 gs4 as4 c5))
=> ((c4 d4 e4 f4 g4 a4)
    (c4 d4 e4 gs4 g4 a4)
    (c4 d4 e4 gs4 as4 a4)
    (cs4 d4 e4 gs4 as4 a4)
    (cs4 d4 e4 gs4 as4 c5)
    (cs4 d4 fs4 gs4 as4 c5)
    (cs4 ds4 fs4 gs4 as4 c5))

The function GEN-MORPH is at the heart of a short piece for sextet called Sextet-Tonality in
the Score Examples/Sextet Studies. Here the function is used to 'morph' one tonality into
another.
Opusmodus                                                                       gen-morph     2

(setf wholetone-1 '(0 2 4 6 8 10))
(setf wholetone-2 '(1 3 5 7 9 11))

(setf wt-series (gen-morph 7 wholetone-1 wholetone-2))
=> ((0 2 4 6 8 10)
    (0 2 4 6 8 11)
    (0 2 4 7 8 11)
    (1 2 4 7 8 11)
    (1 2 4 7 9 11)
    (1 2 5 7 9 11)
    (1 3 5 7 9 11))

In effect ve new tonalities are created between the two positions of the whole-tone scales.

OMN:

(gen-morph 7 '(e d4 f eb4 fs4 g4 a4 bb4)
             '(3q c5 mp b4 a4 e fs4 f5 ds4 e5 c5) :seed 45)
=> ((e d4 f eb4 fs4 g4 a4 bb4)
    (e d4 f eb4 fs4 ds4 mp a4 f bb4)
    (e d4 f eb4 f5 mp ds4 a4 f bb4)
    (e d4 f eb4 f5 mp ds4 a4 f c5 mp)
    (e d4 f fs4 mp f5 ds4 a4 f c5 mp)
    (3q c5 mp b4 a4 e fs4 f5 ds4 a4 f c5 mp)
    (3q c5 mp b4 a4 e fs4 f5 ds4 e5 c5))
  fi
