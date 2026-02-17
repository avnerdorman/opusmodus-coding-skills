Opusmodus                                                                rnd-form-set   1

rnd-form-set n row &key type seed
[Function]

Arguments and Values:
n                        an integer (number of forms).
row                      a twelve-tone row.
type                     :integer or :pitch. The default is :integer.
seed                     NIL or an integer. The default is NIL.


Description:

This function returns N lists of twelve-tone forms selected at random.


Examples:
(rnd-form-set 2 '(0 4 9 10 5 3 8 7 1 2 11 6) :seed 56)
=> ((6 1 10 11 5 4 9 7 2 3 8 0) (8 3 0 1 7 6 11 9 4 5 10 2))

(rnd-form-set 2 '(0 4 9 10 5 3 8 7 1 2 11 6) :type :pitch :seed 56)
=> ((fs4 cs4 bb4 b4 f4 e4 a4 g4 d4 eb4 gs4 c4)
    (gs4 eb4 c4 cs4 g4 fs4 b4 a4 e4 f4 bb4 d4))
Opusmodus                                                      rnd-form-set   2

Score Example:
(progn
 (setf forms (rnd-form-set 24 (rnd-row :transpose 6)))
 (setf pitch (integer-to-pitch forms))
 (setf mat (gen-chord2 200 (rnd-sample 12 '(1 2)) (flatten pitch)))

    (setf vel (substitute-map '(ppp ppp pp pp p p f f ff ff fff fff)
                              '(0 1 2 3 4 5 6 7 8 9 10 11) forms))

    (setf fib (rnd-sample 16 (fibonacci 10 18)))
    (setf l1 (binary-rhythm '(16 20 32) fib '(1/16 1/20 1/32)
                            :type (rnd-sample 12 '(1 2))
                            :rotate (rnd-sample 12 '(0 1 -1 2 -2))))

    (setf l2 (binary-rhythm '(28 16 12) fib '(1/28 1/16 1/12)
                            :type (rnd-sample 12 '(1 2 3))
                            :rotate (rnd-sample 12 '(0 1 -1 2 -2))))

    (setf cd-p (distribute-seq mat l1 l2))
    (setf cd-v (distribute-seq vel l1 l2))
    (setf p1 (rnd-octaves 'piano (1~ cd-p)))
    (setf p2 (rnd-octaves 'piano (2~ cd-p)))
    (setf v1 (1~ cd-v))
    (setf v2 (2~ cd-v))
    (setf in1 (make-omn :length l1 :pitch p1 :velocity v1))
    (setf in2 (make-omn :length l2 :pitch p2 :velocity v2))
    (setf tempo (gen-tempo '(32 88 72 56 96) '(1) l1 :beat 1/1))

    (def-score form-dist
                (:title "Distribution"
                 :copyright "(c) 2016 Opusmodus"
                 :composer "OPMO"
                 :key-signature 'chromatic
                 :time-signature '(8 8)
                 :tempo tempo
                 :layout (grand-layout '(in1 in2)))

         (in1 :omn in1 :channel 1 :sound 'gm :program 0)
         (in2 :omn in2 :channel 2 :sound 'gm :program 0)
     )
)
