Opusmodus                                                                           interval-ambitus   1

interval-ambitus max-size sequence &key flatten ambitus
                            start section exclude

[Function]

Arguments and Values:
max-size                 an integer.
sequence                 a sequence (interval, pitch or omn-form).
flatten                  T or NIL. The default is NIL.
ambitus                  integers (low high), pitches (low high) or instrument-name.
                         The default is 'piano.
start                    an integer or pitch symbol. The default is 0 (c4).
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

This interval function provides a way of restricting interval content via an :ambitus
operation. If the composer is using interval lists to devise new material this could be away of
keeping wide intervals in check.

(interval-ambitus 14 23)
=> 11

(interval-ambitus 14 '(-12 3 -17 23))
=> (-12 3 -5 11)

(interval-ambitus 14 '(-12 3 (-17 23)))
=> (-12 3 (-5 11))

(interval-ambitus 14 '((-12 3) (-17 23)) :start 'fs1)
=> ((0 3) (-5 11))

(interval-ambitus
 13 '((2 -2 2 24 31 -25 (-19 6)) ((13 -9) -1 2 -1 -25 0 13 6 -16 7 11)))
=> ((2 -2 2 12 7 -13 (-7 6)) ((13 -9) -1 2 -1 -13 0 13 6 -4 7 11))

OMN:

(interval-ambitus
 7 '((-w) (e c3 d3 b3 g3 a3 f4 d4 c4) (e b3 a3 d3 e3 h g3)))
=> ((-w) (e c3 d3 b2 g2 a2 f2 d2 c2) (e b3 a3 d3 e3 h g3))
Opusmodus                                                                interval-ambitus      2

Example with :flatten option:

(interval-ambitus 7 '((h d5 -q) (q b5 c5 d5 c5)) :flatten t)
=> ((h d5 -q) (q b4 c5 d5 c5))

(interval-ambitus 7 '((h d5 -q) (q b5 c5 d5 c5)))
=> ((h d5 -q) (q b5 c6 d6 c6))


Examples:

Here's a short example of how INTERVAL-AMBITUS might be used. A sequence of
intervals is generated then reorganised by GEN-CURVE. The :ambitus operation then
makes a second row where the interval restriction on the list is a fth. Notice that whatever
the corresponding :ambitus intervals are on each row they will add up to 12. Both rows
are then interleaved with the result that a sequence of octaves and unisons of the original
row are created.

(setf int-row (gen-curve 'd 'o '(0 2 3 4 6 8 10 11 12 14 16)))
=> (8 6 10 4 11 3 12 2 14 0 16)

(setf int-edit (interval-ambitus 7 int-row))
=> (-4 6 -2 4 -1 3 0 2 2 0 4)

(integer-to-pitch (gen-combine int-row int-edit))
=> ((gs4 gs3) (fs4 fs4) (bb4 bb3) (e4 e4) (b4 b3)
    (eb4 eb4) (c5 c4) (d4 d4) (d5 d4) (c4 c4) (e5 e4))
                                                          fi
