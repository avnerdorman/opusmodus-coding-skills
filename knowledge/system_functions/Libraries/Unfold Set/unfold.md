Opusmodus                                                                            unfold   1

unfold name method sequence
[Function]

Arguments and Values:
name                     method-set name.
method                   method name with optional bar and event number.
sequence                 omn-form sequence.


Description:

The DEF-UNFOLD-SET and UNFOLD function opens up a whole new set of possibilities for
the composer using OPUSMODUS. It can prove a very powerful tool in de ning methods
(functions) from the outset, for a speci c work or as a global index of your most used
functions. To be able to store methods, processes and solutions and call them at anytime
becomes a valuable resource for a composers work ow. This function is a companion to the
DEF-UNFOLD-SET function.

A method is a collation of functions, generically ‘instructions’, that are applied to a de ned
set of data (or to a speci ed parts of it). This set of data is de ned as the object of the
method. The functions method are applied sequentially: the rst function acts directly on the
object data, the next on the object data modi ed by the previous one and so on. In the context
of structured programming (object oriented) the method is conceptually similar to the
subroutine (subroutine) of linear programming.

Method applied to entire sequence:

(unfold 'name 'method sequence)

Method1 applied to 2nd bar only:

(unfold 'name '((method1 2) method2) sequence)

Method1 applied to the 3rd event in the 1st bar:

(unfold 'name '((method1 1 3) method2) sequence)

(setf mat '((s c4 d4 e4 f4 g4) (s c4 d4 e4 f4 g4) (s c4 d4 e4 f4 g4)))

(unfold 'om 't7 mat)
=> ((s g4 a4 b4 c5 d5) (s g4 a4 b4 c5 d5) (s g4 a4 b4 c5 d5))

(unfold 'om '((t-12 1 3) (t-1 2) (r 3)) mat)
=> ((s c4 mf d4 e3 f4 g4) (s b3 cs4 eb4 e4 fs4) (s g4 f4 e4 d4 c4))
                 fi
                                fi
                                      fi
                                              fl
                                                       fi
                                                            fi
                                                                           fi
                                                                                fi
Opusmodus                                                                   unfold     2

(unfold 'om '? mat)
=> ((s c4 d4 e4 f4 g4) (s g4 a4 bb4 c5 d5) (s c4 bb3 gs3 g3 f3))

Before you start using the function you must rst de ne a DEF-UNFOLD-SET library with
the number of methods you want to call in your work.

(def-unfold-set ie
                 :methods
  (:group transp
          t7   (:pitch (pitch-transpose 7 x))
          t-12 (:pitch (pitch-transpose -12 x))

            :group basic
            ret (:all (gen-retrograde x :flatten t))
            var (:pitch (pitch-variant x :variant '? :seed (seed)))
            gf   (nil (gen-fragment '(3) '(3) x :seed (seed)))
            ld   (nil (length-divide '(2 2) x))
            lrq (:length (length-rational-quantize x))
            dyn (:velocity (velocity-to-dynamic x))
            ls   (nil (length-span '(6/4 6/4) x))

            :group ambitus
            ob   (:pitch (ambitus 'oboe x))
            bn   (:pitch (ambitus 'bassoon x))
            hn   (:pitch (ambitus 'french-horn x))
            ))


Examples:

Two bars of omn (opusmodus notation):

(setf mat '((q d4 pp s eb4 < leg g4 < leg bb4 < leg a4 q. cs5 mf
             -e 3q gs5 > leg fs5 > leg c5 > b4 > leg f4 leg e4)
            (t d4 < leg eb4 < leg g4 < leg bb4 q. a4 marc
             t fs4 mf leg gs4 leg e. c5 e b4 t f5 leg e5 leg d5 leg eb5
             3q bb5 > a4 > bb5 > e a4 pp stacc -e)))

Applying methods with UNFOLD function:

(setf
 t1 (unfold 'ie 't7 mat)
 t2 (unfold 'ie '(t-12 var ob) mat)
 t3 (unfold 'ie 'var mat)
 t4 (unfold 'ie '(t-12 gf lrq ls dyn ret var hn) t3)
 t5 (unfold 'ie '(gf lrq ls dyn bn) t2)
 )
                                   fi
                                          fi
Opusmodus                                unfold   3

The result with a Wind-Quintet layout:

(ps 'gm :w5 (list t1 t2 t3 t4 t5))
