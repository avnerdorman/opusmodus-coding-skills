Opusmodus                                                      get-unfold-set-group   1

get-unfold-set-group unfold-set group
[Function]

Arguments and Values:
unfold-set             unfold set name.
group                  group name.


Description:

Returns a list of method names in the given unfold-set and in the given group.

(get-unfold-set-group 'om 'variants)
=> (r i ri a d ? ra rl rv raf)


Examples:
(unfold-set-names)
=> (u1 om)

(get-unfold-set-groups 'om)
=> (transposition variants length velocity
    random voice-leading others ambitus)

(get-unfold-set 'om 'raf)
=> (:all (gen-retrograde x :flatten t))
