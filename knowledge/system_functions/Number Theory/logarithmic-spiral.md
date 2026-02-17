Opusmodus                                                                  logarithmic-spiral       1

logarithmic-spiral a b resolution count
[Function]

Arguments and Values:
a                           n number.
b                           a number.
resolution                  a number.
count                       an integer.


Description:

A logarithmic spiral, equiangular spiral, or growth spiral is a self-similar spiral curve that
often appears in nature. The rst to describe a logarithmic spiral was Albrecht Dürer (1525)
who called it an “eternal line” (“ewige lini”). More than a century later, the curve was
discussed by Descartes (1638), and later extensively investigated by Jacob Bernoulli, who
called it Spira mirabilis, “the marvelous spiral”.

The logarithmic spiral can be distinguished from the Archimedean spiral by the fact that the
distances between the turnings of a logarithmic spiral increase in geometric progression,
while in an Archimedean spiral these distances are constant.

In modern notation the equation of the spiral is r = aeθ cot b, in which r is the radius of each
turn of the spiral, a and b are constants that depend on the particular spiral, θ is the angle of
rotation as the curve spirals, and e is the base of the natural logarithm.
                       fi
   Opusmodus                                                                  logarithmic-spiral    2

   Examples:
   (xy-plot (logarithmic-spiral 1 .4 .1 500)
    :join-points t :point-radius 1)


100000000.100000000.

  50000000.50000000.

         0.0.
                     -100000000.
                          -100000000.0.0.    100000000.
                                                  100000000.
                                                        200000000.
                                                             200000000.
                                                                   300000000.
                                                                        300000000.
                                                                              400000000.
                                                                                   400000000.
                                                                                         500000000.
                                                                                              500000000.
 -50000000.-50000000.

-100000000.-100000000.

-150000000.-150000000.

-200000000.-200000000.

-250000000.-250000000.

-300000000.-300000000.

-350000000.-350000000.




   (xy-plot (logarithmic-spiral 1 .2 .1 570)
    :join-points t :point-radius 1)



     40000.40000.

     30000.30000.

     20000.20000.

     10000.10000.

         0.0.
                     -40000.
                        -40000. -20000.
                                   -20000.   0.0.   20000.
                                                       20000. 40000.
                                                                 40000. 60000.
                                                                           60000. 80000.
                                                                                     80000. 100000.
                                                                                               100000.
    -10000.-10000.

    -20000.-20000.

    -30000.-30000.

    -40000.-40000.

    -50000.-50000.

    -60000.-60000.

    -70000.-70000.
