Opusmodus                                                              get-unfold-set   1

get-unfold-set unfold-set method
[Function]

Arguments and Values:
unfold-set              unfold set name.
method                  method name.


Description:

Returns a list of unfold set values in the given unfold-set and in the given method.

(get-unfold-set 'om 'raf)
=> (:all (gen-retrograde x :flatten t))


Examples:
(unfold-set-names)
=> (u1 om)

(get-unfold-set-groups 'om)
=> (transposition variants length velocity
    random voice-leading others ambitus)

(get-unfold-set-group 'om 'variants)
=> (r i ri a d ? ra rl rv raf)
