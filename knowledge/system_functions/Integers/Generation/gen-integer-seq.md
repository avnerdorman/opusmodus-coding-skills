Opusmodus                                                                gen-integer-seq   1

gen-integer-seq integers
[Function]

Arguments and Values:
integers                 a list of integers.


Description:

GEN-INTEGER-SEQ will generate a series of integers between any values that are
enclosed in brackets as a pair (<from> <to>).

(gen-integer-seq '(1 5 (6 10) 15 10))
=> (1 5 6 7 8 9 10 15 10)

(gen-integer-seq '(1 5 (10 6) 15 10))
=> (1 5 10 9 8 7 6 15 10)

(gen-integer-seq '((6 12) (18 32)))
=> (6 7 8 9 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32)

(gen-integer-seq '(0 2 (5 12) 16 (32 43)))
=> (0 2 5 6 7 8 9 10 11 12 16 32 33 34 35 36 37 38 39 40 41 42 43)

The use of integers as a building block for musical material is a fundamental aspect of
OPUSMODUS. At a symbolic level integers have a powerful characteristic for the composer.
Whereas pitch symbols are constrained by the octave, integers have no such constraints. This
enables the composer to think more speculatively about creating pitch material, particularly
beyond the con nes of the chromatic ascending octave. The musical alphabet is limited to
seven letters but integers are almost limitless!
         fi
Opusmodus                                                                 gen-integer-seq   2

Examples:

The two examples below show very simply how integer generation can ascend and descend.
Mapped to pitches this means that scales can be constructed having the qualities of the vakra
(crooked) ragas found in Indian music.

Here's a freely invented vakra raga:

(setf mukhari (gen-integer-seq '(0 (3 6) (7 2) 3 (5 8) (9 4) (5 7))))
=> (0 3 4 5 6 7 6 5 4 3 2 3 5 6 7 8 9 8 7 6 5 4 5 6 7)

(tonality-map '(mukhari :root eb4) (integer-to-pitch mukhari))
=> (eb4 fs4 g4 gs4 a4 bb4 a4 gs4 g4 fs4 f4 fs4
    gs4 a4 bb4 b4 c5 b4 bb4 a4 gs4 g4 gs4 a4 bb4)
