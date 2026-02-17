Opusmodus                                                             interference-series   1

interference-series sequence
[Function]

Arguments and Values:
sequence                 an integer list.


Description:

This function allows you to create sub-groups from a single 'master' number which represents
the meter of the composition. In other words we can create a family of rhythms in a metrical
style or series. If 8 is divided into two numbers (5+3) (unequal and not divisible by a
common number other than 1) the function INTERFERENCE-SERIES will create a more
fragmented subgroup derived from synchronising (simultaneous combination) all their
rotational variants.Eg, (5+3) has one rotation (3+5). When the two are synchronised they
generate the result (3+2+3). This in turn will produce yet another sub group (2+1+2+1+2) by
the same process. Each generation of subgroups can be thought of as the offspring of the last.

This is a key function at the heart of the OPUSMODUS realisations of interference
techniques found in the Schillinger System of Music Composition. This system, popular in
the USA in the mid 20C and studied by Gershwin and many lm composers, has been
reassessed in recent years by Dr Jeremy Arden.

(interference-series '(5 3))
=> ((3 2 3) (2 1 2 1 2))

These result are very useful as the source material for the function DISTRIBUTIVE-
SQUARE and DISTRIBUTIVE-CUBE.


Examples:

Let's examine how this output or something similar could be used to generate rhythm in
phrases of note and rest lengths. Taking 7 as our master number:

(setf 7-is (interference-series '(4 3)))
=> ((3 1 3) (1 2 1 2 1))

Using the function GEN-LENGTH to make the conversion to lengths:

(gen-length 7-is 8)
=> (3/8 1/8 3/8 1/8 1/4 1/8 1/4 1/8)
                                                      fi
Opusmodus                                                             interference-series   2

(gen-length 7-is 16)
=> (3/16 1/16 3/16 1/16 1/8 1/16 1/8 1/16)

(gen-length 7-is '(8 16))
=> ((3/8 1/8 3/8) (1/16 1/8 1/16 1/8 1/16))

Now to add rest lengths into the rhythmic phrases. Note that series suggested in the rst
argument of LENGTH-REST-SERIES runs through the output lists:

(length-rest-series
 '(1 2 1 3 2 4)
  (gen-length 7-is '(8 16)))
=> ((-3/8 1/8 -3/8) (-1/16 1/8 1/16 -1/8 1/16))

(length-rest-series
 '(1 2 1 3 2 4)
  (gen-length 7-is '(8 16) :repeat 2))
=> ((-3/8 1/8 -3/8) (-3/8 1/8 3/8)
    (-1/16 1/8 -1/16 1/8 1/16) (1/16 -1/8 1/16 1/8 1/16))




                                                                             fi
