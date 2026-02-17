Opusmodus                                                                      do-timeline   1

do-timeline list function &key time loop index
[Function]

Arguments and Values:
list                    variable (name) followed by a timeline list.
function                a function. Operation on x and 1.
time                    a length-symbol or ratio.
                        The default is the time-signature of the given sequence.
loop                    NIL or T. T loop the time list.
index                   variable index name.

Timeline forms:

(0 1 1 0), (- x x -) or compressed (-xx-), (0110).


Description:

The function DO-TIMELINE distributes an operation over a number of bars, if 'x. If '- the
bar is unchanged. Optionally you can use binary numbers: 1 equal x and 0 equal -.

When orchestrating it's often easier to ll the instrumental parts with musical content and
then gradually erase sections of that content to achieve the required timbre mix. In the
timeline below we use GEN-PAUSE function to manage the sounding out of musical activity
across an ensemble of instruments. The names of the instruments are variables.
                               fi
Opusmodus                                                     do-timeline   2

(do-timeline
 '(
    piccolo       (---xxxxxxx xxxxxx---- xxx------- xxxxxx----)
    flute         (--xxxxxxxx xxxxxxxxxx xxxxxxxxxx xxxxxx----)
    alto-flute    (--xxxxxxxx xxxxxxxxxx xxxxxxxxxx xxxx------)
    oboe1         (xx----xxxx xxxxxx---- xxxxxxxxxx ---xxx----)
    oboe2         (xxxxxxxxxx xxxxxxxxx- xxxxxxxxxx ---xx-----)
    cor-anglais   (xxxxxxxxxx xxxxxx---- xxxxxxxxxx ---xx-----)
    clarinet1     (xxx------- xxxxxx---- --xxxxxxxx ---xxx----)
    clarinet2     (xxxxxxxxxx xxxx------ xxxxxxxxxx ---xxx----)
    clarinet3     (xxxxxxxxxx xxxx------ xxxxxxxxxx ----------)
    bass-clarinet (xxxxxxxxxx xxxxxxxxxx xxxxxxxxxx x---------)
    bassoon1      (xxxxxxxxxx ---------- xxxxxxxxxx ---xxx----)
    bassoon2      (xxxxxxxxxx xx-------- xxxxxxxxxx -x--------)
    contrabassoon (xxxxxxxxxx xxxx------ xxxxxxxxxx xx--------)
    horn1         (x--------- xxxxxxxx-- ---------- xxxxxxxxxx)
    horn2         (xxxx------ xxxxxxxxxx xxxxxxxxxx xx-x------)
    horn3         (xxxxxx---- xxxxxxxxxx xxxxxxxxxx xx-xxx----)
    horn4         (xxxxxx---- xxxxxxxxxx xxxxxxxxxx xx-x------)
    trumpet1      (xxxxxx---- ---xxxxx-- ---------- ---xxx----)
    trumpet2      (xxx--x---- ---xxxxx-- xxxxxxxxxx ---xxx----)
    trumpet3      (---------- x--xxxxxxx xxxxxxxxxx ---xxx----)
    bass-trumpet (xxxx------ x--------- ---------- x--xxx---x)
    trombone      (------xxxx xxxxxxxxxx ---------- x-xxxxxx-x)
    tenor-tuba    (---------- xxxxxxxxxx ---xxxxxxx x---------)
    bass-tuba     (xxxxxx---x xx---xxxxx xxxxxxxxxx x---------)
    harp-lh       (xxxxxxxxx- xxxxxxxxxx xx-xxxxxxx xx-xxx-x-x)
    harp-rh       (xxxxxxxxxx xxxxxxxxxx xx-xxxxxxx xx-xxx-x-x)
    violin1       (xxxxxxxxxx xxxxxxxxxx xxxxxxxxxx -xxxxxxxxx)
    violin2       (xxxxxxxxxx xxxxxxxxxx xxx------x xxxxxxxxxx)
    viola         (xxxxxxxxxx xxxxxxxxxx xxxxxx-xxx xxxx--xxxx)
    violoncello   (xxxxxxxxxx xxxxxxxxxx xxxxxxxxxx xx-x--xxxx)
    contrabass    (xxxxxx---x xxxxxxxxxx xxxxxxxxxx xx-x--xx--)
    )
 '(gen-pause x))

=> (piccolo flute alto-flute oboe1 oboe2 cor-anglais
    clarinet1 clarinet2 clarinet3 bass-clarinet
    bassoon1 bassoon2 contrabassoon
    horn1 horn2 horn3 horn4
    trumpet1 trumpet2 trumpet3 bass-trumpet
    trombone tenor-tuba bass-tuba
    harp-lh harp-rh
    violin1 violin2 viola violoncello contrabass)
