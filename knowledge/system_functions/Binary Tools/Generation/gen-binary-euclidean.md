Opusmodus                                                                 gen-binary-euclidean       1

gen-binary-euclidean count level low high &key rotate seed
[Function]

Arguments and Values:
count                    an integer (number of return lists).
level                    an integer (unit size).
low                      an integer. Lowest pulse count.
high                     an integer. Highest pulse count.
rotate                   an integer or list. The default is 0.
seed                     This is an integer that guarantees consistent results each time the code is
                         evaluated. By providing a speci c seed, you can ensure that the randomness in
                         your code is reproducible. The default value for seed is NIL, which means the
                         seed is not set, resulting in different outputs on each run due to natural
                         randomness.


Description:

This function is based on the Euclidean algorithm. This computes the greatest common
divisor of two given integers. It has been demonstrated that the structure of this algorithm
can generate a large family of ostinato-like rhythms. The unique feature of such ostinatos is
the even distribution of their patterns.

In Traditional World Music a common method for representing musical rhythms is as a
binary sequence, sometimes known as 'beat / space'. In the literature of ethnomusicology the
usual representation of the beat/space is "x" and ".". In OPUSMODUS we shall use 1 and 0.
So a rhythm such as E(5,13=[x . . x . x . . x . x . . ] would look like this '(1 0 0 1 0 1
0 0 1 0 1 0 0). This rhythm is a cyclic rhythm with a time span of 13 units (level).

(gen-binary-euclidean 1 13 5 5)
=> (1 0 0 1 0 1 0 0 1 0 1 0 0)

Let's take a common West African clapping-pattern using another common musicological
notation named interval vectors. P=(1221222). This is described as Euclidean string. It isn't a
Euclidean rhythm but when rotated gives a true Euclidean rhythmic form identical to
West African bell pattern E(7,12)=(2122122).

(gen-binary-euclidean 1 12 7 7)
=> (1 0 1 1 0 1 0 1 1 0 1 0)
                                                fi
Opusmodus                                                          gen-binary-euclidean   2

Examples:
(gen-binary-euclidean 8 12 2 5 :seed 59)
=> ((1 0 0 1 0 0 1 0 0 1 0 0) (1 0 0 1 0 0 1 0 0 1 0 0)
    (1 0 0 0 1 0 0 0 1 0 0 0) (1 0 0 1 0 1 0 0 1 0 1 0)
    (1 0 0 1 0 1 0 0 1 0 1 0) (1 0 0 0 1 0 0 0 1 0 0 0)
    (1 0 0 1 0 1 0 0 1 0 1 0) (1 0 0 0 0 0 1 0 0 0 0 0))

(gen-binary-euclidean 8 '(12 8 6 12) 3 5 :rotate '(-1 2 0 1) :seed 59)
=> ((0 0 1 0 1 0 0 1 0 1 0 1)
    (1 0 1 0 1 0 1 0)
    (1 0 1 1 0 1)
    (0 1 0 0 1 0 1 0 0 1 0 1)
    (0 0 1 0 1 0 0 1 0 1 0 1)
    (1 0 1 0 1 0 1 0)
    (1 1 1 1 1 0)
    (0 1 0 0 0 1 0 0 0 1 0 0))


Score Example:

To create variants on such rhythms change the number of attack onsets in the high and low
argument slots. Thus, the range of attack onsets in the example is between 3 and 7. See how
the expression below is turned into a library using the DEF-LIBRARY system function to
create a library of just one of the Euclidean rhythms.

(create-library 'euclidean-rhythmics 'mpre-ashanti 'er
           (gen-binary-euclidean 10 12 3 7))

Library:

(def-library euclidean-rhythmics
 (:section mpre-ashanti
  er0 '(1 0 1 0 1 0 1 0 1 0 1 0)
  er1 '(1 0 1 0 1 0 1 0 1 0 1 0)
  er2 '(1 0 1 1 0 1 0 1 1 0 1 0)
  er3 '(1 0 1 1 0 1 0 1 1 0 1 0)
  er4 '(1 0 1 0 1 0 1 0 1 0 1 0)
  er5 '(1 0 0 1 0 0 1 0 0 1 0 0)
  er6 '(1 0 1 1 0 1 0 1 1 0 1 0)
  er7 '(1 0 0 0 1 0 0 0 1 0 0 0)
  er8 '(1 0 0 1 0 0 1 0 0 1 0 0)
  er9 '(1 0 0 1 0 1 0 0 1 0 1 0)
 ))

(library 'euclidean-rhythmics 'mpre-ashanti 'er6)
=> (1 0 1 1 0 1 0 1 1 0 1 0)
Opusmodus                                                              gen-binary-euclidean   3

We can call a collection of these patterns at :random like this:

(setf c-rhy
      (library 'euclidean-rhythmics 'mpre-ashanti nil :random 10))
=> ((1 0 1 1 0 1 0 1 1 0 1 0) (1 0 1 1 0 1 0 1 1 0 1 0)
    (1 0 1 1 0 1 0 1 1 0 1 0) (1 0 1 1 0 1 0 1 1 0 1 0)
    (1 0 1 0 1 0 1 0 1 0 1 0) (1 0 0 1 0 1 0 0 1 0 1 0)
    (1 0 0 1 0 1 0 0 1 0 1 0) (1 0 1 1 0 1 0 1 1 0 1 0)
    (1 0 1 0 1 0 1 0 1 0 1 0) (1 0 0 1 0 0 1 0 0 1 0 0))

Now let's make this into a percussion part for conga drums and bell.

(setf c-rhys (binary-map c-rhy 's))
(setf c-pitches (span c-rhys '(c4 cs4))) ; GM conga pitches
(setf bell-x (span (gen-repeat 11 '((10/16))) '((ab4))))

(def-score c-solo
       (:key-signature 'atonal
        :time-signature '(10 16)
        :tempo '(q 110))

 (congas
  :pitch c-pitches
  :length c-rhys
  :velocity '(mf)
  :channel 10
  :sound 'gm)

 (bell
  :pitch bell-x
  :length (gen-repeat 11 '(10/16))
  :velocity '(ff)
  :channel 10))
