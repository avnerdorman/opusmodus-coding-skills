Opusmodus                                                                        klangreihen      1

klangreihen ambitus group row &key type sort chord
[Function]

Arguments and Values:
ambitus                   an integer or pitch symbol.
group                     integer list with sum 12.
row                       integer or pitch set (12 tone).
type                      result in :pitch or :integer. The default in :pitch
sort                      NIL or T. The default is NIL.
chord                     NIL or T. The default is NIL.


Description:

»Klangreihen technique« is a way to harmonise a twelve-tone row in dependence on its
intrinsic interval relations. A Klangreihe is a series of sonorities using a twelve-tone row as
its basis. The progressions inside a Klangreihe usually are non-tonal with regard to the
harmonic relations. Nevertheless, the auditory impression usually is mildly dissonant and
»logic«, but can also be oating due to the lack of tonal gravity.

A Klangreihe can be understood as a matrix of pitch relations that is both vertical (sonorities)
and horizontal (harmonic progression; melody). Klangreihen theory comprises several
different methods to harmonise a twelve-tone row. The standard method – named by the code
[3-3-3-3] – has been developed by Josef Matthias Hauer in 1926.

The twelve pitches are divided into chromatic groups called »voice layers«. A [3-3-3-3] -
setup of voice layers means that we use four groups with three chromatic notes each (the
layers are notated and read in an ascending order):

Voice layer [3-3-3-3]:
((c cs d) (ds e f) (fs g gs) (a as b))

This voice layer is being imposed over the twelve-tone row in the way that any pitch in a
voice layer is sustained as long until it can be replaced by another (twelve-tone row’s) pitch
that is the same layer:

Example row: (f b gs fs c g e as cs ds a d)
Voice layers: ((c cs d) (ds e f) (fs g gs) (a as b))
                  fl
Opusmodus                                                                       klangreihen      2




The above example demonstrates that the rst pitch (f) appears six times until it is replaced
by (e). In order to get full 4-part sonorities at the beginning at the Klangreihe, we can take
the Klangreihe’s last pitches for the beginning (white circles). This will enable us to freely
repeat and rotate the resulting Klangreihe.

Result:

((d f g a) (d f g b) (d f gs b) (d f fs b)
 (c f fs b) (c f g b) (c e g b) (c e g as)
 (cs e g as) (cs ds g as) (cs ds g a) (d ds g a))
                                    fi
Opusmodus                                                                      klangreihen   3

Different setups of the voice layers result in different Klangreihen:

Voice layer (3 3 3 3):
((c cs d) (ds e f) (fs g gs) (a as b)) – Row ambitus: c ... b
((cs d ds) (e f fs) (g gs a) (as b c)) – Row ambitus: cs ... c
((d ds e) (f fs g) (gs a as) (b c cs)) – Row ambitus: d ... cs

(klangreihen 0 '(3 3 3 3) '(f b gs fs c g e as cs ds a d))
=> ((f4 d4 a4 g4) (f4 d4 b4 g4) (f4 d4 b4 gs4) (f4 d4 b4 fs4)
    (f4 c4 b4 fs4) (f4 c4 b4 g4) (e4 c4 b4 g4) (e4 c4 as4 g4)
    (e4 cs4 as4 g4) (ds4 cs4 as4 g4) (ds4 cs4 a4 g4) (ds4 d4 a4 g4))


Voice layer (3 4 2 3):
((c-cs-d) (ds-e-f-fs) (g-gs) (a-as-b)) – Row ambitus: c ... b

(klangreihen 0 '(3 4 2 3) '(f b gs fs c g e as cs ds a d))
=> ((f4 d4 a4 g4) (f4 d4 b4 g4) (f4 d4 b4 gs4) (fs4 d4 b4 gs4)
    (fs4 c4 b4 gs4) (fs4 c4 b4 g4) (e4 c4 b4 g4) (e4 c4 as4 g4)
    (e4 cs4 as4 g4) (ds4 cs4 as4 g4) (ds4 cs4 a4 g4) (ds4 d4 a4 g4))


((e-f-fs) (g-gs-a-as) (b-c) (cs-d-ds)) – Row ambitus: e ... ds

(klangreihen 4 '(3 4 2 3) '(f b gs fs c g e as cs ds a d))
=> ((f4 d4 a4 c4) (f4 d4 a4 b4) (f4 d4 gs4 b4) (fs4 d4 gs4 b4)
    (fs4 d4 gs4 c4) (fs4 d4 g4 c4) (e4 d4 g4 c4) (e4 d4 as4 c4)
    (e4 cs4 as4 c4) (e4 ds4 as4 c4) (e4 ds4 a4 c4) (e4 d4 a4 c4))


Voice layer (4 2 2 4):
((f-fs-g-gs) (a-as) (b-c) (cs-d-ds-e)) – Row ambitus: f ... e

(klangreihen 5 '(4 2 2 4) '(f b gs fs c g e as cs ds a d))
=> ((f4 d4 a4 c4) (f4 d4 a4 b4) (gs4 d4 a4 b4) (fs4 d4 a4 b4)
    (fs4 d4 a4 c4) (g4 d4 a4 c4) (g4 e4 a4 c4) (g4 e4 as4 c4)
    (g4 cs4 as4 c4) (g4 ds4 as4 c4) (g4 ds4 a4 c4) (g4 d4 a4 c4))

Note: If applied to the given row, this setup will lead to a symmetric Klangreihe.

Voice layer (3 2 3 2 2):
((d-ds-e) (f-fs) (g-gs-a) (as-b) (c-cs)) – Row ambitus: d ... cs

