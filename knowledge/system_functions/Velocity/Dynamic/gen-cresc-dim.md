Opusmodus                                                                   gen-cresc-dim   1

gen-cresc-dim n low high &optional dynamic
[Function]

Arguments and Values:
n                        a number of values to generate.
low                      lower velocity ( oat or velocity-symbol).
high                     peak velocity ( oat or velocity-symbol).
dynamic                  NIL or T. The default is NIL.


Description:

The function GEN-CRESC-DIM will generate a crescendo from a lower velocity value to a
peak value at half the speci ed length. Having reached this, it will then generate a
diminuendo for the rest of the lengths.

(gen-cresc-dim 10 0.1 0.5)
=> (0.1 0.18 0.26 0.35 0.43 0.5 0.43 0.35 0.26 0.18)

There are three different possible notations for dynamics. One is the use of oating point
values. Second is the OMN notation. The third is MIDI values from 0-127.


Examples:

For example, to generate a crescendo-diminuendo across ten steps:

(gen-cresc-dim 10 'pp 'f)
=> (pp p mp mp mf f mf mp mp p)

With optional T (dynamic):

(gen-cresc-dim 10 'pp 'f t)
=> (pp< p< mp< mf< f> > mf> mp> p> pp)

Generate a crescendo & diminuendo for a given phrase length:

(gen-cresc-dim (length '(c4 d4 e4 f4 g4)) 0.32 0.5)
=> (0.32 0.41 0.5 0.41 0.32)
                    fi
                                fl
                                     fl
                                                                     fl
Opusmodus                                                                 gen-cresc-dim     2

Create two crescendo-diminuendos, one on the nal six notes, the other on the remainder of
the phrase:

(setf phrase '(c4 d4 e4 f4 g4 a4 b4 c5 d5 e5 f5 g5))

(append
 (gen-cresc-dim (- (length phrase) (- (length phrase) 6)) 0.32 0.5)
 (gen-cresc-dim (- (length phrase) 6) 0.32 0.5))

=> (0.32 0.41 0.5 0.5 0.41 0.32 0.32 0.41 0.5 0.5 0.41 0.32)

 (gen-cresc-dim 50 'pp 'fff t)
=> (pp< < p< < < < < mp< < < mf< < < < < f< < <
    ff< < < < < fff> > > > ff> > > > > f> > >
    mf> > > > mp> > > > p> > > > > pp pp)
                                       fi
