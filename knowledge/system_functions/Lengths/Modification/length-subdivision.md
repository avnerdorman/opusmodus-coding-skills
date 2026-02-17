Opusmodus                                                                    length-subdivision    1

length-subdivision values sequence &key type position
                                section exclude omn seed

[Function]

Arguments and Values:
values                   a list of values: (<subdivision><segment> and optional
                         <intervals>). <intervals> types: NIL, '?,
                         'r (pitch repeat) or list of intervals.
                         The default is '? at random from (-1 1 -2 2).
sequence                 a list of lengths or omn-form list.
type                     'n (note), 'r (rest) or '? (at random). The default is 'n.
position                 's (start), 'e (end), 'c (centre) or '? (at random). The default is '?.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     NIL or an integer. The default is NIL.
omn                      NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

This function is able to divide a list of lengths into a number of subdivisions derived from a
given length segment value. The :type and :position option increases the control for
the desired result. When processing the omn-form sequence an optional third value allows
you to ll intervalic steps (a root transposition) to new length values derived from the
divisions. This function is a more sophisticated version of LENGTH-DIVIDE. It produces
fascinating variants on the simplest of note-lengths, as can be seen below.

(setf rhy '(1/4 1/4 1/4 1/4))

(length-subdivision '(2 1/8) rhy)
=> (1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8)




position 's (start):

(length-subdivision '(2 1/16) rhy :position 's)
=> (1/16 1/16 1/8 1/16 1/16 1/8 1/16 1/16 1/8 1/16 1/16 1/8)
fi
Opusmodus                                               length-subdivision   2

position 'e (end):

(length-subdivision '(2 1/16) rhy :position 'e)
=> (1/8 1/16 1/16 1/8 1/16 1/16 1/8 1/16 1/16 1/8 1/16 1/16)




type 'r (rest), position 'e (end):

(length-subdivision '(2 1/16) rhy :type 'r :position 'e)
=> (-1/8 1/16 1/16 -1/8 1/16 1/16 -1/8 1/16 1/16 -1/8 1/16 1/16)




type 'r (rest), position 's (end):

(length-subdivision '(2 s) rhy :type 'r :position 's)
=> (1/16 1/16 -1/8 1/16 1/16 -1/8 1/16 1/16 -1/8 1/16 1/16 -1/8)




type at random rest or note :

(length-subdivision '(2 s) rhy :type '? :position 's)
=> (1/16 1/16 -1/8 1/16 1/16 -1/8 1/16 1/16 -1/8 1/16 1/16 1/8)




position and type at random:

(length-subdivision '(1 e) rhy :type '? :position '?)
=> (1/16 1/8 1/16 1/8 1/8 -1/8 1/8 1/8 1/8)
Opusmodus                                               length-subdivision   3

(length-subdivision '((2 5q) (1 3q)) rhy :type '? :position 's)
=> (1/20 1/20 3/20 1/12 -1/6 1/20 1/20 3/20 1/12 -1/6)




(length-subdivision '((2 5q) (1 3q) (1 e) (1 s)) rhy)
=> (1/20 1/20 3/20 1/12 1/12 1/12 1/8 1/8 3/16 1/16)




Examples:
(setf rhy2 '((1/4 1/4 1/4 1/4) (1/4 1/4 1/4 1/4)))

(length-subdivision '(1 e) rhy2)
=> ((1/8 1/8 1/16 1/8 1/16 1/8 1/8 1/8 1/8)
    (1/16 1/8 1/16 1/8 1/8 1/8 1/8 1/8 1/8))




(length-subdivision '((1 e) (1 3q)) rhy2)
=> ((1/8 1/8 1/12 1/12 1/12 1/8 1/8 1/6 1/12)
    (1/16 1/8 1/16 1/6 1/12 1/8 1/8 1/6 1/12))




(length-subdivision '(((1 e)) ((1 3q))) rhy2)
=> ((1/8 1/8 1/16 1/8 1/16 1/8 1/8 1/8 1/8)
    (1/12 1/12 1/12 1/6 1/12 1/12 1/6 1/6 1/12))
Opusmodus                                              length-subdivision   4

(length-subdivision '((3 3q) (1 e)) '((q -e e h) (s e. q h)))
=> ((1/12 1/12 1/12 -1/8 1/8 1/12 1/12 1/12 1/4)
    (1/16 3/16 1/8 1/8 1/8 1/12 1/12 1/12 1/8))




(length-subdivision '(((3 3q)) ((1 e))) '((q -e e h) (s e. q h)))
=> ((1/12 1/12 1/12 -1/8 1/8 1/12 1/12 1/12 1/4)
    (1/16 1/16 1/8 1/16 1/8 1/16 1/8 3/8))




(length-subdivision '(((2 3q)) ((1 e))) '((q -e e h) (s e. q h))
                    :type '?)
=> ((1/12 1/12 1/12 -1/8 1/8 1/12 1/12 -1/3)
    (1/16 -1/16 1/8 1/8 1/8 1/8 3/8))




OMN:

(setf mat1 '(q c4 d4 e4 f4 g4 a4 b4))

(length-subdivision '(1 e) mat1)
=> (s cs4 e b3 s d4 e cs4 e4 s f4 e fs4
    s d4 e fs4 eb4 f4 a4 bb4 gs4 bb4 a4)
Opusmodus                                                 length-subdivision   5

The symbol 'r (third value) will apply repeat function:

(length-subdivision '(1 e r) mat1)
=> (s c4 e s e d4 d4 s e4 e s e f4 f4 g4 g4 a4 a4 b4 b4)




Here we de ne the intervals (third value):

(length-subdivision '(1 e (13 0 13 0)) mat1)
=> (s cs5 e c4 s cs5 e eb5 d4 s f5 e e4
    s f5 e fs5 f4 gs5 g4 bb5 a4 c6 b4)




(length-subdivision '(4 s (13 0 13 0)) mat1)
=> (s cs5 c4 cs5 c4 eb5 d4 eb5 d4 f5 e4 f5 e4 fs5 f4
      fs5 f4 gs5 g4 gs5 g4 bb5 a4 bb5 a4 c6 b4 c6 b4)




(length-subdivision '(2 3q (13 0 13 0)) mat1
                    :type '(r n) :position '(e s s s e s s))
=> (-3q cs5 c4 eb5 d4 eb5 f5 e4 - fs5
    f4 fs5 - gs5 g4 bb5 a4 bb5 c6 b4 -)
     fi
Opusmodus                                              length-subdivision   6

(setf mat2 '((e c4 p e4 mp g4 he c5 p)
             (q c4 f c4 cs4 mp - d5 p d5)
             (q cs5 mf = - - cs5 p =)))




(length-subdivision '((1 e (13 0 13 0)) (2 e (13 0 13 0))
                      (2 3q (13 0 13 0))) mat2 :type '?)
=> ((e c4 p e4 mp g4 q cs6 p e c5 q cs6)
    (e cs5 f c4 cs5 c4 -3q d5 mp cs4 -q e eb6 p d5 eb6 d5)
    (-s e cs5 mf -s e d6 cs5 -q - 3e d6 p 3q cs5 d6 3e cs5 e d6 cs5))




(length-subdivision '(((1 e (13 0 13 0))) ((2 s (13 0 13 0)))
                      ((2 3q r))) mat2 :type '?)
=> ((e c4 p e4 mp g4 q cs6 p e c5 q cs6)
    (e cs5 f s c4 cs5 -e s cs5 c4 e d5 mp
     s cs4 d5 -q -s eb6 p d5 - eb6 d5 eb6 d5)
    (3q cs5 mf cs5 cs5 cs5 cs5 cs5 -q - 3q cs5 p cs5 - - cs5 cs5))
Opusmodus                                                            length-subdivision   7

In the example below we assign three series of values to variables s1, s2 and s3:

(setf
 s1 '(2 e (6 12 18 24))
 s2 '(1 3q ((13 1 13 0) (13 0 7 1) r))
 s3 '(3 5q ((13 0 13 0 13) ?))
 )

(length-subdivision (list s1 s2 s3) mat2)
=> ((e c4 p 3e bb4 mp 3q e5 e cs6 cs5 p cs6 q.)
    (e fs4 f c5 3q cs5 cs4 cs5 5h mp
     5q c4 g4 c4 -q e c4 p c4 3q d5 3h cs4)
    (e g5 mf cs6 3q d6 3h d5 -q - 5q d6 p cs5 cs5 5h e d6 cs5))
