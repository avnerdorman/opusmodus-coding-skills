Opusmodus                                                                             pitch-lsystem   1

pitch-lsystem ls &key depth map start remove preserve
[Function]

Arguments and Values:
ls                         a name of the l-system class.
depth                      an integer. Depth of recursion.
map                        mapping symbols (variables) to pitches.
start                      pitch symbol (pitch transposition start).
remove                     removes selected symbol from the list. The default is NIL.
preserve                   preserved selected symbol from the list. The default is NIL.

Pitch L-SYSTEM Operators:

+    one semitone transposition up.
-    one semitone transposition down.
n    number of semitone, minus for down, plus for up.
<    pushes operations on stack.
>    pops operations from stack.


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
Opusmodus                                                                         pitch-lsystem   2

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
        /| |       |\              A spawned into AB again, former B turned into A.
n=3:   A B A       A B            note all A's producing a copy of themselves in the rst place,
      /| | |\      |\ \           then a B, which turns ...
n=4: A B A A B     A B A          ... into an A one generation later,
                                  starting to spawn/repeat/recurse then ...
                                                                             fi
     Opusmodus                                                             pitch-lsystem   3

     How to use the L-System to generate a list of pitches.

     There are two essential steps to create an Opusmodus L-SYSTEM:
     The rst step is class (DEFCLASS) and the second step is method (DEFMETHOD).

     The L-System class form:

     (defclass name (l-system)
       ((axiom :initform axiom)
        (depth :initform number)))

     The argument in DEFCLASS is always l-system.

     The L-System method form:

     (defmethod l-productions ((ls name))
       (choose-production ls (variabile (--> rules))))

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

     To be able to see the output of the applied L-System rules, we use the REWRITE-LSYSTEM
     function:

     (rewrite-lsystem 'algae)
     => (a b a a b a b a)

     (rewrite-lsystem 'algae :depth 7)
     => (a b a a b a b a a b a a b a b a a
         b a b a a b a a b a b a a b a a b)

     To map the variables to pitches we use :map keyword:

     (rewrite-lsystem 'algae :depth 4 :map '((a c4) (b cs4)))
     => (c4 cs4 c4 c4 cs4 c4 cs4 c4)
fi
                                                                      fi
Opusmodus                                                                       pitch-lsystem    4

Example 2: Pythagoras Tree

variables: 0, 1
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

(rewrite-lsystem 'tree :depth 3 :map '((1 c4) (0 cs4)))
=> (c4 c4 c4 c4 < c4 c4 < c4 < cs4 > cs4 > c4 < cs4 >
    cs4 > c4 c4 < c4 < cs4 > cs4 > c4 < cs4 > cs4)

The PITCH-LSYSTEM function transforms the L-SYSTEM grammar into a list of pitches.

(pitch-lsystem 'tree :depth 3 :map '((1 c4) (0 cs4)))
=> (c4 c4 c4 c4 c4 c4 c4 cs4 cs4 c4 cs4 cs4
    c4 c4 c4 cs4 cs4 c4 cs4 cs4)
Opusmodus                                                                  pitch-lsystem    5

Here we add a pitch symbol before the integers 1 and 0. Each integer 1 will transpose the
pitch one semitone up. 0 means no transposition.


(defclass tree2 (l-system)
  ((axiom :initform '(cs4))
   (depth :initform 3)))

(defmethod l-productions ((ls tree2))
  (choose-production ls
                     (c4 (--> c4 1 c4 1))
                     (cs4 (--> c4 1 < cs4 0 > cs4 0))))

(rewrite-lsystem 'tree2 :depth 3)
=> (c4 1 c4 1 1 c4 1 c4 1 1 1 < c4 1 c4 1 1 < c4 1
    < cs4 0 > cs4 0 0 > c4 1 < cs4 0 > cs4 0 0 0 >
    c4 1 c4 1 1 < c4 1 < cs4 0 > cs4 0 0 > c4 1
    < cs4 0 > cs4 0 0 0)

(pitch-lsystem 'tree2 :depth 4)
=> (c4 cs4 eb4 e4 g4 gs4 bb4 c5 c5 bb4
    c5 c5 g4 gs4 bb4 c5 c5 bb4 c5 c5)


Examples:
(defclass exp3 (l-system)
  ((axiom :initform '(c4 b3 ab3 bb3 a3 ab4))
   (depth :initform 3)))

Below, each axiom is assigned to a series of pitches:

(defmethod l-productions ((ls exp3))
  (choose-production ls
                     (c4 (--> - - b3))
                     (b3 (--> ab3 + bb3))
                     (ab3 (--> bb3 a3))
                     (bb3 (--> a3 gb3 c4))
                     (a3 (--> gb3 c4 + - +))
                     (ab4 (--> gb3 - + b3))))

(rewrite-lsystem 'exp3)
=> (- - bb3 a3 + a3 gb3 c4 a3 gb3 c4 gb3 c4 + - + +
    gb3 c4 + - + gb3 - - b3 gb3 c4 + - + gb3 - - b3
    gb3 - - b3 + - + gb3 - - b3 + - + gb3 - - ab3 +
    bb3 gb3 - - ab3 + bb3 + - + gb3 - + bb3 a3 + a3 gb3 c4)
Opusmodus                                                    pitch-lsystem   6

(pitch-lsystem 'exp3)
=> (gs3 g3 gs3 f3 b3 gs3 f3 b3 f3 b3 g3 cs4 gs3 b3
    fs3 c4 g3 bb3 f3 gs3 e3 g3 eb3 eb3 fs3 d3 d3
    f3 d3 fs3 f3 fs3 eb3 a3)

Example with function map:

(defclass rnd (l-system)
  ((axiom :initform '(a b))
   (depth :initform 4)))

(defmethod l-productions ((ls rnd))
  (choose-production ls
                     (a (--> < b -))
                     (b (--> + < a - b + >))))

(pitch-lsystem 'rnd
               :depth 3
               :map '((a (rnd-sample 3 '(c4 cs4 d4 ds4e5 f4 fs4)))
                      (b (rnd-order '(cs4c5 b3)))))

=> (d4cs5 c4 cs4 cs4 fs4 c4b4 bb3 e4 g4 gs4
    c4 d4cs5 c4 d4cs5 fs4 f4 d4 c4b4 bb3)

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
Opusmodus                                                   pitch-lsystem   7

(rewrite-lsystem 'context-a
                 :depth 10
                 :map '((f c4) (0 e4) ({ <) (} >))
                 :preserve '(f 1 + - 0 { }))

The rewrite:
=> (c4 1 c4 e4 c4 e4 c4 e4 < + c4 1 c4 1 c4 1 >
    c4 1 c4 1 < - c4 1 c4 e4 c4 1 > < + c4
    1 c4 e4 c4 e4 c4 1 c4 1 c4 1 > c4 1)

(pitch-lsystem 'context-a
                :depth 10
                :map '((f c4) (0 e4) ({ <) (} >))
                :preserve '(f 1 + - 0 { }))

The transformation result:
=> (c4 cs4 f4 cs4 f4 cs4 f4 d4 eb4 e4 cs4 d4 d4
    eb4 g4 eb4 e4 f4 a4 f4 a4 f4 fs4 g4 eb4)

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
Opusmodus                                                                                 pitch-lsystem   8

This output above is not very useful for length transformation.
Lets preserve the symbols which are useful to map:

(rewrite-lsystem 'context-b
                 :depth 10
                 :preserve '(f 1 + - 0 { }))
=> (f 1 f 0 f 1 { - f 1 f 1 } f 1 f 0 f 0 { + f 0 { + f 0
    f 1 } f 1 } { - f 1 f 0 f 1 { - f 1 f 1 } f 1 } f 1)

Now we map the symbol to pitch symbols and to our operators:

(pitch-lsystem 'context-b
               :depth 10
               :map '((f c4) (0 e4) ({ <) (} >))
               :preserve '(f 1 + - 0 { }))
=> (c4 cs4 f4 cs4 cs4 d4 d4 eb4 g4 eb4 g4 e4 gs4
    f4 a4 f4 e4 d4 eb4 g4 eb4 eb4 e4 e4 eb4)

Erstad, K. A. (2002) L-systems, twining plants, Lisp. Master’s thesis thesis. University of Bergen.
Available from: http://www.vcn.bc.ca/~grif nk/lisp_lsystems.pdf
                                    fi
