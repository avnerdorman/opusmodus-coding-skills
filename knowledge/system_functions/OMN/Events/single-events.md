Opusmodus                                                                               single-events         1

single-events sequence &key type group velocityp
[Function]

Arguments and Values:
sequence                     omn sequence.
type                         Speci es the type and can be one of the following: :length,
                             :pitch, :velocity, or :attribute.
group                        A boolean value, defaulting to NIL. When set to T, it takes into consideration
                             tuplet grouping in the sequence.
velocityp                    A boolean value determines the 'Initial-mf' velocity symbol if the velocity
                             element is absent from the event. The default is T.


Description:

The function SINGLE-EVENTS brakes-up an omn sequence into a new list of single
events (l p v a). If the group parameter is set to T and some of the events in the
sequence are tuplets, the function will retain these events as a group in the resulting list,
preserving the original tuplet structure.

(single-events '(s bb3 leg a3 mp leg g3 a3 f c4 f4 a4))
=> ((s bb3 mf leg) (s a3 mp leg) (s g3 mp)
    (s a3 f) (s c4 f) (s f4 f) (s a4 f))


Examples:
(single-events
 '((q f3 mp leg d3 leg bb2 leg eb4)
   (q cs4 mf e bb3 stacc bb4 stacc 3q a4 mp 3h gs4 q c5 fermata)
   (3q c5 p 3h cs5 3q b4 marc c5 marc e5 marc q fs4 mp 3h g4 p 3q c5)))
=> (((q f3 mp leg) (q d3 mp leg) (q bb2 mp leg) (q eb4 mp))
    ((q cs4 mf) (e bb3 mf stacc) (e bb4 mf stacc) (3q a4 mp)
     (3h gs4 mp) (q c5 mp fermata))
    ((3q c5 p) (3h cs5 p) (3q b4 p marc) (3q c5 p marc) (3q e5 p marc)
     (q fs4 mp) (3h g4 p) (3q c5 p)))

Examples with optional :type:

(single-events
 '((q f3 mp leg d3 leg bb2 leg eb4)
   (q cs4 mf e bb3 stacc bb4 stacc 3q a4 mp 3h gs4 q c5 fermata)
   (3q c5 p 3h cs5 3q b4 marc c5 marc e5 marc q fs4 mp 3h g4 p 3q c5))
 :type :length)
=> ((1/4 1/4 1/4 1/4)
    (1/4 1/8 1/8 1/12 1/6 1/4)
                        fi
Opusmodus                                                         single-events   2

     (1/12 1/6 1/12 1/12 1/12 1/4 1/6 1/12))




(single-events
 '((q f3 mp leg d3 leg bb2 leg eb4)
   (q cs4 mf e bb3 stacc bb4 stacc 3q a4 mp 3h gs4 q c5 fermata)
   (3q c5 p 3h cs5 3q b4 marc c5 marc e5 marc q fs4 mp 3h g4 p 3q c5))
 :type :attribute)
=> ((leg leg leg -) (- stacc stacc - - fermata)
    (- - marc marc marc - - -))

With optional :group set to T the tuplets are grouped together:

(single-events
 '((q f3 mp leg d3 leg bb2 leg eb4)
   (q cs4 mf e bb3 stacc bb4 stacc 3q a4 mp 3h gs4 q c5 fermata)
   (3q c5 p 3h cs5 3q b4 marc c5 marc e5 marc q fs4 mp 3h g4 p 3q c5))
 :group t)
=> (((q f3 mp leg) (q d3 mp leg) (q bb2 mp leg) (q eb4 mp))
    ((q cs4 mf) (e bb3 mf stacc) (e bb4 mf stacc)
     (3q a4 mp 3h gs4) (q c5 mp fermata))
    ((3q c5 p 3h cs5) (3q b4 p marc c5 marc e5 marc)
     (q fs4 mp) (3h g4 p 3q c5)))
