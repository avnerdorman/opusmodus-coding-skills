Opusmodus                                                                                    tone-lakes    1

tone-lakes size series start root tonality dir-pattern
                  &key first-interval scale-step method ambitus
                  imethod iambitus pattern follow warnings printp

[Function]

Arguments and Values:
size                      Integer. The total number of elements in the output sequence.
series                    List. The initial integer series used to generate the in nity-series.
start                     List or NIL. The start positions for the in nity-series that make up the lake.
                          If NIL the start positions will be generated automatically.
root                      List. A list of pitches for the in nity-series that make up the lake.
                          This argument determine how many in nity-series that make up the lake.
tonality                  List or Atom. Speci es the tonality or tonalities to be applied to the series.
dir-pattern               Describes how the series should be transformed (p for prime, i for
                          inverted, r for retrograde, ri for retrograde-inverted).
first-interval            Boolean. Unless pattern is supplied will generate the pattern for the in nity-
                          series. If true will use '(i p p), if false will use '(p i i).
                          Default is T.
scale-step                Determines the scale steps for each series (Default is 1).
method                    Atom. Type of transformation (tone-lakes): (wrap, octa, ratio, fold,
                          clip, ambi). Default is 'wrap.
ambitus                   List or Atom. Speci es the range of permissible pitch values (tone-lakes).
                          (type and ambitus are used at the end of the process).
                          Default is '(c0 b8).
imethod                   List or Atom. Type of transformation (in nity-series) (wrap, octa, ratio,
                          fold, clip, ambi). Default is 'wrap.
iambitus                  List or Atom. Speci es the range of permissible pitch values (in nity-series).
                          The itype and iambitus parameters are utilised when generating
                          infinite-series. Default is '(c0 b8).
pattern                   Describes how the series are generated (in nity-series): (p for prime and i
                          for inverted).
follow                    Atom. root and melody. Default is 'root.
warnings                  Boolean. Enables or disables warnings. Default is T. Setting the warnings
                          to NIL allows even numbered series and non power of two number of series.
printp                    Boolean. Debugging ag. If true, prints intermediary information
                          during execution. Default is T.


Description:

Per Nørgård is a Danish composer born in 1932 who has contributed signi cantly to
contemporary classical music. One of his notable contributions is the concept of “tone
lakes”, which is part of his unique approach to composition. In a ‘tone lake’, musical notes
are not organised in the usual linear fashion; instead, they are treated as elements of a pool or
lake, from which any can be drawn at any time. This approach encourages non-linear, more
                                      fi
                                      fi
                                      fi
                                           fl
                                                 fi
                                                         fi
                                                              fi
                                                                   fi
                                                                        fi
                                                                             fi
                                                                                  fi
                                                                                       fi
                                                                                            fi
Opusmodus                                                                          tone-lakes   2

organic development of musical material and can be thought of as a way to generate a
constantly varying, yet internally cohesive, texture.
The idea also re ects Nørgård's fascination with the notion of ‘in nite series’ and
mathematical constructs as they apply to music. ‘Tone lakes’ can be manipulated in various
ways to create evolving musical landscapes, which might involve drawing from multiple
‘lakes’ of tones, or applying certain processes or transformations to the ‘lake’ to generate new
material.

Understanding Nørgård's Tone Lakes may offer an interesting perspective, even for those
working in different programming or compositional paradigms, as it challenges conventional
wisdom about how musical material can be organised and developed.

This function builds upon the fundamental idea of Tone Lakes and extends it by
incorporating multiple other musical parameters such as tonality, ambitus, and
directions for series manipulation. Additionally, the function offers robustness and exibility
through its keyword parameters, allowing users to control speci c characteristics of the
generated sequence.

To qualify as a ‘real’ Tone Lake, certain symmetrical properties must be present. The second
half of the lake should be a mirror image of the rst half. Additionally, there are four smaller
mirror segments. To achieve this, both the list of root and the tonality must be
symmetrical. The pattern should either be (p i ri r) or (i p r ri).

While it is possible to generate material that may not be a ‘real’ Tone Lake, such variations
can still be intriguing. The TONE-LAKES function accepts series of odd lengths—such as 3,
5, 7, and so on—and the number of series should be a power of two (e.g., 2, 4, 8, 16). If you
wish to use other lengths or a non-power-of-two number of series, you can disable warnings
by setting the keyword to NIL. To verify whether your con guration quali es as a real Tone
Lake, you can use the CHECK-TONE-LAKES-SYMMETRY function.
         fl
                                          fi
                                                      fi
                                                           fi
                                                                fi
                                                                     fi
                                                                              fl
Opusmodus                                                                                                            tone-lakes               3

