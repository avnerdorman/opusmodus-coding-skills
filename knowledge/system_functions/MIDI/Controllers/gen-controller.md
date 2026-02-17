Opusmodus                                                                       gen-controller   1

gen-controller span values &key min max time loop
[Function]

Arguments and Values:
span                     a number or a ratio (total length).
values                   integers or vector.
time                     a ratio or length symbol. The default is 1/128.
min                      a oating-point number or midi value. The default is 0.
max                      a oating-point number or midi value. The default is 127.
loop                     NIL or T. The default is NIL.


Description:

The GEN-CONTROLLER function generates controller values in a given span (total length)
with a de ned time for each of the values (<value><time>). The count of the sent
messages is the sum of the time values equal to the span value. For example span 1/4
with time 1/128 will produce 32 values.

(setf values (gen-sine 32 4 1.0))

(gen-controller 1/4 values)
=> ((64 1/128) (108 1/128) (127 1/128) (108 1/128)
    (63 1/128) (19 1/128) (0 1/128) (19 1/128) (64 1/128)
    (108 1/128) (127 1/128) (108 1/128) (64 1/128)
    (19 1/128) (0 1/128) (19 1/128) (64 1/128) (108 1/128)
    (127 1/128) (108 1/128) (63 1/128) (19 1/128) (0 1/128)
    (19 1/128) (64 1/128) (108 1/128) (127 1/128) (108 1/128)
    (63 1/128) (19 1/128) (0 1/128) (19 1/128))

The :min and :max option allows you to control the minimum and maximum value of the
sent messages:

(gen-controller 1/4 values :min 20 :max 80)
=> ((50 1/128) (71 1/128) (80 1/128) (71 1/128) (50 1/128)
    (29 1/128) (20 1/128) (29 1/128) (50 1/128) (71 1/128)
    (80 1/128) (71 1/128) (50 1/128) (29 1/128) (20 1/128)
    (29 1/128) (50 1/128) (71 1/128) (80 1/128) (71 1/128)
    (50 1/128) (29 1/128) (20 1/128) (29 1/128) (50 1/128)
    (71 1/128) (80 1/128) (71 1/128) (50 1/128) (29 1/128)
    (20 1/128) (29 1/128))

If the values count is less than the sum of the :time values equal to the span than the
last value of the list is used to complete the count.
   fi
                    fl
                    fl
Opusmodus                                                          gen-controller   2

Test:

(/ 1/2 1/128)
=> 64

(gen-controller 1/2 values)
=> ((64 1/128) (108 1/128) (127 1/128) (108 1/128) (63 1/128)
    (19 1/128) (0 1/128) (19 1/128) (64 1/128) (108 1/128)
    (127 1/128) (108 1/128) (64 1/128) (19 1/128) (0 1/128)
    (19 1/128) (64 1/128) (108 1/128) (127 1/128) (108 1/128)
    (63 1/128) (19 1/128) (0 1/128) (19 1/128) (64 1/128)
    (108 1/128) (127 1/128) (108 1/128) (63 1/128) (19 1/128)
    (0 1/128) (19 1/128) (19 1/128) (19 1/128) (19 1/128)
    (19 1/128) (19 1/128) (19 1/128) (19 1/128) (19 1/128)
    (19 1/128) (19 1/128) (19 1/128) (19 1/128) (19 1/128)
    (19 1/128) (19 1/128) (19 1/128) (19 1/128) (19 1/128)
    (19 1/128) (19 1/128) (19 1/128) (19 1/128) (19 1/128)
    (19 1/128) (19 1/128) (19 1/128) (19 1/128) (19 1/128)
    (19 1/128) (19 1/128) (19 1/128) (19 1/128))

The loop option will trim the values to complete the time count:

(gen-controller 1/2 values :loop t)
=> ((64 1/128) (108 1/128) (127 1/128) (108 1/128) (63 1/128)
    (19 1/128) (0 1/128) (19 1/128) (64 1/128) (108 1/128)
    (127 1/128) (108 1/128) (64 1/128) (19 1/128) (0 1/128)
    (19 1/128) (64 1/128) (108 1/128) (127 1/128) (108 1/128)
    (63 1/128) (19 1/128) (0 1/128) (19 1/128) (64 1/128)
    (108 1/128) (127 1/128) (108 1/128) (63 1/128) (19 1/128)
    (0 1/128) (19 1/128) (64 1/128) (108 1/128) (127 1/128)
    (108 1/128) (63 1/128) (19 1/128) (0 1/128) (19 1/128)
    (64 1/128) (108 1/128) (127 1/128) (108 1/128) (64 1/128)
    (19 1/128) (0 1/128) (19 1/128) (64 1/128) (108 1/128)
    (127 1/128) (108 1/128) (63 1/128) (19 1/128) (0 1/128)
    (19 1/128) (64 1/128) (108 1/128) (127 1/128) (108 1/128)
    (63 1/128) (19 1/128) (0 1/128) (19 1/128))

Example with user de ned :time:

(setf length '(q = s = = = h))

(gen-controller 2 values :time length)
=> ((64 1/4) (108 1/4) (127 1/16) (108 1/16) (63 1/16)
    (19 1/16) (0 1/2) (19 1/4) (64 1/4) (108 1/16)
    (127 1/16) (108 1/16) (64 1/16))

GEN-CONTROLLER inside the DEF-SCORE instrument instance:

:controllers (45 (gen-controller 1/2 values :loop t))
               fi
Opusmodus                                                 gen-controller   3

Score Example:
(progn
  (setf vec1 (gen-sine 1024 3 1))
  (setf vec2 (gen-sine 1024 4 1))
  (setf vec3 (gen-sine 1024 10 0.5))

  (def-score ctrl
             (:key-signature 'chromatic
              :time-signature '(8 4)
              :tempo 78)
    (ctrl
     :omn '((w c4 c4) (w cs5 cs5) (w d4 d4) (w eb5 eb5) (d eb5))
     :sound 'gm
     :channel 1
     :program 'String-Ensemble-1
     :volume (gen-controller 10 vec1 :min 20 :max 100)
     :tuning '((0 0.25) (-0.5 0) (0 0.5) (0.5 0.75) (0.5))
     :pan (assemble-seq (gen-controller 5 vec2) (gen-controller 5 vec1))
     :controllers (1 (assemble-seq '(127 5) (gen-controller 5 vec1))))
    ))
