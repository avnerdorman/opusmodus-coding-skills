     Opusmodus                                                                   gen-brownian-motion       1

     gen-brownian-motion steps &key start amp lower upper
                                       drift delta volatility seed

     [Function]

     Arguments and Values:
     steps                     the number of steps to simulate.
     start                     the initial position of the particle (optional, defaults to 0.5).
     amp                       the amplitude for the Gaussian random number generator
                               (optional, defaults to 1.0).
     lower                     the lower boundary for the particle's position (optional, defaults to -1.0).
     upper                     the upper boundary for the particle's position (optional, defaults to 1.0).
     drift                     the drift rate for the Brownian motion (optional, defaults to 0.01).
     delta                     the time step size for the Brownian motion
                               (optional, defaults to 0.1).
     volatility                the volatility for the Brownian motion (optional, defaults to 0.05).
     seed                      This is an integer that guarantees consistent results each time the code is
                               evaluated. By providing a speci c seed, you can ensure that the randomness in
                               your code is reproducible. The default value for seed is NIL, which means the
                               seed is not set, resulting in different outputs on each run due to natural
                               randomness.


     The function makes use of three local helper functions:

     - gaussian-random: Generates a normally distributed random number using the Box-Muller
       transform, with a speci ed amplitude that controls the standard deviation of the
       generated numbers.

     - next-step: Simulates the next step of Brownian motion from the start position, taking into
       account the drift and volatility, and using the Gaussian random number generator to add
       randomness.

     - re ect: Re ects the particle's position if it crosses either the lower or upper limit, ensuring
       that the returned position is always within these bounds.


     Description of Each of the Parameters:

     steps
     This is the number of steps you want to simulate in your Brownian motion. The returned list
     will have this many positions.

     start
     This is the starting position for the particle in the Brownian motion simulation.
fl
         fl
                      fi
                                                      fi
Opusmodus                                                                gen-brownian-motion      2

amp
This is the amplitude for the Gaussian random number generator. In the context of this
function, it scales the standard deviation of the random component of the motion, making the
steps more or less random. Larger values of amp will result in more drastic random
movements in the particle's position.

lower and upper
These de ne the boundaries for the particle's motion. If the particle's position would go
beyond these limits, it's re ected back within the range.

drift
This is the drift rate for the Brownian motion. It's a deterministic component that
continuously pushes the particle in one direction. If drift is positive, the particle will tend
to move upwards; if it's negative, the particle will tend to move downwards.

delta
This is the time step size for the Brownian motion. It effectively scales the impact of the
drift and volatility on the particle's position. Larger values of delta will result in
more drastic movements in each step.

volatility
This is the volatility for the Brownian motion. It scales the random component of the motion,
similar to amp, but it's tied to the current position of the particle. Larger values of volatility
will result in more drastic random movements in the particle's position.

To summarize, drift and volatility control the deterministic and random components
of the motion, respectively. delta scales the impact of both of these components. amp and
volatility both in uence the randomness of the motion, but they do so in different
ways: amp scales the standard deviation of the underlying Gaussian random numbers, while
volatility scales the impact of these random numbers on the particle's position. lower
and upper limit ensure that the particle's position stays within a certain range, by re ecting
the position whenever it would go out of bounds.


Description:

This function simulates a particle moving according to Brownian motion, where the particle's
position is affected by both a constant drift and a random term. If the particle's position
crosses a speci ed upper or lower limit, it is re ected back into the valid range. The
randomness in the particle's motion is controlled by a Gaussian random number generator
with a speci ed amplitude.
  fi
       fi
            fi
                 fl
                      fl
                                              fl
                                                                                  fl
Opusmodus                                                                gen-brownian-motion   3

Brownian motion, named after the biologist Robert Brown, is a type of random motion
exhibited by particles which have been suspended in a uid (liquid or gas). This motion is the
result of the particle colliding with the fast-moving atoms or molecules in the uid.

Key characteristics of Brownian motion include:
It is non-deterministic: You cannot precisely predict the future position of a particle knowing
its present one.

