Opusmodus                                                                     gen-dim-cresc   1

gen-dim-cresc n low high &optional dynamic
[Function]

Arguments and Values:
n                         an integer. Number of values to generate.
high                      peak velocity ( oat or velocity-symbol).
low                       lower velocity ( oat or velocity-symbol).
dynamic                   NIL or T. The default is NIL.


Description:

GEN-DIM-CRESC will generate a diminuendo from a peak velocity value to a lower value
at half the speci ed length. Having reached this, it will then generate a crescendo back to the
original peak value.

(gen-dim-cresc 10 0.5 0.1)
=> (0.5 0.4 0.31 0.2 0.1 0.1 0.2 0.3 0.4 0.5)

There are three different possible notations for dynamics. One is the use of oating point
values. Second is the OMN notation. The third is MIDI values from 0-127.


Examples:
(gen-dim-cresc 10 'f 'pp)
=> (f mf mp mp p pp p mp mp mf)

With optional T (dynamic):

(gen-dim-cresc 10 'f 'pp t)
=> (f> mf> mp> p> pp< < p< mp< mf< f)

Generate a diminuendo & crescendo for a given phrase length:

(gen-dim-cresc (length '(c4 d4 e4 f4 g4)) 0.5 0.32)
=> (0.5 0.41 0.32 0.41 0.5)
             fi
                                 fl
                                      fl
                                                                      fl
Opusmodus                                                                 gen-dim-cresc     2

Create two diminuendo-crescendos, one on the nal six notes, the other on the remainder of
the phrase:

(setf phrase '(c4 d4 e4 f4 g4 a4 b4 c5 d5 e5 f5 g5))

(append
 (gen-dim-cresc (- (length phrase) (- (length phrase) 6)) 0.5 0.32)
 (gen-dim-cresc (- (length phrase) 6) 0.6 0.25))

=> (0.5 0.41 0.32 0.32 0.41 0.5 0.6 0.43 0.25 0.25 0.43 0.6)

 (gen-dim-cresc 50 'fff 'pp t)
=> (fff> > ff> > > > > f> > > mf> > > > >
    mp> > > > p> > > > pp< < < < p< < < < <
    mp< < < mf< < < < < f< < < ff< < < < < fff fff)
                                       fi
