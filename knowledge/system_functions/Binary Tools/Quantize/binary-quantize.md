Opusmodus                                                                            binary-quantize   1

binary-quantize binary quantize &key section exclude
[Function]

Arguments and Values:
binary                  a binary list.
quantize                an integer or list of integers.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.


Description:

With the function BINARY-QUANTIZE the hits (1) in a list of binary numbers is
quantized to a given number of steps. This is useful e.g. when used for durations to
simplify the rhythmic output.

(setf binary (gen-binary 4 24 :seed 645))
=> ((0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0)
    (0 0 0 0 1 0 0 1 0 0 0 0 0 0 1 1 1 0 0 0 0 0 1 0)
    (1 0 0 1 0 1 0 0 0 1 0 1 0 0 0 0 0 1 0 1 0 1 0 0)
    (0 1 0 0 0 0 0 0 1 0 1 0 1 1 0 0 0 0 0 0 1 0 0 1))

(binary-quantize binary 4)
=> ((1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0)
    (1 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0)
    (1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0)
    (1 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0))


Examples:
(length-rest-merge (binary-map binary 't))
=> ((-1/16 1/32 -3/32 1/32 -11/32 1/32 -5/32)
    (-1/8 1/32 -1/16 1/32 -3/16 1/32 1/32 1/32 -5/32 1/32 -1/32)
    (1/32 -1/16 1/32 -1/32 1/32 -3/32 1/32 -1/32
     1/32 -5/32 1/32 -1/32 1/32 -1/32 1/32 -1/16)
    (-1/32 1/32 -3/16 1/32 -1/32 1/32 -1/32
      1/32 1/32 -3/16 1/32 -1/16 1/32))
Opusmodus                                                binary-quantize   2

(length-rest-merge
 (binary-map
  (binary-quantize binary 4) 't))
=> ((1/32 -7/32 1/32 -7/32 1/32 -7/32)
    (1/32 -3/32 1/32 -3/32 1/32 -7/32 1/32 -7/32)
    (1/32 -3/32 1/32 -3/32 1/32 -3/32 1/32 -3/32 1/32 -3/32 1/32 -3/32)
    (1/32 -7/32 1/32 -3/32 1/32 -7/32 1/32 -3/32))


Score Example:
(progn
  (setf integers (gen-integer 1 32))
  (setf quant (rnd-sample 7 '(4 8 4 8)))

  (setf binary-list
        (gen-loop
         7 (gen-binary-row 32 (rnd-unique (rndn 1 1 7) integers))))

  (setf mat-orig
        (make-omn
         :length (length-rest-merge (binary-map binary-list 't))
         :pitch '(e5)))

  (setf mat-quant
        (make-omn
         :length (length-rest-merge
                  (binary-map (binary-quantize binary-list quant) 't))
         :pitch '(f4)))

  (def-score binary-quantize
             (:key-signature 'atonal
              :tempo 60
              :time-signature '(4 4)
              :layout (treble-layout '(toms-orig toms-quant)))

      (toms-orig
       :omn mat-orig
       :sound 'gm
       :channel 10
       :program 0)

      (toms-quant
        :omn mat-quant)
      )
  )
