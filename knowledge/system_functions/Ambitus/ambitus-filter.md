Opusmodus                                                                             ambitus-filter       1

ambitus-filter ambitus sequence &key remain section exclude
[Function]

Arguments and Values:
ambitus                   A two-element list specifying the lower and upper bounds of the ambitus.
                          It can be provided as a pair of integers, a pair of pitch symbols, or a string
                          representing an instrument name. This parameter de nes the allowable pitch
                          range for the ltering process.

sequence                  An OMN (Opusmodus Notation) form list or a list of pitch sequences.
                          This is the musical material that the function will process, applying the
                          ambitus lter.

remain                    (optional): A boolean ag (true/false). When set to true, the function retains the
                          parts of the sequence that fall outside the speci ed ambitus. By default,
                          it is set to false.

section                   (optional): An integer or a list of integers specifying the sections of the
                          sequence to which the ambitus lter should be applied. If not provided,
                          the function processes the entire sequence.

exclude                   (optional): An integer or a list of integers indicating the sections of the
                          sequence that should be excluded from processing. By default, all sections
                          are included.


Description:

The AMBITUS-FILTER function processes a given musical sequence (OMN list or pitch
sequence) to lter out pitches, velocities, and articulations that fall outside the speci ed
ambitus range. For pitches removed from the sequence, their corresponding lengths are
converted into rests, ensuring the temporal structure of the sequence remains unchanged.
This function is particularly useful for adapting musical material to t the playable range of
different instruments or voices.


Examples:

Basic usage with integer ambitus range:

(ambitus-filter '(-11 21) '((q c4ds3 e c4 c1 q d5 g9)
                            (q c4 e d6 d6 d6 d6 c8 q d5 g9)))
=> ((q c4ds3 e c4 - q d5 -) (q c4 -he q d5 -))
       fi
                           fi
                                fi
                                         fl
                                                   fi
                                                                   fi
                                                                        fi
                                                                             fi
                                                                                         fi
Opusmodus                                                              ambitus-filter   2

Using remain ag to keep the parts of the sequence outside ambitus:

(ambitus-filter '(-11 21) '((q c4ds3 e c4 c1 q d5 g9)
                            (q c4 e d6 d6 d6 d6 c8 q d5 g9)) :remain t)
=> ((-q. e c1 -q g9) (-q e d6 d6 d6 d6 c8 -q g9))

Applying lter to a speci c section of the sequence:

(ambitus-filter '(cs3 a5) '((q c4ds3 e c4 c1 q d5 g9)
                            (q c4 e d6 = = = c8 q d5 g9)) :section 0)
=> ((q c4ds3 e c4 - q d5 -) (q c4 e d6 = = = c8 q d5 g9))

Combining section and remain for more complex ltering:

(ambitus-filter '(cs3 a5) '((q c4ds3 e c4 c1 q d5 g9)
                            (q c4 e d6 = = = c8 q d5 g9))
                :section 0 :remain t)
=> ((-q. e c1 -q g9) (q c4 e d6 = = = c8 q d5 g9))

Example with pitch sequence:

(ambitus-filter
 '(-11 21) '((c4ds3 c4 c1 d5 g9) (c4 d6 d6 d6 d6 c8 d5 g9)))
=> ((c4ds3 c4 d5) (c4 d5))

(ambitus-filter
 '(cs3 a5) '((c4ds3 c4 c1 d5 g9) (c4 d6 d6 d6 d6 c8 d5 g9)) :section 0)
=> ((c4ds3 c4 d5) (c4 d6 d6 d6 d6 c8 d5 g9))

Here's an example of how AMBITUS-FILTER might be used in context:

(setf cello-part
      (integer-to-pitch
       (vector-round -24 12 (gen-noise 30 :seed 45))))
=> (a2 eb2 fs4 g4 eb4 f4 fs3 d2 b4 c5 c3 d2 e3 c5 c2 eb2
    eb2 eb2 gs4 e2 b3 bb2 cs3 f3 bb2 a3 gs2 b4 e3 c2)

(setf viola-part (ambitus '(c4 g5) cello-part))
=> (a4 eb4 fs4 g4 eb4 f4 fs4 d4 b4 c5 c4 d4 e4 c5 c4 eb4
    eb4 eb4 gs4 e4 b4 bb4 cs4 f4 bb4 a4 gs4 b4 e4 c4)

Contextual example using ambitus lter with a cello part transformed for a viola:

(setf viola-var (ambitus-filter '(cs3 a5) cello-part))
=> (fs4 g4 eb4 f4 fs3 b4 c5 e3 c5 gs4 b3 cs3 f3 a3 b4 e3)
   fi
            fl
                 fi
                               fi
                                              fi
Opusmodus                                                 ambitus-filter   3

More Examples:

(setf row (rnd-air :group :symmetric :type :pitch))
(setf pitch (rnd-octaves '(c2 g7) row))
(setf length (rnd-order (gen-length '(1 2 3 4 5 6 7 8 9 10 11 12) 16)))

(setf mat (split-lengths
           (make-omn :length length :pitch pitch)
          :type :denominator))
=> ((h. c6) (he. cs6) (q bb4) (q.. d4) (he a5) (h b6)
    (e. f5 hs eb2 s gs3) (e e3) (qs g6) (q. fs5))

(setf vln (ambitus-filter 'violin mat))
=> ((he. c5) (q cs7) (s a4 q.. e7 qs d6) (h f6)
    (-he) (e. gs6) (e bb4) (-hs) (h. g6) (-q.))

(setf vlc (ambitus-filter 'violin mat :remain t))
=> ((-he.) (-q) (-h.s) (-h) (he b2)
    (-e.) (-e) (hs eb3) (-h.) (q. fs3))
