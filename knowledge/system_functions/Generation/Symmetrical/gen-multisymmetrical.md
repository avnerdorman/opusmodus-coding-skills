Opusmodus                                                         gen-multisymmetrical     1

gen-multisymmetrical n sequence &key repeat seed
[Function]

Arguments and Values:
n                       an integer. Number of return values.
sequence                a sequence.
repeat                  NIL or T. The default is NIL.
seed                    NIL or number. The default is NIL.


Description:

This function generates a series of multisymmetrical ordered values of a given sequence.

(gen-multisymmetrical 8 '(1 2 3 4 5 6))
=> (2 3 2 1 1 2 3 2 4 5 2 5 5 2 5 4 1 5 4 6 6 4
      5 1 6 5 3 1 1 3 5 6 6 5 3 1 1 3 5 6 1 5 4 6
      6 4 5 1 4 5 2 5 5 2 5 4 2 3 2 1 1 2 3 2)

(gen-multisymmetrical 8 '(1 2 3 4 5 6) :repeat t)
=> (1 1 2 4 4 2 1 1 6 4 5 5 5 5 4 6 2 2 2 5 5 2
      2 2 5 5 5 3 3 5 5 5 5 5 5 3 3 5 5 5 2 2 2 5
      5 2 2 2 6 4 5 5 5 5 4 6 1 1 2 4 4 2 1 1)

(gen-multisymmetrical '(6 8 12) '(1/16 1/32 1/8))
=> ((1/8 1/32 1/16 1/16 1/32 1/8 1/16 1/32 1/8 1/8 1/32 1/16 1/16 1/32
     1/8 1/8 1/32 1/16 1/16 1/32 1/8 1/8 1/32 1/16 1/16 1/32 1/8 1/8
     1/32 1/16 1/8 1/32 1/16 1/16 1/32 1/8)
    (1/32 1/8 1/32 1/16 1/16 1/32 1/8 1/32 1/16 1/32 1/8 1/16 1/16 1/8
     1/32 1/16 1/32 1/8 1/16 1/8 1/8 1/16 1/8 1/32 1/8 1/32 1/8 1/32
     1/32 1/8 1/32 1/8 1/8 1/32 1/8 1/32 1/32 1/8 1/32 1/8 1/32 1/8 1/16
     1/8 1/8 1/16 1/8 1/32 1/16 1/32 1/8 1/16 1/16 1/8 1/32 1/16 1/32
     1/8 1/32 1/16 1/16 1/32 1/8 1/32)
    (1/32 1/8 1/16 1/32 1/16 1/32 1/32 1/16 1/32 1/16 1/8
     1/32 1/8 1/16 1/32 1/8 1/16 1/32 1/32 1/16 1/8 1/32 1/16
     1/8 1/16 1/8 1/32 1/16 1/32 1/16 1/16 1/32 1/16 1/32 1/8
     1/16 1/16 1/8 1/16 1/32 1/8 1/32 1/32 1/8 1/32 1/16 1/8
     1/16 1/8 1/32 1/8 1/16 1/32 1/8 1/8 1/32 1/16 1/8 1/32
     1/8 1/16 1/8 1/16 1/8 1/32 1/16 1/16 1/32 1/8 1/16 1/8
     1/16 1/16 1/8 1/16 1/8 1/32 1/16 1/16 1/32 1/8 1/16 1/8
     1/16 1/8 1/32 1/8 1/16 1/32 1/8 1/8 1/32 1/16 1/8 1/32 1/8
     1/16 1/8 1/16 1/32 1/8 1/32 1/32 1/8 1/32 1/16 1/8 1/16
     1/16 1/8 1/32 1/16 1/32 1/16 1/16 1/32 1/16 1/32 1/8 1/16
     1/8 1/16 1/32 1/8 1/16 1/32 1/32 1/16 1/8 1/32 1/16 1/8
     1/32 1/8 1/16 1/32 1/16 1/32 1/32 1/16 1/32 1/16 1/8 1/32))
Opusmodus                                                    gen-multisymmetrical    2

Examples:

In the two examples bellow we use the LENGTH-LIST-PLOT function to demonstrate the
repeat T option.

(length-list-plot
 (gen-multisymmetrical 8 '(1 2 3 4 5 6) :seed 87))




With repeat:

(length-list-plot
 (gen-multisymmetrical 8 '(1 2 3 4 5 6) :repeat t :seed 87))
