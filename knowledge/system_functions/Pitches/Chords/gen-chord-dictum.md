Opusmodus                                                                           gen-chord-dictum       1

gen-chord-dictum dictum
[Function]

Arguments and Values:
dictum                      A list containing 10 sublists. Each sublist corresponds to a speci c musical
                            property, and its values must align with the properties and placeholders
                            de ned below.

Dictum Properties and Placeholders:

:len - (Required) Speci es the length as either a symbol or a ratio.
:chd - (Required) Number of pitches in the chord.
:div - (Required) Number of divisions of the length.
:vel - (Optional) Velocity, represented as either a symbol or NIL.
:att - (Optional) Attribute (articulation), speci ed as either a symbol or NIL.
:grp - (Optional) List of chord size values to be generated, provided as a list of numbers or NIL.
:int - (Optional) List of intervals, or NIL.
:var - (Optional) Variant to be applied to the process.
       Options include: p, r, i, ri, a, d, ad, da, and ? (at random), or NIL.
:mtd - (Optional) Method applied to the process. Options are m (melodize) and r (repeat), or NIL.
:rhy - (Optional) Rhythm-series function to be applied, indicated by T or NIL.

Description:

The GEN-CHORD-DICTUM function generates a list of rules and methods based on the
provided dictum list. This function is intended for use with the CHORD-DICTUM function
and assists in the creation of complex musical structures.


Example:
(setf dictum-values
      '((w h q. q)                         ; Length map
         (5 5 4)                           ; Chord-size map
         (4 5 4)                           ; Length division
         nil                               ; Velocity map
         nil                               ; Attribute map
         ((3 4) (3 4) nil)                 ; Chord group
         ((0 13 1 11) nil (0 13 1 11) nil) ; Interval
         ?                                 ; Variant
         (m r nil)                         ; Methods
         (nil t t nil)                     ; Rhythm series
      ))
                  fi
                       fi
                                         fi
                                                                                     fi
Opusmodus                                                              gen-chord-dictum      2

(setf dictum (gen-chord-dictum dictum-values))
=> ((:len 1 :chd 5 :div 4 :vel nil :att nil :grp (3 4)
     :int (0 13 1 11) :var ? :mtd m :rhy nil)

     (:len 1/2 :chd 5 :div 5 :vel nil :att nil :grp (3 4)
      :int nil :var ? :mtd r :rhy t)

     (:len 3/8 :chd 4 :div 4 :vel nil :att nil :grp nil
      :int (0 13 1 11) :var ? :mtd nil :rhy t)

     (:len 1/4 :chd 4 :div 4 :vel nil :att nil :grp nil
      :int nil :var ? :mtd nil :rhy nil))

In this example, dictum-values is a list of lists where each sublist de nes the values for
a set of musical properties. The GEN-CHORD-DICTUM function then generates a structured
dictum list based on these values.



Relevant Functions
---------------------------------------------------------
CHORD-DICTUM
MAKE-CHORD-DICTUM

Relevant Examples
---------------------------------------------------------
Documentation/How-to/Chord Dictum/
                                                                 fi
