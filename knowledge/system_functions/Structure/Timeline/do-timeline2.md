Opusmodus                                                                      do-timeline2   1

do-timeline2 variables timeline function &key time loop index
[Function]

Arguments and Values:
variables                a list of variables.
timeline                 a timeline-form (a list or function).
function                 a function. Operation on x and 1.
time                     a length-symbol or ratio.
                         The default is the time-signature of the given sequence.
loop                     NIL or T. T loop the time list.
index                    variable index name.

Timeline form:

(0 1 1 0), (- x x -) or compressed (-xx-), (0110).


Description:

The function DO-TIMELINE2 distributes an operation over a number of bars, if 1. If 0 the
bar is unchanged. Optionally you can use symbols: x equals 1 and - equals 0.

When orchestrating it is often easier to ll the instrumental parts with musical content and
then gradually erase sections of that content to achieve the required timbre mix. In the
timeline below we use GEN-PAUSE function to manage the sounding out of musical activity
across an ensemble of instruments.

The names of the instruments are variables. After each of the DO-TIMELINE2 operation the
variables will retain the new values.

The difference between DO-TIMELINE and DO-TIMELINE2:

(do-timeline
 '(
    afl (1 0 1 0 1 1 0 0 1 0 1 0 1 0 1 0 1 1 0 0 1 0 1 0)
    cl (0 1 0 1 1 0 1 0 0 1 0 1 0 1 0 1 1 0 1 0 0 1 0 1)
    bcl (1 1 0 1 1 0 1 0 0 1 0 1 1 1 0 1 1 0 1 0 0 1 0 1)
    hn (1 0 1 1 0 1 0 1 1 0 1 0 1 0 1 1 0 1 0 1 1 0 1 0)
    vn (0 1 1 0 1 0 1 0 0 1 0 1 0 1 1 0 1 0 1 0 0 1 0 1)
    vc (0 1 1 0 1 0 1 0 0 1 0 1 0 1 1 0 1 0 1 0 0 1 0 1))
 '(gen-pause x) :time '(q h) :loop t)
=> (afl cl bcl hn vn vc)
                                fi
Opusmodus                                                                  do-timeline2   2

In DO-TIMELINE2 function the variables and the operation values are in separate lists:

(do-timeline2
 '(afl cl bcl hn vn vc)
 '((1 0 1 0 1 1 0 0 1 0 1 0 1 0 1 0 1 1 0 0 1 0 1 0)
   (0 1 0 1 1 0 1 0 0 1 0 1 0 1 0 1 1 0 1 0 0 1 0 1)
   (1 1 0 1 1 0 1 0 0 1 0 1 1 1 0 1 1 0 1 0 0 1 0 1)
   (1 0 1 1 0 1 0 1 1 0 1 0 1 0 1 1 0 1 0 1 1 0 1 0)
   (0 1 1 0 1 0 1 0 0 1 0 1 0 1 1 0 1 0 1 0 0 1 0 1)
   (0 1 1 0 1 0 1 0 0 1 0 1 0 1 1 0 1 0 1 0 0 1 0 1))
 '(gen-pause x) :time '(q h) :loop t)
=> (afl cl bcl hn vn vc)

To stop given variable names taking on new values we assign a new variable name
with an index option, this way the original variable values stying unchanged:

(do-timeline2
 '(afl cl bcl hn vn vc)
 '((1 0 1 0 1 1 0 0 1 0 1 0 1 0 1 0 1 1 0 0 1 0 1 0)
   (0 1 0 1 1 0 1 0 0 1 0 1 0 1 0 1 1 0 1 0 0 1 0 1)
   (1 1 0 1 1 0 1 0 0 1 0 1 1 1 0 1 1 0 1 0 0 1 0 1)
   (1 0 1 1 0 1 0 1 1 0 1 0 1 0 1 1 0 1 0 1 1 0 1 0)
   (0 1 1 0 1 0 1 0 0 1 0 1 0 1 1 0 1 0 1 0 0 1 0 1)
   (0 1 1 0 1 0 1 0 0 1 0 1 0 1 1 0 1 0 1 0 0 1 0 1))
 '(gen-pause x) :time '(q h) :loop t :index ‘v)
