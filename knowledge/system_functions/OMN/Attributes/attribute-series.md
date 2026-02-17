Opusmodus                                                       attribute-series   1

attribute-series series sequence
[Function]

Arguments and Values:
series                a list of values: (<attribute><count>).
sequence              an omn sequence.


Description:

The function ATTRIBUTE-SERIES inserts a series of attributes into an omn-form
sequence. The series list consists of two values: attribute and its count.


Examples:
(attribute-series
 '(leg 8)
 '(s g2 d3 b3 a3 b3 d3 b3 d3 g2 d3 b3 a3 b3 d3 b3 d3))




                                                    Opusmodus



(attribute-series
 '((leg 4) (- 4))
 '(s g2 d3 b3 a3 b3 d3 b3 d3 g2 d3 b3 a3 b3 d3 b3 d3))




                                                    Opusmodus
Opusmodus                                               attribute-series   2

(setf omn
      (make-omn
       :length '(s)
       :pitch (vector-to-pitch '(c2 c5) (gen-sine 64 5 .4))
       :span :pitch))




    2




    3




    4




                                                              Opusmodus



(attribute-series '((leg 4) (stacc 4)) omn)




    2




    3




    4




                                                              Opusmodus
Opusmodus                                                             attribute-series   3

In this example we generate the attribute values and its count separately:

(setf attr (rnd-sample 12 '(leg stacc -)))
=> (- - stacc stacc leg - leg - leg stacc leg stacc)

(setf div (rnd-sample 12 '(2 3 4 5)))
=> (4 2 3 5 2 5 4 5 5 5 3 4)

The next step is to create lists with two values each containing attribute and its count.
The MCLIST function helps us to create such lists:

(setf series (mclist attr div))
=> ((- 4) (- 2) (stacc 3) (stacc 5) (leg 2) (- 5)
    (leg 4) (- 5) (leg 5) (stacc 5) (leg 3) (stacc 4))

(attribute-series series omn)




    2




    3




    4




                                                                             Opusmodus