Opusmodus                                                           do-timeline   3

To stop given variable names taking on new values we assign a new variable name
with an index option, this way the original variable values stying unchanged:

(do-timeline
 '(
    piccolo       (---xxxxxxx xxxxxx---- xxx------- xxxxxx----)
    flute         (--xxxxxxxx xxxxxxxxxx xxxxxxxxxx xxxxxx----)
    alto-flute    (--xxxxxxxx xxxxxxxxxx xxxxxxxxxx xxxx------)
    oboe1         (xx----xxxx xxxxxx---- xxxxxxxxxx ---xxx----)
    oboe2         (xxxxxxxxxx xxxxxxxxx- xxxxxxxxxx ---xx-----)
    cor-anglais   (xxxxxxxxxx xxxxxx---- xxxxxxxxxx ---xx-----)
    clarinet1     (xxx------- xxxxxx---- --xxxxxxxx ---xxx----)
    clarinet2     (xxxxxxxxxx xxxx------ xxxxxxxxxx ---xxx----)
    clarinet3     (xxxxxxxxxx xxxx------ xxxxxxxxxx ----------)
    bass-clarinet (xxxxxxxxxx xxxxxxxxxx xxxxxxxxxx x---------)
    bassoon1      (xxxxxxxxxx ---------- xxxxxxxxxx ---xxx----)
    bassoon2      (xxxxxxxxxx xx-------- xxxxxxxxxx -x--------)
    contrabassoon (xxxxxxxxxx xxxx------ xxxxxxxxxx xx--------)
    horn1         (x--------- xxxxxxxx-- ---------- xxxxxxxxxx)
    horn2         (xxxx------ xxxxxxxxxx xxxxxxxxxx xx-x------)
    horn3         (xxxxxx---- xxxxxxxxxx xxxxxxxxxx xx-xxx----)
    horn4         (xxxxxx---- xxxxxxxxxx xxxxxxxxxx xx-x------)
    trumpet1      (xxxxxx---- ---xxxxx-- ---------- ---xxx----)
    trumpet2      (xxx--x---- ---xxxxx-- xxxxxxxxxx ---xxx----)
    trumpet3      (---------- x--xxxxxxx xxxxxxxxxx ---xxx----)
    bass-trumpet (xxxx------ x--------- ---------- x--xxx---x)
    trombone      (------xxxx xxxxxxxxxx ---------- x-xxxxxx-x)
    tenor-tuba    (---------- xxxxxxxxxx ---xxxxxxx x---------)
    bass-tuba     (xxxxxx---x xx---xxxxx xxxxxxxxxx x---------)
    harp-lh       (xxxxxxxxx- xxxxxxxxxx xx-xxxxxxx xx-xxx-x-x)
    harp-rh       (xxxxxxxxxx xxxxxxxxxx xx-xxxxxxx xx-xxx-x-x)
    violin1       (xxxxxxxxxx xxxxxxxxxx xxxxxxxxxx -xxxxxxxxx)
    violin2       (xxxxxxxxxx xxxxxxxxxx xxx------x xxxxxxxxxx)
    viola         (xxxxxxxxxx xxxxxxxxxx xxxxxx-xxx xxxx--xxxx)
    violoncello   (xxxxxxxxxx xxxxxxxxxx xxxxxxxxxx xx-x--xxxx)
    contrabass    (xxxxxx---x xxxxxxxxxx xxxxxxxxxx xx-x--xx--)
    )
 '(gen-pause x) :index 'v)

=> (v1 v2 v3 v4 v5 v6 v7 v8 v9 v10
    v11 v12 v13 v14 v15 v16 v17 v18 v19 v20
    v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31)
Opusmodus                                                     do-timeline   4

Binary list:

