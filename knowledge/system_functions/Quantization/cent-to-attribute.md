Opusmodus                                                             cent-to-attribute   1

cent-to-attribute values
[Function]

Arguments and Values:
values                   a list of integers (cents).


Description:

This function converts a list of cent values into cent attributes. Use this function to
display the remaining cent values from a list of oating point numbers after a quantisation.

(cent-to-attribute '(-21 -8 12 -23 -19 -11 2 -5 -21 -3 7 -18))
=> (-21c -8c 12c -23c -19c -11c 2c -5c -21c -3c 7c -18c)


Examples:
(setf values (rndn 12 -24.0 24.0))
=> (-7.713619 -14.579453 15.1178665 16.266499 12.808762 14.388897
    2.5207481 -16.045317 21.785748 21.965816 -3.9338093 -15.677707)

(setf length (quantize (scale-numbers .1 values) '(1 2 3 4 5 6 7 8)))
=> (-q -q -s q. q.t et_3h 3q_qt s -et -q ht q..._7h -7wq -q -s)

(setf pitch (integer-to-pitch (micro-quantize values :quantize 1/4)))
=> (e3+ a2+ eb5 e5+ cs5 d5+ d4+ gs2 bb5 bb5 gs3 gs2+)

(setf rem (micro-quantize values :quantize 1/4 :remain t))
=> (-21 -8 12 -23 -19 -11 2 -5 -21 -3 7 -18)

(setf cents (cent-to-attribute rem))
=> (-21c -8c 12c -23c -19c -11c 2c -5c -21c -3c 7c -18c)
                                               fl
Opusmodus                                                  cent-to-attribute       2

(make-omn :length length
          :pitch pitch
          :articulation cents)


                                                    +12c              -23c
                        -21c
                                      -8c 2


                                                              3



             -19c              -11c           +2c
     3                                4             7             5




                                                                       Opusmodus
