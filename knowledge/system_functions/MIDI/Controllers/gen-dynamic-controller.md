Opusmodus                                                         gen-dynamic-controller   1

gen-dynamic-controller omn-sequence &key scale loop
[Function]

Arguments and Values:
omn-sequence          omn-form sequence.
scale                 a oating point number from 0.1 to 2.0. The default is 1.0.
loop                  NIL or T. The T (true) will loop the scale list to the count
                      of the lists in the sequence. The default is NIL.


Description:

The GEN-DYNAMIC-CONTROLLER function generates controller values from the omn-
sequence dynamic symbols.

(setf omn
      '((h. eb4 pp tasto q g3 0<pp>0 ponte)
        (-e) (q gs4 fp tasto) (-s) (q a5 ffp)
        (-e) (q bb4 fffp) (-s) (q cs5 pf)
        (-s q. e5 fp -e.) (q cs5 p h. d5 pfp)
        (-q h. c5 pp) (h. gs3 0<ppp>0 ponte -e a4 p< tasto)
        (h. fs5 mp q bb3 0<pp>0 ponte)
        (q c5 p tasto h. e4 pfp) (-e)
        (q cs4 fp h d5 pp>pppp) (h. f4 pp>pppp)))

(gen-dynamic-controller omn)
=> ((36 3/4) (:asc-desc 0 36 1/256 1/4) (0 1/8)
    (80 1/64) (:desc 40 25 1/256 15/64) (0 1/16)
    (91 1/64) (:desc 45 25 1/256 15/64) (0 1/8)
    (102 1/64) (:desc 50 25 1/256 15/64) (0 1/16)
    (25 1/64) (:asc 20 91 1/256 15/64) (0 1/16)
    (80 1/64) (:desc 40 25 1/256 23/64) (0 3/16) (47 1/4)
    (:asc 20 91 1/256 1/2) (:desc 91 20 1/256 1/4) (0 1/4)
    (36 3/4) (:asc-desc 0 25 1/256 3/4) (0 1/8) (47 1/8)
    (58 3/4) (:asc-desc 0 36 1/256 1/4) (47 1/4)
    (:asc 20 91 1/256 1/2) (:desc 91 20 1/256 1/4) (0 1/8)
    (80 1/64) (:desc 40 25 1/256 15/64)
    (:desc 36 14 1/256 1/2) (:desc 36 14 1/256 3/4))
                 fl
Opusmodus                                                        gen-dynamic-controller      2

This is the notation of the sequence, see above:




Examples:

To scale up the controller values we set the :scale value higher than 1.0. To scale down
the controller values we set the :scale value lower than 1.0.

Here the :scale value is 1.2:

(gen-dynamic-controller omn :scale 1.2)
=> ((43 3/4) (:asc-desc 0 43 1/256 1/4) (0 1/8)
    (96 1/64) (:desc 48 30 1/256 15/64) (0 1/16)
    (109 1/64) (:desc 54 30 1/256 15/64) (0 1/8)
    (122 1/64) (:desc 60 30 1/256 15/64) (0 1/16)
    (30 1/64) (:asc 24 109 1/256 15/64) (0 1/16)
    (96 1/64) (:desc 48 30 1/256 23/64) (0 3/16) (56 1/4)
    (:asc 24 109 1/256 1/2) (:desc 109 24 1/256 1/4) (0 1/4)
    (43 3/4) (:asc-desc 0 30 1/256 3/4) (0 1/8) (56 1/8)
    (70 3/4) (:asc-desc 0 43 1/256 1/4) (56 1/4)
    (:asc 24 109 1/256 1/2) (:desc 109 24 1/256 1/4) (0 1/8)
    (96 1/64) (:desc 48 30 1/256 15/64)
    (:desc 43 17 1/256 1/2) (:desc 43 17 1/256 3/4))

To add more control to the dynamic of the sequence we can set each bar (a list) with their
own :scale value. In the example below the 4th value 1.0 will stay for all of the
remaining bars (lists).
Opusmodus                                                    gen-dynamic-controller     3

(gen-dynamic-controller omn :scale '(1.0 1.1 1.2 1.0))

Adding :loop to the :scale keyword we are looping the :scale values to the count of
the lists in the sequence:

(gen-dynamic-controller omn :scale '(1.0 1.1 1.2 1.0) :loop t)



Score Example:

It is important to use the same omn-sequence data that you are using in the DEF-SCORE
instrument instance.

(setf omn
      '((h. eb4 pp tasto q g3 0<pp>0 ponte)
        (-e) (q gs4 fp tasto) (-s) (q a5 ffp)
        (-e) (q bb4 fffp) (-s) (q cs5 pf)
        (-s q. e5 fp -e.) (q cs5 p h. d5 pfp)
        (-q h. c5 pp) (h. gs3 0<ppp>0 ponte -e a4 p< tasto)
        (h. fs5 mp q bb3 0<pp>0 ponte)
        (q c5 p tasto h. e4 pfp) (-e)
        (q cs4 fp h d5 pp>pppp) (h. f4 pp>pppp)))

GM sound set:

(def-score dynamic
           (:key-signature 'chromatic
            :time-signature (get-time-signature omn)
            :tempo 32
            :layout (violin-layout 'vln))

  (vln
    :omn omn
    :channel 1
    :sound 'gm
    :volume 127
      :program 'violin
    :controllers (11 (gen-dynamic-controller omn)))
  )
Opusmodus                                             gen-dynamic-controller   4

VSL sound set:

(def-score dynamic
           (:key-signature 'chromatic
            :time-signature (get-time-signature omn)
            :tempo 32
            :layout (violin-layout 'vln))

  (vln
    :omn omn
    :port 0
    :channel 1
    :sound 'vsl-violin-solo
    :volume 127
    :controllers (11 (gen-dynamic-controller omn)))
  )
