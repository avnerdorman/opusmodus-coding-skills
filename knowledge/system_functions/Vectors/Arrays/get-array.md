Opusmodus                                                                       get-array   1

get-array row column size array &key direction seed
[Function]

Arguments and Values:
row                    row number.
column                 column number.
size                   an integer.
array                  an array.
direction              'right, 'left, 'down, 'up, 'diagonal-down,
                       'diagonal-up or '? (at random). The default is 'right.
seed                   an integer or NIL. The default is NIL.


Description:

An array is a systematic arrangement of objects, usually in rows and columns.

(setf array
 (build-array
    ; column     0 1 2 3 4 5 6 7 8 9 10 11
             '((10 5 0 11 9 6 1 3 7 8 2 4)     ; 0 row
               ( 3 10 5 4 2 11 6 8 0 1 7 9)    ; 1
               ( 8 3 10 9 7 4 11 1 5 6 0 2)    ; 2
               ( 9 4 11 10 8 5 0 2 6 7 1 3)    ; 3
               (11 6 1 0 10 7 2 4 8 9 3 5)     ; 4
               ( 2 9 4 3 1 10 5 7 11 0 6 8)    ; 5
               ( 7 2 9 8 6 3 10 0 4 5 11 1)    ; 6
               ( 5 0 7 6 4 1 8 10 2 3 9 11)    ; 7
               ( 1 8 3 2 0 9 4 6 10 11 5 7)    ; 8
               ( 0 7 2 1 11 8 3 5 9 0 4 6)     ; 9
               ( 6 1 8 7 5 2 9 11 3 4 10 0)    ;10
               ( 4 11 6 5 3 0 7 9 1 2 8 10)))) ;11

(get-array 11 7 6 array :direction 'right)
=> (9 1 2 8 10 4)

(get-array 11 7 6 array :direction 'up)
=> (9 11 5 6 10 0)

(get-array
 11 7 6
 (row-matrix '(9 5 4 10 7 2 6 0 1 3 8 11 12 13 14)
 :remove nil :assoc 12 :array t :mod 14 :seed 34)
 :direction '?)
=> (12 4 0 5 8 2)
Opusmodus                                                                        get-array    2

Examples:

Here's a 2-dimensional array:

(spiral-array 5 3)
=> #2A(( 0 1 2)
       (11 12 3)
       (10 13 4)
       ( 9 14 5)
       ( 8 7 6))

Let's make out own array and see how it might be used as a resource for creating new
material. A useful magic square could be de ned as a 3x3 array:

(setf magic-square-3
      (build-array
       '((4 9 2)
         (3 5 7)
         (8 1 6))))

=> #2A((4 9 2) (3 5 7) (8 1 6))

(get-array 0 1 3 magic-square-3 :direction 'down)
=> (9 5 1)

Magic squares are a particular sort of array used by composers to create both pitch and
sectional material. Bach is said to have used them to determine the number of bars within
phrases and sections. In this magic-square-3 the rst 9 numbers are be arranged so that all
rows, columns and both diagonals add up to 15. All four lines through the central 5 are in
arithmetical progression, with differences 1, 2, 3, 4 rotating anti-clockwise from 6-5-4 to
9-5-1.

The sum of the squares of the rst and third columns are equal: 4^2+3^2+8^2=2^2+7^2
+6^2=89. The middle column gives 9^2+5^2+1^2=107=89+18. The squares of the numbers
in the rows sum to 101, 83 and 101, and 101-83=18.

There are 8 ways in which the magic total 15 can be made by adding 3 of the integers1 to 9.
Each of these 8 ways occurs once in the square.
                        fi
                                     fi
                                          fi
     Opusmodus                                                                        get-array   3

     The composer Peter Maxwell Davies has made regular use of such squares. In A Mirror of
     Whitening Light he takes 8 notes from the plainchant Veni Sancte Spiritus (Come Holy
     Spirit), often called the “Golden Sequence,” to create a melodic phrase with 8 distinct notes.
     He then transposes the phrase to start on each of the 8 notes, yielding an 8 × 8 matrix of
     notes. This matrix is then mapped onto the magic square of Mercury. Different paths through
     the resulting magical music square generate the pitches and rhythms for the piece.

                                      8 58 59 5 4 62 63 1
                                     49 15 14 52 53 11 10 56
                                     41 23 22 44 45 19 18 48
                                     32 34 35 29 28 38 39 25
                                     40 26 27 37 36 30 31 33
                                     17 47 46 20 21 43 42 24
                                      9 55 54 12 13 51 50 16
                                     64 2 3 61 60 6 7 57

     “I rmly believe that the more one controls the ow of one’s wildest inspiration, the wilder it
     sounds. And so when I really wanted to be wild towards the climax of this work, I imposed
     very rigid rhythmic and tonal controls derived from the plainsong, and from that magic
     square; and the result is really quite extraordinary I nd, even now.”

     Nigel Morgan has used array structures to determine the orchestration in each of his Six
     Concertos for orchestra. Here is an example from the rst movement of Concerto 1. The key
     is w1/2 (wind) s1/2 (strings) br (brass) cn (continuo pc (percussion).

     (setf m1-array
           (build-array
     ; column 0     1          2     3      4         5         6
           '((w1    br         w2    s1     s2        cn        pc)      ; 0 row
             (cn    s1         w1    br     cn        s2        pc)      ; 1
             (s1    w1         s2    cn     w2        br        pc)      ; 2
             (s2    cn         br    w1     s1        w2        pc)      ; 3
             (cn    s2         w1    s1     br        w2        pc)      ; 4
             (br    s1         w1    w2     cn        s2        pc)      ; 5
             (pc    cn         s2    s1     w2        br        w1))))   ; 6
fi
                                                 fl
                                                      fi
                                                           fi
