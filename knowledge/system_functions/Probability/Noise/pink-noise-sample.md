Opusmodus                                                                pink-noise-sample    1

pink-noise-sample n sequence &key octave seed
[Function]

Arguments and Values:
n                         an integer (a sample size).
sequence                  a sequence.
octave                    an integer. The default is 5.
seed                      an integer or NIL. The default is NIL.


Description:

This function applies pink noise to a sequence of elements. Pink noise or 1/f noise is a signal
or process with a frequency spectrum such that the power spectral density (energy or power
per Hz) is inversely proportional to the frequency of the signal. In pink noise, each octave
(halving/doubling in frequency) carries an equal amount of noise power.

(pink-noise-sample 24 '(0 1 2 3 4 5 6 7 8 9 10 11))
=> (0 3 8 9 3 5 11 8 8 11 11 9 9 11 6 9 9 9 5 8 6 6 5 6)


Examples:
(pink-noise-sample 24 '(c4 d4 e4 fs4 gs4 a4 d5 e5 fs5))
=> (d5 fs5 c4 gs4 fs5 d5 d5 fs5 d5 c4 d5 gs4
    d5 gs4 fs5 fs5 e4 c4 c4 e4 c4 d5 d5 c4)

(pink-noise-sample 24 '(s s s -s e e h -q q s s e))
=> (s s h h s e e e -q e e e h s e h e e e -q e -q s e)

(pink-noise-sample 24 '(ppp pp p mp mf f ff))
=> (mf ppp pp ppp ff pp p p p p pp mf
    ppp f f mf p mf pp f mf ppp pp f)

OMN:

(setf length '(s s s -s -e e q -q s s))
(setf pitch (interval-to-pitch
            '(13 0 -1 0 -13 0 1 0 11 -1 -13) :start 'g3))
(setf velocity '(pp p mp mf f ff))

(make-omn
 :length (pink-noise-sample 64 length)
 :pitch (pink-noise-sample 64 pitch)
 :pitch (pink-noise-sample 64 velocity)
 )
