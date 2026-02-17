Opusmodus                                                                                     tonnetz   1

tonnetz chord transition %key net join step rotate transpose ambitus
[Function]

Arguments and Values:
chord                     a chord or pitch list (intervalic content, one of 12 Tonnetz numbers).
transition                list of transition names: p, r, l, n, s, h and 0 (repeat).
net                       an integer. Tonnetz net label: 1 to 12.
join                      0 (a transition) or 1 (a joined transition).
step                      a list of integers. Number of axis steps: 0 (no change), 1 (1 step up),
                          -1 (1 step down) etc…
rotate                    a list of integers. Chordal rotation based on a rotate-number value.
transpose                 a list of integers (transposition value).
ambitus                   instrument name or an integer or a pitch list (low high).
                          The default is 'piano.


Description:

The principal transformations of neo-Riemannian triadic theory connect triads (major and
minor), and are their own inverses (a second application undoes the rst). These
transformations are purely harmonic, and do not need any particular voice leading between
chords: all instances of motion from a C major to a C minor triad represent the same neo-
Riemannian transformation, no matter how the voices are distributed in register.

The three transformations move one of the three notes of the triad to produce a different
triad:

The P transformation exchanges a triad for its Parallel. In a Major Triad move the third down
a semitone (C major to C minor), in a Minor Triad move the third up a semitone (C minor to
C major).

The R transformation exchanges a triad for its Relative. In a Major Triad move the fth up a
tone (C major to A minor), in a Minor Triad move the root down a tone (A minor to C major).

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
Opusmodus                                                                           tonnetz    2

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
structures. The Riemannian Tonnetz (‘tonal space’, shown below) is a planar array of pitches
along three simplicial axes, corresponding to the three consonant intervals. Major and minor
triads are represented by triangles which tile the plane of the Tonnetz. Edge-adjacent triads
share two common pitches, and so the principal transformations are expressed as minimal
motion of the Tonnetz.
     Opusmodus                                                                    tonnetz   3

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

     Basic examples with default Tonnetz 11 (as above). The result of a TONNETZ process is a
     list of chords or a lists of pitches equal to a length of :transition values.

     (tonnetz '(c4e4g4) '(p p r r l l))
     => (c4eb4g4 c4e4g4 c4e4a4 c4e4g4 b3e4g4 c4e4g4)

     A :start list containing pitches will return melodic lists:

     (tonnetz '(c4 e4 g4) '(p p r r l l))
     => ((c4 eb4 g4) (c4 e4 g4) (c4 e4 a4)
         (c4 e4 g4) (b3 e4 g4) (c4 e4 g4))

     (tonnetz '(e4g4b4) '(l r l r p l r l r p))
     => (e4g4c5 e4a4c5 f4a4c5 f4a4d5 fs4a4d5 fs4a4cs5
         e4a4cs5 e4gs4cs5 e4gs4b4 e4g4b4)
fl
Opusmodus                                                                           tonnetz      4

(tonnetz '(ab3c4eb4) '(p l p l p l p l))
=> (gs3b3eb4 gs3b3e4 g3b3e4 g3c4e4
    g3c4eb4 gs3c4eb4 gs3b3eb4 gs3b3e4)

(tonnetz '(ab3c4eb4) '(pl pl pl pl))
=> (gs3b3e4 g3c4e4 gs3c4eb4 gs3b3e4)

(tonnetz '(ab4b4eb5) '(p n l s l n))
=> (gs4c5eb5 gs4cs5e5 a4cs5e5 bb4cs5f5 bb4cs5fs5 b4d5fs5)

(tonnetz '(c4e4g4) '(plp rpr lpl rpr lpl lpl rprp lpl))
=> (b3eb4gs4 a3d4fs4 bb3cs4f4 gs3b3e4 g3c4eb4 gs3b3e4 bb3d4f4 a3cs4fs4)


12 Tonnetz structures

In Opusmodus there are 12 Tonnetz structures labelled by a number and by an intervallic
content of the composite chord. The intervallic content is a number of semitones associated
with the different interval axis. As you will notice each of the intervallic content sum up to
12:

1 (1 1 10)
2 (1 2 9)
3 (1 3 8)
4 (1 4 7)
5 (1 5 6)
6 (2 2 8)
7 (2 3 7)
8 (2 4 6)
9 (2 5 5)
10 (3 3 6)
11 (3 4 5)
12 (4 4 4)

In musical tuning and harmony, the Tonnetz (German: tone-network) is a conceptual
lattice diagram representing tonal space (net) rst described by Leonhard Euler in 1739.
Various visual representations of the Tonnetz can be used to show traditional harmonic
relationships in European classical music.
                                        fi
