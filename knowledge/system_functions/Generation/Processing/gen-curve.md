     Opusmodus                                                                          gen-curve    1

     gen-curve start direction sequence
                     &key encode section exclude type span flat

     [Function]

     Arguments and Values:
     start                   a symbol: 'a (ascending) 'd (descending) or '? (at random).
     direction               a symbol: 'i (inner), 'o (outer) or '? (at random).
     sequence                a sequence.
     encode                  T or NIL. With :encode T (the default) the function transforms OMN repeat
                             symbols (=) into its values, while :encode NIL returns selections
                             unchanged.
     section                 an integer or list of integers. Selected list or lists to process.
                             The default is NIL.
     exclude                 an integer or list of integers. Excluded list or lists from process.
                             The default is NIL.

     OMN:
     type                    :pitch, :length or :velocity. The default is NIL.
     span                    :length, :pitch or :velocity. The default is :length.
     flat                    NIL or T (sublist atten when span). The default is NIL.


     Description:

     The function GEN-CURVE returns a list de ned on inner or outer sequential direction. In
     the rst example notice the 'outward' sequence of numerical difference as it gets larger
     between the each integer in the output stream '(1 2 3 4 5 6 7 8 9). In the second
     the sequence is reversed, the numerical difference gets smaller as it progresses giving an
     'inward' movement.

     (gen-curve 'a 'o '(0 1 2 3 4 5 6 7 8 9))
     => (4 5 3 6 2 7 1 8 0 9)

     (gen-curve 'a 'i '(0 1 2 3 4 5 6 7 8 9))
     => (0 9 1 8 2 7 3 6 4 5)

     At random:

     (gen-curve '? '? '(0 1 2 3 4 5 6 7 8 9))
     => (5 4 6 3 7 2 8 1 9 0)
     . . .
fi
                                      fl
                                           fi
Opusmodus                                                                             gen-curve       2

Examples:
(gen-curve 'd 'o '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4))
=> (fs4 f4 g4 e4 gs4 ds4 a4 d4 as4 cs4 b4 c4)

(gen-curve 'd 'i '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4))
=> (b4 c4 as4 cs4 a4 d4 gs4 ds4 g4 e4 fs4 f4)

(gen-curve '(d a) '(i o) '((1 2 3 4 5 6 7 8 9) (1 2 3 4 5)))
=> ((9 1 8 2 7 3 6 4 5) (3 4 2 5 1))

(gen-curve '(d a) '(i o) '((1 2 3 4 5 6 7 8 9) (1 2 3 4 5))
             :section 0)
=> ((9 1 8 2 7 3 6 4 5) (1 2 3 4 5))

(setf mat '((s b4 mf e5 g5 g4 b4 e5 e4 g4 b4 b3 e4 g4)
            (s e5 mf a4 fs4 a4 fs4 e4 fs4 e4 a3)
            (s a3 mf eb4 fs4 eb4 fs4 a4 fs4 a4 eb5)))


         = 120




                                                                                                  OPUSMODU
(gen-curve '(d a) '(i o) mat)
=> ((s g4 mf b4 e4 e5 b3 g5 b4 g4 g4 b4 e4 e5)
    (s fs4 mf e4 a4 fs4 fs4 e4 a4 a3 e5)
    (s eb5 mf a3 a4 eb4 fs4 fs4 a4 eb4 fs4))


            = 120




                                                                                                      OPUSMOD
These examples below focus on the rst pattern in Slonimsky's Thesaurus of Scales and
Musical Patterns. Known as sl-1 '(c4 cs4 fs4 g4 c5) is a ambiguous pattern
centred on the tritone interval. If your source material in integers or pitches is scalic then it's
fairly straightforward to predict how the scale can be modi ed.
                                fi
                                                        fi
Opusmodus                                                     gen-curve   3

(gen-curve 'a 'o '(c4 cs4 fs4 g4 c5))
=> (fs4 g4 cs4 c5 c4)

(gen-curve 'a 'i '(c4 cs4 fs4 g4 c5))
=> (c4 c5 cs4 g4 fs4)


(gen-curve 'd 'o '(c4 cs4 fs4 g4 c5))
=> (fs4 cs4 g4 c4 c5)

(gen-curve 'd 'i '(c4 cs4 fs4 g4 c5))
=> (c5 c4 g4 cs4 fs4)

(gen-curve '(d a) '(i o) '((c4 cs4 fs4 g4 c5) (c4 f4 fs4 b4 c5)))
=> ((c5 c4 g4 cs4 fs4) (fs4 b4 f4 c5 c4))

(gen-curve '(? a) '(i ?) '((c4 cs4 fs4 g4 c5) (c4 f4 fs4 b4 c5)))
=> ((c5 c4 g4 cs4 fs4) (fs4 b4 f4 c5 c4))