(klangreihen 2 '(3 2 3 2 2) '(f b gs fs c g e as cs ds a d))
=> ((f4 d4 a4 cs4 as4) (f4 d4 a4 cs4 b4) (f4 d4 gs4 cs4 b4)
    (fs4 d4 gs4 cs4 b4) (fs4 d4 gs4 c4 b4) (fs4 d4 g4 c4 b4)
    (fs4 e4 g4 c4 b4) (fs4 e4 g4 c4 as4) (fs4 e4 g4 cs4 as4)
    (fs4 ds4 g4 cs4 as4) (fs4 ds4 a4 cs4 as4) (fs4 d4 a4 cs4 as4))
Opusmodus                                                                              klangreihen   4

Voice layer (5 3 4):
((fs-g-gs-a-as) (b-c-cs) (d-ds-e-f)) – Row ambitus: fs ... f

(klangreihen 6 '(5 4 3) '(f b gs fs c g e as cs ds a d))
=> ((f4 d4 a4) (f4 b4 a4) (f4 b4 gs4) (f4 b4 fs4)
    (f4 c4 fs4) (f4 c4 g4) (e4 c4 g4) (e4 c4 as4)
    (e4 cs4 as4) (ds4 cs4 as4) (ds4 cs4 a4) (ds4 d4 a4))

When composing with Klangreihen, one can apply given setups of voice layers (as
demonstrated above) or work freely with the technique of sustaining the twelve-tone row’s
pitches and let them proceed to other pitches (from the row) freely. Free Klangreihen
harmonisation without the use of given voice layers. Black circles depict the twelve-tone
row, white circles indicate sustained pitches:

With given ambitus:




Free ambitus:




        Further reading: Dominik Šedivý: Serial Composition and Tonality, Vienna 2011, p.25-30.
Opusmodus                                                                      klangreihen      5

Examples:

Exploring symmetry in tonality and harmonic structure was an important precursor of atonal
music composition begun by composers such as Liszt and Szymanowski. Here's an example:

(setf tonal-ex '(fs4a4cs5e5 fs4gs4b4d5 e4gs4b4cs5))
(setf mel-ex '(q a4 e e5 s fs5 e5 d5 cs5 e b4 d5 = q cs5 gs4))

The melody is 'made' from the rst three chords of the tonal-ex chord sequence.

(setf row-1 '(e g cs d bb c f a fs ds b gs))

In the examples below a row / pitch-set is given without octave indications. This is because
in KLANGREIHEN a pitch's position in the octave continuum does not matter. In the rst
example an interval set is made for each pitch of the row - 12 in all. These could be used to
make chords.

(setf k-sets-1 (klangreihen 1 '(3 3 3 3) row-1))
=> ((e4 gs4 b4 ds4) (e4 g4 b4 ds4) (e4 g4 b4 cs4)
    (e4 g4 b4 d4) (e4 g4 as4 d4) (e4 g4 c4 d4)
    (f4 g4 c4 d4) (f4 a4 c4 d4) (fs4 a4 c4 d4)
    (fs4 a4 c4 ds4) (fs4 a4 b4 ds4) (fs4 gs4 b4 ds4))

(setf chords (chordize k-sets-1))
=> ((e4gs4b4ds4) (e4g4b4ds4) (e4g4b4cs4)
    (e4g4b4d4) (e4g4as4d4) (e4g4c4d4)
    (f4g4c4d4) (f4a4c4d4) (fs4a4c4d4)
    (fs4a4c4ds4) (fs4a4b4ds4) (fs4gs4b4ds4))

(pitch-list-plot (flatten chords)
 :join-points nil :join-chords t)
                        fi
                                                                               fi
Opusmodus                                                                     klangreihen   6

These chords are remarkably similar to those made by the most schematic method of
producing a four-part Klangreihe sequence from a 12-note row - shown below. Notice the
difference between each of the chords above is a single pitch.

(setf chd-ex
        '(e4 e4g4 e4g4c5 e4g4c5db5 e4a4c5db5 fs4a4c5db5 fs4a4c5d5
          fs4a4bb4d5 f4a4bb4d5 f4a4b4d5 f4a4b4eb5 f4gs4b4eb5))

(klangreihen
 0 '(3 3 3 3) '(e4 g4 cs4 d4 bb4 c4 f4 a4 fs4 ds4 b4 gs4))
=> ((4 8 11 3) (4 7 11 3) (4 7 1 3)
    (4 7 1 2) (4 10 1 2) (4 0 1 2)
    (5 0 1 2) (9 0 1 2) (6 0 1 2)
    (6 0 3 2) (11 0 3 2) (8 0 3 2))

(klangreihen
 1 4 '(e4 g4 cs4 d4 bb4 c4 f4 a4 fs4 ds4 b4 gs4) :chord t)
=> (e4ab4b4eb4 e4g4b4eb4 e4g4db4eb4
    e4g4db4d4 e4bb4db4d4 e4bb4c4d4
    f4bb4c4d4 f4a4c4d4 gb4a4c4d4
    gb4a4c4eb4 gb4b4c4eb4 ab4b4c4eb4)

Notice above that chords can be created as part of the function, but without each being placed
in a list - something that CHORDIZE does automatically.

(klangreihen
 0 '(3 3 3 3) '(e4 g4 cs4 d4 bb4 c4 f4 a4 fs4 ds4 b4 gs4) :chord t)
=> (e4ab4b4eb4 e4g4b4eb4 e4g4b4db4
    d4g4b4db4 d4g4bb4db4 d4g4bb4c4
    d4f4bb4c4 d4f4a4c4 d4gb4a4c4
    eb4gb4a4c4 eb4gb4b4c4 eb4ab4b4c4)