Opusmodus                                                            tonnetz   5

Diagrams of 12 possible intervallic contents in a chromatic scale:
Opusmodus   tonnetz   6
Opusmodus   tonnetz   7
Opusmodus   tonnetz   8
Opusmodus   tonnetz   9
Opusmodus   tonnetz   10
Opusmodus                                                                       tonnetz   11

Examples:

With :transition value 0 (zero) we de ne a repeat of the previous :transition:

(tonnetz '(c4e4g4) '(0 0 l 0 r 0 p 0))
=> (c4e4g4 c4e4g4 b3e4g4 b3e4g4 b3d4g4 b3d4g4 bb3d4g4 bb3d4g4)

In this example we apply :transition successively with the result of the
last :transition in the sequence:

(tonnetz '(c4e4g4) '(0l 0rl 0lr 0pl 0rl 0rl 0lr 0lr))
=> (b3e4g4 b3d4fs4 b3e4g4 b3eb4gs4 bb3eb4fs4 bb3cs4f4 bb3eb4fs4
b3eb4gs4)

With :join value 1 we chordize the successive :transition to a chord:

(tonnetz '(c4e4g4) '(0l 0rl 0lr 0pl 0rl 0rl 0lr 0lr) :join 1)
=> (b3c4e4g4 b3d4e4fs4g4 b3d4e4fs4g4 b3eb4e4g4gs4
    bb3b3eb4fs4gs4 bb3cs4eb4f4fs4 bb3cs4eb4f4fs4 bb3b3eb4fs4gs4)

