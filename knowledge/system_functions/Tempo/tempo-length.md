Opusmodus                                                                        tempo-length   1

tempo-length tempo &key sum
[Function]

Arguments and Values:
tempo                   a list of tempo values.
length                  a list of tempo durations.
sum                     T or NIL. If T then sum is return. The default is NIL.


Description:

The function TEMPO-LENGTH can be used to calculate the duration of all bars of differing
tempi in a piece.

(tempo-length '((80 19/4) (72 4) (32 3/2) (44 9/2)))
=> (19/4 4 3/2 9/2)

Notice the connection with the function MAKE-TEMPO. This latter function enables a
composer to work from two separate lists, for example if proposed tempos are arrived at
through some algorithmic computation:

(tempo-length '((80 19/4) (72 4) (32 3/2) (44 9/2)) :sum t)
=> 59/4

(make-tempo '(80 72 32 44) '(19/4 4 3/2 9/2) :type :length)
=> ((80 :length 19/4) (72 4) (32 3/2) (44 9/2))

(setf tempo
      '(("Mäßig" 60 :length 10/4)
        (:rit 60 40 1/64 2/4)
        (60 2/4)
        (:accel 60 96 1/64 2/4)
        ("heftig" 96 2/4)
        (:rit 96 60 1/64 1/4)
        ("wieder mäßig" 60 4/4)
        (:rit 60 44 1/64 2/4)
        (44 3/4)))

(tempo-length tempo)
=> (5/2 1/2 1/2 1/2 1/2 1/4 1 1/2 3/4)

(tempo-length tempo :sum t)
=> 7