(do-timeline
 '(
    piccolo       (0001111111 1111110000 1110000000 1111110000)
    flute         (0011111111 1111111111 1111111111 1111110000)
    alto-flute    (0011111111 1111111111 1111111111 1111000000)
    oboe1         (1100001111 1111110000 1111111111 0001110000)
    oboe2         (1111111111 1111111110 1111111111 0001100000)
    cor-anglais   (1111111111 1111110000 1111111111 0001100000)
    clarinet1     (1110000000 1111110000 0011111111 0001110000)
    clarinet2     (1111111111 1111000000 1111111111 0001110000)
    clarinet3     (1111111111 1111000000 1111111111 0000000000)
    bass-clarinet (1111111111 1111111111 1111111111 1000000000)
    bassoon1      (1111111111 0000000000 1111111111 0001110000)
    bassoon2      (1111111111 1100000000 1111111111 0100000000)
    contrabassoon (1111111111 1111000000 1111111111 1100000000)
    horn1         (1000000000 1111111100 0000000000 1111111111)
    horn2         (1111000000 1111111111 1111111111 1101000000)
    horn3         (1111110000 1111111111 1111111111 1101110000)
    horn4         (1111110000 1111111111 1111111111 1101000000)
    trumpet1      (1111110000 0001111100 0000000000 0001110000)
    trumpet2      (1110010000 0001111100 1111111111 0001110000)
    trumpet3      (0000000000 1001111111 1111111111 0001110000)
    bass-trumpet (1111000000 1000000000 0000000000 1001110001)
    trombone      (0000001111 1111111111 0000000000 1011111101)
    tenor-tuba    (0000000000 1111111111 0001111111 1000000000)
    bass-tuba     (1111110001 1100011111 1111111111 1000000000)
    harp-lh       (1111111110 1111111111 1101111111 1101110101)
    harp-rh       (1111111111 1111111111 1101111111 1101110101)
    violin1       (1111111111 1111111111 1111111111 0111111111)
    violin2       (1111111111 1111111111 1110000001 1111111111)
    viola         (1111111111 1111111111 1111110111 1111001111)
    violoncello   (1111111111 1111111111 1111111111 1101001111)
    contrabass    (1111110001 1111111111 1111111111 1101001100)
    )
 '(gen-pause x) :index 'v)

=> (v1 v2 v3 v4 v5 v6 v7 v8 v9 v10
    v11 v12 v13 v14 v15 v16 v17 v18 v19 v20
    v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31)
Opusmodus                                                                 do-timeline     5

In the timeline below we use T (true) which means the function operates on every bar of
the selected variable (sequence):

clarinet3       t
same as:
clarinet3       (x x x x x x x x x x x x x x x x x x x x x x x x)

If nil there is no operation on any bar of the selected sequence:

violin1       nil
same as:
violin1       (- - - - - - - - - - - - - - - - - - - - - - - -)


Examples:
(do-timeline
   '(               ;        5          10       15        20
                    ;        |          |        |         |
      clarinet3     t
      contrabassoon (- - - - - - - - - - - - - - - - x - x x x - - -)
      horn3         (- - x x x - - - - - - - - - - - - - - - - - - -)
      trumpet3      (- - - - - - - - - - - - - - - - - - - - - - - -)
      violin1       nil
      violin2       (- - - - - - x x x x - - - - - - - x - - x - - -)
      viola         (- - - - - - - - - - x - x - - - - - - - - - - -)
      violoncello   (- - x - - x - - - - - - - - - - - - x x - x - x)
      contrabass    (- - - x - - x - - - - - - x - x - x - - - - - -)
      ) '(pitch-variant x :variant 'i))

Same as above (binary list):

(do-timeline
   '(               ;        5         10        15        20
                    ;        |         |         |         |
      clarinet3     t
      contrabassoon (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 0 0 0 1 1 1)
      horn3         (1 1 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)
      trumpet3      (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)
      violin1       nil
      violin2       (1 1 1 1 1 1 0 0 0 0 1 1 1 1 1 1 1 0 1 1 0 1 1 1)
      viola         (1 1 1 1 1 1 1 1 1 1 0 1 0 1 1 1 1 1 1 1 1 1 1 1)
      violoncello   (1 1 0 1 1 0 1 1 1 1 1 1 1 1 1 1 1 1 0 0 1 0 1 0)
      contrabass    (1 1 1 0 1 1 0 1 1 1 1 1 1 0 1 0 1 0 1 1 1 1 1 1)
      )
      '(pitch-variant x :variant 'i))
Opusmodus                                                                do-timeline    6

Same as above with compressed timeline:

(do-timeline
   '(              ;   5    10   15   20
                   ;   |    |    |    |
     clarinet3     t
     contrabassoon (xxxxxxxxxxxxxxxx-x---xxx)
     horn3         (xx---xxxxxxxxxxxxxxxxxxx)
     trumpet3      (xxxxxxxxxxxxxxxxxxxxxxxx)
     violinx       nil
     violin2       (xxxxxx----xxxxxxx-xx-xxx)
     viola         (xxxxxxxxxx-x-xxxxxxxxxxx)
     violoncello   (xx-xx-xxxxxxxxxxxx—x-x--)
     contrabass    (xxx-xx-xxxxxx-x-x-xxxxxx)
     )
     '(pitch-variant x :variant 'i))

