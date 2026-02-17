Opusmodus                                                                        get-ac-hexachord   1

get-ac-hexachord name &key start aggregate type prob seed
[Function]

Arguments and Values:
name                     allowed names: a, b, c, d, e and f.
start                    an integer (pitch class).
aggregate                T or NIL. The default is NIL.
type                     :integer or :pitch. The default is :integer.
prob                     a oating-point number (probability value) between 0.0 and 1.0.
                         The default is 0.5.
seed                     an integer. Ensures the same result each time the code is evaluated.
                         The default is NIL.


Description:

The function GET-AC-HEXACHRD generate a hexachord (H1) set and its complement (H2)
set form a given name (all-combinatorial hexachords) by randomising the order and
applying an inversion into the the H1 set rst. The result is a sequence with two hexachords,
H1 and H2 or an :aggregate (twelve-tone row). The AC in the function name stand for
'All-Combinatorial Hexachords'.

All-Combinatorial Hexachords names and there pitch class prime form sets:

A = (0 1 2 3 4 5)
B = (0 2 3 4 5 7)
C = (0 2 4 5 7 9)
D = (0 1 2 6 7 8)
E = (0 1 4 5 8 9)
F = (0 2 4 6 8 10)

All-Combinatorial Hexachords in Forte notation:

(pcs-prime-form
 '((0 1 2 3 4 5)
   (0 2 3 4 5 7)
   (0 2 4 5 7 9)
   (0 1 2 6 7 8)
   (0 1 4 5 8 9)
   (0 2 4 6 8 10)
   ) :forte)
=> (6-1 6-8 6-32 6-7 6-20 6-35)
                    fl
                                    fi
Opusmodus                                                            get-ac-hexachord   2

Example:

In the rst example we use A set (0 1 2 3 4 5):

(get-ac-hexachord 'a)
=> ((6 4 3 1 5 2) (7 9 10 0 8 11))

With probability:

(get-ac-hexachord 'a :start 0 :prob .1)
=> ((0 2 4 11 1 3) (9 7 5 10 8 6))

(get-ac-hexachord 'a :start 0 :prob .5)
=> ((0 11 2 1 10 3) (7 8 5 6 9 4))

(get-ac-hexachord 'a :start 0 :prob .9)
=> ((0 1 2 3 4 5) (11 10 9 8 7 6))

Here the result is a twelve-tone row:

(get-ac-hexachord 'b :aggregate t)
=> (11 7 2 9 10 0 4 8 1 6 5 3)

In the example below the hexachords are generated from set C and with start 0:

(get-ac-hexachord 'c :start 0)
=> ((0 2 5 4 9 7) (3 1 10 11 6 8))

(get-ac-hexachord 'd :aggregate t :start 7)
=> (7 11 5 1 0 6 8 4 10 2 3 9)

(get-ac-hexachord 'e)
=> ((0 9 8 1 5 4) (3 6 7 2 10 11))

(get-ac-hexachord 'f :seed 456)
=> ((9 1 7 5 11 3) (4 0 6 8 2 10))
fi
