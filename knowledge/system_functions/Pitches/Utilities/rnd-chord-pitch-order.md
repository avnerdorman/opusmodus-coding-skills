Opusmodus                                                                  rnd-chord-pitch-order      1

rnd-chord-pitch-order sequence &key section exclude prob seed
[Function]

Arguments and Values:
sequence                 A sequence (pitches, chords or omn-form sequence).
section                  An integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  An integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
prob                     Optional parameter with a default value of 0.5. This is a oating-point
                         number ranging between 0.0 and 1.0, which affects the distribution
                         of the generated random number within the speci ed range. A lower value for
                         this parameter increases the likelihood of selecting a lower number within
                         the given range, while a higher value favours the selection of higher numbers.
seed                     This is an integer that guarantees consistent results each time the code is
                         evaluated. By providing a speci c seed, you can ensure that the randomness in
                         your code is reproducible. The default value for seed is NIL, which means the
                         seed is not set, resulting in different outputs on each run due to natural
                         randomnes.


Description:

The RND-CHORD-PITCH-ORDER function randomizes the order of each chord in the
sequence. This is particularly useful when melodizing chords and you're looking for
intervalic movement rather than just ascending order. This function is integrated into the
RND-MELODIZE function and can be activated by setting the keyword :rnd-order to
true.

(setf chords '(g4a4cs5fs5 c4eb4g4b4 a4b4eb5gs5 fs4a4cs5f5 a4b4eb5gs5))




(pitch-melodize chords)

                                    2        3          4              5




(pitch-melodize (rnd-chord-pitch-order chords))

                                    2         3         4              5
                                                  fi
                                                                  fi
                                                                            fl
