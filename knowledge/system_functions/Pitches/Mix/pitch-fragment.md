Opusmodus                                                                              pitch-fragment   1

pitch-fragment count size pitch &key transpose flatten
                          section exclude seed span flat

[Function]

Arguments and Values:
count                     an integer or list of integers (count of fragments).
size                      an integer list (size of fragments).
pitch                     a list or list of pitches.
transpose                 a list of integers (transposition values).
flatten                   T or NIL. The default is NIL. (internal process).
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
seed                      NIL or an integer. The default is NIL.

OMN:
flat                      NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                      :length, :pitch or :velocity. The default is :pitch.


Description:

This function returns a fragment of a sequence from an existing list or lists.

(pitch-fragment 4 3 '(c4 d4 e4 f4 g4 a4) :seed 235)
=> (d4 e4 f4 e4 f4 g4 c4 d4 e4 d4 e4 f4)

(pitch-fragment 4 3 '(c4 d4 e4 f4 g4 a4) :seed 235 :flatten nil)
=> ((d4 e4 f4) (e4 f4 g4) (c4 d4 e4) (d4 e4 f4))

(pitch-fragment 4 3 '(c4 d4 e4 f4 g4 a4)
                :transpose '(1 -1 2 -2)
                :seed 2457)
=> (cs4 eb4 f4 e4 fs4 gs4 g4 a4 b4 c4 d4 eb4)

(pitch-fragment 4 3 '(c4 d4 e4 f4 g4 a4)
                :transpose '(1 -1 2 -2)
                :variant '(r i ri p)
                :seed 2457)
=> (f4 eb4 cs4 e4 d4 c4 b4 cs5 eb5 d4 eb4 f4)

The function has many applications, not least in the area of LIVE CODING. In non-realtime
composition it is invaluable for exploring the potential of a motif or theme.
                                                                       fl
Opusmodus                                                                pitch-fragment   2

Examples:

If you set count to '(2 4) and the size set to '(2 3) then the rst list will output 2
fragments, one of 2 and one of 3 pitches. The second list will output 4 fragments of 2, 3, 2
and 3 pitches (loop).

(pitch-fragment '(2 4) '(2 3)
                '((c4 d4 e4 f4 g4 a4) (cs4 eb4 fs4 gs5 bb4))
                :transpose '(1 -1 2 -2))

=> ((fs4 gs4 eb4 e4 fs4)
    (e4 g4 c4 d4 f4 bb5 c5 b3 cs4 e4))

The following examples show how OMN list form can be fragmented.

(pitch-fragment '(3 2) '((2 3) (1 2))
                '((q c4 stacc cs4 d4 c4cs4 ten d4)
                  (q c4 stacc cs4 d4 c4cs4 ten d4))
                :transpose '((1 -13) (6 -13)) :seed 6)

=> ((q eb4 stacc cs4d4 cs3 b2c3 ten cs3 cs4d4 stacc eb4)
    (q fs4 stacc b2c3 cs3))

(setf omn (gen-repeat
           6 '((e f4 e4 c4 a4 g4 d4 gs4 cs4 eb4 fs4 bb4 b4))))

(pitch-fragment '(3 4 2 5) '((2 3 4 2) (3 2 3)) omn
                :transpose '((1 -1) (1 -11 2 -2 13 -13))
                :seed 235)
=> ((e eb4 a4 g4 c4 d4 fs4 f4 cs4 bb4)
    (e bb4 gs4 eb4 b3 c4 e4 bb4 eb4 d4 bb3 g4)
    (e d4 e4 gs4 fs4 cs4)
    (e bb4 gs4 eb4 bb3 gs3 a4 e4 bb4 c4 fs4 b3 a5 d5)
    (e e4 g4 f4 a4 bb4 f4 cs4 bb4 gs4)
    (e gs4 eb4 a4 f3 cs3 eb4 f4 gs4 fs4 b3 cs4))
                                                                fi
