Opusmodus                                                                      find-odd   1

find-odd list
[Function]

Arguments and Values:
list                     a list of numbers.


Description:

This function returns all odd numbers from a list of numbers. It could be used to create
variations in a pitch sequence. Once such a sequence was converted to integers all even
numbered integers could be transposed up and octave. This is a favoured device used in some
serial composition, notably by the composer Charles Wuorinen.

(find-odd '(1 2 3 4 5 6 7))
=> (1 3 5 7)


Examples:

Below is an example of how the function might be used to create a radical variation in a
second part based on 'even numbered' pitches taken from the ute part and dropped an octave
to be played by a bassoon.

(setf flute-1 (rnd-sample 24 '(c4 cs4 d4 fs4 g4 gs4 c5) :seed 34))
=> (gs4 fs4 d4 cs4 gs4 d4 c5 d4 fs4 c5 gs4 gs4
    fs4 g4 c5 gs4 gs4 cs4 cs4 d4 g4 cs4 gs4 cs4)

(setf flute-1i (pitch-to-integer flute-1))
=> (8 6 2 1 8 2 12 2 6 12 8 8 6 7 12 8 8 1 1 2 7 1 8 1)

(find-odd flute-1i)
=> (1 7 1 1 7 1 1)

(setf bassoon-map
      (binary-invert
       (gen-binary-remove
          (integer-to-pitch (find-even flute-1i)) flute-1)))
=> (1 1 1 0 1 1 1 1 1 1 1 1 1 0 1 1 1 0 0 1 0 0 1 0)

(setf bassoon-1 (pitch-transpose -12 (binary-map bassoon-map flute-1)))
=> (gs3 fs3 d3 gs3 d3 c4 d3 fs3 c4 gs3 gs3 fs3 c4 gs3 gs3 d3 gs3))

(setf bassoon-lengths (binary-map bassoon-map 's :omn t))
=> (s = = - = = = = = = = = = - = = = - - = - - = -)
                                                     fl
