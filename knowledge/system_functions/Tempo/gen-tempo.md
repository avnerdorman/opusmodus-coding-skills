Opusmodus                                                                          gen-tempo   1

gen-tempo tempo size length &key beat seed
[Function]

Arguments and Values:
tempo                    a list of integers.
size                     a list of integers.
length                   a list of lengths.
beat                     a ratio or NIL. The default is NIL (bars).
seed                     an integer. The default is NIL.


Description:

The function GEN-TEMPO generates randomised control of position and frequency of tempo
changes within lists of lengths.

(gen-tempo '(60 72 96) '(1 2)
           '((1/4 1/2) (1/8 1/8 1/8) (1/2 1/8 1/8))
           :beat 1/4 :seed 45)
=> ((60 1/2) (72 1/4) (96 1/2) (60 1/4) (72 1/4) (96 1/4)))

With the argument beat a series of different tempos (composer or algorithmically-de ned)
can be arranged within lists of lengths. Look closely at the way the three different tempo
functions GEN-TEMPO, TEMPO-LENGTH and MAKE-TEMPO interact.


Examples:
(setf len
      (gen-tuplet
       1 4 'd 'n '(4 4 4 4 4 4 4)
       '(5 3 4 5 5 3 4 5 4 4 5 4 5 4 4 3 3) :seed 21))

=> ((1/20 1/20 1/10 1/20) (1/6 1/12) (1/16 1/16 1/16 1/16)
    (1/20 1/20 1/10 1/20) (1/20 1/20 1/10 1/20) (1/6 1/12)
    (1/16 1/16 1/16 1/16) (1/20 1/20 1/10 1/20)
    (1/16 1/16 1/16 1/16) (1/16 1/16 1/16 1/16)
    (1/20 1/20 1/10 1/20) (1/16 1/16 1/16 1/16)
    (1/20 1/20 1/10 1/20) (1/16 1/16 1/16 1/16)
    (1/16 1/16 1/16 1/16) (1/6 1/12) (1/6 1/12))

(gen-tempo '(32 44 72 88) '(1 1) len :seed 52)
=> ((32 1) (44 1) (72 1) (88 1) (32 1) (44 1) (72 1)
    (88 1) (32 1) (44 1) (72 1) (88 1) (32 1) (44 1)
    (72 1) (88 1) (32 1))
                                                                              fi
Opusmodus                                                      gen-tempo   2

(gen-tempo '(32 44 72 88) '(2 1) len :seed 52)
=> ((32 1) (44 2) (72 2) (88 2) (32 2) (44 2)
    (72 1) (88 1) (32 1) (44 2) (72 1))

(gen-tempo (rnd-sample 12 '(32 44 72 88) :seed 32)
 '(1 2) len :seed 52)
=> ((88 2) (44 1) (44 1) (32 1) (32 1) (72 1) (44 2)
    (88 2) (44 2) (32 1) (32 1) (32 1) (88 1))

(gen-tempo '(32 44 72 88) '(2 3) len :seed 52)
=> ((32 3) (44 2) (72 2) (88 2) (32 2) (44 2) (72 3) (88 1))

(setf t-list (gen-tempo '(32 44 72 88) '(2 3 5) len
              :beat '1/4 :seed 32))
=> ((32 5/4) (44 3/4) (72 5/4) (88 3/4) (32 1/4))

(tempo-length t-list)
=> (5/4 3/4 5/4 3/4 1/4)

(make-tempo '(32 44 72 88) '(1/2 5/4 1/2 5/4 1/2 1/4))
=> ((32 :bars 1) (44 1) (72 1) (88 1) (32 1) (44 1))

(make-tempo '(32 44 72 88) '(1/2 5/4 1/2 5/4 1/2 1/4)
            :type :length)
=> ((32 :length 1/2) (44 5/4) (72 1/2) (88 5/4) (32 1/2) (44 1/4))

(make-tempo '(32 44 72 88) '(1 2 2 1 1 2 2 3 1))
=> ((32 :bars 1) (44 1) (72 1) (88 1) (32 1)
    (44 1) (72 1) (88 1) (32 1))
