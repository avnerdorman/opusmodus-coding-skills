Opusmodus                                                                      gen-dim   1

gen-dim n low high &optional dynamic

[Function]

Arguments and Values:
n                        an integer.
low                      a oat or velocity-symbol.
high                     a oat or velocity-symbol.
dynamic                  NIL or T. The default is NIL.


Description:

The functions GEN-DIM and GEN-CRESC share the same functionality and can be used to
generate smooth crescendos and diminuendos by interpolating between two velocities.

(gen-dim 10 0.5 0.32)
=> (0.5 0.48 0.46 0.44 0.43 0.4 0.39 0.36 0.35 0.32)

There are three different possible notations for dynamics. One is the use of oating point
values. Second is the OMN notation. The third is MIDI values from 0-127. Whilst the latter
works quite ef ciently it does not have the ne resolution of the rst.


Examples:

For example, to generate a diminuendo across ten steps:

(gen-dim 10 'f 'pp)
=> (f f mf mf mp mp p p pp pp)

With optional T (dynamic):

(gen-dim 10 'f 'pp t)
=> (f> > mf> > mp> > p> > pp pp)

Generate a diminuendo for a given phrase length:

(gen-dim (length '(c4 d4 e4 f4 g4)) 0.5 0.32)
=> (0.5 0.46 0.41 0.37 0.32)
        fi
                    fl
                    fl
                                     fi
                                                          fi
                                                                  fl
Opusmodus                                                                       gen-dim   2

Score Example:

Create two diminuendos, one on the nal four notes, the other on the remainder of the
phrase:

(setf phrase '(c4 d4 e4 f4 g4 a4 b4 c5 d5 e5 f5 g5))

(append
 (gen-dim (- (length phrase) (- (length phrase) 4)) 0.5 0.32)
 (gen-dim (- (length phrase) 4) 0.5 0.32))

(setf phrase-1 (rndn 20 0 12))
(setf phrase-2 (rndn 20 0 6))
(setf phrase-3 (ambitus-integer '(-12 12) (x*y phrase-1 phrase-2)))

(setf t-1 (integer-to-pitch phrase-1))
(setf t-2 (integer-to-pitch phrase-2))
(setf t-3 (integer-to-pitch phrase-3))

(setf fanfare-rhy
     (gen-length '(1 1 2 1 1 1 1 2 1 1 3 1 2 2 1 1 1 1 4 4) 16))

(setf trio-vel (gen-dim (length phrase-1) 'fff 'p))

(def-score fanfare
           (:key-signature 'chromatic
            :time-signature '(2 4)
            :tempo '(q 50))

 (horn1
  :pitch t-1 :length fanfare-rhy :velocity trio-vel
  :channel 1 :sound 'gm :program 'french-horn)

 (horn2
  :pitch t-2 :length fanfare-rhy :velocity trio-vel
  :channel 2)

 (horn3
  :pitch t-3 :length fanfare-rhy :velocity trio-vel
  :channel 3))
                             fi
