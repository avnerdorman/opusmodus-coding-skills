Opusmodus                                                       get-unfold-set-groups   1

get-unfold-set-groups unfold-set
[Function]

Arguments and Values:
unfold-set             unfold set name.


Description:

Returns a list of method group names in the given unfold-set.

(get-unfold-set-groups 'om)
=> (transposition variants length velocity
    random voice-leading others ambitus)


Examples:
(unfold-set-names)
=> (u1 om)

(get-unfold-set-group 'om 'variants)
=> (r i ri a d ? ra rl rv raf)

(get-unfold-set 'om 'raf)
=> (:all (gen-retrograde x :flatten t))
