Opusmodus                                                              gen-sieve     1

sieve modulus shift maximum
[Function]

Arguments and Values:
modulus               an integer (step number).
shift                 an integer (start number).
maximum               an integer (maximum number).


Description:

SIEVE returns a list of numbers to a given modulus, shift and maximum number. This
function can be useful in generating root numbers for the SIEVE-TREE function.

(sieve 4 0 96)
=> (0 4 8 12 16 20 24 28 32 36 40 44 48
    52 56 60 64 68 72 76 80 84 88 92 96)


Examples:
(sieve 2 0 60)
=> (0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32
    34 36 38 40 42 44 46 48 50 52 54 56 58 60)

(sieve 2 1 60)
=> (1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33
    35 37 39 41 43 45 47 49 51 53 55 57 59)

Example with SIEVE-TREE function:

(sieve-tree (sieve 3 4 14)
            '((2 0.43) (3 0.37))
            '((3 0.47) (4 0.56) (5 0.68))
            :rest '((20 0.43) (80 0.6) (90 0.7)))
Opusmodus   gen-sieve   2