It has stationary increments:
The probability distribution of the position of the particle after a certain period only depends
on the length of the period, not on the starting time.

It has independent increments:
The position of the particle after non-overlapping periods are statistically independent.

It exhibits statistical self-similarity:
Every smaller timescale of the motion statistically resembles the motion over a longer
timescale.

In the context of music, Brownian motion can be used to simulate variations and uctuations
in different musical parameters. The GEN-BROWNIAN-MOTION function could be used to
generate a sequence of pitches, velocities, or other parameters that uctuate randomly but
within certain bounds, potentially with some overall direction or trend.


Examples:
(gen-brownian-motion 128 :seed 876)


        0.56

        0.52

        0.48

        0.44

        0.40

        0.36

        0.32

        0.28

        0.24
                      20        40         60          80          100    120        140
                                                  fl
                                                              fl
                                                                          fl
                                                                                fl
Opusmodus                                             gen-brownian-motion   4

With amp set to 0.3:

(list-plot (gen-brownian-motion 128 :amp 0.3 :seed 876)
            :zero-based t :point-radius 1 :join-points t)


        1.00
       0.95
       0.90
       0.85
       0.80
       0.75
       0.70
       0.65
       0.60
       0.55
       0.50
                   20   40      60      80     100     120      140




With amp set to 0.8:

(list-plot (gen-brownian-motion 128 :amp 0.8 :seed 876)
            :zero-based t :point-radius 1 :join-points t)


       0.50
       0.45
       0.40
       0.35
       0.30
       0.25
       0.20
        0.15
        0.10
       0.05
       0.00
                   20   40      60      80     100     120      140
Opusmodus                                             gen-brownian-motion   5

With lower and upper limit:

(list-plot (gen-brownian-motion 128
            :lower 1.0 :upper 2.0 :seed 876)
            :zero-based t :point-radius 1 :join-points t)


        1.55
        1.50
        1.45
        1.40
        1.35
        1.30
        1.25
        1.20
        1.15
        1.10
        1.05
        1.00
                     20       40   60   80     100     120      140




With drift set to 0.5:

(list-plot (gen-brownian-motion 128 :drift 0.3 :seed 876)
            :zero-based t :point-radius 1 :join-points t)


        1.00
        0.95
        0.90
        0.85
        0.80
        0.75
        0.70
        0.65
        0.60
        0.55
        0.50
                     20       40   60   80     100     120      140
Opusmodus                                                       gen-brownian-motion     6

Five results to compare:

(list-plot
 (list
  (gen-brownian-motion 120 :seed 345)
  (gen-brownian-motion 120 :delta 1.0 :seed 345)

  (gen-brownian-motion
   120 :delta 1.0 :volatility 0.1 :seed 345)

  (gen-brownian-motion
   120 :delta 1.0 :volatility 0.1 :drift .02 :seed 345)

  (gen-brownian-motion
   120 :delta 1.0 :volatility 0.1 :drift -.02 :seed 345))
 :zero-based t :point-radius 1 :join-points t)


         1.0
         0.9
         0.8
         0.7
         0.6
         0.5
         0.4
         0.3
         0.2
         0.1
         0.0
                         20     40         60        80         100       120




Compare the output of the rst example with output from GEN-NOISE. Both outputs create
12 pitches.

(setf white-series
      (vector-to-pitch '(g3 b4) (gen-noise 12 :seed 23)))
=> (eb4 c4 c4 b4 b3 eb4 g3 gs3 e4 d4 bb4 d4)

(setf brownian-series
      (vector-to-pitch '(g3 b4) (gen-brownian-motion 12 :seed 23)))
=> (a3 g3 cs4 bb3 gs3 d4 e4 b4 gs4 bb4 gs4 eb4)

Mapping Brownian Motion to velocity symbols:

(vector-to-velocity 'ppp 'mf (gen-brownian-motion 12 :seed 23))
=> (pp ppp p pp ppp p p mf mp mf mp p)
                    fi
