Opusmodus                                                                       axis-plot   1

axis-plot axis direction displacement
[Function]

Arguments and Values:
axis                     an integer list.
direction                symbol (a, b, c, d).
displacement             an integer list.


Description:

The American composer and theorist Joseph Schillinger believed in the biological origin of
melody. For example, the emotion of joy is an expansive physical gesture, fear usually makes
us shrink away or contract. A melody must have a point of balance, a pitch which roots it.
This is represented by the rst parameter in the function. Schillinger represents this balance
point as a horizontal line on a graph. A melody moving towards the line from above or below
represents contraction, the diminution of energy. A melody moving away from the balance
line is expanding and gaining energy. These melodic directions are called secondary axes to
distinguish them from the balance line which is the primary axis.

AXIS-PLOT allows you to specify the direction of the melody: a = away from the
primary axis in the upwards direction. b = towards primary axis, downwards. c =
towards axis, upwards. d = away from axis downwards. In addition we must say how far in
pitch the melody moves from the primary axis. This is the second part of AXIS-PLOT.

This is a function at the heart of the OPUSMODUS realisations of interference techniques
found in the Schillinger System of Music Composition. This system, popular in the USA in
the mid 20C and studied by George Gershwin and many lm composers, has been reassessed
in recent years by Dr Jeremy Arden.

(interference2 '(8 5))
=> (5 3 2 5 1 4 4 1 5 2 3 5)

The INTERFERENCE2 function creates a list of displacement values, that is
displacement from the base value, in pitch terms think c4. Studying the output of the
AXIS-PLOT function with direction symbols '(a b c d) it can be seen in the
example below that the output goes upwards from axis '(0 5), downwards to axis (3 0),
upwards towards axis '(-2 0), then downwards from axis. Look at the rst four
displacement integers 5 3 2 5.
                   fi
                                                  fi
                                                                       fi
Opusmodus                                                                        axis-plot     2

(axis-plot 0 '(a b c d) '(5 3 2 5 1 4 4 1 5 2 3 5))
=> ((0 5) (3 0) (-2 0) (0 -5) (0 1) (4 0)
    (-4 0) (0 -1) (0 5) (2 0) (-3 0) (0 -5))


Examples:
(setf plot-b (axis-plot 0 '(a b c d) '(5 3 2 5 1 4 4 1 5 2 3 5)))
=> ((0 5) (3 0) (-2 0) (0 -5) (0 1) (4 0)
    (-4 0) (0 -1) (0 5) (2 0) (-3 0) (0 -5))

The total output creates a complex symmetrical pattern. In pitch conversion this appears as:

(setf pitch-plot-b (integer-to-pitch plot-b))
=> ((c4 f4) (eb4 c4) (bb3 c4) (c4 g3) (c4 cs4) (e4 c4)
    (gs3 c4) (c4 b3) (c4 f4) (d4 c4) (a3 c4) (c4 g3))

Listen to it as a complete sequence:

(flatten pitch-plot-b)
=> (c4 f4 eb4 c4 bb3 c4 c4 g3 c4 cs4 e4 c4
    gs3 c4 c4 b3 c4 f4 d4 c4 a3 c4 c4 g3)
