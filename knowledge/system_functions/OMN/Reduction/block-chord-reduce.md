Opusmodus                                                                 block-chord-reduce   1

block-chord-reduce sequence &key time row bar
[Function]

Arguments and Values:
sequence              omn sequences.
time                  a time-signature value or a sequence. The default is 4/4.
row                   NIL or T. The default is NIL. The T equals modus 12.
bar                   a bar number or bar numbers. The default is NIL.


Description:

The function BLOCK-CHORD-REDUCE reduces (compress) every bar of every instrument
into a single chord.

(setf rh
      '((-q. e gs3 f)
         (-q e a4 p stacc -)
         (-e q f5 f ten -e)
         ((acc e g6 mf) e6 p stacc -q.)
         (e cs4fs4c5 f marc -q e d3 p)
         (-e gs3 f - g6 p stacc)
         (-q. (acc e ds5 fff) e6 ff stacc)
         (-q c5 f ten)
         (-e (acc d6 mf) b5 p stacc - b3f5bb5 ff)
         (-q e a4 p stacc -)
         (-e cs4 f - c5 p stacc)
         (-q. e gs3 f)))

(setf lh
      '((-q e bb5 f -)
         (-e a4 p stacc -q)
         (q cs4 f ten -e (acc b2 mf) d3 p stacc)
         (-q. e fs4c5f5 f marc)
         (-q e e6 p -)
         (-q e bb5 f -)
         (e b2 p stacc - (acc eb4 fff) d3 ff stacc -)
         (-e q fs4 f ten -e)
         ((acc e e3 mf) e g3 p stacc -q.)
         (e gs3cs4g4 ff marc -q e a4 p stacc)
         (-q e f5 f -)
         (e fs4 p stacc -q.)))
Opusmodus                                                     block-chord-reduce   2

In this example we use the time-signature from the sequence rh:

(block-chord-reduce (list rh lh) :time rh)
=> ((1/2 gs3bb5) (1/2 a4) (1/2 f5cs4b2d3) (1/2 g6e6fs4c5f5)
    (1/2 cs4fs4c5d3e6) (1/2 gs3g6bb5) (1/2 ds5e6b2eb4d3)
    (1/2 c5fs4) (1/2 d6b5b3f5bb5e3g3) (1/2 gs3cs4g4a4)
    (1/2 cs4c5f5) (1/2 gs3fs4))




Reduce with option :row T (modus 12):

(block-chord-reduce (list rh lh) :time rh :row t)
Opusmodus                                              block-chord-reduce   3

Examples:

Score: "How-to/Chord Progression1.opmo"

