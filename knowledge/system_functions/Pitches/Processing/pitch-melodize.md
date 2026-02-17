Opusmodus                                                                        pitch-melodize        1

pitch-melodize pitch &key sort type flat span
                         section exclude seed omn

[Function]

Arguments and Values:
sequence                 list(s) of pitches.
sort                     'a (ascending) 'd (descending), '? (at random). The default is NIL.
type                     :divide, :repeat or NIL. The default is NIL.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     NIL or number. The default is NIL.
omn                      NIL or T. If true force OMN style output. The default is T.

OMN:
flat                     NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                     :length, :pitch or :velocity. The default is :pitch.


Description:

Converts pitch material into melodies by breaking up chords.

OMN fragments processed by PITCH-MELODIZE will also have their rhythmic integrity
preserved.

Take this example:

(setf chords '(e c4e4g4 d4 q f4a4))

Evaluating the expression below will not only break each chord into a separate pitches, but
will also ‘loop’ the rhythmic material:

(pitch-melodize chords)
=> (e c4 e4 q g4 e d4 f4 q a4)

Expression with :sort keyword:

(pitch-melodize chords :sort 'a)
=> (e g4 e4 q c4 e d4 a4 q f4)

(pitch-melodize chords :sort '?)
=> (e e4 c4 q g4 e d4 a4 q f4)
=> (e g4 c4 q e4 e d4 a4 q f4)
=> . . .
                                                                  fl
Opusmodus                                                                             pitch-melodize   2

 We could also constrain the output to the length of the original OMN fragment by using
the :span :length key, for example:

(pitch-melodize chords :span :length)
=> (e c4 e4 q g4)

The way that rhythmic material is handled by PITCH-MELODIZE can also be changed
using :type :divide and :type :repeat. When :type :divide is called, each
chord will be divided up into a series of notes with a total duration of the original, so:

(pitch-melodize chords :type :divide)
=> (3e c4 e4 g4 e d4 f4 a4)

As with the use of :span :length, this will give a phrase which is the same duration as
the original, but unlike the example of :span :length, no pitches have been omitted.

In the case of :type :repeat, the output phrase will be longer than the original, since the
duration value for each chord is repeated for each melodized note.

(pitch-melodize chords :type :repeat)
=> (e c4 e4 g4 d4 q f4 a4)


Examples:

Melodize a single pitch list:

(pitch-melodize '(c4e4g4 d4 f4a4))
=> (c4 e4 g4 d4 f4 a4)

Melodize multiple pitch lists:

(pitch-melodize '((c4e4g4) (d4) (f4a4)))
=> ((c4 e4 g4) (d4) (f4 a4))

Melodize only a speci c section:

(pitch-melodize '((c4e4g4) (d4) (f4a4)) :section 2)
=> ((c4e4g4) (d4) (f4 a4))

Melodize a single OMN list:

(pitch-melodize '(e c4e4g4 d4 q f4a4))
=> (e c4 e4 q g4 e d4 f4 q a4)
                  fi
Opusmodus                                                                 pitch-melodize   3

Melodize a series of OMN lists:

(pitch-melodize '((e c4e4g4) (e d4) (q f4a4)))
=> ((e c4 e4 g2) (e d4) (q f4 a4))

Span the melodized OMN list to the duration of the original phrase:

(pitch-melodize '(e c4e4g4 d4 q f4a4) :span :length)
=> (e c4 e4 q g4)

Span the melodized OMN sublists to the duration of each sublist:

(pitch-melodize '((e c4e4g4) (e d4) (q f4a4)) :span :length)
=> ((e c4) (e d4) (q f4))

Divide melodized OMN output note-lengths to equal the same duration as the original
sublists:

(pitch-melodize '((e c4e4g4) (e d4) (q f4a4)) :type :divide)
=> ((3s c4 e4 g4) (e d4) (e f4 a4)

Repeat the note-lengths of the original chord for each melodized pitch:

(pitch-melodize '((e c4e4g4) (e d4) (q f4a4)) :type :repeat)
=> (e c4 e4 g4) (e d4) (q f4 a4)
