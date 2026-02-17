Opusmodus                                                                    interleave-map    1

interleave-map count lists
[Function]

Arguments and Values:
count                     lists of integers.
list                      list of lists.


Description:

This function is able to mix any number of element patterns in a list or 'interleave' group their
elements sequentially. In the example below the ' rst' integer list group dictates the number
of sequential changes in the 'second' list group of pitches.

(setf
 i-1 '(1 2 1 2)
 i-2 '(2 1)
 )

(setf
 p-1 '(c4 cs4 fs4 g4 c5)
 p-2 '(c5 b4 fs4 f4 c4)
 )

(interleave-map (list i-1 i-2) (list p-1 p-2))
=> ((c4) (c5 b4) (cs4 fs4) (fs4) (g4) (f4 c4) (c5))

Let's lay it out like this to see where each pitch comes from:

((c4)         (cs4 fs4)       (g4)         (c5))
(     (c5 b4)           (fs4)      (f4 c4)     )


Examples:
(setf
 p1 '(3 2 3 3 1)
 p2 '(1 2 3)
 p3 '(1 1 1 3 1)
 )

(setf
 s1 '(c4 d4 e4 f4 g4 a4)
 s2 '(cs4 ds4 e4 f4 gs4 as4)
 s3 '(cs5 ds5 e5 f5 gs5 as5)
 )
                                               fi
Opusmodus                                                 interleave-map   2

(interleave-map (list p1 p2 p3) (list s1 s2 s3))
=> ((c4 d4 e4) (cs4) (cs5) (f4 g4) (ds4 e4) (ds5)
    (a4) (f4 gs4 as4) (e5) (f5 gs5 as5))

(setf p01 '((q d4 pp) (s eb4 < leg g4 < leg bb4 < leg a4) (q cs5 mf)
            (-q) (3q gs5 > leg fs5 > leg c5 >) (q b4 > leg f4 leg e4)))

(setf p02 '((t d4 < leg eb4 < leg g4 < leg bb4 e a4) (-q) (q a4 marc)
            (t fs4 mf leg gs4 leg e. c5)
            (e b4 t f5 leg e5 leg d5 leg eb5)
            (3q bb5 > a4 > bb5 >) (e a4 pp stacc -e)))

(interleave-map '((1 2 1 2) (2 1)) (list p01 p02))
=> ((q d4 pp) (t d4 < leg eb4 < leg g4 < leg bb4 e a4) (-q)
    (s eb4 < leg g4 < leg bb4 < leg a4) (q cs5 mf) (q a4 marc)
    (-q) (t fs4 mf leg gs4 leg e. c5)
    (e b4 t f5 leg e5 leg d5 leg eb5)
    (3q gs5 > leg fs5 > leg c5 >) (q b4 > leg f4 leg e4)
    (3q bb5 > a4 > bb5 >))
