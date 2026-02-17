Opusmodus                                            event-restp   1

event-restp event
[Function]

Arguments and Values:
event                   an event (a list).


Description:

Return true if event is a rest, and NIL otherwise.


Examples:
(event-restp '(-q))
=> t

(event-restp '(-q fermata))
=> t
