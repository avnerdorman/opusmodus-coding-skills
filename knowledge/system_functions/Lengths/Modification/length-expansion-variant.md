Opusmodus                                                                        length-expansion-variant   1

length-expansion-variant lengths &key percent expand
                                              position variant quant flat span
                                              section exclude omn seed

[Function]

Arguments and Values:
lengths                   lists of lengths or OMN sequence form.
percent                   an integer.
expand                    an integer.
position                  's (start), 'e (end) or '? (at random), if not speci ed random
                          position is used.
variant                   'p (prime), 'r (retrograde), 'i (invert), 'ri (retrograde-invert)
                          or '? (at random).
quant                     a ratio. The default is 1/8.
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.
seed                      NIL or an integer. The default is NIL.

OMN:
flat                      NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                      :length, :pitch or :velocity. The default is :length.


Description:

LENGTH-EXPANSION-VARIANT can be used to quickly increase the duration of a given
series of lengths or OMN notation. For example, to increase the length of a phrase 100%
using the prime method:

(length-expansion-variant '(h q e s) :percent 100 :variant 'p)
=> (h q e s h q e s)

Note that when using a percentage of less or greater than 100%, the position at which the
repeat starts is randomly chosen, either from the start of end of the phrase so we may get:

(length-expansion-variant '(h q e s) :percent 50 :variant 'p)
=> (h q e s e s)

We can force this using :position 's:

(length-expansion-variant
 '(h q e s) :percent 50 :position 's :variant 'p)
=> (h q e s h q -s)
                                                                       fl
                                                                            fi
Opusmodus                                                         length-expansion-variant   2

Using the invert :variant 'i will invert rests and length values:

(length-expansion-variant
 '(h -q e -s) :percent 100 :position 's :variant 'i)
=> (h -q e -hs q -e s)
Reverse will reverse the order:

(length-expansion-variant
 '(h q e s) :percent 100 :position 's :variant 'r)
=> (h q e s = e q h)

And reverse invert will reverse the order and invert note lengths and rests:

(length-expansion-variant
 '(h -q e -s) :percent 100 :position 's :variant 'ri)
=> (h -q e -s q -h q -hs)

:expand can also be used to apply an expansion a speci ed number of :expand - useful
in conjunction with the function's default random behaviours:

(length-expansion-variant
 '(h -q e -s) :percent 50 :expand 2 :variant 'ri)
=> (h -q e -s = -e s -e.)

Most arguments of LENGTH-EXPANSION-VARIANT can also take lists:

(length-expansion-variant
 '((h -q e -s) (-h q -e s))
 :percent '(100 50) :position '(s e)
 :variant '(p ri) :expand '(1 2))
=> (((h -q e -s h -q e -s) (-h q -e s - e -s e -s))


Examples:

Expand all lists 50% with random positions and type:

(length-expansion-variant
 '((e e q e e s s) (q q e e q)) :percent 50)
=> ((e = q e = s = e = s =) (q = e = q -q.))

Expand all lists 50% with invert and retrograde, but with random positions:

(length-expansion-variant
 '((e e q e e s s) (q q e e q))
 :percent 50 :variant '(i r))
=> ((e = q e = s = -q.) (q = e = q = e))
                                                    fi
Opusmodus                                                      length-expansion-variant   3

(length-expansion-variant
 '((e e q e e s s) (q q e e q))
 :percent 50 :variant '(i r) :quant 1/4)
=> ((e = q e = s = -e - -q -e) (q = e = q = e))

OMN:

Extend OMN notation 100% with origin variant - pitches repeat:

(length-expansion-variant
 '(h c4 q d4 e e4 s f4) :percent 100 :variant 'p)
=> (h c4 q d4 e e4 s f4 h c4 q d4 e e4 s f4)

Extend OMN notation 100% with retrograde - pitches repeat, but lengths are reversed:

(length-expansion-variant
 '(h c4 q d4 e e4 s f4) :percent 100 :variant 'r)
=> (h c4 q d4 e e4 s f4 c4 e d4 q e4 h f4)

Extend OMN notation 100% with invert - lengths become rests:

(length-expansion-variant
 '(h c4 q d4 e e4 s f4) :percent 100 :variant 'i)
=> (h c4 q d4 e e4 s f4 -h...)

A more complex OMN example:

(length-expansion-variant
 '((h c4 q d4) (e e4 s f4) (3q g4 a4 b4 q c5))
 :percent '(100 50 50) :expand '(1 2 4)
 :variant '(r ? r) :seed 45)
=> ((h c4 q d4 c4 h d4)
    (e e4 s f4 - e4 -)
    (3q g4 a4 b4 q c5 g4 3q a4 -3e q b4 3q c5 g4 a4 b4 c5 -))
