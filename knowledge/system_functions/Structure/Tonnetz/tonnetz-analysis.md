Opusmodus                                                                 tonnetz-analysis      1

tonnetz-analysis chords
[Function]

Arguments and Values:
chords                    list of chords.


Description:

This function returns a list of symbols (P, R, L or combination LPL etc..) obtained by
analysis of the relation exchanges between chords in a give chord sequence.

The principal transformations of neo-Riemannian triadic theory connect triads (major and
minor), and are their own inverses (a second application undoes the rst). These
transformations are purely harmonic, and do not need any particular voice leading between
chords: all instances of motion from a C major to a C minor triad represent the same neo-
Riemannian transformation, no matter how the voices are distributed in register.

The three transformations move one of the three notes of the triad to produce a different
triad:

The P transformation exchanges a triad for its Parallel. In a Major Triad move the third down
a semitone (C major to C minor), in a Minor Triad move the third up a semitone (C minor to
C major)

The R transformation exchanges a triad for its Relative. In a Major Triad move the fth up a
tone (C major to A minor), in a Minor Triad move the root down a tone (A minor to C major)

The L transformation exchanges a triad for its Leading-Tone Exchange. In a Major Triad the
root moves down by a semitone (C major to E minor), in a Minor Triad the fth moves up by
a semitone (E minor to C major).

Observe that P preserves the perfect fth interval (so given say C and G there are only two
candidates for the third note: E and Eb), L preserves the minor third interval (given E and G
our candidates are C and B) and R preserves the major third interval (given C and E our
candidates are G and A).
                                fi
                                                              fi
                                                                     fi
                                                                             fi
Opusmodus                                                                 tonnetz-analysis      2

Secondary operations can be constructed by combining these basic operations:

The N (or Nebenverwandt) relation exchanges a major triad for its minor subdominant, and a
minor triad for its major dominant (C major and F minor). The N transformation can be
obtained by applying R, L, and P successively.

The S (or Slide) relation exchanges two triads that share a third (C major and Cs minor); it
can be obtained by applying L, P, and R successively in that order.

The H relation (LPL) exchanges a triad for its hexatonic pole (C major and Ab minor)
Any combination of the L, P, and R transformations will act inversely on major and minor
triads: for instance, R-then-P transposes C major down a minor third, to A major via A minor,
whilst transposing C minor to Eb minor up a minor 3rd via Eb major.

Neo-Riemannian transformations can be modelled with several interrelated geometric
structures. The Riemannian Tonnetz (‘tonal grid’, shown below) is a planar array of pitches
along three simplicial axes, corresponding to the three consonant intervals. Major and minor
triads are represented by triangles which tile the plane of the Tonnetz. Edge-adjacent triads
share two common pitches, and so the principal transformations are expressed as minimal
motion of the Tonnetz.
     Opusmodus                                                      tonnetz-analysis   3

     One step transformation (basic transformations):

     P     (parallel)
     R     (relative)
     L     (leading)

     Secondary One step transformation (combine transformations):

     N     (RLP)
     S     (LPR)
     H     (LPL)

     Two step transformations:

     Parallel: PR and PL
     Relative: RL and RP
     Leading: LR and LP

     Three step transformations:

     Parallel: PLR and PRL
     Relative: RLP and RPL
     Leading: LPR and LRP

     Re ection:

     PLR and RLP are equal.
     PRL and LRP are equal.
     RPL and LPR are equal.
fl
Opusmodus                                                tonnetz-analysis   4

Examples:
(setf chords (tonnetz 'c4e4g4 '(p p r r l l)))
=> (c4e4g4 c4eb4g4 c4e4g4 c4e4a4 c4e4g4 b3e4g4 c4e4g4)

(tonnetz-analysis chords)
=> (p p r r l l)

(tonnetz-analysis '(e4g4b4 e4g4c5 e4a4c5 f4a4c5 f4a4d5 fs4a4d5
                    fs4a4cs5 e4a4cs5 e4gs4cs5 e4gs4b4 e4g4b4))
=> (l r l r p l r l r p)

(tonnetz-analysis '(ab3c4eb4 gs3b3eb4 gs3b3e4 g3b3e4
                     g3c4e4 g3c4eb4 gs3c4eb4 gs3b3eb4 gs3b3e4))
=> (p l p l p l p l)

(tonnetz-analysis '(ab3c4eb4 gs3b3e4 g3c4e4 gs3c4eb4 gs3b3e4))
=> (pl pl pl pl)

(tonnetz-analysis '(ab4b4eb5 gs4c5eb5 gs4cs5e5 a4cs5e5
                    bb4cs5f5 bb4cs5fs5 b4d5fs5))
=> (p rlp l rpl l rlp)

(tonnetz-analysis '(c4e4g4 cs4e4a4 d4fs4a4 eb4fs4bb4 eb4g4c5 f4a4c5
                    e4g4c5 e4a4c5 e4a4cs5 f4a4d5 fs4a4cs5 f4a4d5
f4bb4d5))
=> (rp rl rpl pr prl lr r p plr pl lp l)

The '? symbol means no relation exchange found:

(tonnetz-analysis '(c4e4g4 c4eb4g4 cs4e4g4 c4e4a4 c4e4g4 b3e4g4 c4e4g4))
=> (p ? ? r l l)


Relevant Functions
---------------------------------------------------------
TONNETZ
TONNETZ-STRUCTURE

Relevant Examples
---------------------------------------------------------
Documentation/3. How-to/Tonnetz/