In the example below the time is 'h (1/2). The process time of each 'x is 1/2 of a
length.

(do-timeline
 '(
    afl (x-x-xx--x-x-x-x-xx—x-x-)
    cl (-x-xx-x--x-x-x-xx-x—x-x)
    bcl (xx-xx-x--x-xxx-xx-x—x-x)
    hn (x-xx-x-xx-x-x-xx-x-xx-x)
    vn (-xx-x-x--x-x-xx-x-x—x-x)
    vc (-xx-x-x--x-x-xx-x-x—x-x)
    )
 '(pitch-figurate '(2 3) x) :time 'h)

Here the time is a list of two lengths q and h with the optional :loop T. The :loop T
will create a :time list (q h q h q h q h . . .). The sum of the time values
equals the SPAN of the sequence.

(do-timeline
 '(
    afl (binary-invert (gen-binary-euclidean 1 48 30 48))
    cl (binary-invert (gen-binary-euclidean 1 48 30 48))
    bcl (binary-invert (gen-binary-euclidean 1 48 30 48))
    hn (binary-invert (gen-binary-euclidean 1 48 30 48))
    vn (binary-invert (gen-binary-euclidean 1 48 30 48))
    vc (binary-invert (gen-binary-euclidean 1 48 30 48))
    )
 '(gen-pause x) :time (rnd-sample 12 '(q h)) :loop t)
Opusmodus                                                                     do-timeline   7

In this example we use variable span (h q q h h w q w). If the sum of the time
values of the instrument does not add-up to the span of a sequence, then the last value of the
time list will be added consecutively to add-up to the span of the sequence (h q q h h
w q w w w w w . . )

(do-timeline
 '(
    afl (x - x - x x - - x - x - x - x - x x - - x - x -)
    cl (- x - x x - x - - x - x - x - x x - x - - x - x)
    bcl (x x - x x - x - - x - x x x - x x - x - - x - x)
    hn (x - x x - x - x x - x - x - x x - x - x x - x -)
    vn (- x x - x - x - - x - x - x x - x - x - - x - x)
    vc (- x x - x - x - - x - x - x x - x - x - - x - x)
    )
 '(pitch-figurate '(2 3) x) :time '(h q q h h w q w)


Score Example:
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

(setf rhy4 (gen-tuplet
            1 2 'd '? (gen-repeat 48 '(q)) (rnd-sample 48 '(5 4))))

(setf rhy5 (gen-tuplet
            1 4 'd '? (gen-repeat 24 '(h)) (rnd-sample 24 '(3 2))))

(setf rhy6 (gen-tuplet
            1 4 'd '? (gen-repeat 24 '(h)) (rnd-sample 24 '(3 2))))
Opusmodus                                                      do-timeline   8

(setf vel (rnd-sample 24 '(pp p mp mf f)))

(setf afl (make-omn :length rhy1 :pitch row1 :velocity vel))
(setf cl (make-omn :length rhy2 :pitch row2 :velocity vel))
(setf bcl (make-omn :length rhy3 :pitch row3 :velocity vel))
(setf hn (make-omn :length rhy4 :pitch row4 :velocity vel))
(setf vn (make-omn :length rhy5 :pitch row5 :velocity vel))
(setf vc (make-omn :length rhy6 :pitch row6 :velocity vel))

(do-timeline
 '(
    afl nil
    cl (101010101010)
    bcl (010101010101)
    hn t
    vn (010101010101)
    vc (101010101010)
    )
 '(pitch-variant x :variant '?) :time '1/1 :index 'v)

(do-timeline
 '(
    v1 (10101100101010101101010)
    v2 (01011010010101011010101)
    v3 (11011010010111011010101)
    v4 (10110101101010110101101)
    v5 (01101010010101101010101)
    v6 (01101010010101101010101)
    )
 '(pitch-figurate '(2 3) x) :time 'h)

(do-timeline
 '(
    v1 (binary-invert (gen-binary-euclidean 1 48 30 48))
    v2 (binary-invert (gen-binary-euclidean 1 48 30 48))
    v3 (binary-invert (gen-binary-euclidean 1 48 30 48))
    v4 (binary-invert (gen-binary-euclidean 1 48 30 48))
    v5 (binary-invert (gen-binary-euclidean 1 48 30 48))
    v6 (binary-invert (gen-binary-euclidean 1 48 30 48))
    )
 '(gen-pause x) :time (rnd-sample 12 '(q h)) :loop t)
Opusmodus                                                      do-timeline   9

(def-score timeline
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
