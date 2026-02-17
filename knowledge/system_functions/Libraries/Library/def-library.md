Opusmodus                                                                        def-library    1

def-library name section data
[Macro]

Arguments and Values:
name                      library name.
section                   section name.
data                      data name.


Description:

The DEF-LIBRARY function opens up a whole new set of possibilities for the composer
using OPUSMODUS. It can prove a very powerful tool not just as somewhere to store
material but a location for data that can be 'called' directly from within an active program.
Libraries can quickly become a valuable resource for composers able to store rhythmic
patterns, scales and melodic sequences, interval and chord sets.

(def-library Binary-Rhythmics
         (:section 4-bit-binary
                  bin0 '(0 0 0 0)
                  bin1 '(0 0 0 1)
                  bin2 '(0 0 1 0)
                  bin3 '(0 0 1 1)
                  bin4 '(0 1 0 0)
                  bin5 '(0 1 0 1)
                  bin6 '(0 1 1 0)
                  bin7 '(0 1 1 1)
                  bin8 '(1 0 0 0)
                  bin9 '(1 0 0 1)
                  bin10 '(1 0 1 0)
                  bin11 '(1 0 1 1)
                  bin12 '(1 1 0 0)
                  bin13 '(1 1 0 1)
                  bin14 '(1 1 1 0)
                  bin15 '(1 1 1 1)))


Examples:

To explain how the library system works let's de ne a library entry based on a collection of
Binary Rhythms. Sometimes it's possible, as in the 4-bit-binary le example below,
that a library can be generated algorithmically. The function COMBINATION2 can generate
all the binary instances of the pattern '(1 0 1 0).
                                           fi
                                                                 fi
Opusmodus                                                                    def-library   2


(combination2 4 '(1 0 1 0))
=> ((0 0 0 0) (1 0 0 0) (0 1 0 0) (1 1 0 0)
    (0 0 1 0) (1 0 1 0) (0 1 1 0) (1 1 1 0)
    (0 0 0 1) (1 0 0 1) (0 1 0 1) (1 1 0 1)
    (0 0 1 1) (1 0 1 1) (0 1 1 1) (1 1 1 1))

We could copy and paste the print out from the Listener and attach identifying name.
However, it is possible to assemble a library semi-automatically using the function
CREATE-LIBRARY.

(create-library 'Binary-Rhythmics '4-bit-binary 'bin
                (combination2 4 '(1 0 1 0)))

The print out in the Listener is as follows:

=> (def-library binary-rhythmics
        (:section 4-bit-binary
        bin0 '(0 0 0 0)
        bin1 '(1 0 0 0)
        bin2 '(0 1 0 0)
        bin3 '(1 1 0 0)
        bin4 '(0 0 1 0)
        bin5 '(1 0 1 0)
        bin6 '(0 1 1 0)
        bin7 '(1 1 1 0)
        bin8 '(0 0 0 1)
        bin9 '(1 0 0 1)
        bin10 '(0 1 0 1)
        bin11 '(1 1 0 1)
        bin12 '(0 0 1 1)
        bin13 '(1 0 1 1)
        bin14 '(0 1 1 1)
        bin15 '(1 1 1 1)
       ))

(library 'binary-rhythmics '4-bit-binary 'bin15)
=> (1 1 1 1)

A collection of these patterns may be called n-times at random like this:

(setf c-rhy (library 'binary-rhythmics
                     '4-bit-binary nil :random 10))
=> ((0 0 0 1) (0 1 0 1) (0 1 0 1) (1 0 0 0) (1 0 0 0)
    (0 0 0 0) (0 1 0 0) (1 0 1 0) (0 1 0 1) (1 1 1 0))
Opusmodus                                                                        def-library   3

Another option allows an integer list to determine which entries in the library list can be
collected together in a set order.

(setf template '(11 12 7 9 15 13 12 4 2 6))

(setf lh-rhy (library 'binary-rhythmics '4-bit-binary
                       nil :collect template))

Random selection can be enhanced and extended with the argument :repeat. For some
library material the argument :transpose may also be valuable.

Now let's make this into a percussion part for conga drums.

(setf c-rhys (gen-divide 4 (binary-map (flatten c-rhy) 1/16)))
=> ((1/16 -1/16 -1/16 1/16)
    (-1/16 -1/16 -1/16 -1/16)
    (-1/16 1/16 -1/16 1/16)
    (1/16 -1/16 -1/16 -1/16)
    (1/16 -1/16 -1/16 1/16)
    (1/16 -1/16 -1/16 -1/16)
    (-1/16 -1/16 1/16 -1/16)
    (-1/16 1/16 -1/16 1/16)
    (1/16 -1/16 1/16 1/16)
    (-1/16 -1/16 1/16 1/16))

(setf c-pitches (span c-rhys '(c4 cs4))) ; GM conga pitches
=> ((c4 cs4) nil (c4 cs4) (c4) (cs4 c4) (cs4) (c4)
    (cs4 c4) (cs4 c4 cs4) (c4 cs4))

(make-omn
 :length c-rhys
 :pitch c-pitches
 :velocity '(mf))
=> ((s c4 - - cs4) (-s - - -) (-s c4 - cs4)
    (s c4 - - -) (s cs4 - - c4) (s cs4 - - -)
    (-s - c4 -) (-s cs4 - c4) (s cs4 - c4 cs4)
    (-s - c4 cs4))
Opusmodus                                                  def-library   4

Here are some further examples of de ning libraries.

(def-library rhythms1
        (:section dance
                 Pavane '((q =) (q. e q =) (q =))
                 Galliarde '((h) (h. q h) (h = =) (w))
                 Allemande '((s) (q_s s = = q =))
                 Courante '((q) (h q) (q. e q) (h.) (h))
                 Chaconne '((q q. e) (q h))
                 Bourree '((e =) (q e = q =))
                 Sarabande '((h h. q) (h =))
                 Gavotte '((q =) (h q =) (h))
                 Siciliano '((e. s e e. s e) (q. =))
                 Gigue '((e) (e = = e = =) (e = = q))
                 Menuett '((q = =) (q = =))
                 Polonaise '(e s = e = = =)
                 Mazurka '((e. s q =) (e. s q =))
                 Walzer '((q = =) (h q) (h q))
                 Bolero '(e s = = e s = = e =)
                 Polka '((e = e. s) (e = = -))
                 Galopp '((s) (e. s e -s =) (e. s e -s))
                 Habanera '((e. s e =) (e. s e =))
                 Tango '((s e s e e) (s e s e e))
                 English-Waltz '((q = =) (q h) (q h))
                 Foxtrott '((q = = =) (q = = =))
                 Charleston '((q -e e_h) (q -e e_h))
                 Rumba'((e = =) (e = =) (e =))
                 Samba '((e q e q =) (e q e q =))
                 Cha-Cha-Cha '(e s = e = = = = =)))

(library 'rhythms1 'dance 'Bolero)
=> (e s = = e s = = e =)

(library 'rhythms1 'dance 'Bolero :repeat 8)
=> (e s = = e s = = e =
    e s = = e s = = e =
    e s = = e s = = e =
    e s = = e s = = e =
    e s = = e s = = e =
    e s = = e s = = e =
    e s = = e s = = e =
    e s = = e s = = e =)

(library 'slonimsky 'tritone 's10d)
=> (c5 b4 gs4 fs4 f4 d4)

(library 'slonimsky 'tritone 's10d :transpose -12)
=> (c4 b3 ab3 gb3 f3 d3)
                              fi
Opusmodus                                      def-library   5

(library 'slonimsky 'tritone nil :random 10)
=> ((c4 cs4 d4 ds4 e4 fs4 g4 gs4 a4 as4)
    (c5 as4 a4 fs4 ds4 d4)
    (c4 cs4 d4 fs4 as4 b4)
    (c5 as4 a4 fs4 ds4 d4)
    (c5 cs5 gs4 e4 fs4 g4 d4 as3)
    (c4 ds4 f4 fs4 g4 a4)
    (c4 d4 b4 fs4 gs4 f5)
    (c4 b4 a4 g4 fs4 f5 ds5 cs5)
    (c5 cs4 fs4 g3)
    (c5 a4 f4 fs4 ds4 b3))
