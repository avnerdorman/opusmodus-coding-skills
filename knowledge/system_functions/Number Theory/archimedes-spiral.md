Opusmodus                                                                  archimedes-spiral     1

archimedes-spiral a b resolution count
[Function]

Arguments and Values:
a                         n number.
b                         a number.
resolution                a number.
count                     an integer.


Description:

The Archimedean spiral (also known as the arithmetic spiral) is a spiral named after the 3rd-
century BC Greek mathematician Archimedes. It is the locus of points corresponding to the
locations over time of a point moving away from a xed point with a constant speed along a
line that rotates with constant angular velocity. Equivalently, in polar coordinates (r, θ) it
can be described by the equation r = a + bθ with real numbers a and b. Changing the
parameter a moves the centerpoint of the spiral outward from the origin (positive a toward θ
= 0 and negative a toward θ = π), while b controls the distance between loops.


Examples:
(xy-plot (archimedes-spiral 10 10 0.01 1500))


  160.160.


  120.120.


   80.80.


   40.40.


    0.0.
               -120.
                 -120.    -80.
                            -80.        -40.
                                          -40.        0.0.   40.
                                                              40.   80.
                                                                     80.       120.
                                                                                 120.   160.
                                                                                          160.

  -40.-40.


  -80.-80.


 -120.-120.


 -160.-160.
                                                 fi
Opusmodus   archimedes-spiral   2
