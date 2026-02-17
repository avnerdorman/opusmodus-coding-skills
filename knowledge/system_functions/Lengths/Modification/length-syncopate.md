Opusmodus                                                                       length-syncopate   1

length-syncopate values sequence &key set ignore
                             section exclude omn seed

[Function]

Arguments and Values:
values                    a list of values: (<count><divide> and optional <intervals>).
                          <intervals> types: NIL, '?, ‘r (pitch repeat) or list of intervals.
                          The default is '? at random from (-1 1 -2 2).
sequence                  a list of lengths or omn-form list.
set                       'min, 'max or length value.
ignore                    'min, 'max or length value.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
seed                      NIL or an integer. The default is NIL.
omn                       NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

The function LENGTH-SYNCOPATE is a valuable way of bringing more rhythmic interest
into a length list. The usual idea of syncopating rhythm is to 'choke' certain attacks so that the
attack is delayed or pre-empted.

(setf rhy '(1/4 1/4 1/4 1/4))

(length-syncopate '(1 4) rhy)
=> (1/4 3/16 1/16 1/4 1/4)




(length-syncopate '(2 4) rhy)
=> (1/16 3/16 1/4 3/16 1/16 1/4)
Opusmodus                                                                length-syncopate      2

Examples:
(length-syncopate '(1 4) '(1/4 -1/8 1/16 1/16 -1/8 1/8 1/1))
=> (1/4 -1/8 1/16 1/64 3/64 -1/8 1/8 1)




In the example above only 1 length is divided by 4 (1, 3) - that is the 1/16. In the example
below 2 values are divided by 3: (1, 2) and (2, 1).

(length-syncopate '(2 3) '(1/4 -1/8 1/16 1/16 -1/8 1/8 1/1))
=> (1/4 -1/8 1/48 1/24 1/16 -1/8 1/8 2/3 1/3)




(length-syncopate '(1 4) '(1/4 -1/8 1/16 1/16 -1/8 1/8 1/1)
                  :set 1/8)
=> (1/4 -1/8 1/16 1/16 -1/8 1/32 3/32 1)




Example with :set for each list:

(length-syncopate '((2 3) (1 4)) '((1/4 -1/8 1/16 1/16)
                                   (1/32 -3/32 1/8 1/1))
                  :set '(min 1/8))
=> ((1/4 -1/8 1/24 1/48 1/24 1/48) (1/32 -3/32 3/32 1/32 1))
Opusmodus                                                  length-syncopate   3

(length-syncopate '((2 3) (1 5)) '((q -e s s) (s -e. q h))
                  :set 'max :ignore 'h :omn t)
=> ((3h 3q -e s 3s 3e) (s -e. 5q 5w h))




OMN:

(setf mat '(q c4 d4 e4 f4 g4 a4 b4))

Pitch repeat is used if intervals are not de ned:

(length-syncopate '(3 4) mat)
=> (s b3 e. cs4 q d4 e. fs4 s d4 q f4 g4 a4 e. bb4 s c5)




Here we use a set of interval values:

(length-syncopate '(3 4 ((13 0) (0 14) (1 13))) mat)
=> (s cs5 e. c4 d4 s e5 q e4 f4 s gs4 e. gs5 q a4 b4)




(setf mat2 '((e c4 p e4 mp g4 he c5 p)
             (q c4 f c4 cs4 mp - d5 p d5)
             (q cs5 mf = - q cs5 stacc p = =))
                                    fi
Opusmodus                                               length-syncopate   4

(length-syncopate '((1 3 (-3 6)) (2 4 (6 0)) (2 5 (11 13))) mat2)
=> ((e c4 p e4 mp 3e 3q cs5 he c5 p)
    (q c4 f s fs4 e. c4 q cs4 mp - e. gs5 p s d5 q)
    (q cs5 mf cs5 - 5w c6 stacc 5q d6 stacc q cs5 p 5q c6 5w d6 q cs5))
