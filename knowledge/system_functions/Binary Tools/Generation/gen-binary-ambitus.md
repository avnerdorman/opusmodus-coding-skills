Opusmodus                                                                         gen-binary-ambitus   1

gen-binary-ambitus ambitus sequence &key section exclude
[Function]

Arguments and Values:
sequence                  a list of items.
ambitus                   instrument name, an integer list or pitch list (low high).
section                   an integer or list of integers. Selected list or lists to process.
                          The default is NIL.
exclude                   an integer or list of integers. Excluded list or lists from process.
                          The default is NIL.


Description:

The GEN-BINARY-AMBITUS function identi es and assigns the value of 0 to any pitch
outside the range, while assigning the value of 1 to those within the range. The output of the
function is a list of binary numbers.


Examples:

(setf stream
        (integer-to-pitch
         (vector-round -12 24 (gen-noise 30 :seed 12))))
=> (fs3 gs4 e3 a3 gs4 d4 eb4 a5 g4 c6 d4 a3 eb3 f5 fs5
    eb5 f5 fs4 d3 b5 b5 c4 d3 e4 c6 c3 eb3 eb3 eb3 gs5)

(setf map (gen-binary-ambitus '(c4 cs5) stream))
=> (0 1 0 0 1 1 1 0 1 0 1 0 0 0 0 0 0 1 0 0 0 1 0 1 0 0 0 0 0 0)

(binary-map map stream)
=> (gs4 gs4 d4 eb4 g4 d4 fs4 c4 e4)

Using name parameter :list T.

(binary-map map stream :list t)
=> ((gs4) (gs4 d4 eb4) (g4) (d4) (fs4) (c4) (e4))



Score Example:

This function acts like a lter and is ideal as an orchestration tool. Imagine a woodwind choir
whose texture is fragmented by such an ambitus lter acting over a particular pitch range.
Built into this example is a phrase for clarinet and horn.
                  fi
                                            fi
                                                  fi
Opusmodus                                                 gen-binary-ambitus   2

(setf stream
      (integer-to-pitch
       (vector-round -12 24 (gen-noise 30 :seed 12))))
=> (fs3 gs4 e3 a3 gs4 d4 eb4 a5 g4 c6 d4 a3 eb3 f5 fs5
    eb5 f5 fs4 d3 b5 b5 c4 d3 e4 c6 c3 eb3 eb3 eb3 gs5)

(setf map (gen-binary-ambitus '(c4 cs5) stream))
=> (0 1 0 0 1 1 1 0 1 0 1 0 0 0 0 0 0 1 0 0 0 1 0 1 0 0 0 0 0 0)

(setf fragment (binary-map map stream))
=> (gs4 gs4 d4 eb4 g4 d4 fs4 c4 e4)

(setf rhy (binary-map map 's :omn t))
=> (-s = - - = = = - = - = - - - - - - = - - - = - = - - - - - -)

(def-score duo
             (:title "duo"
              :key-signature 'chromatic
              :time-signature '(3 4)
              :tempo 60)

  (clarinet
   :length rhy
   :pitch stream
   :velocity '(f)
   :channel 1
   :sound 'gm
   :program 'clarinet)

  (horn
   :length rhy
   :pitch fragment
   :velocity '(ff)
   :channel 2
   :program 'french-horn))
