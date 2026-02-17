Opusmodus                                                                                 midi-to-hertz   1

midi-to-hertz values
[Function]

Arguments and Values:
values                   a list or lists of midi numbers. Chords as sublists in a list.


Description:

The function MIDI-TO-HERTZ converts a series of midi values into their corresponding
hertz values.


Examples:
(midi-to-hertz '(69 81 88 93 97))
=> (440.0 880.0 1318.5103 1760.0 2217.461)

(midi-to-hertz '(69.453 81.4342 88.34 93 97))
=> (451.6652 902.3496 1344.6604 1760.0 2217.461)

The hertz (symbol Hz) is a unit of frequency de ned as the number of cycles per second of a
periodic phenomenon. One of its most common uses is the description of the sine wave,
particularly those used in radio and audio applications, such as the frequency of musical
tones. The word "hertz" is named for Heinrich Rudolf Hertz, who was the rst to
conclusively prove the existence of electromagnetic waves.
                                            fi
                                                                              fi
