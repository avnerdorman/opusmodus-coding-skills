Opusmodus                                                                                           span   1

span pattern items &key flat swallow
[Function]

Arguments and Values:
span                      (pattern list(s) of pattern to span to.
items                     list(s) or input material to span.
swallow                   NIL or T. T will remove item list if pattern list equal to empty lists.
flat                      NIL or T. Use :flat T to atten sublists of prior to spanning.
                          The default in NIL.


Description:

SPAN is a powerful function for organising material, and is especially useful to create lists of
pitches which align with length lists. Here's a preliminary example:

(setf seq-1 (rnd-sample 15 '(c4 cs4 d4 fs4 g4 gs4 c5)))
=> (gs4 g4 g4 fs4 c4 cs4 fs4 c5 g4 gs4 c4 cs4 d4 c5 g4)

(span seq-1 '(e))
=> (1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8
    1/8 1/8 1/8 1/8 1/8 1/8 1/8)

(setf bass-1 (find-everyother 5 seq-1))
=> (gs4 cs4 c4)

(span bass-1 '(q._q))
=> (5/8 5/8 5/8)

(setf chord-1 (gen-trim 3 (gen-chord 12 3 4 -5 7 seq-1 :seed 31)))
=> (f4e4eb4 cs4d4g4 g5d5eb5)

(span chord-1 '(q. q))
=> (3/8 1/4 3/8)



Examples:

For example, we might have the following rhythm:

(setf my-rhythm '(e = - = - = = =))

And the following pitch data:

(setf my-pitches '(c4 g4 f4))
                                               fl
Opusmodus                                                                              span      2

To successfully align our pitches and rhythms we would need to extend - or SPAN - the
number of pitches to match the number of rhythms. Discounting the rests, we would need 6
pitches in total.

(span my-rhythm my-pitches)
=> (c4 g4 f4 c4 g4 f4)

(gen-swallow my-rhythm my-pitches)
=> (c4 g4 c4 f4 c4 g4)

Notice the difference between the outputs of the two forms.

This might now be combined into an OMN fragment, for example:

(make-omn :length my-rhythm
          :pitch my-pitches)
=> (e c4 g4 - f4 - c4 g4 f4)

Span a single list of pitches to a single list of lengths:

(span '(q = - e =) '(c4 e4 g4))
=> (c4 e4 g4 c4)

Span multiple lists:

(span '((q =) (e =) (q)) '((c4 e4) (g4) (d4 f4 a4)))
=> ((c4 e4) (g4 g4) (d4))

Use :flat T to atten the input list prior to spanning:

(span '((q =) (e =) (q)) '((c4 e4) (g4) (d4 f4 a4)) :flat t)
=> ((c4 e4) (g4 d4) (f4))

Note that if no spanning occurs in a given list, the spanned elements will be held over to the
next list:

(span '((q =) (-q) (e =)) '((c4 e4) (g4) (d4 f4 a4)))
=> ((c4 e4) nil (g4 g4))

If :swallow name parameter is used and no spanning occurs in a given list then NIL is
returned:

(span '((q =) (-q) (e =))
      '((c4 e4) (g4) (d4 f4 a4)) :swallow t)
=> ((c4 e4) nil (d4 f4))
            fl
Opusmodus                                                                        span   3

Lengths to pitches:

(span '((c4 e4) (g4) (d4 f4 a4)) '((e) (q) (e q)))
=> ((e e) (q) (e q e)

Velocities to pitches:

(span '((c4 e4) (g4) (d4 f4 a4))
      '((mp) (mf) (pp mp)))
=> ((mp mp) (mf) (pp mp mp))

Any type of value can be used by SPAN, for example: pitches to abstract items:

(span '((a b c d) (e f g) (h i j k))
      '((c4 e4) (g4) (d4 f4 a4)))
=> ((c4 e4 c4 e4) (g4 g4 g4) (d4 f4 a4 f4))

Items to items:

(span '((a b c d) (e f g) (h i j k))
      '((a b) (c) (d e f)))
=> ((a b a b) (c c c) (d e f d))
