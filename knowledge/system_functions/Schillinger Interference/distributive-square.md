Opusmodus                                                              distributive-square        1

distributive-square sequence
[Function]

Arguments and Values:
sequence                  an integer list.


Description:

This is a function at the heart of the OPUSMODUS realisations of interference techniques
found in the Schillinger System of Music Composition. This system, popular in the USA in
the mid 20C and studied by Gershwin and many lm composers, has been reassessed in
recent years by Dr Jeremy Arden.

The function DISTRIBUTIVE-SQUARE must be understood as an organic process which
generates a relatively large amount of material from the smallest amount. One bar's worth of
rhythm is squared to produce several bars worth. That is, the number of beats in the bar
(numerator of time signature) equals the number of bars of newly created material. If there
were 4 beats in the bar then there would be four bars in the bar group as a result of squaring.
First one must divide the beats in the bar into sub groups. Eg. 4=3+1. The sub groups are
then squared (3+1) squared = (9+3)+(3+1). The total length of the result is 16 the square of
4 and will therefore ll 4 bars of 4/4.

The process is intend to combine with the results of INTERFERENCE2 which also produces
rhythms whose length is the 4 square of the larger number in the original ratio.

(distributive-square '(3 1))
=> ((9 3) (3 1))

(setf ds-i2 (distributive-square (interference2 '(3 2))))
=> ((4 2 2 4) (2 1 1 2) (2 1 1 2) (4 2 2 4))


Examples:

Using the function GEN-LENGTH to make the conversion to lengths:

(gen-length ds-i2 8)
=> (1/2 1/4 1/4 1/2 1/4 1/8 1/8 1/4
    1/4 1/8 1/8 1/4 1/2 1/4 1/4 1/2)

(gen-length ds-i2 16)
=> (1/4 1/8 1/8 1/4 1/8 1/16 1/16 1/8
    1/8 1/16 1/16 1/8 1/4 1/8 1/8 1/4)
              fi
                                             fi
Opusmodus                                                             distributive-square   2

(gen-length ds-i2 '(8 16))
=> ((1/2 1/4 1/4 1/2) (1/8 1/16 1/16 1/8)
    (1/4 1/8 1/8 1/4) (1/4 1/8 1/8 1/4))

Now to add rest lengths into the rhythmic phrases. Note that series suggested in the rst
argument of LENGTH-REST-SERIES runs through the output lists:

(length-rest-series '(1 2 1 3 2 4) (gen-length ds-i2 '(8 16)))
=> ((1/2 -1/4 1/4 1/2) (-1/8 1/16 -1/16 1/8)
    (1/4 1/8 -1/8 1/4) (1/4 -1/8 1/8 1/4))




                                                                             fi
