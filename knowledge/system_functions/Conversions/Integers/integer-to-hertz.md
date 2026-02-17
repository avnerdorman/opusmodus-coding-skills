Opusmodus                                                                             integer-to-hertz   1

integer-to-hertz values
[Function]

Arguments and Values:
values                   a list or lists of integers. Chords as sublists in a list.


Description:

The function INTEGER-TO-HERTZ converts a series of integers into their corresponding
hertz values.


Examples:
(integer-to-hertz '(9 21 28 33 37))
=> (440.0 880.0 1318.5103 1760.0 2217.461)

(setf values (rndn 12 -12.5 12.5))
=> (-4.0175104 -7.5934653 7.873888 8.472134 6.6712303 7.494217
    1.3128891 -8.3569355 11.346745 11.440529 -2.0488586 -8.165472)

(integer-to-hertz values)
=> (207.65234 169.64319 409.35056 427.47406 386.3755 403.48178
    281.21432 162.45088 501.067 508.3552 233.08186 162.45088)

The hertz (symbol Hz) is a unit of frequency de ned as the number of cycles per second of a
periodic phenomenon. One of its most common uses is the description of the sine wave,
particularly those used in radio and audio applications, such as the frequency of musical
tones. The word "hertz" is named for Heinrich Rudolf Hertz, who was the rst to
conclusively prove the existence of electromagnetic waves.
                                             fi
                                                                                fi
