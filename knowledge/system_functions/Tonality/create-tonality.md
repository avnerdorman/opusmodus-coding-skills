Opusmodus                                                             create-tonality   1

create-tonality name row
[Macro]

Arguments and Values:
name                      a tonality name.
row                       a list of pitches of integers.


Description:

The function CREATE-TONALITY can be used to de ne tonalities in terms of either pitches
or integers.

(create-tonality whole-tone '(0 2 4 6 8 10))

Tonalities can then be 'mapped' onto existing pitch data using the TONALITY-MAP function.
This means tonalities may be invented through algorithmic means.


Examples:

Tonalities can also be created using pitch values:

(create-tonality whole-tone2 '(c4 d4 e4 gb4 ab4 bb4))

(tonality-map '(whole-tone2 :root d3)
              '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4))
=> (d3 d3 e3 e3 fs3 fs3 gs3 gs3 bb3 c4 c4 c4)

Tonalities can also span more than an octave:

(create-tonality whole-tones3
                '(c4 d4 e4 gb4 ab4 bb4 b4 cs5 ds5 f5 g5 a5))

(tonality-map '(whole-tones3 :root c4)
              '(c4 d4 cs4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4))
=> (c4 d4 cs4 eb4 e4 f4 fs4 g4 gs4 a4 bb4 b4)

Tonalities can then be 'mapped' onto existing pitch data using the TONALITY-MAP function.
This means tonalities may be invented through algorithmic means. In an example from
Fifteen Images for solo piano by Nigel Morgan 15 tonalities are generated from computer-
improvised chords formed in each hand and then mixed.
                                                      fi
Opusmodus                                                 create-tonality   2

(setf rh
      (chordize
       (gen-loop
         15 (rnd-sample (rndn 1 2 4)
             (expand-tonality '(c4 chromatic))))))

(setf lh
      (chordize
       (gen-loop
         15 (rnd-sample (rndn 1 2 4)
             (gen-retrograde (expand-tonality '(c4 chromatic)))))))

(setf lh-rh-mix
      (sort-asc
       (pitch-melodize
        (chord-pitch-unique
         (gen-divide 2
          (flatten (gen-combine lh (pitch-transpose 12 rh))))))))
=> ((cs4 a4 d5 f5 bb5 b5) (c4 cs4 gs4 d5 bb5) (c4 gs4 eb5 bb5 b5)
    (d4 gs4 a4 eb5 b5) (d4 gs4 a4 d5 eb5 a5) (d4 a4 d5 eb5 a5)
    (d4 as4 b4 d5 a5) (as4 b4 c5 cs5 a5) (cs4 as4 b4 c5 cs5)
    (cs4 b4 c5 cs5 bb5) (cs4 a4 c5 bb5) (cs4 a4 d5 bb5)
    (d4 a4 d5 bb5) (c4 d4 ds4 b4 d5 a5) (c4 ds4 b4 c5 gs5 a5 b5))
