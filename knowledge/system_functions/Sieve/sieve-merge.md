Opusmodus                                                                 sieve-merge   1

sieve-merge residual-classes maximum
[Function]

Arguments and Values:
residual-classes        a sequence of paired values <modulus><shift>.
maximum                 an integer (maximum number).


Description:

SIEVE-MERGE returns a list of numbers derived from merging a number of sieve lists. This
function can be useful in generating root numbers for the SIEVE-TREE function.


Examples:

Here we merge two sieve lists, one from (sieve 3 0 96) and one from (sieve 4 0
96):

(sieve-merge '(3 0 4 0) 96)
=> (0 3 4 6 8 9 12 15 16 18 20 21 24 27 28 30 32 33 36 39 40 42 44 45
    48 51 52 54 56 57 60 63 64 66 68 69 72 75 76 78 80 81 84 87 88 90
    92 93 96)

Example with SIEVE-TREE and SIEVE-MERGE function:

(sieve-tree (sieve-merge '(3 2 4 2) 12)
            '((2 0.43) (3 0.37))
            '((3 0.47) (4 0.56) (5 0.68))
            :quantize '(1 2 4 8))
Opusmodus   sieve-merge   2
