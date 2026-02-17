Opusmodus                                                                              get-beats      1

get-beats values voices &key omit seed
[Function]

Arguments and Values:
values                 a list form: (<voice-number><bar-number>
                       <beat-number><variant>),
                       minimum values (<voice-number><bar-number>).
                       variants: 'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert),
                       'a (ascending), 'd (descending), 'ad (ascending-descending),
                       'da (descending-ascending), 'ro (random order) or '? (at random).
                       The default is NIL.
voices                 lists of voices.
omit                   list of variants to omit. The default is NIL.
seed                   NIL or number. The default is NIL.


Description:

The function GET-BEATS allows you to assemble a new sequence from a number of
beats of a given bar and a given omn sequence. The beat value is taken from the bar
time-signature. The variant - if de ned - is applied to the entire bar before the beat
collection.


Examples:
(setf omn '((q c4 mf eb4 g4 bb4) (h g3f4cs5 p c5)))

(get-beats '(1 1) omn)
=> (q c4 mf eb4 g4 bb4)

(get-beats '(1 1 1) omn)
=> (q c4 mf)

(get-beats '(1 1 (1 4)) omn)
=> (q c4 mf bb4)

(get-beats '((1 1 (1 3))
             (1 2 1)) omn)
=> ((q c4 mf g4) (q g3f4cs5 p tie))

(get-beats '((1 1 (1 3) r)
             (1 2 1 i)) omn)
=> ((q bb4 mf eb4) (q g3a2cs2 p tie))
                             fi
Opusmodus                                                               get-beats   2

Collecting beat values from two voices with variant set to '? (at random):

(setf
 seq1 '((s g4 pp e s cs5 c4 -e s fs5 g4 mf q s gs5 mp e)
        (s a3 f g4 pp e s gs5 gs5 -e s a3 gs4 mf q s a5 mp a5))

 seq2    '((h e4f5 p c5a4) (h b3d3 gs4eb2fs3) (h bb2g5cs5 gs4d4eb2)
           (w bb2 mp) (h g3f4cs5 p c5) (h fs5a5b3 e4b3) (h bb2)
           (w e2eb4) (h c5cs6 a5) (h f4g3 gs4d3) (h fs5 bb2fs5g3)
           (h d3e5eb4 gs4) (h a2c6 f2) (h b0 cs6c5) (h gs4d3)))

(get-beats '((1 1 1 ?)
             (2 3 2 ?)
             (1 2 2..4 ?)
             (2 5 2 ?)) (list seq1 seq2) :seed 42)
=> ((s gs5 pp e s fs5)
    (q g5cs5bb2 p)
    (s gs5 pp a5 -e s a5 gs5 mf e gs4 tie gs4 s g4 mp a3)
    (q g3f4cs5 p))

Collecting beat values from four voices:

(setf cello1 '((s g2 p d3 b3 a3 b3 d3 b3 d3)
               (s g2 d3 b3 a3 b3 d3 b3 d3))

        cello2 '((s g2 p e3 c4 b3 mf c4 e3 c4 e3)
                 (s g2 e3 c4 b3 c4 e3 c4 e3))

        cello3 '((s g2 mf fs3 c4 b3 c4 fs3 c4 fs3)
                 (s g2 fs3 c4 b3 c4 fs3 c4 fs3))

        cello4 '((s g2 mf g3 b3 a3 b3 g3 b3 g3)
                 (s g2 g3 b3 a3 b3 g3 b3 fs3)))

(get-beats '((1 1 2 ?)
             (2 1 2 ri)
             (3 2 2 ?)
             (4 2 1 ?)
             (2 2 2 ?)
             (3 2 2 ?))
           (list cello1 cello2 cello3 cello4)
           :seed 59)
=> ((s a3 p g2 b3 b3)
    (s a2 mf gs2 e3 cs4)
    (s c4 mf c4 fs3 fs3)
    (s g2 mf g3 a3 b3)
    (s c4 mf c4 e3 e3)
    (s b3 mf c4 c4 c4))
