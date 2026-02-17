Opusmodus                                                                   clm-generators   1

List of CLM Generators:
all-pass                             all-pass lter
asymmetric-fm                        asymmetric fm
comb                                 comb lter
convolve                             convolution
delay                                delay line
env                                  line segment envelope
filter                               direct form FIR/IIR lter
filtered-comb                        comb lter with lter on feedback
fir-filter                           FIR lter
formant                              resonance
granulate                            granular synthesis
iir-filter                           IIR lter
in-any                               sound le input
locsig                               static sound placement
move-sound                           sound motion
moving-average                       moving window average
ncos                                 sum of equal amplitude cosines
notch                                notch lter
nsin                                 sum of equal amplitude sines
nrxycos                              sum of n scaled cosines
nrxysin                              sum of n scaled sines
one-pole                             one pole lter
one-zero                             one zero lter
oscil                                sine wave and FM
out-any                              sound output
polywave                             waveshaping
polyshape                            waveshaping
phase-vocoder                        vocoder analysis and resynthesis
pulse-train                          pulse train
rand                                 random numbers, noise
rand-interp                          random numbers, noise
readin                               sound input
sawtooth-wave                        sawtooth
square-wave                          square wave
src                                  sampling rate conversion
ssb-am                               single sideband amplitude modulation
table-lookup                         interpolated table lookup
tap                                  delay line tap
triangle-wave                        triangle wave
two-pole                             two pole lter
two-zero                             two zero lter
wave-train                           wave train
                 fi
                      fi
                           fi
                           fi
                           fi
                                fi
                                     fi
                                          fi
                                          fi
                                           fi
                                           fi
                                                fi
                                                     fi
Opusmodus                                                                  clm-generators   2

Description:

A generator is a function that returns the next sample in an in nite stream of samples each
time it is called. An oscillator, for example, returns an endless sine wave, one sample at a
time. Each generator consists of a set of functions: MAKE-<gen> sets up the data structure
associated with the generator at initialization time; <gen> produces a new sample; <gen>?
checks whether a variable is that kind of generator. Internal elds are accessible via various
generic functions such as MUS-FREQUENCY.

(setf oscillator (make-oscil :frequency 330))

prepares oscillator to produce a sine wave when set in motion via:

(oscil oscillator)
returns 23292580841837857D0

(oscil? oscillator)
returns t

(mus-frequency oscillator)
returns 330

The initialization function MAKE-OSCIL normally takes a number of optional arguments,
setting whatever choices need to be made to specify the generator's behaviour. The run-
time function OSCIL always takes the generator as its rst argument. Its second argument
is nearly always something like an FM input; in a few cases, it is a function to provide input
data or editing operations. Frequency sweeps of all kinds (vibrato, glissando, breath noise,
FM proper) are all forms of run-time frequency modulation. So, in normal usage, our
oscillator looks something like:

(oscil oscillator (+ vibrato glissando frequency-modulation))

Frequencies are always in cycles per second (also known as Hz). The FM (or frequency
change) argument is assumed to be a phase change in radians, applied on each sample.
Normally composers would rather think in terms of Hz, so the function HZ->RADIANS can
be used to convert from units of cycles per second to radians per sample.

Finally, one special aspect of the MAKE-<gen> functions is the way they read their
arguments. We use the word optional-key in the function de nitions in this document to
indicate that the arguments are keywords, but the keywords themselves are optional. Take the
MAKE-OSCIL call, de ned as:

MAKE-OSCIL &optional-key (frequency 0.0) (initial-phase 0.0)
                fi
                                                   fi
                                                        fi
                                                             fi
                                                                  fi
Opusmodus                                                                clm-generators   3

When MAKE-OSCIL is called, it scans its arguments; if a keyword is seen, that argument
and all following arguments are passed unchanged, but if a value is seen, the corresponding
keyword is prepended in the argument list:

(make-oscil :frequency 440.0)
(make-oscil :frequency 440.0 :initial-phase 0.0)
(make-oscil 440.0)
(make-oscil)
(make-oscil 440.0 :initial-phase 0.0)
(make-oscil 440.0 0.0)

are all equivalent, but

(make-oscil :frequency 440.0 0.0)
(make-oscil :initial-phase 0.0 440.0)

are in error, because once we see any keyword, all the rest of the arguments have to use
keywords too (we can't reliably make any assumptions after that point about argument
ordering). If this is confusing, just use the keywords all the time. I implemented this
somewhat unusual argument interpretation because in many cases it is silly to insist on the
keyword; for example, in MAKE-ENV, the envelope argument is obvious and can't be
confused with any other argument, so it's an annoyance to have to say ":envelope" over
and over. Keyword arguments are also useful when there are so many arguments to a
function that it becomes impossible to remember what they are and what order they come in.


MAKE-<gen>

make-all-pass feedback feedforward size initial-contents
              initial-element max-size type

(make-all-pass :size 5 :feedforward -1 :feedback 0.5)
make-asymmetric-fm (frequency *clm-default-frequency*)
                   (initial-phase 0.0) (r 1.0) (ratio 1.0)

(make-asymmetric-fm 440.0 :ratio 0.8)
make-comb scaler size initial-contents initial-element max-size type

(make-comb 0.742 (next-prime 4799 (/ *srate* 25600)))
make-convolve input filter fft-size filter-size filter-scaler

(make-convolve :filter (make-double-array 8)
               :input (open-input (snd-path "granis")))
