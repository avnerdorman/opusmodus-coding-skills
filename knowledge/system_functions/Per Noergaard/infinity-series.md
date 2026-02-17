          Opusmodus                                                                             infinity-series      1

          infinity-series size series &key pattern root tonality scale-step
                                     method ambitus step ratio follow type rest printp

          [Function]

          Arguments and Values:
          size                      Integer. The length of the resulting series.
          series                    List. The initial pitch or number series used to generate the sequence.
          pattern                   Describes how the series should be transformed ('p for prime and'i for
                                    inverted). Default is generated based on the initial series 'p (prime).
          root                      List or Atom. The root pitch that anchors the series.
          tonality                  List or Atom. Speci es the tonality or tonalities to be applied to the series.
          scale-step                Number. Scale (tonality) step position. Default is 1.
          method                    Atom. Type of transformation (wrap, octa, ratio, fold, clip, ambi).
                                    Default is 'wrap.
          ambitus                   List or Atom. Speci es the range of permissible pitch values.
                                    Default is '(c0 b8).
          step                      Number. Step size for transformations. Calculated automatically
                                    if not speci ed.
          ratio                     Rational. The ratio by which pitch values are adjusted when type is 'ratio.
                                    Default is 1/16.
          follow                    Atom. root and melody. Default is 'root.
          type                      :pitch or :integer (the return). Default is :pitch.
          rest                      Boolean. Whether to include rests in the generated sequence. Default is T.
          printp                    Boolean. Debugging ag. If true, prints intermediary information
                                    during execution.


          Description:

          The term ‘in nity series’ usually refers to a sequence or series that goes on inde nitely, and
          speci cally refers to a unique compositional technique developed by Per Nørgård, a Danish
          composer. The in nity series can be generated through a relatively simple iterative process,
          starting with a small motif. Each iteration expands the sequence, preserving elements of the
          original while introducing new material. This results in a structure that is complex and
          in nitely expandable but also contains inherent relationships and symmetries.

          These series have been used in various compositions by Nørgård, and they offer a rich
          tapestry of possibilities for generating melodic, harmonic, and rhythmic material. They've
          also been of interest to musicologists and mathematicians due to their unique mathematical
          properties.

          In terms of application, the series can be applied in a variety of ways, ranging from the
          generation of pitch material to rhythmic structuring and beyond. Per Nørgård's works that
fi
     fi
                 fi
                       fi
                                       fi
                                                fi
                                                fi
                                                     fl
                                                                                           fi
Opusmodus                                                                  infinity-series   2

utilise the in nity series provide excellent examples of how this concept can be creatively
applied. See also the tone-lakes function which is made of several in nity-series intertwined.