(setf violin1
      '(#|1|# (-t a3 f -s -t b3 -s -t b3 -s -t b3 -s -t b3 -s -t b3
               -s -t b3 -s -t c4 -s)
        #|2|# (t c4 f c4 -s. t c4 c4 c4 c4 c4 -s. t c4 -s. t c4 -s.
               t d4 -s. t d4 -s. t d4 -s)
        #|3|# (-t d4 f -s. t d4 -s. t e4 -s. t e4 -s. t e4 -s. t e4
               -s. t e4 -s. t e4 -s)
        #|4|# (-t e4 f -s. e e4 s s c4 c4 c4 c4 c4 c4 c4 t - - - d4
               -s)
        #|5|# (-t e4 f -s -t e4 -s -t e4 -s -t e4 -s -t e4 -s -t e4
               -s -t e4 -s -t e4 -s)
        #|6|# (-t a4 f -s -t a4 -s -t a4 -s -t a4 -s -t a4 -s -t a4
               -s -t a4 -s -t a4 -s)
        #|7|# (-t b4 f -s. t b4 -s. t b4 -s. t b4 b4 b4 - b4 -s
                 -t b4 -s -t b4 -s -t b4 -s)
        #|8|# (-t b4 f -s. t b4 -s. t b4 -s. t b4 b4 c5 - c5 -s
               -t c5 -s -t d5 -s -t d5 -s)
        #|9|# (e.. d5 f s s s q e5 s s s t - s e5 t)
        #|10|# (-t s e5 f t - s e5 t - s e5 t - s e5 t - s e5 t
                - s e5 t - s a5 t - a5 -s)
        #|11|# (-t b5 f -s. t b5 b5 c6 c6 c6 -q -s. t a3 b3 b3 b3
                e -s.)
        #|12|# (-e -t b3 f b3 c4 c4 e -q t c4 c4 c4 c4 e s.)
        #|13|# (s c4 f -s. s d4 -e. t d4 d4 - d4 d4 e4 - e4 e4 e4
                - e4 e4 e4 - e4 s -t)
        #|14|# (-e -t s c4 f -e. t c4 c4 - c4 c4 c4 - c4 c4 d4
                - e4 e4 e4 - e4 -s.)
        #|15|# (-e -t s e4 f -e. t e4 e4 - e4 a4 a4 - a4 a4 a4
                - a4 a4 a4 - b4 -s.)
        #|16|# (s b4 f -s. s b4 -e. t b4 b4 - b4 b4 b4 - b4 b4 b4
                - b4 b4 b4 - b4 s c5 -t)
        #|17|# (-e -t c5 f c5 d5 d5 e -q t d5 d5 d5 e5 e s.)
        #|18|# (-t e5 f -s. t e5 e5 e5 e5 e5 -q -s. t e5 e5 e5 e5
                e -s.)
        #|19|# (-t s e5 f t - s e5 t - s e5 t a5 - s a5 t - s b5 t
                - s b5 t c6 - s c6 t - a3 -s)
        #|20|# (e.. b3 f s s s q s s c4 c4 t - s c4 t)
        #|21|# (-t c4 f -s. t c4 -s. t c4 -s. t c4 c4 d4 - d4 -s
                -t d4 -s -t d4 -s -t d4 -s)
        #|22|# (-t e4 f -s. t e4 -s. t e4 -s. t e4 e4 e4 - e4 -s
                -t e4 -s -t e4 -s -t c4 -s)
        #|23|# (-t c4 f -s -t c4 -s -t c4 -s -t c4 -s -t c4 -s
                -t c4 -s -t c4 -s -t d4 -s)
        #|24|# (-t e4 f -s -t e4 -s -t e4 -s -t e4 -s -t e4 -s
                -t e4 -s -t e4 -s -t e4 -s)
        #|25|# (-t a4 f -s. e a4 s s s s s s s b4 b4 t - - - b4 -s)
Opusmodus                                                  block-chord-reduce   4

            #|26|# (-t b4 f -s. t b4 -s. t b4 -s. t b4 -s. t b4 -s.
                    t b4 -s. t b4 -s. t b4 -s)
            #|27|# (t b4 f b4 -s. t b4 c5 c5 c5 d5 -s. t d5 -s. t d5
                    -s. t d5 -s. t d5 -s. t d5 -s)
            #|28|# (-t e5 f -s -t e5 -s -t e5 -s -t e5 -s -t e5 -s
                    -t e5 -s -t e5 -s -t e5 -s)))

