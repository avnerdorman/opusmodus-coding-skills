     Opusmodus                                                                    combination    1

     combination n items &key permute
     [Function]

     Arguments and Values:
     n                        a number of elements per list.
     items                    a list of items.
     permute                  T or NIL. The default is NIL.


     Description:

     COMBINATION will return a list of all the combinations N elements in length from a list.

     (combination 3 '(0 1 2 3 4 5))
     => ((0 1 2) (0 1 3) (0 1 4) (0 1 5) (0 2 3) (0 2 4) (0 2 5)
         (0 3 4) (0 3 5) (0 4 5) (1 2 3) (1 2 4) (1 2 5) (1 3 4)
         (1 3 5) (1 4 5) (2 3 4) (2 3 5) (2 4 5) (3 4 5))

     (combination 3 '(0 1 2 3 4 5) :permute t)
     => ((0 1 2) (0 2 1) (1 0 2) (1 2 0) (2 0 1) (2 1 0) (0 1 3)
         (0 3 1) (1 0 3) (1 3 0) (3 0 1) (3 1 0) (0 1 4) (0 4 1)
         (1 0 4) (1 4 0) (4 0 1) (4 1 0) (0 1 5) (0 5 1) (1 0 5)
         (1 5 0) (5 0 1) (5 1 0) (0 2 3) (0 3 2) (2 0 3) (2 3 0)
         (3 0 2) (3 2 0) (0 2 4) (0 4 2) (2 0 4) (2 4 0) (4 0 2)
         (4 2 0) (0 2 5) (0 5 2) (2 0 5) (2 5 0) (5 0 2) (5 2 0)
         (0 3 4) (0 4 3) (3 0 4) (3 4 0) (4 0 3) (4 3 0) (0 3 5)
         (0 5 3) (3 0 5) (3 5 0) (5 0 3) (5 3 0) (0 4 5) (0 5 4)
         (4 0 5) (4 5 0) (5 0 4) (5 4 0) (1 2 3) (1 3 2) (2 1 3)
         (2 3 1) (3 1 2) (3 2 1) (1 2 4) (1 4 2) (2 1 4) (2 4 1)
         (4 1 2) (4 2 1) (1 2 5) (1 5 2) (2 1 5) (2 5 1) (5 1 2)
         (5 2 1) (1 3 4) (1 4 3) (3 1 4) (3 4 1) (4 1 3) (4 3 1)
         (1 3 5) (1 5 3) (3 1 5) (3 5 1) (5 1 3) (5 3 1) (1 4 5)
         (1 5 4) (4 1 5) (4 5 1) (5 1 4) (5 4 1) (2 3 4) (2 4 3)
         (3 2 4) (3 4 2) (4 2 3) (4 3 2) (2 3 5) (2 5 3) (3 2 5)
         (3 5 2) (5 2 3) (5 3 2) (2 4 5) (2 5 4) (4 2 5) (4 5 2)
         (5 2 4) (5 4 2) (3 4 5) (3 5 4) (4 3 5) (4 5 3) (5 3 4)
         (5 4 3))


     Examples:
     (flatten (combination 3 '((c4) (d4 e4) (f4) (g4 a4))))
     => (c4 d4 e4 f4 c4 d4 e4 g4 a4 c4 f4 g4 a4 d4 e4 f4 g4 a4)

     This rst example, a duo for clarinet and drone, shows how the function combination can be
     embedded within the GEN-LENGTH function to produce effective rhythmic structures.
fi
Opusmodus                                                    combination   2

(setf rhy (gen-length (combination 3 '(1 2 4 8 9)) '(16 8 16 16 16)))
(setf ts-c (get-time-signature rhy))
(setf ts-x (time-signature-length ts-c))
(setf ostinato '(s e s s))
(setf rhy-x (length-span ts-x ostinato))

(setf sl-mel
      (pitch-transpose '(-2 2 4 6 4 2 -2 0)
       (span rhy-x '(c4 cs4 fs4 g4 c5 b4 fs4 f4) :flat t)
       :section '(1 2 3 4 5 6 7 10)))

(setf drone-len (list (get-span rhy :sum t)))

(def-score c-duo
           (:key-signature 'chromatic
              :time-signature ts-c
            :tempo '(q 90))

  (clarinet
   :length rhy-x
   :pitch sl-mel
   :velocity '(f)
   :channel 1
   :sound 'gm
   :program 'clarinet)

  (drone
    :length drone-len
    :pitch '(c3)
    :velocity '(p)
    :channel 2)
  )
