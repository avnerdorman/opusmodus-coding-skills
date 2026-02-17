Opusmodus                                                                             assemble-voices         1

assemble-voices index &rest sections
[Function]

Arguments and Values:
index                        (Optional): Used to assign names to instruments or voices, facilitating easier
                             identi cation and manipulation of speci c parts within the composition.

sections                     A list of counterpoint sections.


Description:

ASSEMBLE-VOICES is a twofold operation function. If the index value is a number, the
function returns a list of that number. If the index value is a name the function will set
indexed variable names to all the voices in the list. The index value set to NIL will return
all voices in the list. The assembling of the voices is made by the matrix-transpose
operation on a list of lists. This function is a companion to the COUNTERPOINT function.


Examples:
(setf
 p1 '(3e c6 eb6 f6 g6 gs6 g6 b5 d6 e6 fs6 g6 gs6)
 p2 '(3q f1 pp g1 a1 bb1 b1 cs2)
 p3 '(3e eb2 pp f2 gs2 g2 a2 c3 d3 e3 gs3 f3 g3 bb3)
 p4 '(3e c4 p eb4 gs4 d4 e4 g4 bb4 cs5 fs5 bb4 cs5 eb5)
 p5 '(3e fs5 p a5 d6 f5 gs5 bb5 cs6 eb6 g6 b5 cs6 eb6)
 p6 '(3e f6 p g6 gs6 eb6 f6 g6 gs6 f6 fs6 g6 gs6 fs6)
 p7 '(3e b5 p gs6 g6 f6 d6 d5 gs6 mp g6 e6 cs6 gs5 g4)
 p8 '(3e fs6 mp e6 c6 gs5 eb5 eb4 e6 cs6 gs5 e5 b4 d4)
 )

(setf patterns (list p1 p2 p3 p4 p5 p6 p7 p8))

(setf sec-a
      (counterpoint
       patterns
       '(((5 - - -) :tempo 72)
         ((4 - - -))
         ((2 - - -))
         ((3 - - -))
         (- :span 1/4))
       :global-methods '((dyn fl) - - -)))
                        fi
                                                                fi
Opusmodus                                                    assemble-voices   2

(setf sec-b
      (counterpoint
       patterns
       '(((- 5 2 -) :methods (- ri - -) :tempo 64)
         ((- 2 2 6) :methods (- d d3 -) :tempo (:rit 80 56 1/64))
         ((5 1 - 5) :methods (- d2 - i))
         ((1 2 6 3) :methods (a ri i -))
         ((- 1 5 3) :methods (- d t7 i) :tempo 72)
         ((2 6 3 -) :methods (- a - ri))
         ((5 5 8 3) :methods ((d3 i) da d -))
         ((- 7 - 3) :methods (- i - (t-12 ri)))
         ((4 6 6 8) :methods (a d2 r -) :tempo 88)
         (- :span 1/4))
       :global-methods '((dyn fl) (dyn cl) (t-12 dyn hn) (t-12 dyn vc))
       :global-polyphony '((10 p) (1 13)) :iterate t))

(setf sec-c
      (counterpoint
       patterns
       '(((7 4 - 5) :methods (a d i ?) :tempo 64)
         ((- 3 4 -) :methods (- a d -))
         ((2 - 8 1) :methods (- - - ?) :tempo 56)
         ((8 8 6 6) :methods (a d - (d5 i)))
         ((- 3 3 -) :methods (- i d5 -))
         ((- 4 8 -) :methods (- (ri d5) d -))
         ((1 2 2 3) :methods (a d i -)))
       :global-methods '((dyn fl) (dyn cl) (t-12 dyn hn) (t-12 dyn vc))
       :global-polyphony '((7 p) (1 13)) :iterate t))

(setf sec-d
      (counterpoint
       patterns
       '(((- 3 - -) :methods (- - - -) :tempo 80)
         ((- 2 - -) :methods (- - - -))
         ((- 4 - -) :methods (a - - -))
         ((1 1 1 1) :methods (da ad (r d5) (i d2)) :tempo 72))
       :global-methods '((dyn fl) (dyn cl) (dyn hn) (dyn vc))))

Returns 1st voice from all sections:

(assemble-voices 1 sec-a sec-b sec-c sec-d)

Returns 4th voice from all sections:

(assemble-voices 4 sec-a sec-b sec-c sec-d)

Sets indexed variable names to all voices in the sections:

(assemble-voices 'vox sec-a sec-b sec-c sec-d)
=> (vox1 vox2 vox3 vox4)
Opusmodus                                                              assemble-voices   3

To explore the diverse application of the COUNTERPOINT function and to gain insights into
its practical uses across various musical contexts, please navigate to the “How-to/
Counterpoint” section where you will nd a collection of score examples. These examples
showcase the myriad ways in which the function can be utilised, offering valuable
perspectives on integrating counterpoint techniques into your compositions.


Relevant Functions
---------------------------------------------------------
COUNTERPOINT
CP-INSTRUMANTS
CP-TEMPO
DICTUM-TEMPO
GEN-DICTUM
MAKE-DICTUM

Relevant Examples
---------------------------------------------------------
Documentation/How-to/Counterpoint/
                               fi
