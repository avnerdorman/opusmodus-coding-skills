Opusmodus                                                                              filter-change     1

filter-change sequence &key invert section exclude
[Function]

Arguments and Values:
sequence                 omn-form sequence.

invert                   (Optional) A boolean ag indicating whether to invert the processing, i.e., to
                         keep the repeated pitches and replace non-repeated ones with rests.
                         Default is NIL.

section                  (optional): An integer or a list of integers specifying the sections of the
                         sequence to which the lter adjustment should be applied. If not provided,
                         the function processes the entire sequence.

exclude                  (optional): An integer or a list of integers indicating the sections of the
                         sequence that should be excluded from processing. By default,
                         all sections are included.


Description:

The FILTER-CHANGE function processes a sequence, removing repeated pitches and
replacing them with rests. The function rst generates a binary change map based on the
pitch information of the input sequence. It then processes the input sequence based on this
map, replacing repeated pitches with rests, the invert parameter controls whether to invert
the processing logic.


Examples:
(filter-change '(-s b4 b4 b4 fs5 f4 f4 f4))
=> (s b4 mf - - fs5 f4 - -)

(filter-change '((-s b4 b4 b4 fs5 f4 f4 f4)
                 (s g5 a4 a4 cs5 f5 c5 gs4 cs5)))
=> ((s b4 mf - - fs5 f4 - -) (s g5 mf a4 - cs5 f5 c5 gs4 cs5))

(filter-change '((-s b4 b4 b4 fs5 f4 f4 f4)
                 (s g5 a4 a4 cs5 f5 c5 gs4 cs5))
               :section 0)
((s b4 mf - - fs5 f4 - -) (s g5 a4 a4 cs5 f5 c5 gs4 cs5))
                                  fi
                                        fl
                                             fi