=> (v1 v2 v3 v4 v5 v6)
Opusmodus                                           do-timeline2   3

Examples:
(do-timeline2
 '(piccolo flute alto-flute
   oboe1 oboe2 cor-anglais
   clarinet1 clarinet2 clarinet3 bass-clarinet
   bassoon1 bassoon2 contrabassoon
   horn1 horn2 horn3 horn4
   trumpet1 trumpet2 trumpet3 bass-trumpet
   trombone tenor-tuba bass-tuba
   harp-lh harp-rh
   violin1 violin2 viola violoncello contrabass)

 '((---xxxxxxx xxxxxx---- xxx------- xxxxxx----)
   (--xxxxxxxx xxxxxxxxxx xxxxxxxxxx xxxxxx----)
   (--xxxxxxxx xxxxxxxxxx xxxxxxxxxx xxxx------)
   (xx----xxxx xxxxxx---- xxxxxxxxxx ---xxx----)
   (xxxxxxxxxx xxxxxxxxx- xxxxxxxxxx ---xx-----)
   (xxxxxxxxxx xxxxxx---- xxxxxxxxxx ---xx-----)
   (xxx------- xxxxxx---- --xxxxxxxx ---xxx----)
   (xxxxxxxxxx xxxx------ xxxxxxxxxx ---xxx----)
   (xxxxxxxxxx xxxx------ xxxxxxxxxx ----------)
   (xxxxxxxxxx xxxxxxxxxx xxxxxxxxxx x---------)
   (xxxxxxxxxx ---------- xxxxxxxxxx ---xxx----)
   (xxxxxxxxxx xx-------- xxxxxxxxxx -x--------)
   (xxxxxxxxxx xxxx------ xxxxxxxxxx xx--------)
   (x--------- xxxxxxxx-- ---------- xxxxxxxxxx)
   (xxxx------ xxxxxxxxxx xxxxxxxxxx xx-x------)
   (xxxxxx---- xxxxxxxxxx xxxxxxxxxx xx-xxx----)
   (xxxxxx---- xxxxxxxxxx xxxxxxxxxx xx-x------)
   (xxxxxx---- ---xxxxx-- ---------- ---xxx----)
   (xxx--x---- ---xxxxx-- xxxxxxxxxx ---xxx----)
   (---------- x--xxxxxxx xxxxxxxxxx ---xxx----)
   (xxxx------ x--------- ---------- x--xxx---x)
   (------xxxx xxxxxxxxxx ---------- x-xxxxxx-x)
   (---------- xxxxxxxxxx ---xxxxxxx x---------)
   (xxxxxx---x xx---xxxxx xxxxxxxxxx x---------)
   (xxxxxxxxx- xxxxxxxxxx xx-xxxxxxx xx-xxx-x-x)
   (xxxxxxxxxx xxxxxxxxxx xx-xxxxxxx xx-xxx-x-x)
   (xxxxxxxxxx xxxxxxxxxx xxxxxxxxxx -xxxxxxxxx)
   (xxxxxxxxxx xxxxxxxxxx xxx------x xxxxxxxxxx)
   (xxxxxxxxxx xxxxxxxxxx xxxxxx-xxx xxxx--xxxx)
   (xxxxxxxxxx xxxxxxxxxx xxxxxxxxxx xx-x--xxxx)
   (xxxxxx---x xxxxxxxxxx xxxxxxxxxx xx-x--xx--))
 '(gen-pause x) :index 'v)
=> (v1 v2 v3 v4 v5 v6 v7 v8 v9 v10
    v11 v12 v13 v14 v15 v16 v17 v18 v19 v20
    v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31)
