Opusmodus                                                         add-program-attributes      1

add-program-attributes &rest attributes
[Function]

Arguments and Values:
attributes               lists of attributes (programs).


Description:

This functions allows you to add your own lists of attribute names (program changes) to the
system. This function is used when you don't want to display certain attributes within the
score notation but would like to control program changes on a particular note (pitch).

First you need to create a le "User Attributes.opmo" in the Opusmodus "Extensions" folder
- if it hasn't been created already. To be able to add your own program attributes to
the system you need to add a new list with one arguments to the ADD-PROGRAM-
ATTRIBUTE existing list.

(add-program-attributes
 '(music-box)
 '(vibraphone)
 '(xylophone)
 '(tubular-bells)
 '(marimba)
 )

The new attributes will display in your given colour which you assign in the Preferences
window.


Score Example:
(add-program-attributes
 '(music-box)
 '(vibraphone)
 '(xylophone)
 '(tubular-bells)
 '(marimba)
 )
                   fi
Opusmodus                                                             add-program-attributes      2

Now we are linking the program attributes with a sound set:

(def-sound-set prog-att
                :programs
  (:group prog1
          music-box       10
          vibraphone      11
          marimba         12
          xylophone       13
          tubular-bells 14
          ))

(setf omn '(q a4 ff xylophone b4 vibraphone
            c4 marimba d4 tubular-bells))

(def-score test
           (:key-signature 'chromatic
            :time-signature '(4 4)
            :tempo 30)

  (inst
    :omn omn
    :channel 1
    :sound 'prog-att)
  )

It is important to know that if you share your score with others to include the attribute lists
together with the score at the beginning of the score. See above.
