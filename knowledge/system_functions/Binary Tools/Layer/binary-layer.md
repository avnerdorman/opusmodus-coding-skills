Opusmodus                                                                            binary-layer     1

binary-layer lists &key rnd prob seed
[Function]

Arguments and Values:
lists                    lists.
rnd                      T or NIL. The default is NIL.
prob                     Optional parameter with a default value of 0.5. This is a oating-point
                         number ranging between 0.0 and 1.0, which affects the distribution
                         of the generated random number within the speci ed range. A lower value for
                         this parameter increases the likelihood of selecting a lower number within
                         the given range, while a higher value favours the selection of higher numbers.
seed                     This is an integer that guarantees consistent results each time the code is
                         evaluated. By providing a speci c seed, you can ensure that the randomness in
                         your code is reproducible. The default value for seed is NIL, which means the
                         seed is not set, resulting in different outputs on each run due to natural
                         randomness.


Description:

The BINARY-LAYER function returns a new list of numbers and 0 (zeros) taken from
any number of layers where the priority of the collected values depends on the position of the
layer within the list.

In the example below the rst collected value is 1 taken from the rst layer of the list:

(binary-layer
 (list
  '(1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 1 0 0)
  '(2 0 2 0 0 2 0 0 0 2 0 0 0 0 0 2 0 0 0 0 0 0 0)
  '(3 0 0 3 0 0 0 3 0 0 0 0 0 3 0 0 0 0 0 0 0 3 0)))
=> (1 0 2 3 1 2 0 3 0 2 1 0 0 3 0 2 0 0 1 0 1 3 0)

Here we randomize the layers position within the list with a keyword :rnd T

(binary-layer
 (list
  '(1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 1 0 0)
  '(2 0 2 0 0 2 0 0 0 2 0 0 0 0 0 2 0 0 0 0 0 0 0)
  '(3 0 0 3 0 0 0 3 0 0 0 0 0 3 0 0 0 0 0 0 0 3 0))
 :rnd t)
=> (1 0 2 3 1 2 0 3 0 2 1 0 0 3 0 2 0 0 1 0 1 3 0)
or (2 0 2 3 1 2 0 3 0 2 1 0 0 3 0 2 0 0 1 0 1 3 0)
or (3 0 2 3 1 2 0 3 0 2 1 0 0 3 0 2 0 0 1 0 1 3 0)
                   fi
                                                 fi
                                                                fi
                                                                     fi
                                                                           fl
Opusmodus                                                   binary-layer   2

(binary-layer
 (list
  '(1 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 1 0 0)
  '(2 0 2 0 0 2 0 0 0 2 0 0 0 0 0 2 0 0 0 0 0 0 0)
  '(3 0 0 3 0 0 0 3 0 0 0 0 0 3 0 0 0 0 0 0 0 3 0))
 :rnd t :seed 34)
=> (2 0 2 3 1 2 0 3 0 2 1 0 0 3 0 2 0 0 1 0 1 3 0)


Examples:
(setf intervals (rnd-sum 32 '(4 6 8 2 3)))

(setf layer
      (binary-layer
       (list
        (gen-binary-interval (gen-rotate 1 intervals) 1)
        (gen-binary-interval (gen-rotate 2 intervals) 2)
        (gen-binary-interval (gen-rotate 3 intervals) 3)
        (gen-binary-interval (gen-rotate 4 intervals) 4))
       :rnd t))
=> (2 0 4 1 3 0 4 2 3 1 4 3 0 2 0 0 0 3 0 1 0 2 1 2 1 3 2 3 1 4 3 0)