Opusmodus                                           do-timeline2   4

Binary list:

(do-timeline2
 '(piccolo flute alto-flute
   oboe1 oboe2 cor-anglais
   clarinet1 clarinet2 clarinet3 bass-clarinet
   bassoon1 bassoon2 contrabassoon
   horn1 horn2 horn3 horn4
   trumpet1 trumpet2 trumpet3 bass-trumpet
   trombone tenor-tuba bass-tuba
   harp-lh harp-rh
   violin1 violin2 viola violoncello contrabass)

 '((0001111111 1111110000 1110000000 1111110000)
   (0011111111 1111111111 1111111111 1111110000)
   (0011111111 1111111111 1111111111 1111000000)
   (1100001111 1111110000 1111111111 0001110000)
   (1111111111 1111111110 1111111111 0001100000)
   (1111111111 1111110000 1111111111 0001100000)
   (1110000000 1111110000 0011111111 0001110000)
   (1111111111 1111000000 1111111111 0001110000)
   (1111111111 1111000000 1111111111 0000000000)
   (1111111111 1111111111 1111111111 1000000000)
   (1111111111 0000000000 1111111111 0001110000)
   (1111111111 1100000000 1111111111 0100000000)
   (1111111111 1111000000 1111111111 1100000000)
   (1000000000 1111111100 0000000000 1111111111)
   (1111000000 1111111111 1111111111 1101000000)
   (1111110000 1111111111 1111111111 1101110000)
   (1111110000 1111111111 1111111111 1101000000)
   (1111110000 0001111100 0000000000 0001110000)
   (1110010000 0001111100 1111111111 0001110000)
   (0000000000 1001111111 1111111111 0001110000)
   (1111000000 1000000000 0000000000 1001110001)
   (0000001111 1111111111 0000000000 1011111101)
   (0000000000 1111111111 0001111111 1000000000)
   (1111110001 1100011111 1111111111 1000000000)
   (1111111110 1111111111 1101111111 1101110101)
   (1111111111 1111111111 1101111111 1101110101)
   (1111111111 1111111111 1111111111 0111111111)
   (1111111111 1111111111 1110000001 1111111111)
   (1111111111 1111111111 1111110111 1111001111)
   (1111111111 1111111111 1111111111 1101001111)
   (1111110001 1111111111 1111111111 1101001100))
 '(gen-pause x) :index 'v)
=> (v1 v2 v3 v4 v5 v6 v7 v8 v9 v10
    v11 v12 v13 v14 v15 v16 v17 v18 v19 v20
    v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31)
Opusmodus                                                                    do-timeline2   5

In the example below the time is 'h (1/2). The process time of each 1 is 1/2 of a
length.

(do-timeline2
 '(afl cl bcl hn vn vc) (gen-binary-euclidean 6 48 20 30)
 '(pitch-figurate '(2 3) x) :time 'h)

Here the time is a list of two lengths q and h with the optional :loop T. The :loop T
will create a time list (q h q h q h q h . . .). The sum of the time values
equals the span of the sequence.

(do-timeline2
 '(afl cl bcl hn vn vc) (gen-binary-euclidean 6 48 20 30)
 '(gen-pause x) :time '(q h) :loop t)

In this example we use variable time (h q q h h w q w). If the sum of the time
values of the instrument does not add-up to the span of a sequence, then the last value of the
time list will be added consecutively to add-up to the span of the sequence (h q q h h
w q w w w w w . . )

(do-timeline2
 '(afl cl bcl hn vn vc) (gen-binary-euclidean 6 48 20 30)
 '(pitch-figurate '(2 3) x) :time '(h q q h h w q w))


