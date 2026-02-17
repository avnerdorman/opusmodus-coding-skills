     Opusmodus                                                                      length-delta-map   1

     length-delta-map n lengths delta
     [Function]

     Arguments and Values:
     n                        number of instrument or voice.
     lengths                  collection of note and rest lengths.
     delta                    length values whose types are summed to create a time period
                              in which the length collection can t.

     Description:

     Music can be described as events or commands occurring over time. In computer music
     systems time stored relative to previous events is called a delta-time, the event type is
     identi ed with a number, and the event details are zero or more parameters that are de ned
     by the event type.

     In the function LENGTH-DELTA-MAP delta time is mapped to lengths. Before the
     function can be used we need two lists.

     (setf length '(-1/16 1/16 1/16 1/16 -1/8 1/8))

     The list length is shorthand for '(-1/16 -1/16 -1/16 -1/16 -1/8 -1/8). It is
     not a linear list of values that in absolute terms would last for a bar of 2/4. This is a
     collection of values used as source from which to provide rest-lengths for an individual
     instrumental part or perhaps collection of phrases. These values are used to make an ever-
     lengthening gap between the start of the time period and the instrument's entry.

     (setf delta '(1/2 3/4 4/4 1/2))

     The list delta is a collection of time durations that begin only after the rest-length has
     passed. This list governs the number of entry points from which a length phrase can be
     generated. There are 4 such entry points and possible slots (the delta time duration) where a
     pitch might be placed.
fi
                                                        fi
                                                                                             fi
Opusmodus                                                             length-delta-map      2

Examples:
(setf instr1x (length-delta-map 1 length delta))
=> (-1/16 1/2 -5/8)

(setf instr2x (length-delta-map 2 length delta))
=> (-1/8 3/4 -5/16)

(setf instr3x (length-delta-map 3 length delta))
=> (-3/16 1)

(setf instr4x (length-delta-map 4 length delta))
=> (-3/8 1/2 -5/16)

These four outputs could be thought of as parts for 4 individual instruments. Use LENGTH-
ADJUST or LENGTH-ALIGN to make the music t a common bar duration.

(length-adjust '4/4 (list instr1x instr2x instr3x instr4x)
               :type 'r :position 'l)
=> ((-1/16 1/2 -5/8 -3/16)   ; 1
    (-1/8 3/4 -5/16 -3/16)   ; 2
    (-3/16 1 -3/16)          ; 3
    (-3/8 1/2 -5/16 -3/16)) ; 4

(length-align (list instr1x instr2x instr3x instr4x)
               :type 'r :position 'l)
=> ((-1/16 1/2 -5/8)     ; 1 bar of 19/16
     (-1/8 3/4 -5/16)    ; 2
     (-3/16 1)           ; 3
     (-3/8 1/2 -5/16)) ; 4
                                          fi
