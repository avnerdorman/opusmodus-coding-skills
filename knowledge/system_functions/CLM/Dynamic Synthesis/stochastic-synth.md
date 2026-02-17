Opusmodus                                                                    stochastic-synth      1

stochastic-synth dur amp &key bits xmin xmax xwig xstep
                          ywig xfb init-array bpm

[Function]

Arguments and Values:
dur                     omn-form list or lengths (number, ratio or length-symbol).
amp                     omn-form list or velocities (amplitude).
bits                    number. Resolution of the wave's amplitude dimension. The default is 16.
xmin                    number. Minimum number of samples between time breakpoints,
                        must be >= 1. The default is 1.
xmax                    number. Maximum number of samples between time breakpoints.
                        The default is 20.
xwig                    number. Amplitude applied to random walk function in time dimension.
                        The default is 0.
xstep                   number. Quantization of freedom in time dimension, in samples,
                        minimum: 1. The default is 1.
ywig                    number. Amplitude applied to random walk function in amplitude
                        dimension, as %amp. The default is 0.
xfb                     number. FIR lter. The default is 0.
init-array              a list of numbers. Initial x and y breakpoints for wave, x values
                        must be integers >= 1, y values between -1.0 and 1.0.
                        The default is ((10 0) (10 1) (10 0) (10 -.7) (10 0)
                        (10 .5) (10 0) (10 -.3) (10 0) (10 .2) (10 0)
                        (10 -.1))).
bpm                     number. Beats per Minute. The default is 60.


Description:

Implementation of Xenakis' Dynamic Stochastic Synthesis.


Examples:
(with-sound ()
  (stochastic-synth '(q = = = =) 0.5
                    :xwig '(.1 .15 .2 .15 .1)))

(with-sound ()
 (stochastic-synth '(t = = = = = = = :r 4) 0.5
                   :xwig (rnd-sample 32 '(.1 .2 .3 .4))
                   :ywig (rnd-sample 32 '(4 6 8 12))
                   :xfb (rnd-sample 32 '(1 .9 .8 .7))
                   :xstep (rnd-sample 32 '(1 2 3 4))
                   ))
                             fi
Opusmodus                                                                   stochastic-synth   2

---------------------------------------------------------
CLM instrument: stochastic.ins
Stochastic is Bill Sack's implementation of Xenakis' Dynamic Stochastic Synthesis
as heard in his GENDY3, S.709, Legende d'Eer, etc.

(with-sound () (stochastic 0 6 :amp .5 :xwig .25 :ywig 2.0))

---------------------------------------------------------
