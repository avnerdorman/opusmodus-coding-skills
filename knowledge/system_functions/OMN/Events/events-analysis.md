Opusmodus                                                         events-analysis   1

events-analysis bar sequence
[Function]

Arguments and Values:
bar                   a bar number.
sequence              omn sequence.


Description:

The function EVENTS-ANALYSIS analyses a list of events of a given bar in a
sequence.


Examples:
(setf mat
      '((5h fs6 mp stacc 5q f6 ten - fs6 fermata)
        (3h bb6 p stacc -3q)
        (5q gs6 f stacc a6 ten - gs6 fs6 fermata)
        (5e gs6 mf stacc fs6 stacc 5q g6 ten - gs6 fermata g6)
        (s bb6 mp fermata-l b6 ten bb6 -)
        (5q f6 p stacc 5h fs6 ten 5q f6 -)
        (5q eb6 f stacc - 5h e6 ten 5q eb6)))

(events-analysis 2 mat)
=> Bar: 2
   Time Signature: (1 4 1)
   Events: ((3h bb6 p stacc) (-3q))
   Span: (1/6 1/12)
   Pitch: (bb4)
   Prime Form: nil
   Normal Order: nil
   Velocity: (p)
   Ambitus: (bb6 bb6)
   Interval Ambitus: 0
Opusmodus                                                events-analysis   2

(events-analysis 4 mat)
=> Bar: 4
   Time Signature: (1 4 1)
   Events: ((5e gs6 mf stacc) (5e fs6 mf stacc)
            (5q g6 mf ten) (-5q) (5q gs6 mf fermata) (5q g6 mf))
   Span: (1/40 1/40 1/20 1/20 1/20 1/20)
   Pitch: (gs4 fs4 g4)
   Prime Form: (0 1 2)
   Normal Order: (6 7 8)
   Velocity: (mf)
   Ambitus: (fs6 gs6)
   Interval Ambitus: 2

(setf mat2 '((h. f6 mp stacc)
             (-q h a4d2 p fermata e fermata)
             (e. a4d2 p - h e4g3 mf s fs6 p e c6 mp ten e. cs4 p tie)
             (e cs4 p q gs5eb6 h b2 p stacc e stacc)
             (q b2 p tie s q f6a4 mf -e q. d2 p ten)
             (h d2 p tie s q e4 mp tr2 s tr2 -q. q f4 stacc)
             (s f4 h. a3gs5 p fermata -e. -s)))

(events-analysis 5 mat2)
=> Bar: 5
   Time Signature: (17 16 1)
   Events: ((q b2 p tie) (s b2 p) (q f6a4 mf) (-e) (q. d2 p ten))
   Span: (1/4 1/16 1/4 1/8 3/8)
   Pitch: (b4 f4 a4 d4)
   Prime Form: (0 2 5 8)
   Normal Order: (9 11 2 5)
   Velocity: (p mf)
   Ambitus: (d2 f6)
   Interval Ambitus: 51
