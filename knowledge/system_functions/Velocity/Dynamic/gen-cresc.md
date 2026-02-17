Opusmodus                                                                       gen-cresc   1

gen-cresc n low high &optional dynamic
[Function]

Arguments and Values:
n                        a number of values to generate.
low                      starting velocity ( oat or velocity-symbol).
high                       nishing velocity ( oat or velocity-symbol).
dynamic                  NIL or T. The default is NIL.


Description:

GEN-CRESC and GEN-DIM share the same functionality and can be used to generate
smooth crescendos and diminuendos by interpolating between two velocities.

(gen-cresc 10 0.32 0.5)
=> (0.32 0.35 0.36 0.39 0.4 0.43 0.44 0.46 0.48 0.5)

There are three different possible notations for dynamics. One is the use of oating point
values. Second is the OMN notation. The third is MIDI values from 0-127.


Examples:

For example, to generate a crescendo across ten steps:

(gen-cresc 10 'pp 'f)
=> (pp pp p p mp mp mf mf f f)

With optional T (dynamic):

(gen-cresc 10 'pp 'f t)
=> (pp< < p< < mp< < mf< < f f)

Generate a crescendo for a given phrase length:

(gen-cresc (length '(c4 d4 e4 f4 g4)) 0.32 0.5)
=> (0.32 0.37 0.41 0.46 0.5)
                   fi
                                   fl
                                        fl
                                                                         fl
Opusmodus                                                                      gen-cresc      2

Create two crescendos, one on the nal four notes, the other on the remainder of the phrase:

(setf phrase '(c4 d4 e4 f4 g4 a4 b4 c5 d5 e5 f5 g5))

(append
 (gen-cresc (- (length phrase) (- (length phrase) 4)) 0.32 0.5)
 (gen-cresc (- (length phrase) 4) 0.32 0.5))
=> (0.32 0.39 0.44 0.5 0.32 0.35 0.38 0.4 0.43 0.45 0.48 0.5)


Score Example:
(setf phrase-1 (rndn 20 0 12))
(setf phrase-2 (rndn 20 0 6))
(setf phrase-3 (ambitus-integer '(-12 12) (x*y phrase-1 phrase-2)))

(setf t-1 (integer-to-pitch phrase-1))
(setf t-2 (integer-to-pitch phrase-2))
(setf t-3 (integer-to-pitch phrase-3))

(setf fanfare-rhy
      (gen-length '(1 1 2 1 1 1 1 2 1 1 3 1 2 2 1 1 1 1 4 4) 16))

(setf trio-vel (gen-cresc (length phrase-1) 'p 'fff))

(def-score fanfare
           (:key-signature 'chromatic
            :time-signature '(2 4)
            :tempo '(q 50))

 (horn1
  :length fanfare-rhy
  :pitch t-1
  :velocity trio-vel
  :channel 1 :sound 'gm :program 'french-horn)

 (horn2
  :length fanfare-rhy
  :pitch t-2
  :velocity trio-vel
  :channel 2)

 (horn3
  :length fanfare-rhy
  :pitch t-3
  :velocity trio-vel
  :channel 3))
                            fi
