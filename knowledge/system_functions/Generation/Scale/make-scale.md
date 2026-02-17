Opusmodus                                                                                     make-scale   1

make-scale start size &key alt type
[Function]

Arguments and Values:
start                   an integer or pitch symbol.
size                    an integer (lists length).
alt                     an integer (alternate, step) or list of integers. The default is 1.
type                    0, :pal (palindrome) or :rev (reverse). The default is 0.


Description:

The function MAKE-SCALE generate a list of integers or pitches.


Examples:
(make-scale 'cs4 11)
=> (cs4 d4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4)

(make-scale 0 12 :alt 3)
=> (0 3 6 9 12 15 18 21 24 27 30 33)

(make-scale 0 5 :alt 2 :type :pal)
=> (0 2 4 6 8 6 4 2 0)

(make-scale 0 5 :type :rev)
=> (4 3 2 1 0)

(make-scale 'c4 8 :alt '(2 1))
=> (c4 d4 eb4 f4 fs4 gs4 a4 b4)              ; Bartok 1

(make-scale 'c4 8 :alt '(1 2))
=> (c4 cs4 eb4 e4 fs4 g4 a4 bb4) ; Bartok 2
