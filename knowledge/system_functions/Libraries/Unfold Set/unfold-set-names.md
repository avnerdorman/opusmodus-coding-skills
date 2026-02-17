Opusmodus                                                      unfold-set-names   1

unfold-set-names ()
[Function]


Description:

Returns a list of all unfold set names de ned in the system.

(unfold-set-names)
=> (u1 om)


Examples:
(get-unfold-set-groups 'om)
=> (transposition variants length velocity
    random voice-leading others ambitus)

(get-unfold-set-group 'om 'variants)
=> (r i ri a d ? ra rl rv raf)

(get-unfold-set 'om 'raf)
=> (:all (gen-retrograde x :flatten t))
                                 fi
