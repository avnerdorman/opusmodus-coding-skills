Opusmodus                                                                    binary-to-length   1

binary-to-length binary &key value omn
[Function]

Arguments and Values:
binary                 map (a binary list).
value                  length symbol or ratio. The default is 1/16.
omn                    NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

This function enables length durations to be devised from a binary stream. Thus, a
sequence of (1 0 0 0) with a length ratio of 1/16 will output 1/4 — 1 is a note and 0
is an extension of 1.


Examples:
(binary-to-length '(1 0 0 0 1 0 0 1 0 1 0 0))
=> (1/4 3/16 1/8 3/16)

(binary-to-length '(1 0 0 0 1 0 0 1 0 1 0 0) :omn t)
=> (q e. e e.)

(binary-to-length '((1 0 0 0 1) (1 0 0 1 0 1 0 0)) :omn t)
=> ((q s) (e. e e.))

(setf r1 '(s - - - e = -))

(binary-to-length (gen-binary-length r1) :value r1 :omn t)
=> (q e q)

To explain how BINARY-TO-LENGTH works in context follow this example:

(setf cello-part
      (integer-to-pitch
       (vector-round -24 12 (gen-noise 30 :seed 45))))
=> (a2 eb2 fs4 g4 eb4 f4 fs3 d2 b4 c5 c3 d2 e3 c5 c2 eb2
    eb2 eb2 gs4 e2 b3 bb2 cs3 f3 bb2 a3 gs2 b4 e3 c2)

(setf viola-part (ambitus '(c4 g5) cello-part))
=> (a4 eb4 fs4 g4 eb4 f4 fs4 d4 b4 c5 c4 d4 e4 c5 c4 eb4
    eb4 eb4 gs4 e4 b4 bb4 cs4 f4 bb4 a4 gs4 b4 e4 c4)

The example above show how AMBITUS transforms the cello part into a range playable by a
viola.
Opusmodus                                                                binary-to-length     2

(setf viola-var (ambitus-filter '(db3 a5) cello-part))
=> (fs4 g4 eb4 f4 fs3 b4 c5 e3 c5 gs4 b3 cs3 f3 a3 b4 e3)

This variation above shows how AMBITUS-FILTER creates a new part for the viola
removing rather than transposing or inverting notes outside the viola's given range - between
c2 and b3. Compare the binary output with the cello part. Notice that the binary list has to
be inverted to show the output position of the viola-part.

(setf va (binary-invert
          (gen-binary-remove viola-var cello-part)))
=> (0 0 1 1 1 1 1 0 1 1 0 0 1 1 0 0 0 0 1 0 1 0 1 1 0 1 0 1 1 0)

(setf va-rhy (binary-map va 's :omn t))
=> (-s - = = = = = - = = - - = = - - - - = - = - = = - = - = = -)

The BINARY-TO-LENGTH function below outputs the same rhythm as BINARY-MAP but
with extended durations. Notice however the rst item in the list should be -1/8! To alter a
length to a rest-length simply use POSITION-REPLACE.

(setf va-rhy-d (binary-to-length va))
=> (1/8 1/16 1/16 1/16 1/16 1/8 1/16 3/16 1/16
    5/16 1/8 1/8 1/16 1/8 1/8 1/16 1/8)

(position-replace 0 -1/8 va-rhy-d)
=> (-1/8 1/16 1/16 1/16 1/16 1/8 1/16 3/16 1/16
    5/16 1/8 1/8 1/16 1/8 1/8 1/16 1/8)

The example below show how to generate length directly from a melodic line itself. First,
lets generate the melodic line:

(setf basemel
      (vector-to-pitch '(g3 c6)
       (vector-smooth 0.13 (gen-noise 256 :seed 65))))

Create a map with MAKE-BINARY-CHANGE:

(setf map (gen-binary-change basemel))

Now lets generate length from melodic line:

(setf len (binary-to-length map))

Remove the repeated notes from mel with FILTER-REPEAT:

(setf mel (filter-repeat 1 basemel))

(setf final-mel (make-omn :length len :pitch mel))
                                       fi