(tonnetz '(c4e4g4) '(0l 0rl 0lr 0pl 0rl 0rl 0lr 0lr)
         :join '(1 0 1 0 1 0 1 0))
=> (b3c4e4g4 b3d4fs4 b3d4e4fs4g4 b3eb4gs4
    bb3b3eb4fs4gs4 bb3cs4f4 bb3cs4eb4f4fs4 b3eb4gs4)

:transition :transposition:

(tonnetz '(c4e4g4) '(0l 0rl 0lr 0pl 0rl 0rl 0lr 0lr)
         :join '(1 0 1 0 1 0 1 0)
         :transpose '(0 12))
=> (b3c4e4g4 b4d5fs5 b3d4e4fs4g4 b4eb5gs5
    bb3b3eb4fs4gs4 bb4cs5f5 bb3cs4eb4f4fs4 b4eb5gs5)

The :step value 1 will move the next :transition one step up on the axis of the rst
interval of the last :transition:

(tonnetz '(c4e4g4) '(0l 0rl 0lr 0pl 0rl 0rl 0lr 0lr)
         :join '(1 0 1 0 1 0 1 0)
         :transpose '(0 12)
         :step '(1 0 1 0 1 0 1 0))
=> (d4eb4g4bb4 d5f5a5 f4gs4bb4c5cs5 f5a5d6
    g4gs4c5eb5f5 g5bb5d6 bb4cs5eb5f5fs5 b5eb6gs6)
                                  fi
                                                                           fi
Opusmodus                                                             tonnetz   12

The :rotate value is a chordal rotation step number:

(tonnetz '(c4e4g4) '(0l 0rl 0lr 0pl 0rl 0rl 0lr 0lr)
         :join '(1 0 1 0 1 0 1 0)
         :transpose '(0 12)
         :step '(1 0 1 0 1 0 1 0)
         :rotate '(2 0 2 0 2 0 2 0))
=> (g4bb4d5eb5 d5f5a5 bb4c5cs5f5gs5 f5a5d6
    c5eb5f5g5gs5 g5bb5d6 eb5f5fs5bb5cs6 b5eb6gs6)

(tonnetz '(c4e4g4) '(0l 0rl 0lr 0pl 0rl 0rl 0lr 0lr)
         :net '(11 8 12)
         :join 1
         :transpose '(0 12)
         :step '(1 0 1 0 1 0 1 0))
=> (d4eb4g4bb4 d5e5gs5bb5 fs4bb4d5 f5fs5a5bb5cs6
    g4a4cs5eb5 g5b5eb6 bb4cs5eb5f5fs5 bb5c6e6fs6bb6)

(tonnetz '(c4e4g4) '(p lrp n h s plrpr n s)
         :net '(11 8 12)
         :join 1
         :transpose '(0 6 -6)
         :step '(1 0 1 0 1 0 1 0))
=> (eb4fs4bb4 a4b4eb5f5g5 cs4f4a4 fs4g4bb4b4eb5
    d5e5fs5bb5c6 e4gs4c5 b4c5eb5e5gs5 fs5gs5bb5c6e6)

(tonnetz '(fs4bb4cs5) '(p lrp n h s plrpr n s)
         :net '(11 8 12)
         :join 1
         :transpose '(0 6 -6)
         :step '(1 -2 1 -2 1 -2 1 -2))
=> (a4c5e5 b4cs5f5g5a5 eb4g4b4 d4eb4fs4g4b4
    bb4c5d5fs5gs5 e3gs3c4 b3c4eb4e4gs4 d4e4fs4gs4c5)

In the next example we use all 12 Tonnetz with a :transition variable (0n). A
(0n):transition contains a 0 (repeat) and a n (rlp) successive :transition. The
alternative writing to (0n)variable is (0rlp).

(tonnetz '(c4e4g4) '(0n 0n 0n 0n 0n 0n 0n 0n 0n 0n 0n 0n)
         :net '(1 2 3 4 5 6 7 8 9 10 11 12)
         :join 1
         :step '(1 0 1 0 1 0 1 0))
=> (e3cs4d4eb4 f3fs3g3cs4d4e4 g3gs3c4cs4eb4e4 fs3a3bb3c4cs4f4
    bb3b3c4e4f4 f3b3cs4eb4 gs3a3b3cs4eb4fs4 a3b3cs4eb4f4
    bb3cs4eb4gs4 bb3cs4e4g4 d4eb4e4fs4g4b4 eb4g4b4)
Opusmodus                                                                  tonnetz   13

Preview Score examples:

In the following example we use Tonnetz 11 with the intervallic content (3 4 5) of
minor third, major third and perfect fourth. The :join value 1 will :join
the :transition sequence to a chord size 4 and 5:

(setf length '(w h = - q = = = = = w = -q = = = = h =
               q = = h = -q = = = w -q = = = h = w =))
(setf velocity (gen-prob 64 '((p .4) (mp .6) (mf .2))))

(setf tt1 (tonnetz '(c4e4g4) (rnd-sample 32 '(0l 0rl 0lr) :seed 90198)
                    :join 1
                    :rotate (rnd-sample 32 '(0 -1 1) :seed 431458)))

(setf omn1 (make-omn :length length :pitch tt1 :velocity velocity))

(ps 'gm :pg (list omn1) :time-signature '(4 4) :tempo 88)
Opusmodus                                                                    tonnetz   14

To examine the intervalic content of three Tonnetz used in the following two examples we
run the TONNETZ-STRUCTURE function:

(tonnetz-structure '(7 8 12))
=> ((2 3 7) (2 4 6) (4 4 4))

Names:
(get-interval-name (tonnetz-structure '(7 8 12)))
=> ((major-second minor-third perfect-fifth)
    (major-second major-third tritone)
    (major-third major-third major-third))

(progn
  (init-seed 7654)
  (setf tt2 (tonnetz '(c4eb4g4) (rnd-sample 32 '(0l 0rl 0lr))
                     :net (rnd-sample 32 '(7 8 12))
                     :step (rnd-sample 32 '(0 1))
                     :transpose (rnd-sample 32 '(12 -6 6))))

  (setf omn2 (make-omn :length length :pitch tt2 :velocity velocity))
  (ps 'gm :pg (list (relative-closest-path omn2 :unique t))
      :time-signature '(4 4) :tempo 88)

  (init-seed nil)
  )
Opusmodus                                                       tonnetz   15

Tonnetz content:

(tonnetz-structure '(1 2 3))
=> ((1 1 10) (1 2 9) (1 3 8))

(get-interval-name (tonnetz-structure '(1 2 3)))
=> ((minor-second minor-second minor-seventh)
    (minor-second major-second major-sixth)
    (minor-second minor-third minor-sixth))

Preview:

(progn
  (init-seed 47)
  (setf tt3 (tonnetz '(c4eb4g4)
                     (rnd-sample 32 '(p l r lr lp rp rl pr pl
                                      plr rpl pr lrp lpr pp))
                     :join 1
                     :net (rnd-sample 32 '(1 2 3))
                     :step (rnd-sample 32 '(0 1 2 -2))
                     :rotate (rnd-sample 32 '(0 1 -1))))

  (setf omn3 (make-omn :length length :pitch tt3 :velocity velocity))
  (ps 'gm :pg (list (relative-closest-path omn3 :unique t))
      :time-signature '(4 4) :tempo 88)
  (init-seed nil)
  )
Opusmodus                                                   tonnetz   16




Relevant Functions
---------------------------------------------------------
TONNETZ-STRUCTURE

Relevant Examples
---------------------------------------------------------
Documentation/3. How-to/Tonnetz/
