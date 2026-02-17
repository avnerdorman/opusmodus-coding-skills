Opusmodus                                                                                   gen-length   1

gen-length numerator denominator &key rnd-order repeat omn seed
[Function]

Arguments and Values:
numerator                   an integer, a list of numerators to generate note-lengths.
denominator                 an integer, a denominator, can be a list.
rnd-order                   NIL or T. If true reorder each sublist. The default is NIL.
repeat                      an integer - repetitions of each denominator value. The default is 1.
omn                         NIL or T. If true force OMN style output. The default is NIL.
seed                        NIL or an integer (random seed). The default is NIL.


Description:

GEN-LENGTH is a powerful tool for generating series of length values by multiplying a list
of denominators (base note lengths) with numerators.


Examples:
(gen-length '(1 2 4 8) 32)
=> (1/32 1/16 1/8 1/4)

The denominator does not have to be xed, but can be a list. In this case, each item in the
denominator list will be applied to the numerators in turn:

(gen-length '(1 2 4 8) '(4 8))
=> ((1/4 1/2 1 2) (1/8 1/4 1/2 1))

A list of denominators evaluated against a series of numerator sublists will apply the
denominator to each sublist:

(gen-length '((1 2 1) (1 1 2 4)) '(4 8))
=> ((1/4 1/2 1/4) (1/8 1/8 1/4 1/2))

Using rest-length values:

(gen-length '((1 2 1 2 1 1) (1 -3 1 -3 2 -2 4)) '(16 32))
=> ((1/16 1/8 1/16 1/8 1/16 1/16)
    (1/32 -3/32 1/32 -3/32 1/16 -1/16 1/8))
                                       fi
Opusmodus                                                                     gen-length   2

If the number of denominators exceeds the numerators, then the numerators will repeat to
span the denominators:

(gen-length '(1 2 1 2 1 2) '(8 16))
=> ((1/8 1/4 1/8 1/4 1/8 1/4)
    (1/16 1/8 1/16 1/8 1/16 1/8))

Generate lengths from a list of denominators and sublists of numerators in OMN-style
output:

(gen-length '((1 2) (4 8)) '(4 8) :omn t)
=> ((q h) (h w))

Randomise the order of each sublist:

(gen-length '((1 2 1 2) (4 8 2 4)) '(4 8 4 16) :rnd-order t :omn t)
=> ((q h q h) (h w h q) (q = h =) (q e q h))

Set a random seed for re-ordering:

(gen-length '((1 2 1 2) (4 8 2 4)) '(4 8 4 16)
            :rnd-order t :omn t :seed 32)
=> ((h q = h) (w h q h) (q = h =) (h q e q))

Repeat the denominator list:

(gen-length '((1 2) (4 8)) '(4 8) :repeat 2)
=> ((q h) (q h) (h w) (h w))
