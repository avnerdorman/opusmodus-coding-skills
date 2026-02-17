     Opusmodus                                                                 pascal-triangle   1

     pascal-triangle n &key mod
     [Function]

     Arguments and Values:
     n                         an integer.
     mod                       NIL or T. The default is NIL.


     Description:

     This function generates a triangular array constructed by summing adjacent elements in
     preceding rows. In mathematics, Pascal's triangle is a triangular array of the binomial
     coef cients that arises in probability theory, combinatorics, and algebra. In much of the
     Western world, it is named after the French mathematician Blaise Pascal, although it had
     been described centuries earlier by Chinese mathematician Yanghui (about 500 years earlier,
     in fact) and the Persian astronomer-poet Omar Khayyám. It is therefore known as the
     Yanghui triangle in China.

     The rows of Pascal's triangle are conventionally enumerated starting with row n=0 at the top
     (the 0th row). The entries in each row are numbered from the left beginning with k=0 and
     are usually staggered relative to the numbers in the adjacent rows. The triangle may be
     constructed in the following manner: In row 0 (the topmost row), there is a unique nonzero
     entry 1. Each entry of each subsequent row is constructed by adding the number above and
     to the left with the number above and to the right, treating blank entries as 0. For example,
     the initial number in the rst (or any other) row is 1 (the sum of 0 and 1), whereas the
     numbers 1 and 3 in the third row are added to produce the number 4 in the fourth row.

         (1)                ;row 0
        (1 1)               ;row 1
       (1 2 1)              ;row 2
      (1 3 3 1)             ;row 3
     (1 4 6 4 1)            ;row 4
fi
                       fi
Opusmodus                                                                   pascal-triangle   2

Examples:
(pascal-triangle 7)
=> ((1) (1 1) (1 2 1) (1 3 3 1) (1 4 6 4 1)
    (1 5 10 10 5 1) (1 6 15 20 15 6 1))


        2020

        1818

        1616

        1414

        1212

        1010

            88

            66

            44

            22

            00
                      11         22        33       44         55          66         77




The option :mod allows you to keep the values within a certain limit.

(pascal-triangle 21 :mod 7)


            66


            55


            44


            33


            22


            11


            00
                 22        44   66    88    10
                                             10   12
                                                   12    14
                                                          14   16
                                                                16   18
                                                                      18        20
                                                                                 20   22
                                                                                       22
Opusmodus                                                   pascal-triangle    3

(list-plot (flatten (pascal-triangle 50 :mod 3))
           :point-radius 0 :style :fill)


      22




      11




      00
              200
                200   400
                        400    600
                                 600    800
                                          800      1000
                                                     1000   1200
                                                              1200    1400
                                                                        1400




(list-plot (flatten (pascal-triangle 50 :mod 7))
           :point-radius 0 :style :fill)


      66


      55


      44


      33


      22


      11


      00
              200
                200   400
                        400    600
                                 600    800
                                          800      1000
                                                     1000   1200
                                                              1200    1400
                                                                        1400
Opusmodus                                                pascal-triangle    4

(list-plot (flatten (pascal-triangle 50 :mod 11))
           :point-radius 0 :style :fill)


     1010

      99

      88

      77

      66

      55

      44

      33

      22

      11

      00
              200
                200   400
                        400    600
                                 600    800
                                          800   1000
                                                  1000   1200
                                                           1200    1400
                                                                     1400




(list-plot (flatten (pascal-triangle 50 :mod 17))
           :point-radius 0 :style :fill)


     1616

     1414

     1212

     1010

      88

      66

      44

      22

      00
              200
                200   400
                        400    600
                                 600    800
                                          800   1000
                                                  1000   1200
                                                           1200    1400
                                                                     1400
Opusmodus                                                pascal-triangle   5

Score Example:
(progn
  (setf pascal
        (gen-loop 3 (rnd-octaves
                     '(c1 c7)
                     (flatten
                      (integer-to-pitch
                       (pascal-triangle 20 :mod (rndn 1 1 23)))))))

  (setf chords (pitch-mix pascal))

  (setf omn (make-omn :pitch chords
                      :length '(t)
                      :span :pitch))

  (setf mat (respell (omn-to-time-signature omn '(2 4))))
  (setf rh (ambitus-chord 13 (ambitus-filter '(c4 c7) mat)))
  (setf lh (ambitus-chord 13 (ambitus-filter '(c4 c7) mat :remain t)))

  (ps 'gm :p (list rh lh)
      :tempo 58)
  )
