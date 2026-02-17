Opusmodus                                     omn-formp   1

omn-formp event
[Function]

Arguments and Values:
event                  a list.


Description:

Return true if event is an OMN form (list).


Examples:
(omn-formp '(q c4 mp))
=> t

(omn-formp '(c4 d4))
=> nil

(omn-formp '(q = = =))
=> nil
