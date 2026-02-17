Opusmodus                                                                              spectral      1

spectral partials &key min-amp max-amp min-freq max-freq
             crf normalize type chord quantize

[Function]

Arguments and Values:
partials            A list of spectral data. The function supports two formats of spectral data:
                    Two-point data: frequency and amplitude. Three-point data: duration,
                    frequency, and amplitude.

min-amp             (optional): A oating-point number specifying the minimum amplitude value
                    to be included in the output. Default is NIL.

max-amp             (optional): A oating-point number specifying the maximum amplitude value
                    to be included in the output. Default is NIL.

min-freq            (optional): A oating-point number setting the minimum frequency value to be
                    included. Default is 8.1758 Hz.

max-freq            (optional): A oating-point number setting the maximum frequency value to be
                    included. Default is 12543.855 Hz.

crf                 (optional): An integer. Speci es the maximum allowable consecutive
                    repetitions for any given partial in the sequence. By default, if the crf
                    parameter is not explicitly provided, the lter assumes a maximum threshold
                    of 1, meaning it will eliminate any direct consecutive repetitions of spectral
                    partials, ensuring each partial in the output sequence is unique or non-
                    repetitive consecutively.

normalize           (optional): A boolean (NIL or T). If T, normalizes the partials' amplitudes so
                    their magnitudes sum to 1.0. Default is T.

type                (optional): Speci es the type of values to be returned. Options are:
                    :dur for duration, :freq for frequency, :amp for amplitude, :pitch for
                    pitch. Default is :pitch.

chord               (optional): A boolean (NIL or T). If T and :type is set to :pitch, returns
                    partials as chords. Default is NIL.

quantize            (optional): Speci es the frequency quantization level. Options are NIL,
                    1/2 (semitone), 1/4 (quarter tone), 1/8 (eighth tone).
                    Default is NIL for semitone quantization.
                          fl
                          fl
                          fl
                          fl
                               fi
                               fi
                                         fi
                                                      fi
Opusmodus                                                                           spectral    2

Description:

The SPECTRAL function processes a list of spectral data, extracting and manipulating
various properties like frequency, amplitude, duration, and pitch. It's designed to work with
spectral analysis data, offering a range of ltering and normalization options to tailor the
output for musical applications.

This function is particularly useful in sound synthesis, spectral analysis, and musical
composition, where detailed control over spectral properties is essential. The ability to
quantize frequencies and represent spectral data as chords further extends its utility in
creative sound design and composition.


Example:

Example with Two-Point Data (Frequency and Amplitude):

(setf partials (library 'marangona-frames 'partials nil :random 6))

(spectral partials
          :min-freq 50.00 :max-freq 4000.00
          :min-amp 0.01 :quantize 1/2 :chord t)

=> ((bb2b3d4bb4c5d5eb5e5f5fs5g5gs5bb5b5c6eb6g6bb6)
    (b3d4bb4d5eb5f5g5b5eb6g6)
    (d2bb2fs3g3b3d4e4bb4eb5f5g5b5eb6g6)
    (bb2b3d4f4bb4b4d5eb5f5g5b5eb6g6)
    (bb2b3d4bb4c5eb5f5g5b5eb6g6bb6)
    (bb2b3d4bb4d5eb5f5g5b5eb6g6bb6cs7))

In this example, the SPECTRAL function processes a list of partials to generate a sequence of
chords within speci ed frequency and amplitude ranges, with frequency values quantized to
semitones.



                                2          3      4        5        6
             fi
                                    fi
