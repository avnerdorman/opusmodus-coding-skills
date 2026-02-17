Opusmodus                                                                               length-lsystem   1

length-lsystem ls &key depth map remove preserve omn
[Function]

Arguments and Values:
ls                            a name of the l-system class.
depth                         an integer. Depth of recursion.
map                           mapping symbols (variables) to pitches.
start                         length symbol (pitch transposition start).
remove                        removes selected symbol from the list. The default is NIL.
preserve                      preserved selected symbol from the list. The default is NIL.
omn                           length symbols or ratios. The default is T (symbols).

Length L-SYSTEM Operators:

+            always length-note
-            always rest-note
*            length multiplication by 2
/            length divided by 2
<            pushes operations on stack
>            pops operations from stack


Description:

An L-SYSTEM or LINDENMAYER SYSTEM is a parallel rewriting system and a type of
formal grammar. An L-SYSTEM consists of an alphabet of symbols that can be used to make
strings, a collection of production rules that expand each symbol into some larger string of
symbols, an initial "axiom" string from which to begin construction, and a mechanism for
translating the generated strings into geometric structures. L-SYSTEMS were introduced and
developed in 1968 by Aristid Lindenmayer, a Hungarian theoretical biologist and botanist at
the University of Utrecht. Lindenmayer used L-SYSTEMS to describe the behaviour of plant
cells and to model the growth processes of plant development. L-SYSTEMS have also been
used to model the morphology of a variety of organisms and can be used to generate self-
similar fractals such as iterated function systems. - Wikipedia
Opusmodus                                                                         length-lsystem   2

Example 1: Algae

Lindenmayer's original L-SYSTEM for modelling the growth of algae.

variables: A B
constants: none
axiom: A
rules: (A → AB), (B → A)

which produces:

n = 0 : A
n = 1 : AB
n = 2 : ABA
n = 3 : ABAAB
n = 4 : ABAABABA
n = 5 : ABAABABAABAAB
n = 6 : ABAABABAABAABABAABABA
n = 7 : ABAABABAABAABABAABABAABAABABAABAAB

n=0:               A              start (axiom/initiator)
                  / \
n=1:       A   B                  The initial single A spawned into AB by rule (A → AB),
          /|     \                rule (B → A) couldn't be applied.
n=2:     A B       A              Former string AB with all rules applied,
        /| |       |\             A spawned into AB again, former B turned into A.
n=3:   A B A       A B            note all A's producing a copy of themselves in the rst place,
      /| | |\      |\ \           then a B, which turns ...
