Opusmodus                                                                     def-unfold-set       1

def-unfold-set name &body body &key methods
[Macro]

Arguments and Values:
name                     method-set name.
body                     methods.
methods                  a plist containing pairs of the form: (<name><method>),
                         where <method> is a list of (<omn-type><function>) and where <omn-type>
                         is NIL (function without type), :all (process on all types),
                         :length, :pitch, :velocity and :articulation.


Description:

The DEF-UNFOLD-SET and UNFOLD function opens up a whole new set of possibilities for
the composer using OPUSMODUS. It can prove a very powerful tool in de ning methods
(functions) from the outset, for a speci c work or as a global index of your most used
functions. To be able to store methods, processes and solutions and call them at anytime
becomes a valuable resource for a composers work ow. This function is a companion to the
UNFOLD function.

A method is a collation of functions, generically ‘instructions’, that are applied to a de ned
set of data (or to a speci ed parts of it). This set of data is de ned as the object of the
method. The functions method are applied sequentially: the rst function acts directly on the
object data, the next on the object data modi ed by the previous one and so on. In the context
of structured programming (object oriented) the method is conceptually similar to the
subroutine (subroutine) of linear programming.

(def-unfold-set m1
                :methods
  (:group variant
   var (:pitch (pitch-variant x :variant '?))
   t7   (:pitch (pitch-transpose 7 x))
   t-12 (:pitch (pitch-transpose -12 x))

   :group dynamic
   dyn (:velocity (velocity-to-dynamic x))
   ))

(setf omn '(s bb4 p a4 h. db4 t gs4 mf fs4 c5 b4 q f5 e5))

To call the de ned methods in a given omn-form sequence use the UNFOLD function:

(unfold 'm1 '(var dyn t7) omn)
=> (s b5 p< bb5 < h. e6 < t eb6 mf a6 g6 d7 q fs6 f6)
          fi
                 fi
                                fi
                                      fi
                                             fl
                                                       fi
                                                            fi
                                                                       fi
                                                                                   fi
Opusmodus                                                  def-unfold-set   2

Examples:

Two bars of omn (opusmodus notation):

(setf mat '((q d4 pp s eb4 < leg g4 < leg bb4 < leg a4 q. cs5 mf
             -e 3q gs5 > leg fs5 > leg c5 > b4 > leg f4 leg e4)
            (t d4 < leg eb4 < leg g4 < leg bb4 q. a4 marc
             t fs4 mf leg gs4 leg e. c5 e b4 t f5 leg e5 leg d5 leg eb5
             3q bb5 > a4 > bb5 > e a4 pp stacc -e)))

Unfold example set:

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

(setf
 t1 (unfold 'ie 't7 mat)
 t2 (unfold 'ie '(t-12 var ob) mat)
 t3 (unfold 'ie 'var mat)
 t4 (unfold 'ie '(t-12 gf lrq ls dyn ret var hn) t3)
 t5 (unfold 'ie '(gf lrq ls dyn bn) t2)
 )
Opusmodus                                def-unfold-set   3

The result with a Wind-Quintet layout:

(ps 'gm :w5 (list t1 t2 t3 t4 t5))
