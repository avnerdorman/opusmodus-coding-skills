Opusmodus                                                                 time-signature-length   1

time-signature-length form &key sum
[Function]

Arguments and Values:
form                      a list of time-signature forms: (<beats> <denominator> <length>).
sum                       NIL or T. Use :sum T to return total sum of all time-signatures.
                          The default is NIL.


Description:

The function TIME-SIGNATURE-LENGTH is present to enable the proper presentation of a
score into bars.

(time-signature-length '((4 4 1) (3 4 1) (3 8 2)))
=> (1 3/4 3/4)

Calculate lengths of a list of time-signatures:

(time-signature-length '((4 4 1) (3 4 1) (3 8 2)))
=> (1 3/4 3/4)

Calculate the entire duration of a series of time-signatures:

(time-signature-length '((4 4 1) (3 4 1) (3 8 2)) :sum t)
=> 5/2


Examples:

This is realised in the MIDI graphic display and in the MusicXML notation. In
OPUSMODUS time signatures are de ned in terms of beats, denominators and the duration
that they last in bars. Therefore, one bar of 3/4 is de ned '(3 4 1), but two bars of the
same will be de ned '(3 4 2). Additionally, the time-signature is contained in the
function DEF-SCORE, as in the two examples below.

(def-score Goodbye-Pork-Pie-Hat
           (:title "Goodbye Pork Pie Hat"
            :composer "Charles Mingus"
            :key-signature '(f minor)
            :time-signature '(4 4)
            :tempo 56)
             fi
                                 fi
                                                  fi
Opusmodus                                                            time-signature-length   2

(def-score venitianPrelude
           (:title "venitianPrelude"
            :key-signature '(c maj)
            :time-signature (get-time-signature omnlist)
            :tempo 122)

In the second example above the time signature is called from a variable, in this case a
collection of different bars of different lengths and thus different time signatures '(1/2
5/4 4/4) processed by RND-SAMPLE to give 32 items.

(setf len1 (rnd-sample 32 '((s = -s = = - = = = = - = = = = =)
                            (h) (e = -s = - =) (q - = - e =))))

(get-time-signature len1)
=> ((1 2 1) (5 4 1) (1 2 5) (4 4 1) (1 2 2)
    (4 4 2) (5 4 1) (1 2 1) (4 4 1) (5 4 1)
    (1 2 2) (4 4 1) (1 2 1) (5 4 1) (4 4 1)
    (5 4 1) (4 4 2) (1 2 4) (4 4 1) (1 2 2))

In order to calculate the time signatures needed to show correct bar and beat grouping on
MusicXML the function TIME-SIGNATURE-LENGTH has to use the output provided by
GET-TIME-SIGNATURE.