n=4: A B A A B     A B A          ... into an A one generation later,
                                  starting to spawn/repeat/recurse then ...
                                                                             fi
     Opusmodus                                                             length-lsystem   3

     How to use the L-SYSTEM to generate a list of lengths.

     There are two essential steps to create an Opusmodus L-SYSTEM:
     The rst step is class (DEFCLASS) and the second step is method (DEFMETHOD).

     The L-SYSTEM class form:

     (defclass name (l-system)
       ((axiom :initform axiom)
        (depth :initform number)))

     The argument in DEFCLASS is always l-system.

     The L-SYSTEM method form:

     (defmethod l-productions ((ls name))
       (choose-production ls
                          (variabile (--> rules))))

     The name in the DEFMETHOD is always l-productions with the rst argument always
     as ls. The second argument is the name of the DEFCLASS.

     Lets apply some simple rules to the two variables 'a' and 'b'.

     (defclass algae (l-system)
       ((axiom :initform '(a))
        (depth :initform 4)))

     (defmethod l-productions ((ls algae))
       (choose-production ls
                          (a (--> a b))
                          (b (--> a))))

     To be able to see the output of the applied L-SYSTEM rules, we use the REWRITE-
     LSYSTEM function:

     (rewrite-lsystem 'algae)
     => (a b a a b a b a)

     (rewrite-lsystem 'algae :depth 7)
     => (a b a a b a b a a b a a b a b a a b
         a b a a b a a b a b a a b a a b)

     To map the variables to length symbols we use :map keyword:

     (length-lsystem 'algae :depth 7 :map '((a s) (b e)))
     => (s e s = e s e s = e s = e s e s = e
         s e s = e s = e s e s = e s = e)
fi
                                                                      fi
Opusmodus                                                                      length-lsystem    4

Example 2: Pythagoras Tree

variables : 0, 1
constants: <, >
axiom: 0
rules: (1 → 1 1), (0 → 1 < 0 > 0)

The shape is built by recursively feeding the axiom through the production rules. Each
character of the input string is checked against the rule list to determine which character or
string to replace it with in the output string. In this example, a '1' in the input string becomes
'1 1' in the output string, while '<' remains the same. Applying this to the axiom of '0', we
get:

axiom: 0
1st recursion: 1 < 0 > 0
2nd recursion: 1 1 < 1 < 0 > 0 > 1 < 0 > 0
3rd recursion: 1 1 1 1 < 1 1 < 1 < 0 > 0 > 1 < 0 > 0 > 1 1 < 1 < 0 > 0 > 1 < 0 > 0
. . .

(defclass tree (l-system)
  ((axiom :initform '(0))
   (depth :initform 3)))

(defmethod l-productions ((ls tree))
  (choose-production ls
                     (1 (--> 1 1))
                     (0 (--> 1 < 0 > 0))))

(rewrite-lsystem 'tree)
=> (1 1 1 1 < 1 1 < 1 < 0 > 0 > 1 < 0 >
    0 > 1 1 < 1 < 0 > 0 > 1 < 0 > 0)

The LENGTH-LSYSTEM function transforms the L-SYSTEM grammar into a list of lengths.

(length-lsystem 'tree :depth 3 :map '((1 s) (0 e)))
=> (s = = = = = = e = s e = s = = e = s e =)
Opusmodus                                                  length-lsystem   5

Examples:
(defclass lent1 (l-system)
  ((axiom :initform '(e))
   (depth :initform 4)))

(defmethod l-productions ((ls lent1))
  (choose-production ls
                     (e (--> s s))
                     (s (--> s s e q))
                     (s (--> s s q e -e))
                     (q (--> e -e -e s s))))

(length-lsystem 'lent1)
=> (s = e q s = e q s = e - - s = = = e q s = e q
    s = e - - s = = = e q s = e q s = -e - s = e
    q s = e q s = e q s = e q s = e - - s = = = e
    q s = e q s = e - - s = = = e q s = e q s =
    -e - s = e q s = e q)

Example with a function inside a rule:

(progn
  (defclass llen (l-system)
    ((axiom :initform '(s e))
     (depth :initform 2)))

     (defmethod l-productions ((ls llen))
       (choose-production
        ls
        (s (--> (rnd-pick '((s * e * s /) (s e -s /))) q / s e -s /))
        (e (--> s * s * s / q / s e -s / (rnd-pick '(h -q s -e)
                                                   :encode nil))))))

(rewrite-lsystem 'llen :depth 2)
=> (s * e * s / q / s e -s / q / s e -s / s * s * s / q / s e -s /
    -q -s / s e -s / q / s e -s / * s e -s / q / s e -s / * s e -s /
    q / s e -s / / q / s e -s / q / s e -s / s * s * s / q / s e -s /
    -e -s / -e)

or

=> (s e -s / q / s e -s / s * s * s / q / s e -s / -q -s / q / s e -s /
    q / s e -s / s * s * s / q / s e -s / -e -s / s * e * s / q / s e
   -s / * s e -s / q / s e -s / * s e -s / q / s e -s / / q / s * e *
    s / q / s e -s / s * s * s / q / s e -s / h -s / h)
. . .

(length-lsystem 'llen :depth 2)
=> (s e -s e t e -s e t e -s t e = = t e -s - - t e -s e t e -s = e -s
    e t e -s = e -s e t e -s = t e -s e t e -s t e = = t e -s -e -s -e)
Opusmodus                                                length-lsystem   6

Advance examples for users with L-System deeper knowledge.
;; Context-sensitive L-systems from ABoP p. 34--35

I.

(defclass context-a (l-system)
  ((axiom :initform '(f 1 f 1 f 1))
   (depth :initform 30)
   (angle-increment :initform 22.5)
   (ignore-list :initform '(+ - f))))

(defmethod l-productions ((ls context-a))
  (choose-production ls
    (0 (with-lc (0)
     (with-rc (0) (--> 0))
     (with-rc (1) (--> 1 { + f 1 f 1 })))
       (with-lc (1)
     (with-rc (0) (--> 0))
     (with-rc (1) (--> 1 f 1))))
    (1 (with-lc (0)
     (--> 1))
       (with-lc (1)
     (with-rc (0) (--> 0))
     (with-rc (1) (--> 0))))
    (+ (--> -))
    (- (--> +))))

(rewrite-lsystem 'context-a
                 :depth 10
                 :map '((f s) (1 e) (0 *))
                 :preserve '(f 1 + - 0))

The rewrite:
=> (s e s * s * s * + s e s e s e s e s e -
    s e s * s e + s e s * s * s e s e s e s e)

(length-lsystem 'context-a
                :depth 10
                :map '((f s) (1 e) (0 *))
                :preserve '(f 1 + - 0))

The transformation result:
=> (s e s e = e. e s e s e s e s e -s
    e s e = = = s e = = s e s e s e)
Opusmodus                                                                                length-lsystem   7

II.

(defclass context-b (l-system)
  ((axiom :initform '(f 1 f 1 f 1))
   (depth :initform 30)
   (angle-increment :initform 22.5)
   (consider-list :initform '(0 1))))

(defmethod l-productions ((ls context-b))
  (choose-production ls
    (0 (with-lc (0)
     (with-rc (0) (--> 1))
     (with-rc (1) (--> 1 { - f 1 f 1 })))
       (with-lc (1)
     (with-rc (0) (--> 0))
     (with-rc (1) (--> 1 f 1))))
    (1 (with-lc (0)
     (--> 1))
       (with-lc (1)
     (with-rc (0) (--> 1))
     (with-rc (1) (--> 0))))
    (+ (--> -))
    (- (--> +))))

(rewrite-lsystem 'context-b :depth 10)
=> (f 1 f 0 f 1 ({ 12) - f 1 f 1 (} 6) f 1 f 0 f 0 ({ 32)
    + f 0 ({ 29) + f 0 f 1 (} 23) f 1 (} 19) ({ 50) - f 1
    f 0 f 1 ({ 47) - f 1 f 1 (} 41) f 1 (} 33) f 1)

This output above is not very useful for length transformation.
Lets preserve the symbols which are useful to map:

(rewrite-lsystem 'context-b
                 :depth 10
                 :preserve '(f 1 + - 0 { }))
=> (f 1 f 0 f 1 { - f 1 f 1 } f 1 f 0 f 0 { + f 0 { + f 0
    f 1 } f 1 } { - f 1 f 0 f 1 { - f 1 f 1 } f 1 } f 1)

Now we map the symbol to to length symbols and to our operators:

(length-lsystem 'context-b
                :depth 10
                :map '((f s) (1 e) (0 *) ({ <) (} >))
                :preserve '(f 1 + - 0 { }))
=> (s e s e = -s e s e s e s e e. =
    e = = = - = s e = -s e s e s e = =)

Erstad, K. A. (2002) L-systems, twining plants, Lisp. Master’s thesis thesis. University of Bergen.
Available from: http://www.vcn.bc.ca/~grif nk/lisp_lsystems.pdf
                                    fi
