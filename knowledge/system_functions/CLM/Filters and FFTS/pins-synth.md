Opusmodus                                                                            pins-synth     1

pins-synth dur file amp &key transposition time-scaler fftsize
                  highest-bin max-peaks attack bpm

[Function]

Arguments and Values:
dur                       omn-form list or lengths (number, ratio or length-symbol).
file                      a le input (sound- le). The complete pathname of the sound- le
                          you want to use as source material (.aif).
amp                       omn-form list or velocities.
transposition             number. The default is 1.0.
time-scaler               number. This can make things happen faster (< 1.0)/slower (> 1.0)
                          in the output. The default is 1.0.
fftsize                   number. Should be a power of 2. At 22050 srate, this is ok for sounds
                          above 300Hz or so, below that you need 512 or 1024, At 44100,
                          probably best to double these sizes -- it takes some searching sometimes.
                          The default is 256.
highest-bin               number. How high in fft data should we search for peaks.
                          The default is 128.
max-peaks                 number. How many spectral peaks to track at the maximum. The default is 16.
attack                    number. Whether to use original attack via time domain splice.
                          The default is NIL.
bpm                       number. Beats per Minute. The default is 60.


Description:

Spectral modeling instrument a la SMS.


Examples:
(with-sound () (pins-synth 5.0 "granis" 0.5))

(with-sound () (pins-synth '(h - h - h) "granis" 1.0
                           :transposition '(.2 .4 .6)))


---------------------------------------------------------
CLM instrument: san.ins
Spectral modeling a la SMS (Xavier Serra).

(with-sound () (pins 0 2.0 "granis" 0.5))

---------------------------------------------------------
                     fi
                                     fi
                                                                              fi
