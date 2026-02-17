Opusmodus                                                              musicxml-to-editor   1

musicxml-to-editor &key file instrument
                               application identifier

[Function]

Arguments and Values:
file                     a string (musicxml le name).
instrument               a number.
application              a string. The default is "MuseScore 4.app".
identifier               a string (application bundle-identi er).


Description:

The MUSICXML-TO-EDITOR function opens a MusicXML le or the last compiled score
(DEF-SCORE, PS or snippet) in any notation editor like Sibelius, Dorico, MuseScore,
Finale etc...

In Opusmodus the default editor is set to MuseScore 4:

(defparameter *default-notation-editor* "MuseScore 4.app")

To change the default editor you need to replace the "MuseScore 4.app" string with the
name of your own editor and paste the expression into the ‘User Function.lisp’ le
which you will nd in the ~/Opusmodus/User Source/Extensions directory.

For example:

(defparameter *default-notation-editor* "Dorico 4.app")
(defparameter *default-notation-editor* "Sibelius.app")


Examples:

To open the last compiled score (DEF-SCORE, PS or snippet) in the notation editor:

(musicxml-to-editor)

To open the 2nd instrument from the last compiled score (DEF-SCORE, PS or snippet) in
the notation editor:

(musicxml-to-editor :instrument 2)
             fi
                                   fi
                                                fi
                                                         fi
                                                                             fi
     Opusmodus                                                       musicxml-to-editor    2

     To open a MusicXML le in the notation editor:

     (musicxml-to-editor :file "file-name")

     To open the le in Finale:

     (midi-to-editor :file "file-name" :application "Finale")

     Should the application not open you can use the identifier keyword with the bundle-
     identi er. For example the Sibelius 7.5 version identi er is "com.avid.Sibelius75"

     (musicxml-to-editor :file "file-name" :identifier "com.avid.Sibelius75")
fi
          fi
                    fi
                                                fi