Examples:
(tone-lakes 108 '(0 -14 -7) nil '(g5 eb4 a4 cs5)
            'chromatic '(p i ri r)
            :imethod 'wrap
            :iambitus '(c4 b5))

                  2         3         4          5                   6                  7                  8               9




   10        11        12             13             14                  15             16                 17             18




   19             20        21             22         23                 24                 25             26        27




                                                                                                                                  Opusmodus




(tone-lakes 108 '(0 -14 -7) nil '(g5 eb4 a4 cs5)
            'chromatic '(p i ri r)
            :imethod 'ambi
            :iambitus '((f5 a5) (c4 g4) (f4 c5) (bb4 e5)))

                  2     3                   4              5             6              7             8              9




  10        11         12                   13             14                 15                 16             17         18




  19                    20                           21                            22                           23




  24
                                 25                             26                                    27



                                                                                                                                Opusmodus
Opusmodus                                                                  tone-lakes            4

(tone-lakes 108 '(0 -14 -7) (lake-start-position 12 4 3)
            '(g5 eb4 a4 cs5) 'chromatic '(p i ri r)
            :imethod 'ambi
            :iambitus '((f5 a5) (c4 g4) (f4 c5) (bb4 e5)))

             2         3             4        5   6              7    8     9




  10        11   12             13       14            15   16        17        18




  19        20    21       22            23       24        25       26    27



                                                                                     Opusmodus




(tone-lakes 12 '(0 -14 -7) nil '(g5 eb3 a3 cs5)
            '(chromatic major minor) '(i p r ri) :ambitus '(c2 b6))
=> (g5 a3 eb2 eb6 a6 a2 eb3 cs5 d6 a6 eb6 gs5)

(tone-lakes 12 '(0 -14 -7) (lake-start-position 12 4 3) '(g5 eb3 a3 cs5)
            '(chromatic major minor) '(p i ri r)
            :ambitus '(c2 b6) :imethod 'ambi)
=> (g5 a3 eb4 b3 f4 a4 eb3 cs5 c5 a5 eb5 fs4)

(setf lake1 (tone-lakes 12 '(0 -14 -7) (lake-start-position 12 4 3)
                        '(g5 eb3 a3 cs5) 'chromatic '(p i ri r)
                        :iambitus '(c2 b6)))
=> (g5 a3 bb3 b3 f4 e4 eb3 cs5 c5 b4 f4 fs4)

(setf lake2 (tone-lakes 36 '(0 -14 -7) (lake-start-position 36 4 3)
                        '(g5 eb3 a3 cs5) 'chromatic '(i p r ri)
                        :ambitus '(c2 b6)))
=> (g5 bb6 fs6 a3 a6 f2 bb3 g2 d6 b3 fs6 c2 f4 gs5 cs2 e4 b2 eb6
    eb3 c2 e2 cs5 cs2 f6 c5 eb6 gs2 b4 e2 bb6 f4 d3 a6 fs4 b5 g2)

(setf lake3 (tone-lakes 108 '(0 -14 -7) (lake-start-position 108 4 3)
                        '(g5 eb3 a3 cs5) 'chromatic '(p i ri r)
                        :ambitus '(c2 b6)))

(setf lake4 (tone-lakes 324 '(0 -14 -7) (lake-start-position 324 4 3)
                        '(g5 eb3 a3 cs5) 'chromatic '(i p r ri)
                        :ambitus '(c2 b6)))

(lake-everyother 36 0 3 lake2)   ; every 3rd of lake 2, same as lake 1
(lake-everyother 108 0 3 lake3) ; every 3rd of lake 3, same as lake 2
(lake-everyother 108 0 9 lake3) ; every 9th of lake 3, same as lake 1
(lake-everyother 324 0 3 lake4) ; every 3rd of lake 4, same as lake 3
(lake-everyother 324 0 9 lake4) ; every 9th of lake 4, same as lake 2
(lake-everyother 324 0 27 lake4) ; every 27th of lake 4, same as lake 1
Opusmodus                                                                             tone-lakes   5

Using eight series of ve:

(setf root '(g5 c5 gb5 db5 db5 gb5 c5 g5))
(setf lake (tone-lakes (gen-lake-size 2 5 8) '(0 -4 7 4 0) nil
                        root 'chromatic '(p i ri r i p r ri)
                        :first-interval t
                        :method 'wrap :ambitus '(c2 b6)))

(check-tone-lakes-symmetry lake root 5)
=> Midway symmetry: true
    eight mirrors: true
    This is a Tone Lake

For using even numbered series and non power of two number of series you need to set the
warnings to NIL.

Six series of four:

(tone-lakes (gen-lake-size 2 4 6) '(0 -14 -7 7) nil
            '(g5 eb4 a4 cs5 eb4 g5) 'chromatic '(i p r ri i p)
            :first-interval t :ambitus '(c4 b5) :warnings nil)

Using only two series of two:

(tone-lakes (gen-lake-size 7 2 2) '(0 7) nil
            '(g5 f5) 'chromatic '(p i)
            :first-interval t :ambitus '(c4 b5) :warnings nil)


__________________
Documents and Links:

https://www.lawtonhall.com/blog/2019/9/9/per-nrgrds-in nity-series
https://unsungsymphonies.blogspot.com/2010/08/master-of-in nite-series-nrgards.html
                  fi
                                             fi
                                                   fi
