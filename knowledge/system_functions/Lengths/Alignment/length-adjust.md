Opusmodus                                                                           length-adjust      1

length-adjust value lengths &key type position
                    section exclude omn seed flat span

[Function]

Arguments and Values
value                    ratio or length symbol value.
lengths                  lists of lengths or OMN sequence form.
type                     'r (length-rest) 'n (length-note) or '?, if not speci ed random type is used.
                         The default is 'r (rest).
position                 's, (start) 'e, (end)'o (outer) or '?, if not speci ed random position is used.
                         The default is 'e (end).
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
seed                     NIL or an integer. The default is NIL.
omn                      NIL or T. If true, the OMN style output is forced. The default is NIL.

OMN:
flat                     NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                     :length, :pitch or :velocity. The default is :length.


Description

LENGTH-ADJUST can be used to change the lengths of a given series of durations (or OMN
notation) to match up with a given duration. For example, the OMN phrase:

(setf my-phrase '(q c3 e d3 e3 q f3 e g3 a3))

This is a very simple four beat phrase. We may wish to adjust it to ve beats, which we can
easily do thus:

(length-adjust 5/4 my-phrase)
=> (q c3 e d3 e3 q f3 e g3 a3 -q)

(length-adjust 3/4 '(q e = q e =) :omn t)
=> (q e = q)

(length-adjust 7/8 '(q e = q e =) :omn t)
=> (q e = q e)

(length-adjust 2 '(q e = q e =) :omn t :type 'r :position 's)
=> (-w q e = q e =)
                                                                 fi
                                                                      fi
                                                                      fl
                                                                           fi
Opusmodus                                                                 length-adjust   2



By default LENGTH-ADJUST will add either rest or note lengths to the phrase. In the case of
note-lengths being added, in OMN this will lead to the pitch elements being looped. You can
force LENGTH-ADJUST to return either only rest or note lengths by using :type 'r
or :type 'n. This is a particularly valuable function to use alongside LENGTH-DELTA-
MAP.


Examples

Adjust by adding rest 'r at the start 's of a phrase:

(length-adjust 5/4 '(q e = q e =) :type 'r :position 's :omn t)
=> (-q = e = q e =)

Adjust by adding rest 'r to the end 'e of a phrase:

(length-adjust 5/4 '(q e = q e =) :type 'r :position 'e :omn t)
=> (q e = q e = -q)

Adjust by adding rest 'r to either side 'o of a phrase:

(length-adjust 5/4 '(q e = q e =) :type 'r :position 'o :omn t)
=> (-e q e = q e = -)

OMN:

Adjust by adding rests 'r at the start 's of a phrase:

(length-adjust 5/4 '(q c4 e d4 e4 q f4 e g4 a4) :type 'r :position 's)
=> (-q c4 e d4 e4 q f4 e g4 a4)

Adjust by adding rests 'r to the end 'e of a phrase:

(length-adjust 5/4 '(q c4 e d4 e4 q f4 e g4 a4) :type 'r :position 'e)
=> (q c4 e d4 e4 q f4 e g4 a4 -q)

Adjust by adding rests to either side of a phrase:

(length-adjust 5/4 '(q c4 e d4 e4 q f4 e g4 a4) :type 'r :position 'o)
=> (-e q c4 e d4 e4 q f4 e g4 a4 -)

Add either rest or note in random :position - for example, when working with multiple
lists.
