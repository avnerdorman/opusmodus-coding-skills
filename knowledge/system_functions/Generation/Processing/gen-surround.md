Opusmodus                                                                          gen-surround   1

gen-surround sequence &key start size type sort first butfirst seed
[Function]

Arguments and Values:
sequence                  a list, pitches or integers.
start                     an integer, start position. The default is 0 ( rst).
size                      an integer. The default is 5.
type                      'lf (left-forward), 'lb (left-backwards), 'rf (right-forward),
                          'rb (right-backwards) or '? (at random).
sort                      'a (ascending), 'd (descending), 'ro (rnd-order) or'? (at random).
                          The default is NIL.
first                     an integer, or pitch.
butfirst                  an integer, or pitch.
seed                      an integer or NIL. The default is NIL.


Description:

This function calculates different types of surroundings for elements in a sequence.

(setf num '(0 1 2 3 4 5 6 7 8 9 10 11))

(gen-surround num :start 6 :size 4)
=> (6 7 8 9 10)

(setf mat '(fs5 cs6 eb6 eb4 f4 bb5 bb5 f3 gs3 b5
            c6 c5 d6 a4 cs4 gs5 d5 bb3 f5 e5 bb4))

5 pitches (default) right from start 0 forward:

(gen-surround mat)
=> (fs5 cs6 eb6 eb4 f4)


Examples:

For better illustration of the function we use midi values in our examples below.

(setf notes '(78 85 87 63 65 82 82 53 56 83 84
              72 86 69 61 80 74 58 77 76 70))

5 midi notes (default) right from start 0 (default) forward:

(gen-surround notes)
=> (78 85 87 63 65)
                                                           fi
Opusmodus                                                             gen-surround   2

(First row: IDs, second row: midi list, third row: selection)
 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
(78 85 87 63 65)

8 midi notes right (default) from :start 10 forward:

(gen-surround notes :start 10 :size 8)
=> (84 72 86 69 61 80 74 58)

 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
                              (84 72 86 69 61 80 74 58)

