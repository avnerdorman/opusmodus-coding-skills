Opusmodus                                                                  axis-sub-plot      1

axis-sub-plot axis direction displacement plot
[Function]

Arguments and Values:
axis                    an integer or NIL.
direction               symbol (a, b, c, d).
displacement            an integer list.
plot                    an integer (octaves).


Description:

This is a function at the heart of the OPUSMODUS realisations of interference techniques
found in the Schillinger System of Music Composition. This system, popular in the USA in
the mid 20C and studied by Gershwin and many lm composers, has been reassessed in
recent years by Dr Jeremy Arden.

Once the initial AXIS-PLOT has been achieved it is often desirable to add a second level of
complexity. Schillinger observed that melodies do not move in straight lines and so he
devised a method to superimpose other forms of motion on the secondary axis
directions. This is like superimposing a wiggly line on a straight line, a form of
ornamentation. In this way melodies become more exible and complex.

AXIS-SUB-PLOT works in the following way. An axis has a displacement from the
primary axis. For instance, in the example below, as shown in the plot argument, it rises
away from the axis by an octave '(0 12). Now a further set of axis are superimposed on
it. These also have displacements and directions away from their axis-axes upon
axes. The directions a b c d are identical to those described in the function AXIS-
PLOT.

(axis-sub-plot 0 '(a b a b) '(4 4 7 7) '(0 12))
=> (0 4 0 7 0 12)

In the above '(a b a b) = directions of the sub-axes, '(4 4 7 7) = the
displacements of the sub-axes, '(0 12) = the displacement of the main axis to
which the sub-axes are attached.

(axis-sub-plot 1 '(a b a b) '(4 4 7 7) '(0 12))
=> (0 5 1 8 1 12)

(axis-sub-plot 2 '(a b a b) '(4 4 7 7) '(0 12))
=> (0 6 2 9 2 12)
                                            fi
                                                 fl
Opusmodus                                                                   axis-sub-plot   2

(axis-sub-plot nil '(a b a b) '(4 4 7 7) '(0 12))
=> (0 6 5 14 10 12)


Examples:

Here, in the example below, they are '(a b a b) - a = away from the primary axis in
the upwards direction. b = towards primary axis, downwards. This function and its
companion AXIS-PLOT are interference functions best suited to the generation of melodic
material. Here's how pitch material might be created.

(setf ax-1 (axis-sub-plot 0 '(a b a b) '(4 4 7 7) '(0 12)))
=> (0 4 0 7 0 12)

Notice the relationship or correspondence between the displacement integers and their
conversion to pitch. The integers actually represent interval values and allow the composer to
model the extent of the direction of the plot.

(integer-to-pitch ax-1)
=> (c4 e4 c4 g4 c4 c5)

(setf ax-2
      (integer-to-pitch
       (axis-sub-plot 1 '(a b a b) '(4 4 7 7) '(0 12))))
=> (c4 f4 cs4 gs4 cs4 c5)

(setf ax-3
      (integer-to-pitch
       (axis-sub-plot 2 '(a b a b) '(4 4 7 7) '(0 12))))
=> (c4 fs4 d4 a4 d4 c5)

As the example above demonstrates, as the axis integer is raised from 0 to 12 the pitch series
opens out a semitone at a time.
