Opusmodus                                                                           pitch-demix   1

pitch-demix voice-number lists &key sort section exclude omn seed
[Function]

Arguments and Values:
voice-number             an integer.
lists                    lists of pitches.
sort                     'a (ascending), 'd (descending) or '? (at random). The default is 'a.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
omn                      NIL or T. If true force OMN style output. The default is NIL.
seed                     NIL or an integer. The default is NIL.


Description:

The function PITCH-DEMIX enables a series of lists containing chords to be demixed to
a series of individual voices.

(pitch-demix 1 '(c4 d4b3 e4fs4g4 gb4c4gs4))
=> (c4 d4 e4 gs4)

(pitch-demix 2 '(c4 d4b3 e4fs4g4 fs4c4gs4))
=> (b3 fs4 fs4)

(pitch-demix 1 '((c4gs4cs4g5 fs4d5g4db5 c5gs4f5eb4 fs5d4)
                 (c4 d4b3 e4gb4g4 gb4c4gs4)) :sort nil)
=> ((c4 fs4 c5 fs5) (c4 d4 e4 gb4))

Now let's view the process in reverse with PITCH-MIX.

(pitch-mix '((c4 d4 e4 gb4) (c4 b3 gb4 c4) (c4 b3 g4 ab4)))
=> (c4 d4b3 e4gb4g4 gb4c4ab4)

This function can create individual instrumental parts from a chordal keyboard score, which
for many composers is the starting point of a composition for a larger ensemble.

Here, in these preliminary examples the individual parts are de-mixed by pitch-range rather
than by pitch order.
Opusmodus                                                                      pitch-demix      2

Examples:

You can also demix a different part in each successive list. This can be useful when thinning
a part composed for piano, guitar, harp or mallet instrument.

(setf mat '((c3e4fs4d5 bb3b3f4a4 ab3g4e5 ab3g4e5)
            (d4e4gb4 b3gb4c4 g4ab4)))

(pitch-demix '(1 2) mat)
=> ((d5 a4 e5 e5) (e4 c4 g4))

The :sort keyword offers a further variation to part-writing, a different trajectory through a
series of chords. Instead of demixing parts by pitch range you can :sort by position in the
chord list, as below.

(pitch-demix '(1 2) mat :sort nil)
=> ((c3 bb3 ab3 ab3) (e4 gb4 ab4))

It is also possible to demix lists of chords selectively by :section.

(pitch-demix '(1 2) mat :section 0)
=> ((d5 a4 e5 e5) (d4e4gb4 b3gb4c4 g4ab4))

(pitch-demix
 3 '(-q c3e4fs4d5 p ten -e bb3b3f4a4 gs3g4e5 ab3 stacc g4e5))
=> (-q e4 p ten -e b3 gs3 - -)
