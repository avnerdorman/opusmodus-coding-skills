Opusmodus                                                                          interval-to-hertz   1

interval-to-hertz values &key start
[Function]

Arguments and Values:
values                   a list or lists of intervals.
start                    an integer or pitch symbol. The default is 0 (c4).


Description:

The function INTERVAL-TO-HERTZ converts a series of intervals into hertz values.


Examples:
(interval-to-hertz '(12 7 5 4))
=> (261.62555 523.2511 783.99084 1046.5022 1318.5103)

(interval-to-hertz '(12 7 5 4) :start 'a4)
=> (440.0 880.0 1318.5103 1760.0 2217.461)

(setf intervals (vector-round -3.0 3.0 (gen-noise 12 :seed 43)))
=> (-3.0 0.8094139 -2.6378403 2.9322042 -2.0963752 -0.8222871
    2.3634224 0.8212879 1.5503345 -1.2059051 -0.30191112 3.0000005)

(interval-to-hertz intervals)
=> (261.62555 220.0 229.74022 198.84857 233.08186 207.65234 198.84857
    226.44649 236.47214 261.62555 243.40129 239.9117 285.30472)

The hertz (symbol Hz) is a unit of frequency de ned as the number of cycles per second of a
periodic phenomenon. One of its most common uses is the description of the sine wave,
particularly those used in radio and audio applications, such as the frequency of musical
tones. The word "hertz" is named for Heinrich Rudolf Hertz, who was the rst to
conclusively prove the existence of electromagnetic waves.
                                           fi
                                                                              fi
