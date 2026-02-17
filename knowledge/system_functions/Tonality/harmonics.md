Opusmodus                                                                                   harmonics   1

harmonics pitch size &key type coeff quantize
[Function]

Arguments and Values:
pitch                    a pitch or a list of pitches.
size                     an integer or list of integers (number of pitches).
type                     :pitch, :integer, :midi, :interval or :hertz.
                         The default is :pitch.
coeff                    adjusting the coef cients of the sine waves that correspond to each note.
                         The default is 1.0.
quantize                 NIL, 1/2 (semitone), 1/4 (quarter tone), 1/8 (eight tone).
                         The default is 1/2.


Description:

The function HARMONICS returns a number of harmonics for a given pitch.

(harmonics 'a4 8)
=> (a4 a5 e6 a6 cs7 e7 g7 a7)


Examples:
(harmonics 'a4 8 :type :midi)
=> (69 81 88 93 97 100 103 105)

(harmonics 'a4 8 :type :integer)
=> (9 21 28 33 37 40 43 45)

(harmonics 'a4 8 :type :interval)
=> (12 7 5 4 3 3 2)

The coeff keyword can be used to manipulate the pitches by adjusting the coef cients of
the sine waves that correspond to each note. For example, by increasing the coef cient of the
sine wave that corresponds to the fundamental frequency of a note, the pitch of that note can
be raised. Similarly, by decreasing the coef cient of a higher harmonic, the pitch can be
lowered. The use of coef cients in music theory is a mathematical approach to analysing and
manipulating the frequency of a note.

(harmonics 'a4 8 :coeff 1.2)
=> (a4 c6 g6 c7 e7 g7 bb7 c8)

(harmonics 'a4 8 :coeff 0.6)
=> (a4 c5 g5 c6 e6 g6 bb6 c7)
                  fi
                                   fi
                                        fi
                                                                                  fi
                                                                                       fi
Opusmodus                                                   harmonics   2

(harmonics 'a4 16 :coeff 0.6 :quantize 1/4)
=> (a4 c5 g5 c6 e6 g6 bb6 c7 d7 e7 f7+ g7 gs7+ bb7 b7 c8)

With lists:

(harmonics '(a4 fs5 c4) '(8 8 8) :coeff '(1.2 0.9 1.3))
=> ((a4 c6 g6 c7 e7 g7 bb7 c8)
    (fs5 e6 b6 e7 gs7 b7 d8 e8)
    (c4 f5 c6 f6 gs6 c7 d7 f7))
