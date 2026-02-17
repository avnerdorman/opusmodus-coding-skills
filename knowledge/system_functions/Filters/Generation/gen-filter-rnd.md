Opusmodus                                                                             gen-filter-rnd        1

gen-filter-rnd n size low high pitch length
                        &key velocity invert rotate seed

[Function]

Arguments and Values:
n                       Type: Integer. Speci es the number of lists to be generated. Each list is created
                        independently based on the provided parameters.

size                    Type: Integer. Determines the length of each list generated. This value controls
                        the number of elements in each output list.

low                     Type: Integer. De nes the minimum threshold for the balance of binary
                        integers (0s and 1s) in the generated lists. It in uences how frequently 0 or 1
                        appears in the list.

high                    Type: Integer. Sets the maximum threshold for the balance of binary integers
                        (0s and 1s). Together with the low parameter, it allows ne control over the
                        distribution of 0s and 1s.

pitch                   Type: List. A list of pitches to be used for populating the generated lists. Each
                        binary 1 in the generated binary sequence is mapped to a corresponding pitch
                        from this list.

length                  Type: Symbol or List. Speci es the rhythmic length or durations to be
                        associated with the pitches. This can either be a single symbol representing
                        a uniform length or a list of varying lengths corresponding to each pitch.

velocity                Type: List or NIL. An optional list of velocity values to be applied to each
                        pitch. If not provided (NIL), the default velocity is used for all notes.

invert                  Type: Boolean (NIL or T). If T, the binary sequence is inverted (0 becomes 1
                        and vice versa). The default is NIL, meaning no inversion is applied.

rotate                  Type: Integer or List. Speci es the number of steps by which the generated
                        list(s) should be rotated. A positive value rotates to the right, and a negative
                        value to the left. If a list of integers is provided, each generated list will be
                        rotated by the corresponding value.

seed                    Type: Integer or NIL. Sets the seed for the random number generator, ensuring
                        reproducibility of the random sequence. If NIL, no speci c seed is used, and
                        the sequence will vary with each run.


Description:

The GEN-FILTER-RND function generates one or more lists containing binary-controlled
data (e.g., pitches and rhythms), with extensive customisation options for controlling
                                  fi
                                       fi
                                             fi
                                                  fi
                                                                 fl
                                                                           fi
                                                                                fi
Opusmodus                                                                        gen-filter-rnd   2

randomness and variability. The binary sequences can be in uenced by setting the low and
high parameters, which adjust the likelihood of 0 or 1 appearing in the list. This function is
versatile and can produce complex musical structures by controlling and ltering the input
material (e.g., pitch lists). The generated sequences can be used directly in composition,
especially when combined with the ltering mechanism that this function supports.


Examples:

Basic Random List Generation:

(setf mat (rnd-sample 20 '(c4 d4 e4 fs4 gs4) :seed 234))
=> (gs4 e4 e4 d4 e4 gs4 d4 c4 fs4 gs4
    e4 e4 c4 e4 gs4 d4 gs4 fs4 fs4 d4)

(gen-filter-rnd 3 8 1 3 mat 's :seed 46)
=> ((-s - e4 d4 e4 - - -)
    (s fs4 gs4 - e4 c4 e4 - -)
    (-s - - d4 - - - d4))

This example generates three lists of length eight, where mat provides the pitch material. The
binary lter determines which pitches appear, with the balance of 0s and 1s controlled by the
low and high parameters.

If a single list is required then append the function FLATTEN to the head of the expression.

(flatten (gen-filter-rnd 3 8 1 3 mat 's :seed 46))
=> (-s - e4 d4 e4 - - - s fs4 gs4 - e4
    c4 e4 - - -s - - d4 - - - d4)

Inverting the Binary Sequence:

One further feature of this function lies in the use of the keyword :invert. This is common
to all GEN-FILTER functions and is based on one of the building blocks of the ltering
process, conversion into a binary list. As a binary list can be inverted (1 0 0 1 1 0) can
become (0 1 1 0 0 1) the possibility of two outcomes can be realised giving the
composer a further possibility of variation.

(gen-filter-rnd 3 8 1 3 mat 's :invert t :seed 46)
=> ((s gs4 e4 - - - gs4 d4 c4) (-s - e4 - - - gs4 d4)
    (s gs4 fs4 fs4 - gs4 e4 e4 -))

In this example, the binary sequence is inverted, leading to an altered distribution of pitches
compared to the non-inverted case.
fi
                              fi
                                                      fl
                                                                     fi
                                                                            fi
     Opusmodus                                                                   gen-filter-rnd   3

     Rotation of the Generated Lists:

     (gen-filter-rnd 10 13 2 4 mat 's :rotate '(-1 2 0 1) :seed 457)
     => ((s gs4 - - - - gs4 d4 c4 - - - - c4)
         (s e4 gs4 - - fs4 fs4 d4 gs4 - - - e4 gs4)
         (s d4 c4 - - - - c4 e4 gs4 - - - -)
         (s d4 - - - - e4 gs4 - - - gs4 e4 e4)
         (s c4 - - d4 gs4 fs4 - - - - e4 d4 e4)
         (-s - - - gs4 e4 - - - gs4 d4 - -)
         (s fs4 d4 gs4 e4 - - e4 gs4 d4 - - - -)
         (s e4 - - - d4 gs4 fs4 fs4 - - - - d4)
         (s e4 gs4 d4 - - gs4 e4 e4 - - - - gs4)
         (s fs4 fs4 - - - e4 d4 e4 - - - - gs4))

     This example demonstrates the rotation feature, where each list is rotated by the values
     speci ed in the :rotate parameter, resulting in varied pattern structures.

     Complex Example with Random Velocities:

     (gen-filter-rnd
      10 13 1 7
      (vector-to-pitch '(g4 g5) (gen-noise 64 :seed 246))
      (vector-to-length 's 1 5 (gen-noise 64 :seed 456))
      :velocity (vector-to-velocity 'mp 'ff (gen-noise 64 :seed 546)))

     => ((-s -q - -e. -s -e -q_s eb5 f e gs4 -e. d5 mf fs5 f q_s gs4 mp)
         (q_s c5 e bb4 f g4 mp q fs5 e a4 mf q gs4 eb5 ff -q_s q f5
          - -e -q -s)
         (-e. -e f5 f -q - - - b4 ff e5 f q_s d5 mf e. g5 q f5 ff e. d5 f)
         (q fs5 ff e mf q c5 mp e gs4 mf cs5 mp -e. -s - -e. -e -q_s -s
          q_s bb4 mf)
         (-s -e -e. -q_s -q -e. - e f5 mp q d5 f e c5 e. f5 mf q_s s bb4 f)
         (q gs4 f f e. eb5 -s -e -q_s - -e -e. - fs5 q_s gs4 mp c5 mf)
         (-e g4 mp q fs5 e a4 mf q gs4 eb5 ff q_s g5 mp
          q f5 ff - e f5 mf q fs5 s e5 ff e. bb4 f)
         (e cs5 f5 f q a4 mp f bb4 mf fs5 b4 ff - -q_s -e. -q -e. -q)
         (-e -q e gs4 cs5 mp -e. -s - -e. -e -q_s -s q_s bb4 mf s e5 f)
         (e a4 f e. e5 q_s gs4 q bb4 mf e. c5 eb5 e f5 mp
          -q -e -e. -q_s -s -q))

     In this example, GEN-FILTER-RND generates 10 complex rhythmic and pitch patterns
     using randomised velocities and varying rhythmic lengths. The pitches and lengths are
     derived from random noise vectors, demonstrating how the function can be used to create
     intricate and highly varied musical textures.
fi
