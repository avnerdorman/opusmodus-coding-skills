Opusmodus                                                                        gen-swallow   1

gen-swallow length pattern &key flatten
[Function]

Arguments and Values:
length                    lists of lengths or OMN sequence form.
pattern                   a list or lists of items.
flatten                   NIL or T. If T, lists are atten. The default is NIL.


Description:

This function 'swallows' items that align with rest-length.

(gen-swallow '(1/4 -1/4 1/4 -1/4) '(c4 d4 e4 g4))
=> (c4 e4)

Evaluate multiple lists of lengths and pitches against each other:

(gen-swallow '((1/4 -1/4 1/8 1/8) (1/8 1/8 -1/4 1/4))
             '((c4 d4) (c4 d4 e4 g4)))
=> ((c4 c4 d4) (c4 d4 g4))

Flatten the pitch sublists before processing:

(gen-swallow '((1/4 -1/4 1/8 1/8) (1/8 1/8 -1/4 1/4))
             '((c4 d4) (c4 d4 e4 g4)) :flatten t)
=> ((c4 c4 d4) (e4 g4 d4))

Mapping pitches to series of lengths is a fundamental technique in OPUSMODUS. But
there are two distinct ways of doing this. One option is to use SPAN. The other option is
GEN-SWALLOW. In these preliminary examples we have a list of note-lengths that will result
in two sounding notes.

(span '(1/4 -1/4 1/4 -1/4) '(c4 d4 e4 g4))
=> (c4 d4)

SPAN only works sequentially by leaping over the rest-lengths. GEN-SWALLOW, however,
will effectively remove (or 'swallow) a pitch that falls on to the rest length value:

(gen-swallow '(1/4 -1/4 1/4 -1/4) '(c4 d4 e4 g4))
=> (c4 e4)
                                          fl
Opusmodus                                                                  gen-swallow   2

Examples:

So, with GEN-SWALLOW we could create a hocket or call and response effect by inverting
the durations and keeping the same pitch data:

(setf my-durations '(q - = = - -))
(setf my-pitches '(c4 d4 e4 f4 g4 a4))

(gen-swallow my-durations my-pitches)
=> (c4 e4 f4)

(gen-swallow (length-invert my-durations) my-pitches)
=> (d4 g4 a4)

The function GEN-SWALLOW will also 'swallow' dynamics, articulation or any other data.

(setf my-dynamics '(ff ff p p mf mf))

(gen-swallow my-durations my-dynamics)
=> (ff p p)
