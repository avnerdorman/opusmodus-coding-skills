     Opusmodus                                                               brownian-motion-sample        1

     brownian-motion-sample steps sequence &key start amp
                                             lower upper drift delta
                                             volatility seed

     [Function]

     Arguments and Values:

     steps                     the number of steps to simulate.
     sequence                  a sequence of parameters.
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
fl
         fl
                      fi
                                                      fi
Opusmodus                                                             brownian-motion-sample      2

start
This is the starting position for the particle in the Brownian motion simulation.

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
  fi
        fi
                 fl
                      fl
                                              fl
                                                                                  fl
Opusmodus                                                            brownian-motion-sample    3

randomness in the particle's motion is controlled by a Gaussian random number generator
with a speci ed amplitude.

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
in different musical parameters.

The function BROWNIAN-MOTION-SAMPLE maps a speci ed sequence of parameters such
as pitches or velocities to the results derived from the Brownian motion.

(brownian-motion-sample 24 '(0 1 2 3 4 5 6 7 8 9 10 11))
=> (3 0 0 1 1 3 3 5 7 7 4 6 8 7 6 8 8 11 11 6 9 10 10 11)


Examples:
(brownian-motion-sample 12 '(c4 d4 e4 fs4 gs4 a4 d5 e5 fs5) :seed 45)
=> (c4 e4 d4 d4 c4 fs4 fs4 d4 d4 gs4 fs5 gs4)

(brownian-motion-sample 12 '(s s s -s e e h -q q s s e) :seed 45)
=> (s s s s s e e s s h e e)

(brownian-motion-sample 12 '(ppp pp p mp mf f ff) :seed 45)
=> (ppp pp pp pp ppp p mp pp pp mp ff mp)
     fi
                                                  fl
                                                       fi
                                                                          fl
                                                                               fl
Opusmodus                                          brownian-motion-sample   4

OMN:

(progn
 (setf
  row (library 'vienna 'berg 'r15)
  pitch (relative-closest-path
         (harmonic-progression '(0 3 4 0 -2 -3 -1 0 -2) row))
  length '(s s s -s -e e q -q q s s e)
  velocity '(pp p mp mf f ff)
  mat (make-omn
       :length (brownian-motion-sample 64 length)
       :pitch (brownian-motion-sample 64 pitch)
       :velocity (brownian-motion-sample 64 velocity)))

    (ps 'gm :grand (list mat)
        :time-signature '(4 4))
)
