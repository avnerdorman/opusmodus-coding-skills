Opusmodus                                                                       library   1

library name section data &key transpose collect repeat random seed
[Function]

Arguments and Values:
name                    library name.
section                 section name.
data                    data name.
collect                 list of integers. (position select) or :all
random                  an integer (random select to count).
transpose               an integer (transposition value for pitch libraries).
repeat                  and integer (data repeat).
seed                    an integer or NIL. The default is NIL.


Description:

The function LIBRARY makes possible the organisation and further processing of output
from a de ned library.

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

(library 'binary-rhythmics '4-bit-binary 'bin15)
=> (1 1 1 1)

(library 'binary-rhythmics '4-bit-binary nil :random 10)
=> ((1 1 0 1) (1 0 1 1) (0 1 0 1)
    (0 1 0 1) (1 1 0 1) (0 1 0 0)
    (0 0 1 0) (1 0 0 0) (0 1 1 0)
    (0 1 1 0))
   fi
     Opusmodus                                                                             library    2

     (library 'binary-rhythmics '4-bit-binary nil
              :collect '(1 2 3 2 1))
     => ((0 0 0 1) (0 0 1 0) (0 0 1 1) (0 0 1 0) (0 0 0 1))

     (library 'binary-rhythmics '4-bit-binary nil
              :collect :all)

     Above there is an example of a de ned library le followed by four possible output options.
     The rst is to output a single library entry. The second picks 10 entries at random. The third
     allows an integer list to determine which entries in the library list can be collected together in
     a set order. The fourth :all will collect the entire library.


     Examples:

     A collection of these patterns may be called n-times at random like this:

     (setf c-rhy (library 'binary-rhythmics
                          '4-bit-binary nil :random 10))
     => ((0 0 0 1) (0 1 0 1) (0 1 0 1) (1 0 0 0) (1 0 0 0)
         (0 0 0 0) (0 1 0 0) (1 0 1 0) (0 1 0 1) (1 1 1 0))

     Random selection can be enhanced and extended with the argument :repeat. For some
     library material the argument :transpose may also be valuable.

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

     (library 'slonimsky 'tritone nil :collect '(1 2 2 1 3 2))
     => ((c5 g4 fs4 cs4) (c4 d4 fs4 gs4) (c4 d4 fs4 gs4)
         (c5 g4 fs4 cs4) (c5 gs4 fs4 d4) (c4 d4 fs4 gs4))
fi
                                  fi
                                               fi
Opusmodus                                                                     library   3

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

See the Tutorial Guide Stages 28 for an example of LIBRARY in use within a piece of
Ragtime piano.