Examples:
(infinity-series 128 '(1 0))
=> (1 0 2 -1 0 1 3 -2 2 -1 1 0 -1 2 4 -3 0 1 3 -2 1 0 2 -1 3 -2
    0 1 -2 3 5 -4 2 -1 1 0 -1 2 4 -3 1 0 2 -1 0 1 3 -2 -1 2 4 -3
    2 -1 1 0 4 -3 -1 2 -3 4 6 -5 0 1 3 -2 1 0 2 -1 3 -2 0 1 -2 3
    5 -4 1 0 2 -1 0 1 3 -2 2 -1 1 0 -1 2 4 -3 3 -2 0 1 -2 3 5 -4
    0 1 3 -2 1 0 2 -1 -2 3 5 -4 3 -2 0 1 5 -4 -2 3 -4 5 7 -6)

(infinity-series 36 '(0 1) :pattern '(i p))
=> (0 1 -1 2 1 0 -2 3 -1 2 0 1 2 -1 -3 4 1 0
    -2 3 0 1 -1 2 -2 3 1 0 3 -2 -4 5 -1 2 0 1)

(infinity-series 36 '(0 1)
                    :pattern '(i p) :method 'wrap :ambitus '(-2 2))
=> (0 1 -1 2 1 0 -2 -2 -1 2 0 1 2 -1 2 -1 1 0
    -2 -2 0 1 -1 2 -2 -2 1 0 -2 -2 1 0 -1 2 0 1)

(infinity-series 36 '(0 1)
                    :pattern '(i p) :method 'fold :ambitus '(-2 2))
=> (0 1 -1 2 1 0 -2 1 -1 2 0 1 2 -1 -1 0 1 0
    -2 1 0 1 -1 2 -2 1 1 0 1 -2 0 -1 -1 2 0 1)

(infinity-series 36 '(0 1)
                    :pattern '(i p) :method 'clip :ambitus '(-2 2))
=> (0 1 -1 2 1 0 -2 2 -1 2 0 1 2 -1 -2 2 1 0
    -2 2 0 1 -1 2 -2 2 1 0 2 -2 -2 2 -1 2 0 1)

(infinity-series 36 '(0 1)
                    :pattern '(i p) :method 'ambi :ambitus '(-12 12))
=> (0 1 -1 2 1 0 -2 3 -1 2 0 1 2 -1 -3 4 1 0
    -2 3 0 1 -1 2 -2 3 1 0 3 -2 -4 5 -1 2 0 1)


(infinity-series 36 '(0 1)
                    :pattern '(i p) :method 'octa :ambitus '(-12 12))
=> (0 12 -12 12 12 0 -12 12 -12 12 0 12 12 -12 -12 12 12 0
    -12 12 0 12 -12 12 -12 12 12 0 12 -12 -12 12 -12 12 0 12)

Examples with more then 2 intervals (pitches).

(infinity-series 24 '(c4 cs4 c5))
=> (c4 cs4 c5 b3 c4 cs5 c3 cs3 c6 cs4 d4 b4
    c4 cs4 c5 b2 c3 cs6 c5 cs5 c4 b4 c5 cs4)
      fi
                                                              fi
Opusmodus                                                                        infinity-series         3

(infinity-series 32 '(c4 cs4) :ambitus '(0 11))
=> (c4 cs4 b4 d4 cs4 c4 bb4 eb4 b4 d4 c4 cs4 d4 b4 a4 e4 cs4
    c4 bb4 eb4 c4 cs4 b4 d4 bb4 eb4 cs4 c4 eb4 bb4 gs4 f4)

Examples with tonality:

(infinity-series 36 '(c5 d5 f4)
                 :pattern '(i p i)
                 :tonality 'minor
                 :scale-step 2
                 :ambitus '(c4 bb6))
=> (d5 f5 d4 bb4 gs5 bb6 d6 f4 d5 f5 d5 f4 g4 c6 g6 f6 d4 f5 d4
    f6 d5 bb5 gs4 bb4 d5 f5 d4 bb4 gs5 bb6 d5 f5 d4 bb5 gs4 bb4)

(infinity-series 36 '(c5 d5 f4)
                 :pattern '(i p i)
                 :tonality 'minor
                 :scale-step 3
                 :ambitus '(c4 bb6))
=> (eb5 g5 eb4 c5 bb5 c4 eb6 g4 eb5 g5 eb5 g4 gs4 d6 gs6 g6 eb4 g5
    eb4 g6 eb5 c6 bb4 c5 eb5 g5 eb4 c5 bb5 c4 eb5 g5 eb4 c6 bb4 c5)

(infinity-series 108 '(c5 cs5 a4 d5 f5)
                 :root 'a4
                 :tonality 'raga-yamuna-kalyani
                 :ambitus '(c3 c5)
                 :scale-step 2)

             2         3              4        5         6                  7           8




  9          10            11             12       13        14             15         16




  17              18            19                 20             21              22




  23              24             25                 26                 27              28




                                                                                             Opusmodus
Opusmodus                                                                                      infinity-series          4

(infinity-series 108 '(0 7)
                 :root 'g5
                 :tonality 'chromatic
                 :ambitus '(c4 b5)
                 :scale-step 2)

                     2              3                 4        5             6         7              8




  9             10             11                12            13            14        15             16




  17                 18                     19            20                 21                 22




  23                      24                     25                     26            27



                                                                                                           Opusmodus




Generating rhythmic series:

(infinity-series 13 '(1 3) :step 1/32)
=> (1/32 3/32 -1/32 5/32 3/32 1/32 -3/32 7/32 -1/32 5/32 1/32 3/32 5/32)

(infinity-series 13 '(3/16 5/8) :step 2)
=> (3/8 5/4 -1/2 17/8 5/4 3/8 -11/8 3 -1/2 17/8 3/8 5/4 17/8)
(infinity-series 36 '(2/16 -1/16)
                 :pattern '(i p)
                 :method 'ratio
                 :ambitus '(-2/16 7/16)
                 :step 1/16
                 :ratio 1/16)

                                        2                                         3




  4                                 5                               6                      7



                                                                                                            Opusmodus
Opusmodus                                                                                 infinity-series          5

(infinity-series 36 '(2/16 -1/16)
                 :pattern '(i p)
                 :method 'ratio
                 :ambitus '(-2/16 7/16)
                 :step 1/16
                 :ratio 1/16
                 :rest nil)

                                          2                                    3




    4                               5                            6                    7



                                                                                                       Opusmodus




The Thue-Morse Sequence:

(infinity-series 64 '(c5 cs5)
                :pattern '(i p)
                :method 'wrap
                :ambitus '(c5 cs5))
=> (c5 cs5 cs5 c5 cs5 c5 c5 cs5 cs5 c5 c5 cs5 c5 cs5 cs5 c5 cs5 c5
    c5 cs5 c5 cs5 cs5 c5 c5 cs5 cs5 c5 cs5 c5 c5 cs5 cs5 c5 c5 cs5
    c5 cs5 cs5 c5 c5 cs5 cs5 c5 cs5 c5 c5 cs5 c5 cs5 cs5 c5 cs5 c5
    c5 cs5 cs5 c5 c5 cs5 c5 cs5 cs5 c5)

An easy way to generate the Thue-Morse Sequence by reversing the pattern:

(infinity-series 64 '(c5 g5) :pattern '(p i))
=> (c5 g5 g5 c5 g5 c5 c5 g5 g5 c5 c5 g5 c5 g5 g5 c5 g5 c5 c5 g5 c5
    g5 g5 c5 c5 g5 g5 c5 g5 c5 c5 g5 g5 c5 c5 g5 c5 g5 g5 c5 c5 g5
    g5 c5 g5 c5 c5 g5 c5 g5 g5 c5 g5 c5 c5 g5 g5 c5 c5 g5 c5 g5 g5 c5)


__________________
Documents and Links:

https://www.lawtonhall.com/blog/2019/9/9/per-nrgrds-in nity-series
https://unsungsymphonies.blogspot.com/2010/08/master-of-in nite-series-nrgards.html
                                              fi
                                                   fi