(setf violin2
      '(#|1|# (-q... s e4 f fs4 fs4 t t t t t g3 -et t g3)
        #|2|# (t g3 f s s t t t t t -e.. t a3 a3 a3 a3 e.. -e)
        #|3|# (-t b3 f b3 b3 b3 e.. -s. s b3 b3 b3 t t g4 g4 g4 g4
               -et t g4)
        #|4|# (t g4 f s s t a4 b4 b4 b4 b4 - b4 -s. t b4 -s. t b4
               -s. t b4 -q)
        #|5|# (-t e5 f e5 e5 e5 e.. -et t e5 e5 e5 fs5 e.. -e)
        #|6|# (-t fs5 f fs5 fs5 fs5 e.. -ht s. fs5)
        #|7|# (s. fs5 f s e. s e. s e. t g5 - s g5 t)
        #|8|# (-t s a5 f t - s a5 t - s a5 t - b5 b5 b5 b5 b5
               b5 b5 b5 b5 b5 b5 b5 b5 b5 b5 b5 b5 b5 b5)
        #|9|# (-t e6 f -s. t e6 -s. t e6 -s t fs6 fs6 fs6 g6
               - g6 -s. t g6 -s. t e4 -s. t fs4 -s)
        #|10|# (t fs4 f fs4 -qs. t fs4 fs4 fs4 g3 g3 -qs. t g3 g3 g3)
        #|11|# (t g3 f g3 -qs. t g3 g3 g3 a3 a3 -qs. t a3 a3 a3)
        #|12|# (t b3 f b3 -qs. t b3 b3 b3 b3 b3 -qs. s. b3)
        #|13|# (e.. b3 f s g4 g4 g4 q s s s t - s a4 t b4)
        #|14|# (-t s b4 f t - s b4 t - s b4 t - s b4 t e5 - s e5 t
                - s e5 t - s e5 t - s. e5)
        #|15|# (-t s fs5 f t - s fs5 t - s fs5 t - s fs5 t -
                s fs5 t - s fs5 t - s fs5 t - s. fs5)
        #|16|# (e.. g5 f s s s a5 q s s s t - s b5 t)
        #|17|# (t b5 f b5 -qs. t b5 b5 b5 b5 b5 -qs. s. b5)
        #|18|# (t b5 f b5 -qs. t b5 b5 b5 b5 b5 -qs. t b5 b5 e6)
        #|19|# (t e6 f e6 -qs. t fs6 fs6 fs6 g6 g6 -qs. t g6 e4 fs4)
        #|20|# (-t fs4 f -s. t fs4 -s. t fs4 -s t fs4 fs4 g3 g3
                - g3 -s. t g3 -s. t g3 -s. t g3 -s)
        #|21|# (-t s g3 f t - s g3 t - s a3 t - a3 a3 a3 b3 b3
                b3 b3 b3 b3 b3 b3 b3 g4 g4 g4 g4 g4 g4 g4)
        #|22|# (s. g4 f s a4 e. b4 s e. s e. t - s b4 t)
        #|23|# (-t e5 f e5 e5 e5 e.. -ht s. e5)
        #|24|# (-t e5 f e5 fs5 fs5 e.. -et t fs5 fs5 fs5 fs5 e.. -e)
        #|25|# (t fs5 f s s t t t t t g5 - g5 -s. t g5 -s. t a5
                -s. t a5 -q)
        #|26|# (-t a5 f a5 a5 a5 e.. b5 -s. s b5 b5 b5 t t t t t
                -et t b5)
        #|27|# (t b5 f s s t t t t t -e.. t b5 e6 e6 e6 e.. fs6 -e)
        #|28|# (-q... s fs6 f fs6 g6 t t t e4 -q)))

