Opusmodus                                                                     key-signature-length   1

key-signature-length form &key sum
[Function]

Arguments and Values:
form                      a list of key-signature forms: (<pitch> <tonality-name> <length>).
sum                       use :sum T to sum all key-signatures. The default is NIL.


Description:

The function KEY-SIGNATURES-LENGTH is used to work out the duration in which a
particular key is present in a phrase or section.

Calculate duration of each key-signature in a list:

(key-signature-length '((g maj 8/4) (e maj 6/4)))
=> (2 3/2)

Calculate the entire duration of a series of time signatures:

(key-signature-length '((g maj 8/4) (e maj 6/4)) :sum t)
=> 7/2


Examples:

Key signatures in OPUSMODUS are de ned in terms of pitch, tonality and the duration that
they last in beats. Therefore, one two 4/4 bars in G-major would be de ned '(g maj
8/4). The calculation is all about the length that a key signature is to be shown in the
MusicXML Notation.

(key-signature-length
 '((g maj 3) (e maj 3) (c m 1) (e m 1) (a m 1) (f maj 2)))
=> (3 3 1 1 1 2)

(def-score Goodbye-Pork-Pie-Hat
           (:title "Goodbye Pork Pie Hat"
            :composer "Charles Mingus"
            :key-signature '(f minor)
            :time-signature '(4 4)
            :tempo 56)
                                   fi
                                                                         fi
Opusmodus                                            key-signature-length   2

(def-score venitianPrelude
           (:title "venitianPrelude"
            :key-signature '(c maj)
            :time-signature (get-time-signature omnlist)
            :tempo 122)