Opusmodus                                                   clm-generators   4

make-delay (size 1) initial-contents initial-element max-size type

(make-delay (* .015 *srate*))


make-env envelope (scaler 1.0) duration (offset 0.0) base end length

(make-env :envelope '(0 1 1 1) :scaler 0.5 :duration 5.0)


make-filter order xcoeffs ycoeffs

(make-filter 8)
make-filtered-comb scaler size initial-contents
                   initial-element max-size type filter

(make-filtered-comb .5 5 :filter (make-one-zero .5 .5))
make-fir-filter order x1coeffs coeffs

(make-fir-filter 8)
make-formant frequency radius

(make-formant 1000 .995)
make-granulate input (expansion 1.0) (length .15) (scaler .6)
               (hop .05) (ramp .4) (jitter 1.0) max-size edit

(make-granulate :expansion 4)
make-iir-filter order y1coeffs coeffs

(make-iir-filter 8)
make-locsig (degree 0.0) (distance 1.0) (reverb 0.0)
            (channels nil) (type *clm-locsig-type*)

(make-locsig :degree 0 :distance 1.0 :reverb 0.05)
make-move-sound dlocs-list &optional output revout

(make-move-sound
 (list 0 10 1 0
       (make-delay 32)
       (make-env '(0 0 1 1) :length 1001)
       (make-env '(0 0 1 1) :length 1001)
       (make-array 1 :initial-contents (list (make-delay 32)))
       (make-array 1 :initial-contents (list (make-env
                                             '(0 0 1 1) :length 1001)))
       (make-array 1 :initial-contents (list (make-delay 32)))
       (make-integer-array 1 :initial-contents (list 0))))
Opusmodus                                                   clm-generators   5

make-moving-average size initial-contents initial-element

(make-moving-average 10)
make-ncos (frequency *clm-default-frequency*) (n 1)

(make-ncos :frequency 440.0 :n 0.56)
make-notch scaler size initial-contents initial-element max-size type

(make-notch .7 30)
make-nsin (frequency *clm-default-frequency*) (n 1)

(make-nsin 440.0 10)
make-nrxycos (frequency *clm-default-frequency*)
             (ratio 1.0) (n 1) (r .5)

(make-nrxycos 440.0 1.0 10)
make-nrxysin (frequency *clm-default-frequency*)
             (ratio 1.0) (n 1) (r .5)

(make-nrxysin 440.0 1.0 10)
make-one-pole a0 b1

(make-one-pole 1.0 0.9)
make-one-zero a0 b1

(make-one-zero 1.0 0.9)
make-oscil (frequency *clm-default-frequency*) (initial-phase 0.0)

(make-oscil 440.0 0.0)
make-polywave (frequency *clm-default-frequency*) (partials '(1 1))
              (type mus-chebyshev-first-kind)

(make-polywave 440.0 (list 1 .5 2 .3 3 .2))
make-polyshape (frequency *clm-default-frequency*) (initial-phase 0.0)
               (coeffs nil) (partials '(1 1))
               (kind mus-chebyshev-first-kind)

(make-polyshape :frequency 440.0 :partials (list 1 .5 2 .3 3 .2))
make-phase-vocoder input (fft-size 512) (overlap 4) (interp 256)
                   (pitch 1.0) (analyze nil) (edit nil)
                   (synthesize nil)

(make-phase-vocoder (open-input (snd-path "granis")) :fft-size 512)
Opusmodus                                                 clm-generators   6

make-pulse-train (frequency *clm-default-frequency*)
                 (amplitude 1.0) (initial-phase two-pi)

(make-pulse-train :frequency 440.0)
make-rand (frequency *clm-default-frequency*) (amplitude 1.0)
          (envelope nil) (distribution nil)

(make-rand 440.0)
make-rand-interp (frequency *clm-default-frequency*) (amplitude 1.0)
                 (envelope nil) (distribution nil)

(make-rand-interp 440.0)
make-readin file channel start (direction 1)
            (size *clm-file-buffer-size*)

(make-readin :file (open-input (snd-path "granis")))
make-sawtooth-wave (frequency *clm-default-frequency*)
                   (amplitude 1.0) (initial-phase pi)

(make-sawtooth-wave 440.0)
make-square-wave (frequency *clm-default-frequency*)
                 (amplitude 1.0) (initial-phase 0.0)

(make-square-wave 440.0)
make-src input (srate 1.0) (width *clm-src-width*)

(make-src :input (open-input "granis"))
make-ssb-am (frequency *clm-default-frequency*) (order 40)

(make-ssb-am 440.0 20)
make-table-lookup (frequency *clm-default-frequency*)
                  (initial-phase 0.0) wave (size *clm-table-size*)
                  (type mus-interp-linear)

(make-table-lookup 440.0)
make-triangle-wave (frequency *clm-default-frequency*)
                   (amplitude 1.0) (initial-phase 0.0)

(make-triangle-wave :frequency 6 :amplitude 0.03)
make-two-pole a0 b1 b2 frequency radius

(make-two-pole .1 .1 .1)
Opusmodus                                                clm-generators   7

make-two-zero a0 a1 a2 frequency radius

(make-two-zero .1 .1 .1)


make-wave-train (frequency *clm-default-frequency*) (initial-phase 0.0)
                 wave (size *clm-table-size*) (type mus-interp-linear)

(make-wave-train 440.0)
