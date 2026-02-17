Opusmodus                                                                gen-length-constant   1

gen-length-constant numerator span &key rnd-order
                                 rnd-rest-order seed omn

[Function]

Arguments and Values:
numerator               a list of numerators to generate note-lengths.
span                    a list span.
rnd-order               NIL or T. The default is NIL.
rnd-rest-order          NIL or T. The default is NIL.
seed                    NIL or an integer (random seed). The default is NIL.
omn                     NIL or T. If true force OMN style output. The default is NIL.


Description:

GEN-LENGTH-CONSTANT is a powerful tool for generating series of length values by
multiplying a list of numerators with the denominator value which is the result of the
span value divided by the sum of the numerators.

Lets examine the expression below:

(gen-length-constant '(1 2 -2 5) 'h)

The sum of the numerators (1 2 -2 5) is 10.
The span 'h is 1/2.
To get the denominator value of our list we divide the span 1/2 by 10:

(/ 1/2 10)
=> 1/20

The denominator here is 20.

The expression above returns:
(1/20 1/10 -1/10 1/4)


Examples:
(gen-length-constant '(1 2 -2 5) 'h)
=> (1/20 1/10 -1/10 1/4)

:rnd-order T randomise the order of the numerators list:

(gen-length-constant '(1 2 -2 5) 'h :rnd-order t)
=> (1/4 1/10 1/20 -1/10)
Opusmodus                                                  gen-length-constant   2

:rnd-rest-order T randomise the position of the rest symbol:

(gen-length-constant '(1 2 -2 5) 'h :rnd-rest-order t)
=> (-1/20 1/10 1/10 1/4)

(gen-length-constant '(1 2 -2 5) 'h :rnd-order t :rnd-rest-order t)
=> (-1/4 1/10 1/10 1/20)

(gen-length-constant
 (gen-repeat 12 '((3 -2 5))) 'h :rnd-order t :rnd-rest-order t)
=> ((-3/20 1/10 1/4) (1/10 -3/20 1/4) (3/20 -1/10 1/4)
    (-1/4 3/20 1/10) (-1/4 1/10 3/20) (1/10 1/4 -3/20)
    (3/20 -1/4 1/10) (1/4 -3/20 1/10) (-1/10 3/20 1/4)
    (1/4 3/20 -1/10) (-3/20 1/10 1/4) (1/4 -3/20 1/10))

Examples with list of span values:

(gen-length-constant
 (gen-repeat 6 '((3 -2 5))) '(q q h h w h)
 :rnd-order t :rnd-rest-order t)
=> ((-1/8 1/20 3/40) (3/40 1/8 -1/20) (1/4 -3/20 1/10)
    (-1/4 3/20 1/10) (1/2 1/5 -3/10) (-1/4 3/20 1/10))

(gen-length-constant
 (gen-repeat 6 '((2 3 2 -3 2)))
 '(h h w h w w) :rnd-order t)
=> ((-1/8 1/12 1/12 1/12 1/8) (1/12 1/12 1/8 -1/8 1/12)
    (1/6 1/6 1/4 1/6 -1/4) (-1/8 1/12 1/12 1/8 1/12)
    (1/6 1/6 1/6 -1/4 1/4) (1/6 1/4 -1/4 1/6 1/6)
    (1/12 1/8 -1/8 1/12 1/12) (1/12 1/12 1/12 1/8 -1/8)
    (-1/4 1/6 1/6 1/6 1/4) (1/8 -1/8 1/12 1/12 1/12)
    (1/4 1/6 -1/4 1/6 1/6) (1/6 1/6 1/4 -1/4 1/6))
