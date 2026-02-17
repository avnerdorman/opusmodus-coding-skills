Opusmodus                                                                          def-case      1

def-case name &rest keyforms
[Macro]

Arguments and Values:
name                       case name.
keyforms                   case forms.


Description:

The LISP CASE statement is like a switch statement. We can compare an input against a list
of values, for example:

(setq x 'b)
=> b

(case x
 (a 5)
 ((d e) 7)
 ((b f) 3)
 (otherwise 9))
=> 3

This means that if the CASE statement receives an a, it will return 5. d or e will return 7, b
or f will return 3, but any other value will return 9.

With DEF-CASE we can create a sort of function that we can use to process lists of values in
order to quickly generate material.


Examples:

A DEF-CASE function is de ned as a function name and list of clauses. Note that a clause
can also contain functions, so that randomly generated material or choices between material
can be assigned to each clause:

(def-case rhythms
 (2 '(1/4 1/4))
 (3 '(1/4 1/8 1/8))
 (4 '(1/8 1/8 1/8 1/8))
 (5 '(1/8 1/16 1/16 -1/16 1/8 1/16))
 (otherwise (rnd-pick '((-1/4 1/4) (-1/8 -3/8) (-3/8 1/8)))))
                      fi
Opusmodus                                                                    def-case   2

The DEF-CASE function name becomes a function in its own right - we can process any list
through the above DEF-CASE de nition by simply referring to it as RHYTHMS:

(setf val '(1 3 2 4 5 1 1))

(rhythms val)
=> ((-3/8 1/8) (1/4 1/8 1/8) (1/4 1/4) (1/8 1/8 1/8 1/8)
    (1/8 1/16 1/16 -1/16 1/8 1/16) (-1/4 1/4) (-1/4 1/4))

We can also use the LISP primitive MAPCAR to process sublists of values:

(mapcar 'rhythms '((1 3 2) (4 5 1)))
=> (((-1/4 1/4) (1/4 1/8 1/8) (1/4 1/4))
      ((1/8 1/8 1/8 1/8) (1/8 1/16 1/16 -1/16 1/8 1/16) (-1/8 -3/8)))

(def-case strings
 ((c4 1/2) 'tasto)
 ((cs5 1/4) 'ponte)
 ((d6 1/8) 'trem)
 (otherwise 'ord))

(strings
 (gen-combine '(c4 cs5 f5 e6 ds4 d6 c4 d4 cs4 f5 ds4 d6)
              '(1/2 1/4 1/4 1/4 1/2 1/8 1/4 1/2 1/8 1/4)))
=> (tasto ponte ord ord ord trem ord ord ord ord)

(def-case microtone
 ((pp 1/2 c4) -2400)
 ((mp 1/4 e4) 2040)
 ((mf 1/4 g4) 1020)
 ((mf 1/4 g4) 1020)
 ((ppp 1/2 e4) 1020)
 (otherwise 0))

(microtone
 (gen-combine
  '(pp mp mf pp mp mf fffff ppp pp mf)
  '(1/2 1/4 1/4 1/4 1/2 1/8 1/4 1/2 1/8 1/4)
  '(c4 c4 e4 e4 e4 g4 g4 e4 c4 c4)))
=> (-2400 0 0 0 0 0 0 1020 0 0)
                          fi
