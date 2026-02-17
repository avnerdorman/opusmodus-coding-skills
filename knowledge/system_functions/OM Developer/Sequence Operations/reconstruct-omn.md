Opusmodus                                                        reconstruct-omn   1

reconstruct-omn sequence
[Function]

Arguments and Values:
sequence              an omn-form sequence.


Description:

The function RECONSTRUCT-OMN rewrites a complex attribute sequence to a simple
event sequence.


Examples:
(reconstruct-omn '((leg s g2 e3 c4 b3 c4 e3 c4 e3)
                   (leg g2 e3 c4 b3 c4 e3 c4 e3)))
=> (s g2 mf leg e3 leg c4 leg b3 leg c4 leg e3 leg c4 leg
      e3 g2 leg e3 leg c4 leg b3 leg c4 leg e3 leg c4 leg e3)

(reconstruct-omn '((app t g3 cs4) q a4 (app t e3 as3) q fs4 -
                   (app t b2 es3) e c4 (app t g2 cs3) e as3))
=> (t g3 mf app cs4 app q a4 t e3 app as3 app q fs4
    - t b2 app es3 app e c4 t g2 app cs3 app e as3)
