Opusmodus                                                                         play   1

play &optional name
[Function]

Arguments and Values:
name                         sound le name.


Description:

The PLAY function allows you to listen to the last computed sound again.


Examples:
(with-sound ()
 (fm-violin-synth '(q q q) '(c4 e4 g4) '(ppp p pp)))

Play the last computed sound again:

(play)

To stop audition at anytime press Cmd/ESC keys or:

(stop-sound)

To hear some other sound le, you will need to give the pathname as an argument:

(play "~/Desktop/my-sound.aiff")
                   fi
                        fi
