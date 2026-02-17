Opusmodus                                                                          filter-density         1

filter-density density sequence &key type tolerance closest seed
[Function]

Arguments and Values:
density                 density values in range 0.0 to 1.0.
sequence                a sequence (omn-from, lengths, pitches or velocities list).
type                    :length, :pitch and velocity. The default is NIL.
tolerance               tolerance value. The default in 0.08.
closest                 NIL or t. T returns a closest value in the sequence to the given density value.
                        The default is NIL.
seed                    an integer or NIL. An integer ensures the same result each time the code
                        is evaluated. The default is NIL.


Description:

The function FILTER-DENSITY analyses all bars in a given sequence and returns a new
sequence based on the list of density values and their order.


Example:

A short demonstration on how the density information, taken from a number of patterns can
be used in a compositional manner.

(setf
 p00 '(-w.)

 p01 '(q d4 pp s eb4 < leg g4 < leg bb4 < leg a4 q. cs5 mf
       -e 3q gs5 > leg fs5 > leg c5 > b4 pp leg f4 leg e4)
 p02 '(t d4 < leg eb4 < leg g4 < leg bb4 q. a4 marc t fs4 mf leg gs4 leg
       e. c5 e b4 t f5 leg e5 leg d5 leg eb5 3q bb5 > a4 > bb5 >
       e a4 pp stacc -e)
 p03 '(q d5 leg eb5 3q g4 stacc bb4 stacc a4 stacc e. cs4 marc
       s gs4 leg q gs4 -q)
 p04 '(q. fs5 pp 3e c5 < leg b4 < leg f4 e d5 mf s eb5 leg
       g5 leg bb5 leg a5 e fs5 leg fs5 3e gs4 > stacc c5 > stacc
       b5 > stacc t f5 pp e.. e5)
 p05 '(-q. e d4 pp q. eb5 mf e g4 q bb4 a4)
 p06 '(q cs4 pp -q t gs4 marc e.. fs4 mf leg e c4 -e t b4 leg f4
       q.. e4 pp)
 p07 '(-q e d4 leg eb4 h g4 mf leg q. g4 > -e)
 p08 '(s bb4 pp leg a4 h. db4 t gs4 mp fs4 < c5 < b4 q f5 f marc e5)
 p09 '(h. eb4 pp q g3 -e q gs4 mf -s a5 p tie)
 p10 '(e. a5 -e q bb4 mf -s q cs5 p -s q. e5 mf -e.)
 p11 '(q cs5 p h. d5 mf -q c5 pp tie)
 p12 '(h c5 pp h. gs3 -e a4 p)
Opusmodus                                                    filter-density   2

 p13 '(h. fs5 mp q bb3 c5 p e4 mf tie)
 p14 '(h e4 -e q cs4 mp h d5 p e f4)
 )

(setf mat (assemble-seq
           p00 p01 p02 p03 p04 p05 p06 p07 p08 p09 p10 p11 p12 p13 p14))

(setf
 ; bar 1   2   3   4   5   6   7   8   9 10 11 12 13 14
 p1 '(0.2 0.0 0.2 0.0 0.2 0.3 0.8 0.2 0.3 0.0 0.2 0.2 0.0 0.1)
 p2 '(0.0 0.2 0.6 0.3 0.0 0.5 0.2 0.7 0.0 0.2 0.0 0.2 0.3 0.2)
 p3 '(0.2 0.7 0.0 0.0 0.2 0.3 0.2 0.0 0.7 0.0 0.3 0.2 0.5 0.1)
 p4 '(0.1 0.0 0.0 0.2 0.8 0.2 0.0 0.2 0.2 0.0 0.2 0.2 0.3 0.2)
 p5 '(0.0 0.0 0.2 0.0 0.2 0.0 0.1 0.0 0.0 0.8 0.2 0.2 0.2 0.1)
 )

(setf
 v1 (filter-density p1 mat :type :length :seed 253)
 v2 (filter-density p2 mat :type :length :seed 743)
 v3 (filter-density p3 mat :type :length :seed 545)
 v4 (filter-density p4 mat :type :length :seed 987)
 v5 (filter-density p5 mat :type :length :seed 234)
 )

(setf
 fl (unfold 'om '(t7 ? (a12 1) dyn fl) v1)
 ob (unfold 'om '(t7 i (a12 3 6 8) dyn ob) v2)
 cl (unfold 'om '(t7 ? (a12 2 9 14) (ra 9) dyn cl) v3)
 hn (unfold 'om '(t-5 t-12 ra rol dyn hn) v4)
 bn (unfold 'om '(t-5 t-12 i rol dyn bn) v5)
 )

(ps 'gm :w5 (list fl ob cl hn bn) :tempo 68)


Relevant Functions
----------------------------------------------------------
DENSITY-ANALYSIS
DENSITY