(setf viola
      '(#|1|# (-w)
        #|2|# (-w)
        #|3|# (-w)
Opusmodus                                                  block-chord-reduce   5

            #|4|# (-w)
            #|5|# (-h -e -t g5 f -s. t e4 -s. t g4 -s)
            #|6|# (-t c6 f -s. e d5 s g3 e5 d5 fs3 d5 fs5 g4 e3 g3 c5 -s.)
            #|7|# (-w)
            #|8|# (-w)
            #|9|# (-w)
            #|10|# (-h -e -t d5 f g5 e4 g4 e3 -s. d3)
            #|11|# (e.. fs3 f s g5 e6 g5 q c5 s d5 c5 d5 t g5 - s e3 t d3)
            #|12|# (-t s fs5 f t g5 - s e5 t g5 - s e4 t g5 - s c5 t d5
                    - s g5 t e6 - s d5 t fs5 - s g4 t fs3 - g5 -s)
            #|13|# (-t e4 f -q -s. e g5 t c3 -s. s d3 -e. t g5 e3 d6)
            #|14|# (t e4 f d5 fs3 g5 e4 g4 c5 d6 g4 d5 g4 e4 d3 s fs5 -e.
                    s g3 -e. t e3 g3 c5)
            #|15|# (t g3 f c5 d5 g5 e3 d5 fs3 g4 e3 g5 e3 g3 c6 s d3 -e.
                    s g5 -e. t e6 d3 fs5)
            #|16|# (-t d5 f -q -s. e fs5 t g5 -s. s e4 -e. t g5 c5 d6)
            #|17|# (-t s g3 f t e3 - s g5 t e3 - s d5 t fs4 - s g3 t e5
                    - s g3 t c6 - s d5 t g5 - s e4 t g4 - c6 -s)
            #|18|# (e.. d5 f s g3 e5 d5 q fs3 s d5 fs5 g4 t e3 - s g3 t c5)
            #|19|# (-h -e -t d5 f g5 e4 g4 e3 -s. d3)
            #|20|# (-w)
            #|21|# (-w)
            #|22|# (-w)
            #|23|# (-t fs3 f -s. e g5 s e6 g5 c5 d5 c5 d5 g5 e3 d3 fs5 -s.)
            #|24|# (-h -e -t g5 f -s. t e5 -s. t g5 -s)
            #|25|# (-w)
            #|26|# (-w)
            #|27|# (-w)
            #|28|# (-w)))

(setf cello
      '(#|1|# (-w)
        #|2|# (-w)
        #|3|# (-w)
        #|4|# (-w)
        #|5|# (-w)
        #|6|# (-w)
        #|7|# (-w)
        #|8|# (-w)
        #|9|# (-w)
        #|10|# (-q -e -t e4 f c3 e3 a4 b3 -q -s. t e2 c4 b3)
        #|11|# (t d2 f b3 -q -s. t d4 e3 c2 e2 a3 -q -s. t b3 e4 c3)
        #|12|# (t e3 f c2 -q -s. t b2 d2 e4 c5 e4 -q -s. a3)
        #|13|# (e.. b3 f s a3 b3 e4 q c2 s b2 d4 e4 t c4 - s e4 t c3)
        #|14|# (-t s e4 f t a3 - s b3 t e4 - s c5 t b3 - s d4 t e3
                - s d2 t e4 - s c3 t e4 - s a2 t b2 - s. e4)
        #|15|# (-t s c2 f t b4 - s c3 t b3 - s d2 t e4 - s c3 t e3
                - s a3 t b4 - s e3 t b3 - s e3 t c3 - s. b2)
        #|16|# (e.. d4 f s e2 c2 e2 q a3 s e2 a3 b3 t e4 - s c2 t b3)
        #|17|# (t d2 f e3 -q -s. t c2 e4 c2 e2 a4 -q -s. b2)
        #|18|# (t e4 f c5 -q -s. t b2 d4 b3 d4 e4 -q -s. t c3 e4 a3)
Opusmodus                                                  block-chord-reduce   6

            #|19|# (-q -e -t b4 f e2 c2 e4 c2 -q -s. t b3 d3 e2)
            #|20|# (-w)
            #|21|# (-w)
            #|22|# (-w)
            #|23|# (-w)
            #|24|# (-w)
            #|25|# (-w)
            #|26|# (-w)
            #|27|# (-w)
            #|28|# (-w)))

(block-chord-reduce (list violin1 violin2 viola cello))




(block-chord-reduce (list violin1 violin2 viola cello) :row t)
Opusmodus                                                      block-chord-reduce   7

The option :time allows to change the scope of the analysis:

(block-chord-reduce (list violin1 violin2 viola cello)
                    :time 4/8)
Opusmodus                                                block-chord-reduce   8

(block-chord-reduce (list violin1 violin2 viola cello)
                    :time 1/4)
Opusmodus                                                    block-chord-reduce   9

The option :bar allows to view a speci ed bar number only:

(block-chord-reduce (list violin1 violin2 viola cello) :bar '(10 11))




                               fi
