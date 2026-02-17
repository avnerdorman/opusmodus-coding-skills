Opusmodus                                                                         add-sequences   1

add-sequences &rest sequences
[Function]

Arguments and Values:
sequences               an arbitrary number of sequences of numbers, all of the same size.


Description:

This function returns a new sequence formed by adding the sequences together on an
element by element basis.

(add-sequences '(1 2 3) '(4 5 6) '(7 8 9))
=> (12 15 18)


Score Example:

It has potential for creating expanding (or contracting) sequences of integers which can
be transformed into pitch phrase structures. In this example the function ADD-SEQUENCES
is used to create a percussion backdrop.

(setf phrase (rndn 20 0 6))
=> (2 5 4 3 2 2 4 2 6 2 3 5 4 5 3 4 6 5 5 1)

(setf 4-phrases (rnd-repeat '(4 4 4 4) phrase :seed 8))
=> ((6 2 5 2) (2 4 2 6) (2 2 2 5) (3 6 6 4))

Congas and bongos

(setf p-phrases (integer-to-pitch 4-phrases))
=> ((fs4 d4 f4 d4) (d4 e4 d4 fs4)
    (d4 d4 d4 f4) (eb4 fs4 fs4 e4))

(setf lis (add-sequences (1~ 4-phrases) (2~ 4-phrases)
                         (3~ 4-phrases) (4~ 4-phrases)))
=> (13 14 15 17)

(setf motif-1 (gen-repeat (1~ lis) (1~ p-phrases)))
(setf motif-2 (gen-repeat (2~ lis) (2~ p-phrases)))
(setf motif-3 (gen-repeat (3~ lis) (3~ p-phrases)))
(setf motif-4 (gen-repeat (4~ lis) (4~ p-phrases)))

(setf structure (list motif-1 motif-2 motif-3 motif-4))
Opusmodus                                                                 add-sequences   2

(setf rhy (length-rest-series
           (gen-repeat 6 (flatten 4-phrases))
           (span structure '(s))))

In the conversion of the phrase integers to velocity the composer can use oat or MIDI
values values obtained through the GET-VELOCITY function.

(setf v-phrase (get-velocity (a*x 20 phrase) :type :float))
(setf vel (span structure v-phrase))

(setf perc (make-omn
            :length rhy
            :pitch structure
            :velocity vel))

(def-score p-solo
  (:key-signature 'chromatic
   :time-signature '(2 8)
   :tempo '(q 90))

 (congas
   :omn perc
   :channel 10 :sound 'gm)
 )

(display-midi (compile-score 'p-solo))
                                                                 fl
