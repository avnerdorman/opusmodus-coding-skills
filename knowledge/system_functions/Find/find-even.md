Opusmodus                                                                      find-even   1

find-even list
[Function]

Arguments and Values:
list                     a list of numbers.


Description:

This function selects even numbered integers with a list. It can be useful when
constructing additional parts from a single source.

(find-even '(1 2 3 4 5 6 7))
=> (2 4 6)


Examples:

Below is a preliminary example of how the function might be used to create a radical
variation in a second part based on 'even numbered' pitches taken from the ute part and
dropped an octave to be played by a bassoon.

(setf flute-1 (rnd-sample 24 '(c4 cs4 d4 fs4 g4 gs4 c5) :seed 34))
=> (gs4 fs4 d4 cs4 gs4 d4 c5 d4 fs4 c5 gs4 gs4
    fs4 g4 c5 gs4 gs4 cs4 cs4 d4 g4 cs4 gs4 cs4)

(setf flute-1i (pitch-to-integer flute-1))
=> (8 6 2 1 8 2 12 2 6 12 8 8 6 7 12 8 8 1 1 2 7 1 8 1)

(find-even flute-1i)
=> (8 6 2 8 2 12 2 6 12 8 8 6 12 8 8 2 8)

(integer-to-pitch (find-even flute-1i))
=> (gs4 fs4 d4 gs4 d4 c5 d4 fs4 c5 gs4 gs4 fs4 c5 gs4 gs4 d4 gs4)
                                                                   fl
Opusmodus                                                     find-even   2

(setf bassoon-map
      (binary-invert
       (gen-binary-remove
        (integer-to-pitch (find-even flute-1i)) flute-1)))
=> (1 1 1 0 1 1 1 1 1 1 1 1 1 0 1 1 1 0 0 1 0 0 1 0)

(setf bassoon-1
      (pitch-transpose -12 (binary-map bassoon-map flute-1)))
=> (gs3 fs3 d3 gs3 d3 c4 d3 fs3 c4 gs3 gs3 fs3 c4 gs3 gs3 d3 gs3)

(setf bassoon-lengths (binary-map bassoon-map 's :omn t))
=> (s = = - = = = = = = = = = - = = = - - = - - = -)
