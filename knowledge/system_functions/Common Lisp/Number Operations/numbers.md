Opusmodus                                                                         numbers   1

Numbers
[Function]

Arithmetic:

+      (number &rest numbers)
-      (number &rest more-numbers)
*      (number &rest numbers)
/      (number &rest more-numbers)

(+ 3 4)         => 7
(+ 3 4 -2)      => 5
(- 3 4)         => -1
(- 3 4 5)       => -6
(* 3 4)         => 12
(* 3 4 -2)      => -24
(/ 3 4)         => 3/4
(/ 3 4 5)       => 3/20
(/ 12 3)        => 4

Comparisons:

=      (number &rest more-numbers)
/=     (number &rest more-numbers)
<      (number &rest more-numbers)
>      (number &rest more-numbers)
<=     (number &rest more-numbers)
>=     (number &rest more-numbers)

These functions each take one or more arguments.

=      all the same
/=     all different
<      increasing
>      decreasing
<=     nondecreasing
>=     nonincreasing

If the sequence of arguments satis es a certain condition then the predicate is true, and
otherwise is false.
                           fi
Opusmodus                                                                        numbers      2

(= 3 3)       => t                 (/= 3 3)       => nil
(= 3 5)       => nil               (/= 3 5)       => t
(= 3 3 3 3)   => t                 (/= 3 3 3 3)   => nil
(= 3 3 5 3)   => nil               (/= 3 3 5 3)   => nil
(= 3 6 5 2)   => nil               (/= 3 6 5 2)   => t
(= 3 2 3)     => nil               (/= 3 2 3)     => nil
(< 3 5)       => t                 (<= 3 5)       => t
(< 3 -5)      => nil               (<= 3 -5)      => nil
(< 3 3)       => nil               (<= 3 3)       => t
(< 0 3 4 6 7) => t                 (<= 0 3 4 6 7) => t
(< 0 3 4 4 6) => nil               (<= 0 3 4 4 6) => t
(> 4 3)       => t                 (>= 4 3)       => t
(> 4 3 2 1 0) => t                 (>= 4 3 2 1 0) => t
(> 4 3 3 2 0) => nil               (>= 4 3 3 2 0) => t
(> 4 3 1 2 0) => nil               (>= 4 3 1 2 0) => nil
(= 3)         => t                 (/= 3)         => t
(< 3)         => t                 (<= 3)         => t

max (number &rest more-numbers)
min (number &rest more-numbers)
(max 6 12)     => 12               (min 6 12)     => 6
(max -6 -12)   => -6               (min -6 -12)   => -12
(max 1 3 2 -7) => 3                (min 1 3 2 -7) => -7
(max -2 3 0 7) => 7                (min -2 3 0 7) => -2
(max 3)        => 3                (min 3)        => 3

Conversions:

floor              (number &optional divisor)
ceiling            (number &optional divisor)
truncate           (number &optional divisor)
round              (number &optional divisor)

floor converts its argument by truncating toward negative in nity.
ceiling converts its argument by truncating toward positive in nity.
truncate converts its argument by truncating toward zero.
round converts its argument by rounding to the nearest integer.

If number is exactly halfway between two integers (0.5), then it is rounded to the one that
is even (divisible by 2).
                                                       fi
                                                            fi
Opusmodus                                       numbers   3

(setf x 2.6)

(floor x)
(ceiling x)
(truncate x)
(round x)



Argument floor    ceiling   truncate   round
---------------------------------------------
 2.6      2       3         2          3
 2.5      2       3         2          2
 2.4      2       3         2          2
 0.7      0       1         0          1
 0.3      0       1         0          0
-0.3     -1       0         0          0
-0.7     -1       0         0         -1
-2.4     -3      -2        -2         -2
-2.5     -3      -2        -2         -2
-2.6     -3      -2        -2         -3
---------------------------------------------
