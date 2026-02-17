Opusmodus                                                                          segment-to-time          1

segment-to-time time sequence &key tempo pos mod
                         ratio quantize time-signature seed

[Function]

Arguments and Values:
time                    List of numbers, speci es the start times and span durations for segments.

sequence                An OMN-form sequence to be processed.

tempo                   (optional): List of integers or NIL. Speci es tempo values for each segment.
                        The default is NIL, which sets a tempo of 60 bpm. See LENGTH-TO-TEMPO
                        for more details.

pos                     (optional): Symbol, speci es the position within the time span where the
                        segment is triggered. Options are 's (start), 'e (end), or '? (random).
                        Default is 's.

mod                     (optional): A Boolean value indicating when tempo modulation is applied.
                        If NIL modulation is applied before segment placement.
                        If T, modulation is applied after placement (the default).

ratio                   (optional): A ratio, de nes the quantisation level for time values.
                        Default is 1/4.

quantize                (optional): A list of integers setting quantisation levels for segment values after
                        tempo modulation. Default is (1 2 3 4 5 6 7 8).

time-signature          (optional): A list of two integers specifying the time signature for the returned
                        sequence. The default is NIL, meaning the time span de nes the time
                        signature for each segment.

seed                    (optional): integer; sets a speci c seed for reproducible randomness in
                        transformations. Default is NIL, which allows for natural randomness.


Description:

The function SEGMENT-TO—TIME function applies speci ed time scheduling and duration
spans to each segment of a given sequence. It allows for precise control over the timing
and modulation of segments. The function supports varied tempo settings and
positional adjustments within a de ned time span, enhancing the rhythmic and temporal
complexity of a given sequences.
                          fi
                                      fi
                                           fi
                                                fi
                                                     fi
                                                          fi
                                                               fi
                                                                           fi
Opusmodus                                                                          segment-to-time   2

Examples:

Initialises a sequence with four segments (bars) and applies default settings for the
SEGMENT-TO-TIME function to this sequence:

(setf seq1 '((e a4 =) (s as5 =) (e eb5 =) (q e6 =)))


                                              2        3           4




Generates four random time points within a speci ed range and applies the function to
these time points and the initialised sequence:

(setf time1 (rndn 4 0.5 6.0 :seed 14))
=> (5.7579217 3.737862 2.8659759 5.1697116)

(segment-to-time time1 seq1)

                                      2                        3               4




                                                                                                          Op




Time quantization ratio set to 1/16:

(segment-to-time time1 seq1 :ratio 1/16)

                                  2                        3               4




                                                                                                         Opus




Positions segments at the end of each time span within the sequence:

(segment-to-time time1 seq1 :pos 'e)

                                          2                3           4
                                                  fi
Opusmodus                                                              segment-to-time           3

Randomly positions segments within their respective time spans, with randomness
controlled by a xed seed:

(segment-to-time time1 seq1 :pos '? :seed 23)

                                  2                3       4




Applies a xed tempo of 120 bpm to each segment before placing them at random
positions:

(segment-to-time time1 seq1 :pos '? :tempo 120 :seed 23)

                                      2        3               4




Applies different tempo values to each segment after placing them at random positions,
with modulation occurring post-placement (default).

(segment-to-time time1 seq1
                 :pos '?
                 :tempo '(44 30 120 44)
                 :seed 23)

                3
                                          2                        3




  4


                                                       7
                                                                                     Opusmodus
      fi
           fi
Opusmodus                                                                 segment-to-time         4

Applies different tempo values to each segment after placing them at random positions,
with modulation occurring pre-placement:

(segment-to-time time1 seq1 :pos '? :tempo '(44 30 120 44)
                            :mod nil :seed 23)

             3

                                          2                  3




  4


                                                                                      Opusmodus




(list
 (segment-to-time time1 seq1 :pos '? :tempo '(30 30 20 44))
 (segment-to-time time1 seq1 :pos '? :tempo '(120 76 20 34) :mod t)
 (segment-to-time time1 seq1 :pos '? :tempo '(30 35 20 34))
 (segment-to-time time1 seq1 :pos '? :tempo '(80 65 20 34) :mod t)
 )

                                              2                       3




                                 5




                                                      3



  4
                                      5                           6




                                                  7




                                                      7
                                                                                      Opusmodus
Opusmodus                                                      segment-to-time         5

(setf seq2 '((e d5 s eb6 ff e d3 mp s eb6 fff)
             (s b5 ff e bb5 mf qs eb3 f)
             (s b5 p s d6 ff h.s cs7 f s d6 f)
             (qs d6 mp)
             (s cs4 qs b5 p s eb5 ff)))


                                       2




  3                                4                   5




                                                                           Opusmodus




(setf time2 (rndn 5 0.5 6.0 :seed 14))
=> (5.7579217 3.737862 2.8659759 5.1697116 2.333257)

(segment-to-time time2 seq2)


                                               2




  3                    4                                   5




                                                                           Opusmodus




(segment-to-time time2 seq2 :pos '? :seed 43)


                                           2




  3                        4                       5




                                                                           Opusmodus
Opusmodus                                                      segment-to-time          6

(segment-to-time time2 seq2 :pos '? :tempo 120 :seed 23)


            2




  3




                                                                   3
  4                                            5




                                                                           Opusmodus




(segment-to-time time2 seq2 :pos '? :tempo '(120 30 64 44) :seed 43)




                                   2




  3                    4                               5




                                                                            Opusmodus




(segment-to-time time2 seq2
                 :pos '? :tempo '(120 30 64 44)
                 :mod nil :seed 43)


                                           2



                           3
                                       3




                                                           3
  3                            4                   5




                                                                            Opusmodus
