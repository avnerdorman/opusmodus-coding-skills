Opusmodus                                                              gen-symmetrical   1

gen-symmetrical n sequence &key repeat seed
[Function]

Arguments and Values:
n                       an integer. Number of return values.
sequence                a sequence.
repeat                  NIL or T. The default is NIL.
seed                    NIL or number. The default is NIL.


Description:

This function generates a series of symmetrical ordered values of a given sequence.

(gen-symmetrical 24 '(1 2 3 4 5 6))
=> (5 2 6 2 3 2 1 5 2 3 5 4 4 5 3 2 5 1 2 3 2 6 2 5)

(gen-symmetrical 24 '(1 2 3 4 5 6) :repeat t)
=> (1 1 3 1 1 2 4 6 4 5 5 2 2 5 5 4 6 4 2 1 1 3 1 1)

(gen-symmetrical '(6 8 12) '(1/16 1/32 1/8))
=> ((1/8 1/32 1/8 1/8 1/32 1/8)
    (1/16 1/8 1/16 1/32 1/32 1/16 1/8 1/16)
    (1/8 1/32 1/16 1/32 1/16 1/32 1/32 1/16 1/32 1/16 1/32 1/8))
Opusmodus                                                         gen-symmetrical    2

Examples:

In the two examples bellow we use the LENGTH-LIST-PLOT function to demonstrate the
repeat T option.

(length-list-plot
 (gen-symmetrical 24 '(1 2 3 4 5 6) :seed 56))




With repeat:

(length-list-plot
 (gen-symmetrical 24 '(1 2 3 4 5 6) :repeat t :seed 56))
