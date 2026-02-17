Opusmodus                                                                          make-chord-dictum   1

make-chord-dictum num
[Function]

Arguments and Values:
num                            An integer specifying the number of dictums to be generated.


Description:

The MAKE-CHORD-DICTUM function creates a CHORD-DICTUM dictum template
consisting of a speci ed number of dictum lists. Each list in the template contains
placeholders for a set of rules and methods, which can later be de ned by the composer. This
function is designed to be used in conjunction with the CHORD-DICTUM function,
facilitating the creation of complex musical structures.


Examples:
(make-chord-dictum 8)

Result in the Listener:

(setf
 dictum
 '(
    #|1|# (:len nil :chd nil :div nil :vel nil :att nil :grp nil :int nil
           :var nil :mtd nil :rhy nil)
    #|2|# (:len nil :chd nil :div nil :vel nil :att nil :grp nil :int nil
           :var nil :mtd nil :rhy nil)
    #|3|# (:len nil :chd nil :div nil :vel nil :att nil :grp nil :int nil
           :var nil :mtd nil :rhy nil)
    #|4|# (:len nil :chd nil :div nil :vel nil :att nil :grp nil :int nil
           :var nil :mtd nil :rhy nil)
    #|5|# (:len nil :chd nil :div nil :vel nil :att nil :grp nil :int nil
           :var nil :mtd nil :rhy nil)
    #|6|# (:len nil :chd nil :div nil :vel nil :att nil :grp nil :int nil
           :var nil :mtd nil :rhy nil)
    #|7|# (:len nil :chd nil :div nil :vel nil :att nil :grp nil :int nil
           :var nil :mtd nil :rhy nil)
    #|8|# (:len nil :chd nil :div nil :vel nil :att nil :grp nil :int nil
           :var nil :mtd nil :rhy nil)
    )
 )

This result shows the initial state of the dictum list with placeholders for each property.
These placeholders are to be lled in according to the rules and methods you de ne.
              fi
                          fi
                                                                    fi
                                                                                     fi
Opusmodus                                                                make-chord-dictum   2

Example of a De ned CHORD-DICTUM map:

(setf
 Sec-A
 '(
    #|1|# (:len w :chd 6 div 6 :vel nil :att nil :grp (3 4)
           :int (0 13 1 11) :var ? :mtd m :rhy nil)

      #|2|# (:len h :chd 5 :div 5 :vel nil :att nil :grp (3 4)
             :int nil :var ? :mtd r :rhy t)

      #|3|# (:len q. :chd 4 :div 4 :vel nil :att nil :grp (3 4)
              :int (0 13 1 11) :var ? :mtd nil :rhy t)

      #|4|# (:len q :chd 4 :div 4 :vel nil :att nil :grp (3 4)
             :int nil :var ? :mtd nil :rhy nil)
 ))

In this example, Sec-A is a de ned chord-map template based on the initial structure
created by MAKE-CHORD-DICTUM. Each dictum in Sec-A is customised with speci c
values for length, chord, division, group, etc., illustrating how a composer might de ne their
own musical structure.



Relevant Functions
---------------------------------------------------------
CHORD-DICTUM
GEN-CHORD-DICTUM

Relevant Examples
---------------------------------------------------------
Documentation/How-to/Chord Dictum/
            fi
                         fi
                                                                              fi
                                                                                   fi