8 midi notes right (default) from :start 10 read backwards (:type 'rb):

(gen-surround notes :start 10 :size 8 :type 'rb)
=> (58 74 80 61 69 86 72 84)

 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
                              (58 74 80 61 69 86 72 84)

9 midi notes centred (:type 'c) around :start 10:

(gen-surround notes :start 10 :size 10 :type 'c)
=> (82 53 56 83 84 72 86 69 61)

 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
                  (82 53 56 83 84 72 86 69 61)

8 midi notes left from :start 10 read forward (:type 'lf):

(gen-surround notes :start 10 :size 8 :type 'lf)
=> (63 65 82 82 53 56 83 84)

 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
         (63 65 82 82 53 56 83 84)

8 midi notes left from start 10 read backwards (:type 'lb)

(gen-surround notes :start 10 :size 8 :type 'lb)
=> (84 83 56 53 82 82 65 63)

 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
         (84 83 56 53 82 82 65 63)
Opusmodus                                                                    gen-surround      3

8 midi notes right from :start 10 forward, sorted in ascending order:

(gen-surround notes :start 10 :size 8 :type 'rf :sort 'a)
=> (58 61 69 72 74 80 84 86)

 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
                              (58 61 69 72 74 80 84 86)

8 midi notes right from start 10 forward, sorted in descending order:

(gen-surround notes :start 10 :size 8 :type 'rf :sort 'd)
=> (86 84 80 74 72 69 61 58)

 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
                              (86 84 80 74 72 69 61 58)

8 midi notes right from :start 10 forward, sorted in random order:

(gen-surround notes :start 10 :size 8 :type 'rf :sort 'ro)
=> (84 69 86 74 80 58 61 72)

8 midi notes right from :start 10 forward, sorted depending on a control value. If the
control value is lower than the start value (70 < 84) the selection is listed in descending
order.

(gen-surround notes :start 10 :size 8 :type 'rf :first 70)
=> (86 84 80 74 72 69 61 58)

 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
                              (86 84 80 74 72 69 61 58)

8 midi notes right from :start 10 forward, sorted depending on a control value. If the
control value is higher than the :start value (85 > 84) the selection is listed in ascending
order.

(gen-surround notes :start 10 :size 8 :type 'rf :first 85)
=> (58 61 69 72 74 80 84 86)

 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
                              (58 61 69 72 74 80 84 86)
Opusmodus                                                                    gen-surround     4

8 midi notes right from :start 10 forward, sorted depending on a control value. If the
control value is lower than the start value (70 < 84) the selection is listed in descending
order except of the st value (84).

(gen-surround notes :start 10 :size 8 :type 'rf :butfirst 70)
=> (84 86 80 74 72 69 61 58)

 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
(78 85 87 63 65 82 82 53 56 83 84 72 86 69 61 80 74 58 77 76 70)
                              (84 86 80 74 72 69 61 58)

Nested melodies:

(setf len (length notes))

(gen-surround notes
              :start (gen-integer 0 len)
              :size (rndn len 3 5)
              :type 'rf)

=> ((78 85 87) (85 87 63 65 82 82 53) (87 63 65) (63 65 82 82 53)
    (65 82 82) (82 82 53 56) (82 53 56 83 84) (53 56 83 84)
    (56 83 84 72) (83 84 72) (84 72 86 69 61 80) (72 86 69 61 80)
    (86 69 61 80 74 58 77) (69 61 80 74 58 77) (61 80 74)
    (80 74 58 77) (74 58 77) (58 77 76 70 78 85) (77 76 70 78 85)
    (76 70 78 85 87 63 65) (70 78 85) (78 85 87 63 65 82))
             fi
Opusmodus                                                   gen-surround   5

I.

(setf pitches '(fs5 cs6 eb6 eb4 f4 bb5 bb5 f3 gs3 b5
                c6 c5 d6 a4 cs4 gs5 d5 bb3 f5 e5 bb4))

(gen-surround pitches :start '(1 3 5 7 11))
=> ((cs6 eb6 eb4 f4 bb5) (eb4 f4 bb5 bb5 f3)
    (bb5 bb5 f3 gs3 b5) (f3 gs3 b5 c6 c5) (c5 d6 a4 cs4 gs5))

(setf len (length pitches))
(setf sur1 (gen-surround pitches
                         :start (gen-integer 0 len)
                         :size (rndn len 2 5)))

(make-omn :length '(s) :pitch sur1 :span :pitch))
=> ((s fs5 cs6 eb6 eb4 f4) (s cs6 eb6 eb4) (s eb6 eb4 f4 bb5)
    (s eb4 f4 bb5 bb5) (s f4 bb5 bb5 f3 gs3) (s bb5 bb5 f3 gs3)
    (s bb5 f3 gs3 b5 c6) (s f3 gs3 b5 c6) (s gs3 b5 c6) (s b5 c6)
    (s c6 c5 d6) (s c5 d6 a4) (s d6 a4 cs4) (s a4 cs4 gs5 d5)
    (s cs4 gs5) (s gs5 d5 bb3 f5 e5) (s d5 bb3 f5)
    (s bb3 f5 e5 bb4 fs5) (s f5 e5 bb4 fs5) (s e5 bb4 fs5)
    (s bb4 fs5 cs6 eb6) (s fs5 cs6 eb6 eb4 f4))
Opusmodus                                                   gen-surround   6

II.

(setf sur2 (gen-surround pitches
                         :start (gen-integer 0 len)
                         :size (rndn len 3 7)
                         :first '(bb5 d5 f3)))

(make-omn :length '(s) :pitch sur2 :span :pitch)
=> ((s eb4 f4 fs5 bb5 cs6 eb6) (s eb6 cs6 f4 eb4)
    (s eb6 bb5 bb5 f4 eb4 gs3 f3) (s f3 gs3 eb4 f4 bb5 bb5 b5)
    (s f3 gs3 f4 bb5 bb5) (s c6 b5 bb5 bb5 c5 gs3 f3)
    (s f3 gs3 bb5 b5) (s f3 gs3 a4 c5 b5 c6 d6) (s c6 b5 c5 gs3)
    (s d6 c6 b5 c5 a4 cs4) (s d6 c6 gs5 c5 a4 cs4) (s d6 c5 a4 cs4)
    (s d6 gs5 a4 cs4) (s bb3 cs4 a4 d5 f5 gs5) (s gs5 f5 d5 cs4 bb3)
    (s bb3 d5 f5 gs5) (s bb3 bb4 d5 e5 f5 fs5) (s f5 e5 bb4 bb3)
    (s bb4 e5 f5 fs5 cs6 eb6) (s eb6 cs6 fs5 e5 bb4 eb4)
    (s eb6 cs6 fs5 bb4 eb4) (s eb4 f4 fs5 bb5 cs6 eb6))
