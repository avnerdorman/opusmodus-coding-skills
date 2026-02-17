Opusmodus                                                                        time-point-system        1

time-point-system pitch length &key type start mod pcs variant
                                denominator time-signature seed

[Function]

Arguments and Values:
pitch                     a pitch list or lists of pitches.
length                    a length or list of lengths (length symbol or ratio).
type                      integers: 1 or 2. (Type of time point system). The default is 1.
start                     integers: from 0 to 11 or ’? (at random).
                          The default is the rst integer in the pitch list.
mod                       an integer, the default is 12.
variant                   'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                          or '? (at random).
pcs                       pitch class set: 'n (normal order), 'r (retrograde), 'i (inversion).
                          The default is NIL.
denominator               an integer. The default is 4 (list round up to given time signature measure).
time-signature            time-signature measures. The default is '(3 4).
seed                      NIL or an integer (random seed). The default is NIL.


Description:

The Time Point System was rst developed by Milton Babbitt and is based on two principles:
1. The relationships in a pitch system are transferred in totality to the sphere of time
relations. 2. This transfer is accomplished through the linkage of one simple equivalence -
that of time intervals corresponding to pitch intervals.

There are two types of the time point system.
The type 1 is based on Milton Babbitt system
The type 2 is based purely on modus 12: 0=1, 1=2, 2=3, … 11=12
                     fi
                                    fi
Opusmodus                                               time-point-system   2

Examples:

Type 1:

(setf pitch1 '(f4 a4 gb4 ab4 e5 g4 db5 bb4 d4 c5 eb5 b4))
(setf pitch2 '((b4 d5 fs5) (d4 f4 a4)))

(time-point-system pitch1 's)
=> ((-q -s e. f4 tie s f4 e. a4 tie)
    (q a4 tie e a4 fs4 q gs4 tie)
    (q gs4 e. e5 q g4 tie s g4 tie)
    (s g4 h cs5 tie s cs5 e bb4 tie)
    (e bb4 h d4 tie e d4)
    (e. c5 s eb5 tie q eb5 tie e. eb5 s b4))




(time-point-system pitch1 's :start 0)
=> ((q f4 h a4 tie)
    (s a4 e fs4 s gs4 tie q gs4 tie e. gs4 s e5 tie)
    (e e5 q. g4 q cs5 tie)
    (q cs5 tie s cs5 e. bb4 tie s bb4 e. d4 tie)
    (q d4 tie e. d4 s c5 tie e c5 eb5 tie)
    (q eb5 tie e eb5 q. b4))
Opusmodus                                          time-point-system   3

(time-point-system pitch1 's :start '? :seed 34)
=> ((-e. s f4 tie e. f4 q a4 tie s a4 tie)
    (q a4 e fs4 q. gs4 tie)
    (e gs4 e5 tie s e5 e. g4 tie g4 s cs5 tie)
    (h cs5 q bb4)
    (h d4 tie e d4 c5 tie)
    (s c5 e. eb5 tie q eb5 tie s eb5 e. b4))




(time-point-system pitch1 's :mod 6)
=> ((-q -s q.. f4 tie)
    (e. f4 h a4 tie s a4)
    (e fs4 gs4 h e5 tie)
    (s e5 g4 e cs5 tie s cs5 q.. bb4 tie)
    (e. bb4 h d4 tie s d4 tie)
    (s d4 e. c5 e eb5 q. b4 tie)
    (s b4))
Opusmodus                                           time-point-system   4

(time-point-system pitch1 's :mod 6 :start 0)
=> ((h f4 tie e f4 a4 tie)
    (q a4 tie e. a4 s fs4 tie fs4 e gs4 s e5 tie)
    (h e5 s g4 e. cs5)
    (h bb4 tie e bb4 d4 tie)
    (h d4 e. c5 s eb5 tie)
    (s eb5 h b4 tie e. b4 tie)
    (s b4))




(time-point-system pitch1 's :mod 6 :start 2)
=> ((-e h f4 tie e f4)
    (h a4 tie s a4 e fs4 s gs4 tie)
    (s gs4 h e5 tie s e5 g4 cs5 tie)
    (e cs5 h bb4 tie e bb4)
    (h d4 tie e d4 c5 tie)
    (s c5 e eb5 h b4 tie s b4 tie)
    (s b4))




(time-point-system pitch2 's)
=> ((-h -e. s b4 tie)
    (e b4 d5 tie d5 q. fs5)
    (-e d4 tie s d4 e. f4 tie s f4 e. a4))
Opusmodus                                          time-point-system   5

(time-point-system pitch2 's :start 0)
=> ((e. b4 s d5 tie e. d5 q fs5 tie s fs5)
    (e. d4 s f4 tie e. f4 q a4 tie s a4))




(time-point-system pitch2 's :start '? :seed 34)
=> ((e. b4 s d5 tie e. d5 q fs5 tie s fs5)
    (-h -e d4 tie)
    (s d4 e. f4 tie s f4 q.. a4))




(time-point-system pitch2 's :mod 6)
=> ((-q -s q.. b4 tie)
    (e b4 h d5 tie e d5)
    (h. fs5)
    (-e d4 tie s d4 q.. f4 tie)
    (e. f4 h a4 tie s a4))




(time-point-system pitch2 's :mod 6 :start 0)
=> ((h b4 tie s b4 e. d5 tie)
    (q d5 tie e. d5 q fs5 tie s fs5)
    (e. d4 h f4 tie s f4 tie)
    (s f4 h a4 tie e. a4))
Opusmodus                                            time-point-system   6

(time-point-system pitch2 's :mod 6 :start '(0 2))
=> ((h b4 tie s b4 e. d5 tie)
    (q d5 tie e. d5 q fs5 tie s fs5)
    (-e d4 tie s d4 q.. f4 tie)
    (e. f4 h a4 tie s a4))




Type 2:

(time-point-system pitch1 's :type 2)
=> ((q f4 tie e f4 q. a4 tie)
    (q a4 fs4 tie e. fs4 s gs4 tie)
    (h gs4 q e5 tie)
    (s e5 e. g4 tie q g4 tie s g4 e cs5 s bb4 tie)
    (q bb4 tie bb4 tie e bb4 d4 tie)
    (s d4 c5 e eb5 tie eb5 q. b4 tie)
    (q b4 tie e b4))
Opusmodus                                                  time-point-system   7

(time-point-system pitch1 's :type 2 :start 0)
=> ((s f4 q a4 tie s a4 e fs4 q gs4)
    (h. e5)
    (e. g4 h cs5 tie s cs5)
    (q bb4 tie e bb4 q. d4 tie)
    (q d4 h c5)
    (h eb5 tie e. eb5 s b4 tie)
    (q b4 tie e b4))




(time-point-system pitch1 's :type 2 :start '? :seed 34)
=> ((q f4 h a4)
    (q fs4 tie s fs4 q.. gs4)
    (e. e5 s g4 tie q g4 tie s g4 e. cs5 tie)
    (q cs5 tie cs5 tie s cs5 e. bb4 tie)
    (q bb4 tie e bb4 s d4 q c5 tie s c5 tie)
    (q c5 tie e c5 eb5 q b4 tie)
    (q b4 tie e b4))
Opusmodus                                               time-point-system   8

(time-point-system pitch1 's :type 2 :mod 6)
=> ((q f4 tie e f4 a4 tie a4 s fs4 gs4 tie)
    (e gs4 q e5 tie s e5 g4 tie g4 e cs5 s bb4 tie)
    (q bb4 e. d4 s c5 q eb5)
    (q b4 tie e b4))




(time-point-system pitch1 's :type 2 :mod 6 :start 0)
=> ((s f4 h a4 tie e. a4)
    (h fs4 q gs4 tie)
    (q gs4 tie e gs4 q. e5 tie)
    (q e5 tie e e5 q. g4 tie)
    (e. g4 h cs5 tie s cs5)
    (h. bb4)
    (h d4 tie e d4 c5 tie)
    (q c5 tie e c5 q. eb5 tie)
    (q eb5 tie s eb5 b4))
Opusmodus                                               time-point-system   9

(time-point-system pitch1 's :type 2 :mod 6 :start 2)
=> ((e. f4 s a4 h fs4 tie)
    (e fs4 h gs4 tie e gs4 tie)
    (e gs4 e5 h g4 tie)
    (e. g4 h cs5 tie s cs5 tie)
    (e cs5 bb4 h d4 tie)
    (q d4 h c5 tie)
    (e c5 s eb5 b4 tie e b4))




(time-point-system pitch2 's :type 2)
=> ((h. b4)
    (e. d5 s fs5 tie q fs5 tie e fs5 d4 tie)
    (s d4 e. f4 tie f4 q a4 tie s a4 tie)
    (q a4 tie s a4))




(time-point-system pitch2 's :type 2 :start 0)
=> ((s b4 e. d5 tie s d5 q.. fs5 tie)
    (s fs5 d4 e f4 tie f4 q. a4 tie) (e a4))
Opusmodus                                               time-point-system   10

(time-point-system pitch2 's :type 2 :start '? :seed 34)
=> ((s b4 e. d5 tie s d5 q.. fs5 tie)
    (s fs5 h d4 tie e. d4) (e f4 q. a4))




(time-point-system pitch2 's :type 2 :mod 6 :start 0)
=> ((s b4 h d5 tie e d5 s fs5 tie)
    (q fs5 tie e. fs5 s d4 q f4) (e a4))




(time-point-system pitch2 's :type 2 :mod 6 :start '(0 2))
=> ((s b4 h d5 tie e d5 s fs5 tie)
    (q fs5 tie e. fs5 s d4 tie e d4 f4 tie)
    (q f4 a4))
Opusmodus                                              time-point-system   11

Mixing types:

(setf pitch3 '((e4 a4 fs4 d4) (f4 b4 c4 bb4) (eb4 ab4 db4 g4)))

(time-point-system pitch3 's :type '(2 1 1))
=> ((q e4 tie s e4 q.. a4 tie)
    (e. a4 s fs4 tie q fs4 tie e fs4 d4 tie)
    (s d4 -e. -s -s q. f4)
    (s b4 h c4 tie e c4 s bb4 tie)
    (s bb4 -e. q eb4 tie s eb4 e. gs4 tie)
    (e gs4 q. cs4 q g4 tie)
    (s g4))
Opusmodus                                              time-point-system   12

With :time-signature keyword:

(setf pitch4
      (row-group-combination
       4 '(6 6) '(6 6) '(0 1 2 3 4 5 6 7 8 9 10 11) :type :pitch))
=> ((f4 e4 eb4 d4 cs4 c4) (b4 bb4 a4 gs4 g4 fs4))

(time-point-system pitch4 's)
=> ((-q -s q.. f4 tie)
    (q f4 h e4 tie)
    (e. e4 h eb4 tie s eb4 tie)
    (e eb4 h d4 tie e d4 tie)
    (s d4 h cs4 tie e. cs4)
    (h. c4)
    (-h -e. s b4 tie)
    (q b4 tie b4 tie e b4 bb4 tie)
    (q bb4 tie bb4 tie s bb4 e. a4 tie)
    (h a4 q gs4 tie)
    (q gs4 tie e. gs4 q g4 tie s g4 tie)
    (q g4 tie e g4 q. fs4))
Opusmodus                                                time-point-system   13

(time-point-system pitch4 's :type '(1 2))
=> ((-q -s q.. f4 tie)
    (q f4 h e4 tie)
    (e. e4 h eb4 tie s eb4 tie)
    (e eb4 h d4 tie e d4 tie)
    (s d4 h cs4 tie e. cs4)
    (h. c4)
    (h. b4)
    (h bb4 tie e. bb4 s a4 tie)
    (q a4 tie a4 tie s a4 e. gs4 tie)
    (q gs4 tie e gs4 q. g4 tie)
    (e g4 fs4 tie q fs4 tie s fs4))




With :mod keyword:

(setf pitch5 '((eb4 f4 fs4 a4 c4) (bb4 c4 eb4 e4 f4)))

(time-point-system pitch5 '(s t) :type '(2 1) :mod '(3 4))
=> ((s eb4 e. f4 s fs4 a4 c4 -s q bb4 tie)
    (s bb4 s. c4 q eb4 tie t eb4 e4 q f4 tie t f4 tie)
    (s f4))
Opusmodus                                              time-point-system   14

With :pcs keyword:

(time-point-system pitch5 '(s t) :mod '(3 4) :pcs '(i r))
=> ((h eb4 tie e eb4 f4)
    (s fs4 a4 h c4 tie e c4 tie)
    (e c4 s. bb4 q c4 tie t c4 tie s c4 e. eb4 tie)
    (e eb4 tie t eb4 q e4 tie s. e4 q f4 tie)
    (e f4))
Opusmodus                                              time-point-system   15

With chords:

(setf clusters
      (gen-loop
       3 (flatten
          (gen-cluster '(3 4 2 3)
                       :type 'c
                       :transpose (rnd-sample 4 (gen-integer -12 12))))
      :seed 3568))

(time-point-system clusters 's)
=> ((-h -s e. a4bb4b4 tie)
    (e. a4bb4b4 h eb3e3f3fs3 tie s eb3e3f3fs3)
    (s c3cs3 h c3cs3d3 tie e. c3cs3d3 tie)
    (s c3cs3d3 -s cs4d4eb4 cs4d4eb4e4 e. d3eb3 q f4fs4g4 tie
     s f4fs4g4 tie)
    (e f4fs4g4 -e -s q.. eb3e3f3 tie)
    (e eb3e3f3 c5cs5d5eb5 q d4eb4 fs4g4gs4 tie)
    (e fs4g4gs4))
Opusmodus                                       time-point-system   16

L-SYSTEM with TIME POINT SYSTEM:

(defclass exp (l-system)
  ((axiom :initform '(c4 b3 ab3 bb3 a3 ab4))
   (depth :initform 3)))

(defmethod l-productions ((ls exp))
  (choose-production ls
                     (c4 (--> - + b3))
                     (b3 (--> ab3 + bb3))
                     (ab3 (--> bb3 a3))
                     (bb3 (--> a3 gb3 c4))
                     (a3 (--> gb3 + c4 -))
                     (ab4 (--> gb3 - + b3))))

(time-point-system
 (gen-divide 4 (pitch-lsystem 'exp :depth 3))
 's :type '(1 2 1 1 2))
=> ((-h -e bb3 tie)
    (q bb3 tie bb3 tie s bb3 a3 e bb3 tie)
    (q bb3 tie e. bb3 q g3 tie s g3)
    (e cs4 h bb3 tie e bb3 tie)
    (s bb3 e. g3 tie q g3 tie s g3 e cs4 -s)
    (-q -e q. g3 tie)
    (s g3 e. d4 tie d4 q gs3 tie s gs3 tie)
    (e gs3 h eb4 tie s eb4 -s)
    (-q -e. q gs3 tie s gs3)
    (q cs4 tie e. cs4 q gs3 tie s gs3 tie)
    (e gs3 h eb4 tie s eb4 gs3 tie)
    (h gs3 e cs4 gs3 tie)
    (q gs3 tie e. gs3 s d4 tie e d4 -e)
    (-q -e q. gs3)
    (q d4 tie e d4 gs3 bb3 cs4)
    (h a3 tie e a3 s c4 eb4 tie)
    (e. eb4 -h -s)
    (-s e. bb3 tie s bb3 q.. d4 tie)
    (q d4 s cs4 q.. d4 tie)
    (e. d4 -h -s)
    (-e q. b3 q f4 tie)
    (e. f4))
Opusmodus   time-point-system   17
