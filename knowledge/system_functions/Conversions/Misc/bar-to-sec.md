Opusmodus                                                                   bar-to-sec   1

bar-to-sec sequence &key total ratio bpm
[Function]

Arguments and Values:
sequence                omn-form list or lists.
total                   T or NIL, the default is NIL.
ratio                   a ratio. The default is 1/4.
bpm                     an integer. (beat per minute). The default is 60.


Description:

This function converts bar span to seconds values.


Examples:
(setf omn '((e d6 s eb7 ff e d4 mp s cs7 ffff)
            (s b5 ff e bb5 mf) (qs eb3 f) (s b5 p)
            (s d6 ff) (h.s cs7 f) (s d6 f) (qs d6 mp)
            (s cs4) (qs b5 p) (s eb5 ffff)))

(bar-to-sec omn)
=> (1.5 0.75 1.25 0.25 0.25 3.25 0.25 1.25 0.25 1.25 0.25)

(bar-to-sec omn :total t)
=> 10.5

(bar-to-sec omn :ratio 1/8 :bpm 60)
=> (2.572 1.286 2.143 0.429 0.429 5.571 0.429 2.143 0.429 2.143 0.429)

(bar-to-sec omn :ratio '(1/4 1/4 1/4 1/8 1/8 1/4 1/4) :bpm 60)
=> (1.5 0.75 1.25 0.5 0.5 3.25 0.25 1.25 0.25 1.25 0.5)
