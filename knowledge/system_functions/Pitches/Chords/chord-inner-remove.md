Opusmodus                                                                          chord-inner-remove        1

chord-inner-remove map pitches &key inner retention
                                  section exclude seed

[Function]

Arguments and Values:
map                        A list or nested lists of integers. The rst value in each list speci es the size of
                           the chord. The subsequent values de ne the number of pitches to be removed.
pitches                    A list of pitches or an omn-form sequence. This is the input chord or sequence
                           of chords from which pitches will be removed.
retention                  The 'retention' keyword is used when only one pitch should be returned.
                           The highest tone symbol is 'h, the lowest is 'l, and the '? symbol means
                           'at random' between 'h or 'l. The default is 'l (lowest).
inner                      This function modi es chord structures by removing inner pitches. If set to T
                           (true), it consistently removes inner chord pitches. Alternatively, if the ‘inner'
                           keyword is set to NIL, it removes the pitches at random. The default value for
                           this function is T.
section                    (optional): An integer or a list of integers specifying the sections of the
                           sequence to which the ambitus adjustment should be applied. If not provided,
                           the function processes the entire sequence.
exclude                    (optional): An integer or a list of integers indicating the sections of the
                           sequence that should be excluded from processing. By default,
                           all sections are included.
seed                       An integer. Ensures the same result each time the code is evaluated.
                           The default is NIL.

Description:

The CHORD-INNER-REMOVE function is designed for the selective diminution of chordal
density by excising a predetermined number of internal pitches. This function upholds the
structural integrity of the chord by preserving its external pitches, contingent upon the
retention of more than two pitches post-removal. In scenarios where the reduction process
results in a solitary pitch, the function, by default, opts for the retention of the lowest pitch.
This default behaviour can be overridden through the explicit speci cation of the
retention keyword, allowing for a choice between the highest ('h), lowest ('l), or a
random ('?) pitch from the residual set.

Basic Usage:

This example demonstrates the removal of one internal pitch from each chord, applicable
when the pitch count of the chord matches the speci ed size value (5 in this case).

(chord-inner-remove
 '(5 1) '(c4d4e4f4g5 c4d4e4f4g5 c4d4e4f4g5))
=> (c4e4f4g5 c4d4e4g5 c4d4f4g5)
                                       fi
                                                   fi
                                                         fi
                                                              fi
                                                                      fi
                                                                                      fi
Opusmodus                                                              chord-inner-remove       2




Here, 1 or 2 internal pitches are removed from each chord, with this operation being
applicable to chords whose pitch count equals the size value (5). The seed parameter
ensures reproducible results.

(chord-inner-remove
 '(5 (1 2)) '(c4d4e4f4g5 c4d4e4f4g5 c4d4e4f4g5) :seed 21)
=> (c4d4e4g5 c4d4e4g5 c4d4g5)

In this instance, the function CHORD-INNER-REMOVE is con gured to remove varying
numbers of internal pitches (1, 2, or 4) from each chord in the sequence, where each chord
initially has a pitch count of 5. The :seed 21 parameter ensures consistent and
reproducible results across evaluations. Notably, in the nal chord of the sequence, after the
removal process, only the lowest pitch remains, which aligns with the function's default
behaviour when a retention pitch is to be selected from the modi ed chord.

(chord-inner-remove
 '(5 (1 2 4)) '(c4d4e4f4g5 c4d4e4f4g5 c4d4e4f4g5) :seed 21)
=> (c4e4g5 c4f4g5 c4)

(chord-inner-remove
 '(5 (1 2 4)) '(c4d4e4f4g5 c4d4e4f4g5 c4d4e4f4g5)
 :retention 'h :seed 21)
=> (c4d4e4g5 c4d4e4g5 g5)

Random Single Pitch Selection:

(chord-inner-remove
 '(5 (1 2 4)) '(c4d4e4f4g5 c4d4e4f4g5 c4d4e4f4g5)
 :retention '? :seed 21)
=> (c4d4e4g5 c4d4e4g5 c4)

Randomly chooses between the highest and lowest pitches of the remaining ones in each
chord.


Examples:
(setf mat
      (flatten
       (gen-cluster
        (rnd-sample 12 '(3 4 5 6) :seed 45)
        :type 'c
        :transpose (rnd-sample 12 (gen-integer -12 12) :seed 23))))
=> (c4cs4d4eb4 g3gs3a3 gs3a3bb3b3c4cs4 c5cs5d5eb5e5f5 fs3g3gs3a3bb3b3
    c4cs4d4eb4e4f4 c3cs3d3eb3e3 cs3d3eb3 cs4d4eb4e4f4fs4 b3c4cs4d4eb4e4
    bb4b4c5cs5 bb3b3c4)
                                                 fi
                                                        fi
                                                               fi
Opusmodus                                              chord-inner-remove   3


(setf size '((6 (3 5)) (4 (1 2 3)) (5 (1 2 4)))


(chord-inner-remove size mat :retention 'l :seed 32)
=> (c4cs4eb4 g3gs3a3 gs3 c5 fs3g3b3 c4cs4f4
    c3eb3e3 cs3d3eb3 cs4 b3c4e4 bb4 bb3b3c4)

(chord-inner-remove size mat :retention 'h :seed 32)
=> (c4cs4eb4 g3gs3a3 cs4 f5 fs3g3b3 c4cs4f4
    c3eb3e3 cs3d3eb3 fs4 b3c4e4 cs5 bb3b3c4)

(chord-inner-remove size mat :retention '? :seed 32)
=> (c4cs4eb4 g3gs3a3 cs4 c5 fs3g3b3 c4cs4f4
    c3eb3e3 cs3d3eb3 cs4 b3c4e4 bb4 bb3b3c4)

(setf r-values (vector-map '(l h) (gen-sine (length mat) 1 0.5)))
=> (l h h h h h l l l l l l)

Example with a list of retention pitch values:

(chord-inner-remove
 '((6 5) (4 (1 2 3)) (5 (1 2 4))) mat :retention r-values :seed 65)
=> (c4 g3gs3a3 cs4 f5 b3 f4 c3 cs3d3eb3 cs4 b3 bb4cs5 bb3b3c4)
