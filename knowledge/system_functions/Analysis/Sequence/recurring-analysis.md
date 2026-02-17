Opusmodus                                                             recurring-analysis   1

recurring-analysis type sequence &key size name
[Function]

Arguments and Values:
type                    :length, :pitch, :interval, :velocity
                        :attribute or :values.
sequence                a sequence.
size                    an integer. The default is 2.
name                    a name (a string).


Description:

This function searches for a recurring series in a sequence. The result is a count number of
the most frequently recurring series and the longest recurring series found in a sequence.

(setf rh '((-s) (e f4e5 pp -s db5) (-s) (-s eb4 pp c4d5 -)
           (-s) (-s c4d5 pp eb4 -) (-s) (e db5 pp -s f4e5)
           (-s) (s gb4f5 p a5 -) (s d4ab4db5 p bb4 -)
           (-s a5 p gb4f5) (-s) (s b5 f gb4g5 -)
           (s a3bb4 f ab4 -) (s c4d5 f> eb4 -)
           (s db5 f> f4e5 -) (-s)
           (s gb4f5 p a5 d4ab4db5 bb4 -) (-s)
           (-s a5 pp gb4f5) (-s)
           (-t b2 f e3 bb3 - d5 c4eb4) (-s)
           (s db3 f - s. g5 -t) (s gb4f5 p)
           (-t a3 mp ab3 mf -s. t db5f5 f c4 -) (s e3e4 p)
           (-t s. d2 f -s ab5 mf) (-s)
           (t gb4a4 p g3 mp - b2 f e3 bb3 e3 a3 eb4 - g5 mf f4ab4 mp)
           (-s) (s f2 f - s. c6 -t) (s b2bb3 p)
           (-s t db5 mp -s. t gb5bb5 f4 f -) (t a3 f ab2 - ab2 a3)
           (-t f4 f gb5bb5 mf) (-t a3 mp d4ab4 c4 p bb5db6 mf)
           (-t b2 f3 b2 -) (t bb5db6 c5 f d4ab4 a3 p)
           (-s) (t b4eb5 p bb3 -)
           (t d4 p db3 - db3 d4) (-t bb3 p b4eb5)
           (-s) (-s eb5 p bb3b4 -) (-s)
           (e d4db5 p -s c5) (-s)
           (e c5 p -s d4db5) (-s)
           (-s bb3b4 p eb5 -) (-s)
           (-s ab3g4 p e4 mf) (-s c4gb4b4 f5)
           (-s db5 mp bb3a4) (-s)
           (-s eb4d5 p gb4) (-s e4 p f3g4)
           (-s b3 p a2bb3) (-s c5db6 pp ab5)
           (-s) (-s e5eb6 p g5 c4f4b4 p> gb4)
           (-s) (-e) (e d5ab5db6 pp)))
Opusmodus                                              recurring-analysis   2

Pitch search:

(recurring-analysis :pitch rh
                    :name "Webern, Variationen für Klavier Op.27, I,
rh")
--------------------------------------------------------------
Score: Webern, Variationen für Klavier Op.27, I, rh
--------------------------------------------------------------
Frequently recurring series:
Found: 5 (gb4 f5)

Longest recurring series:
Found: 2 (c4 d5 eb4 db5 f4 e5 gb4 f5 a5 d4 ab4 db5 bb4 a5 gb4 f5)
--------------------------------------------------------------

Interval search:

(recurring-analysis :interval rh
                    :name "Webern, Variationen für Klavier Op.27, I,
rh")
--------------------------------------------------------------
Score: Webern, Variationen für Klavier Op.27, I, rh
--------------------------------------------------------------
Frequently recurring series:
Found: 6 (5 6)

Longest recurring series:
Found: 2 (14 -11 10 -8 11 -10 11 4 -19 6 5 -3 11 -15 11)
--------------------------------------------------------------

Length search:

(recurring-analysis :length rh
                    :name "Webern, Variationen für Klavier Op.27, I,
rh")
--------------------------------------------------------------
Score: Webern, Variationen für Klavier Op.27, I, rh
--------------------------------------------------------------
Frequently recurring series:
Found: 29 (s -)

Longest recurring series:
Found: 2 (s - = = - = = - - = = - = = - = = - = = -)
--------------------------------------------------------------
Opusmodus                                              recurring-analysis   3

Velocity search:

(recurring-analysis
 :velocity rh
 :name "Webern, Variationen für Klavier Op.27, I, rh")
--------------------------------------------------------------
Score: Webern, Variationen für Klavier Op.27, I, rh
--------------------------------------------------------------
Frequently recurring series:
Found: 18 (p =)

Longest recurring series:
Found: 2 (mp f = = = = = mf mp)
Found: 2 (p = = = = = = = =)
--------------------------------------------------------------

Values search:

(setf population (gen-population 16 3 7 :seed 453))
(setf pitches (vector-to-pitch '(0 24) population))

(recurring-analysis :values pitches)
--------------------------------------------------------------
Frequently recurring series:
Found: 5 (c6 c4)

Longest recurring series:
Found: 2 (gs5 c6)
Found: 2 (fs5 c4)
Found: 3 (c4 e4)
Found: 2 (e4 c6)
Found: 2 (c6 gs5)
Found: 5 (c6 c4)
Found: 2 (cs4 c6)
Found: 4 (c4 c6)
Found: 2 (c4 cs4)
Found: 2 (bb4 c4)
Found: 2 (c6 c6)
--------------------------------------------------------------

(recurring-analysis :values (modus pitches) :name "Modus")
--------------------------------------------------------------
Score: Modus
--------------------------------------------------------------
Frequently recurring series:
Found: 11 (0 0)

Longest recurring series:
Found: 2 (0 4 0 1)
--------------------------------------------------------------
