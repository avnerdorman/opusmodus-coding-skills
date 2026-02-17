Opusmodus                                                                         length-span   1

length-span duration length &key align flat omn
[Function]

Arguments and Values:
duration                a phrase duration, or list of durations.
length                  a series of lengths or OMN notation.
align                   T or NIL. The default is NIL.
flat                    NIL or T. Use :flat T to atten OMN sublists before processing.
                        The default is NIL.
omn                     NIL or T. T to force OMN format. The default is NIL.


Description:

The function LENGTH-SPAN span lengths or length values in OMN format to ll a given
series of durations.

(length-span '1/2 '(e s =))
=> (1/8 1/16 1/16 1/8 1/16 1/16)

(length-span '(1 1 1) '((e) (q) (h)))
=> ((1/8 1/8 1/8 1/8 1/8 1/8 1/8 1/8)
    (1/4 1/4 1/4 1/4) (1/2 1/2))

You might think of the term durations in this context like bars with time signatures:
(2/4 3/4 5/8 2/4).

(length-span '(2/4 3/4 5/8 2/4) '((e) (s) (e)) :omn t)
=> ((e = = =) (s = = = = = = = = = = =)
    (e = = = =) (e = = =))

With the keyword :align T the lists count will align to the durations count.

(length-span '(q q q q) '((e) (s) (e)) :align t :omn t)
=> ((e =) (s = = =) (e =) (-q))


Examples:

We might have the following rhythm:

(setf ostinato '(s e s =))
                                          fl
                                                                             fi
Opusmodus                                                                     length-span      2

We can quickly 'span' this rhythm to ll a given range of durations:

(setf spanned-ostinato
     (length-span '(2/4 3/4 5/8 2/4) ostinato :omn t))
=> ((s e s = = e) (s = = e s = = e s =)
    (s e s = = e s =) (s e s = = e))

This has enabled us to quickly create a rhythmic template, which we might apply some pitch
material to:

(setf spanned-melody
     (span spanned-ostinato '(c4 g4 f4 g4 d4 a4 g4 a4)))
=> ((c4 g4 f4 g4 d4 a4) (g4 a4 c4 g4 f4 g4 d4 a4 g4 a4)
    (c4 g4 f4 g4 d4 a4 g4 a4) (c4 g4 f4 g4 d4 a4))

(make-omn :length spanned-ostinato
          :pitch spanned-melody)
=> ((s c4 e g4 s f4 g4 d4 e a4)
    (s g4 a4 c4 e g4 s f4 g4 d4 e a4 s g4 a4)
    (s c4 e g4 s f4 g4 d4 e a4 s g4 a4)
    (s c4 e g4 s f4 g4 d4 e a4))

We could even do the whole of the above operation in OMN, but note that the rhythm needs
extending to match the pitches:

(length-span '(2/4 3/4 5/8 2/4) '(s c4 e g4 s f4 g4 d4 e a4 s g4 a4))
=> ((s c4 e g4 s f4 g4 d4 e a4)
    (s g4 a4 c4 e g4 s f4 g4 d4 e a4 s g4 a4)
    (s c4 e g4 s f4 g4 d4 e a4 s g4 a4)
    (s c4 e g4 s f4 g4 d4 e a4))

LENGTH-SPAN will repeat material if the given duration is longer than the duration of the
rhythmic material being spanned. It will also truncate and compensate for durations that are
shorter than the rhythmic material:

(length-span '4/8 '(1/8 1/8 1/2))
=> (1/8 1/8 1/4)

Rests may be introduced by using negative duration values:

(length-span '(2/4 -3/4 5/8 2/4) '(s e s =) :omn t)
=> ((s e s = = e) (-h.) (s = = e s = = e) (s = = e s = =))

Span to a single duration:

(length-span '1/2 '(e s =))
=> (1/8 1/16 1/16 1/8 1/16 1/16)
                              fi
Opusmodus                                                       length-span   3

Span multiple durations:

(length-span '(1/2 2/2 3/4) '(e s =))
=> ((1/8 1/16 1/16 1/8 1/16 1/16)
    (1/8 1/16 1/16 1/8 1/16 1/16 1/8 1/16 1/16 1/8 1/16 1/16)
    (1/8 1/16 1/16 1/8 1/16 1/16 1/8 1/16 1/16))

Force OMN-style output:

(length-span '(1/2 2/2 3/4) '(e s =) :omn t)
=> ((e s = e s =)
    (e s = e s = e s = e s =)
    (e s = e s = e s =))

Span OMN to a single duration:

(length-span '1/2 '(e c4 s g4 s f4))
=> (e c4 s g4 f4 e c4 s g4 f4)

Span OMN to multiple durations:

(length-span '(1/2 2/2 3/4) '(e c4 s g4 s f4))
=> ((e c4 s g4 f4 e c4 s g4 f4)
    (e c4 s g4 f4 e c4 s g4 f4 e c4 s g4 f4 e c4 s g4 f4)
    (e c4 s g4 f4 e c4 s g4 f4 e c4 s g4 f4))
