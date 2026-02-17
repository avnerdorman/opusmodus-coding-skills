Opusmodus                                                             check-tone-lakes-symmetry   1

check-tone-lakes-symmetry lake root serie-length
[Function]

Arguments and Values:
lake                             List. A tone-lake.
root                             List. The roots for the tone-lake to be tested.
series-length                    Integer. The length of the series making up the tone-lake.


Description:

To qualify as a ‘real’ Tone Lake, certain symmetrical properties must be present. The second
half of the lake should be a mirror image of the rst half. Additionally, there are four smaller
mirror segments. To achieve this, both the list of root and the tonality must be
symmetrical. The pattern should either be (p i ri r) or (i p r ri).

While it is possible to generate material that may not be a ‘real’ Tone Lake, such variations
can still be intriguing. The TONE-LAKES function accepts series of odd lengths—such as 3,
5, 7, and so on—and the number of series should be a power of two (e.g., 2, 4, 8, 16). If you
wish to use other lengths or a non-power-of-two number of series, you can disable warnings
by setting the keyword to NIL. This function verify whether your con guration in the
TONE-LAKES function quali es as a real Tone Lake.


Examples:

First lake with 4 3-series:

(setf root1 '(g5 eb3 a3 cs5))
(setf lake1 (tone-lakes 12 '(0 -14 -7) nil root1 'chromatic
                        '(p i ri r) :first-interval t
                        :iambitus '(c2 b6) :printp t))
=> (g5 a3 bb3 b3 f4 e4 eb3 cs5 c5 b4 f4 fs4)

(check-tone-lakes-symmetry lake1 root1 3)
=> Midway symmetry: true
   four mirrors: true
   This is a Tone Lake
                        fi
                                            fi
                                                                      fi
Opusmodus                                                      check-tone-lakes-symmetry   2

However, if we change the pitch of the root cs5 to c5 the symmetry will be lost:

(setf root2 '(g5 eb3 a3 c5))
(setf lake2 (tone-lakes 12 '(0 -14 -7) nil root2 'chromatic
                        '(p i ri r) :first-interval t
                        :iambitus '(c2 b6) :printp t))
=> (g5 a3 bb3 bb3 f4 e4 eb3 c5 c5 b4 f4 f4)

(check-tone-lakes-symmetry lake2 root2 3)
=> Midway symmetry: false
   four mirrors: false
   This is a Fake Lake

If we also lower the rst pitch from g5 to gb5 we gain the symmetry again:

(setf root3 '(gb5 eb3 a3 c5))
(setf lake3 (tone-lakes 12 '(0 -14 -7) nil root3 'chromatic
                        '(p i ri r) :first-interval t
                        :iambitus '(c2 b6) :printp t))
=> (fs5 a3 bb3 bb3 e4 e4 eb3 c5 b4 b4 f4 f4)

(check-tone-lakes-symmetry lake3 root3 3)
=> Midway symmetry: true
   four mirrors: true
   This is a Tone Lake

If we generate the second tone-lake but with a major scale, we lost the symmetry again:

(setf lake4 (tone-lakes 36 '(0 -14 -7) nil root2 'major
                        '(i p r ri) :first-interval t
                        :iambitus '(c2 b6) :printp t))
=> (g5 c3 eb5 a3 g2 c4 eb4 a6 g6 c3 eb5 a5 g3 c6 eb6 a4 g4 c2
    eb3 a5 g3 c5 eb6 e3 g4 c2 eb2 a5 g3 c3 eb5 a2 g2 c4 bb2 a6)

(check-tone-lakes-symmetry lake4 root2 3)
=> Midway symmetry: false
   four mirrors: false
   This is a Fake Lake
              fi
Opusmodus                                                  check-tone-lakes-symmetry   3

Same thing if we change the pattern so that it doesn't have symmetry:

(setf lake5 (tone-lakes 36 '(0 -14 -7) nil root1 'chromatic
                        '(i p r p) :first-interval t
                        :iambitus '(c2 b6) :printp t))
=> (g5 gs2 fs6 a3 a6 eb3 bb3 g2 d6 g5 fs6 c2 f4 eb3 cs2 e4 b2
    bb3 eb3 c2 e2 c5 cs2 f6 c5 bb3 gs2 b4 e2 f4 f4 d3 a6 d6 b5 g2)

(check-tone-lakes-symmetry lake5 root1 3)
=> Midway symmetry: false
   four mirrors: false
   This is a Fake Lake