Score Examples:
(setf partial1 (library 'tbn-cs3-frames 'partials 'p0))
(setf partial2 (library 'tbn-cs3-frames 'partials 'p1))
(setf partial3 (library 'tbn-cs3-frames 'partials 'p2))
(setf partial4 (library 'tbn-cs3-frames 'partials 'p3))
(setf partial5 (library 'tbn-cs3-frames 'partials 'p4))
(setf partial6 (library 'tbn-cs3-frames 'partials 'p5))

(setf row1 (partial-row partial1))
(setf row2 (partial-row partial2))
(setf row3 (partial-row partial3))
(setf row4 (partial-row partial4))
(setf row5 (partial-row partial5))
(setf row6 (partial-row partial6))

(setf rhy1 (gen-tuplet
            1 2 'd '? (gen-repeat 48 '(q)) (rnd-sample 48 '(5 4 3))))

(setf rhy2 (gen-tuplet
            1 2 'd '? (gen-repeat 48 '(q)) (rnd-sample 48 '(5 4 3))))

(setf rhy3 (gen-tuplet
            1 2 'd '? (gen-repeat 48 '(q)) (rnd-sample 48 '(5 4 3))))
Opusmodus                                                      do-timeline2   6

(setf rhy4 (gen-tuplet
            1 2 'd '? (gen-repeat 48 '(q)) (rnd-sample 48 '(5 4))))

(setf rhy5 (gen-tuplet
            1 4 'd '? (gen-repeat 24 '(h)) (rnd-sample 24 '(3 2))))

(setf rhy6 (gen-tuplet
            1 4 'd '? (gen-repeat 24 '(h)) (rnd-sample 24 '(3 2))))

(setf vel (rnd-sample 24 '(pp p mp mf f)))

(setf afl (make-omn :length rhy1 :pitch row1 :velocity vel))
(setf cl (make-omn :length rhy2 :pitch row2 :velocity vel))
(setf bcl (make-omn :length rhy3 :pitch row3 :velocity vel))
(setf hn (make-omn :length rhy4 :pitch row4 :velocity vel))
(setf vn (make-omn :length rhy5 :pitch row5 :velocity vel))
(setf vc (make-omn :length rhy6 :pitch row6 :velocity vel))

(do-timeline2
 '(afl cl bcl hn vn vc) (gen-binary-euclidean 6 48 30 48)
 '(pitch-variant x :variant '?) :time '1/1 :index 'v)

(do-timeline2
 '(v1 v2 v3 v4 v5 v6)
 (binary-invert (gen-binary-euclidean 6 48 30 48))
 '(pitch-figurate '(2 3) x) :time '1/2)

(do-timeline2
 '(v1 v2 v3 v4 v5 v6) (gen-binary-euclidean 6 48 15 30)
 '(gen-pause x) :time (rnd-sample 24 '(q h)) :loop t)
Opusmodus                                                      do-timeline2   7

(def-score timeline2
           (:key-signature 'chromatic
            :time-signature '(4 4)
            :tempo '(q 82)
            :flexible-clef t
            :layout (list
                     (bracket-group
                      (alto-flute-layout 'alto-flute)
                      (clarinet-layout 'clarinet)
                      (bass-clarinet-layout 'bass-clarinet))
                     (horn-layout 'french-horn)
                     (bracket-group
                      (violin-layout 'violin)
                      (violoncello-layout 'violoncello))))

  (alto-flute
   :omn (ambitus 'alto-flute v1)
   :sound 'gm :channel 1 :program 'flute)

  (clarinet
   :omn (ambitus 'clarinet v2)
   :channel 2 :program 'clarinet)

  (bass-clarinet
   :omn (ambitus 'bass-clarinet v3)
   :channel 3 :program 'clarinet)

  (french-horn
   :omn (ambitus 'french-horn v4)
   :channel 4 :program 'french-horn)

  (violin
   :omn (ambitus 'violin v5)
   :channel 5 :program 'violin)

  (violoncello
    :omn (ambitus 'violoncello v6)
    :channel 6 :program 'cello)
  )
