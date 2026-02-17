Opusmodus                                                            time-swallow   1

time-swallow time chord-size length pitch &key type
[Function]

Arguments and Values:
time                  length-value (ratio or length-symbol).
chord-size            an integer or list of integers.
length                a length sequence.
pitch                 a pitch sequence.
type                  1 or 2. The default is 1.


Description:

The function TIME-SWALLOW 'swallows' sequence of pitches derived from the divide of
every length value of a sequence by a given time value: (/ 1/2 1/16) = 8. The rest-
lengths are omitted.

(setf pmat '(c3 d3 e3 f3 g3 a3 b3 c4 d4 e4 f4 g4 a4 b4 c5))
(setf lmat '(1/4 1/8 1/8 1/4 1/4))

(time-swallow 1/16 1 lmat pmat)
=> (c3 g3 b3 d4 a4)

(setf length '(1/2 1/16 7/16 1/8 3/8 3/16 5/16 1/4 1/4 5/16 3/16 3/8))

(setf pitch (infinity-series 100 '(g4 gs4)))
=> (g4 gs4 fs4 a4 gs4 g4 f4 bb4 fs4 a4 g4 gs4 a4 fs4 e4 b4 gs4 g4
    f4 bb4 g4 gs4 fs4 a4 f4 bb4 gs4 g4 bb4 f4 eb4 c5 fs4 a4 g4
    gs4 a4 fs4 e4 b4 g4 gs4 fs4 a4 gs4 g4 f4 bb4 a4 fs4 e4 b4
    fs4 a4 g4 gs4 e4 b4 a4 fs4 b4 e4 d4 cs5 gs4 g4 f4 bb4 g4
    gs4 fs4 a4 f4 bb4 gs4 g4 bb4 f4 eb4 c5 g4 gs4 fs4 a4 gs4
    g4 f4 bb4 fs4 a4 g4 gs4 a4 fs4 e4 b4 f4 bb4 gs4 g4)

(time-swallow 1/16 1 length pitch)
=> (g4 fs4 a4 gs4 f4 f4 g4 fs4 a4 g4 g4 a4)

Time 1/16 in each length: 8 1 7 2 6 3 5 4 4 5 3 6

8                           1    7                     2
g4 gs4 fs4 a4 gs4 g4 f4 bb4 fs4 a4 g4 gs4 a4 fs4 e4 b4 gs4 g4
6                    3           5               4
f4 bb4 g4 gs4 fs4 a4 f4 bb4 gs4 g4 bb4 f4 eb4 c5 fs4 a4 g4 gs4
4            5                 3         6
a4 fs4 e4 b4 g4 gs4 fs4 a4 gs4 g4 f4 bb4 a4 fs4 e4 b4 fs4 a4
Opusmodus                                                       time-swallow   2

(make-omn
 :length length
 :pitch (time-swallow 1/16 1 length pitch))
=> (h g4 s fs4 q.. a4 e gs4 q. f4 e. qs g4 q fs4 a4 qs g4 e. q. a4)

Example with swallow :type 1 (default) and with chord-size (3 3 2 1):

(make-omn
 :length length
 :pitch (time-swallow 1/16 '(3 3 2 1) length pitch))
=> (h g4gs4fs4 s fs4a4g4 q.. a4g4 e gs4 q. f4bb4g4 e. f4bb4gs4
      qs g4bb4 q fs4 a4fs4e4 qs g4gs4fs4 e. g4f4 q. a4)

8-3                         1-3 7-2                    2-1
g4 gs4 fs4 a4 gs4 g4 f4 bb4 fs4 a4 g4 gs4 a4 fs4 e4 b4 gs4 g4
6-3                  3-3        5-2              4-1
f4 bb4 g4 gs4 fs4 a4 f4 bb4 gs4 g4 bb4 f4 eb4 c5 fs4 a4 g4 gs4
4-3          5-3               3-2       6-1
a4 fs4 e4 b4 g4 gs4 fs4 a4 gs4 g4 f4 bb4 a4 fs4 e4 b4 fs4 a4

Same as above but with swallow :type 2:

(make-omn
 :length length
 :pitch (time-swallow 1/16 '(3 3 2 1) length pitch :type 2))
=> (h g4gs4fs4 s g4gs4a4 q.. fs4e4 e gs4 q. a4f4bb4
      e. c5fs4a4 qs a4fs4 q fs4 f4bb4a4 qs fs4a4g4 e. fs4b4 q. cs5)

8-3                                1-3       7-2
g4 gs4 fs4 a4 gs4 g4 f4 bb4 fs4 a4 g4 gs4 a4 fs4 e4 b4 gs4 g4 f4 bb4 g4
2-1     6-3                         3-3
gs4 fs4 a4 f4 bb4 gs4 g4 bb4 f4 eb4 c5 fs4 a4 g4 gs4
5-2                 4-1           4-3
a4 fs4 e4 b4 g4 gs4 fs4 a4 gs4 g4 f4 bb4 a4 fs4 e4 b4
5-3                     3-2         6-1
fs4 a4 g4 gs4 e4 b4 a4 fs4 b4 e4 d4 cs5 gs4 g4 f4 bb4 g4
Opusmodus                                                   time-swallow   3

Examples:
(make-omn
 :length length
 :pitch (time-swallow 'e '(3 3 2 1) length pitch))
=> (h g4gs4fs4 s gs4g4f4 q.. gs4g4 e fs4 q. a4g4gs4 e. a4fs4e4
      qs e4b4 q gs4 f4bb4g4 qs g4gs4fs4 e. fs4a4 q. f4)

(make-omn
 :length length
 :pitch (time-swallow 'e '(3 3 2 1) length pitch :type 2))
=> (h g4gs4fs4 s f4bb4fs4 q.. fs4a4 e fs4 q. e4b4gs4
      e. bb4g4gs4 qs a4f4 q gs4 bb4f4eb4 qs fs4a4g4 e. a4fs4 q. b4)

(setf length2 (gen-length
               (distributive-cube (interference2 '(3 2))) '(1/16)))

(make-omn
 :length length2
 :pitch (time-swallow '(3e e s) '((3 3 2 1) (2 3)) length2 pitch))
=> ((h g4gs4fs4 q a4fs4e4 f4bb4 h f4 q a4fs4e4 e fs4a4gs4 g4f4
       q a4 g4gs4e4 e b4e4d4 cs5gs4 q f4 h f4bb4gs4
       q gs4g4f4 g4gs4 h f4)
    (q g4gs4 e fs4a4gs4 a4gs4 q gs4g4f4 e f4bb4 s bb4fs4a4 bb4fs4
       e bb4fs4a4 fs4a4 s a4g4gs4 a4g4 e a4g4gs4 q g4gs4
       e a4fs4e4 fs4e4 q e4b4gs4)
    (q g4gs4fs4 e gs4g4f4 f4bb4 q fs4 e a4fs4e4 s e4b4gs4 b4gs4
       e gs4 f4bb4g4 s g4gs4fs4 gs4fs4 e fs4 q f4bb4gs4
       e bb4f4eb4 eb4c5 q fs4)
    (h g4gs4 q a4fs4e4 f4bb4 h f4bb4gs4 q a4fs4 e fs4a4gs4 g4f4
       q a4fs4e4 g4gs4 e b4e4d4 cs5gs4 q f4bb4g4
       h f4bb4 q gs4g4f4 g4gs4 h f4bb4gs4))

(make-omn
 :length length2
 :pitch (time-swallow '(3e e s)
                      '((3 3 2 1) (2 3)) length2 pitch :type 2))
=> ((h g4gs4fs4 q e4b4gs4 fs4a4 h f4 q gs4fs4a4 e fs4e4b4 g4gs4
       q a4 gs4g4f4 e f4bb4gs4 f4eb4 q gs4 h bb4fs4a4
       q gs4fs4a4 a4g4 h gs4)
    (q g4gs4 e a4gs4g4 f4bb4 q fs4a4g4 e a4fs4 s e4b4gs4 gs4g4
       e g4f4bb4 g4gs4 s fs4a4f4 f4bb4 e bb4gs4g4 q bb4f4
       e c5fs4a4 g4gs4 q a4fs4e4)
    (q g4gs4fs4 e f4bb4fs4 g4gs4 q fs4 e g4f4bb4 s gs4fs4a4 f4bb4
       e gs4 bb4f4eb4 s fs4a4g4 gs4a4 e fs4 q b4g4gs4
       e g4f4bb4 fs4e4 q fs4)
    (h g4gs4 q fs4e4b4 gs4fs4 h bb4f4eb4 q fs4a4 e fs4e4b4 g4gs4
       q a4fs4b4 f4bb4 e bb4gs4g4 eb4c5 q fs4a4gs4
       h g4gs4 q a4gs4g4 gs4a4 h f4bb4g4))
