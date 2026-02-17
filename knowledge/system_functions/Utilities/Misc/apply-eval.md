Opusmodus                                                                      apply-eval   1

apply-eval object
[Function]

Arguments and Values:
object                   atom, a list or lists.


Description:

The function APPLY-EVAL is a necessary utility based on the LISP primitive apply. This
LISP function when 'applied' to a list of variables or arguments evaluates their content. The
version of the apply function found in OPUSMODUS is particularly useful when a composer
has collected and named short pieces of musical material and wishes to evaluate this material
within a list.


Example:
(setf
 c-1 '(c4 cs4)
 c-2 '(cs4 c4 d4)
 c-3 '(cs4 c4 cs4 d4)
 b-1 '(ds4 e4)
 b-2 '(ds4 e4 ds4)
 b-3 '(e4 e4 ds4 e4))

(apply-eval 'b-1)
=> (ds4 e4)

(apply-eval '(b-1 c-1 c-2 b-2 b-3 c-3 b-3))
=> ((ds4 e4) (c4 cs4) (cs4 c4 d4) (ds4 e4 ds4)
    (e4 e4 ds4 e4) (cs4 c4 cs4 d4) (e4 e4 ds4 e4))

(apply-eval '((b-1 c-1) (c-2 b-2) (b-3 c-3 b-3)))
=> ((ds4 e4 c4 cs4) (cs4 c4 d4 ds4 e4 ds4)
    (e4 e4 ds4 e4 cs4 c4 cs4 d4 e4 e4 ds4 e4))
Opusmodus                                                    apply-eval   2

Score Example:
(setf conga-solo-p
      (apply-eval (rnd-sample 12 '(c-1 c-2 c-3 b-1 b-2 b-3))))

(setf
 c-1l '(e =)
 c-2l '(e s =)
 c-3l '(s = = =)
 b-1l '(-e s =)
 b-2l '(s = e)
 b-3l '(s = = =))

(setf conga-solo-l
      (apply-eval (rnd-sample 12 '(c-1l c-2l c-3l b-1l b-2l b-3l))))

(def-score p-solo
           (:key-signature 'chromatic
            :time-signature '(2 8)
            :tempo '(q 90))

 (congas
  :length conga-solo-l
  :pitch conga-solo-p
  :velocity '(ff)
  :channel 10
  :sound 'gm))
