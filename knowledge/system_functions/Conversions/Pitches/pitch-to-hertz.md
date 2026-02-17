Opusmodus                                                                pitch-to-hertz   1

pitch-to-hertz pitch
[Function]

Arguments and Values:
pitch                    a list or lists of pitches.


Description:

The function PITCH-TO-HERTZ converts a series of pitches into their corresponding
hertz values.


Examples:
(pitch-to-hertz '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4 c5))
=> (261.62555 277.18265 293.66476 311.12698 329.62756 349.22824
    369.99442 391.99542 415.3047 440.0 466.1638 493.8833 523.2511)

(pitch-to-hertz '(c4. cs4 d4 ds4+ e4 f4 fs4+ g4 gs4 a4.. as4 b4 c5.))
=> (265.43097 277.18265 293.66476 320.2437 329.62756 349.22824 380.8361
    391.99542 415.3047 459.48044 466.1638 493.8833 530.862)

The hertz (symbol Hz) is a unit of frequency de ned as the number of cycles per second of a
periodic phenomenon.[1] One of its most common uses is the description of the sine wave,
particularly those used in radio and audio applications, such as the frequency of musical
tones. The word "hertz" is named for Heinrich Rudolf Hertz, who was the rst to
conclusively prove the existence of electromagnetic waves.
                                              fi
                                                                  fi
