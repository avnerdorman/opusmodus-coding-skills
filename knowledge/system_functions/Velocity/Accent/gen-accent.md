Opusmodus                                                                             gen-accent   1

gen-accent weight period velocity &key section exclude
[Function]

Arguments and Values:
weight                  a oating number or an integer.
period                  a list of integers.
velocity                velocity values - integer, velocity symbols, oat numbers or midi value.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.


Description:

This function places higher velocity values on speci ed positions in a list.

(gen-accent 0.3 '(2 3) (gen-cresc 10 'pp 'mp))
=> (mf pp mf p p f p ff mp mp)

The weight argument is an additional value to be added to the existing value. The period
argument marks out the accent period, so '(2 3) would every two steps then three steps
1 0 1 0 0.


Examples:
(gen-accent 0.5 '(4 3) (gen-cresc 20 0.2 0.7))
=> (0.7 0.22 0.25 0.28 0.8 0.33 0.35 0.9 0.41 0.43
    0.46 0.99 0.51 0.54 1.0 0.6 0.62 0.65 1.0 0.7)

(gen-accent 0.5 '(4 3) (gen-cresc 20 'pppp 'fff))
=> (f pppp ppp ppp fff pp p ffff p mp mp
    fffff mf mf fffff f ff ff fffff fff)

Con sotto-liste:

(gen-accent '(-0.2 0.3) '((4 3) (2 3))
            (list (gen-cresc 10 'ppp 'ff) (gen-dim 10 'ff 'ppp)))
=> ((ppppp pp pp p pp mp mf mp f ff)
    (fffff f ffff mf mp ff p mf pp ppp))
                   fl
                                                   fi
                                                           fl
Opusmodus                                                      gen-accent   2

OMN:

(gen-accent '(-0.2 0.3) '((4 3) (2 3))
            '((e c4 f cs5 f d4 f ds5 p f4 p fs5 p c5 p pp)
              (e cs4 p f d4 f eb5 p f4 p eb4 f d3 p ppppp)))
=> ((e c4 mp cs5 f d4 ds5 p f4 ppp fs5 p c5 c5 pppp)
    (e cs4 f cs4 d4 ffff eb5 p f4 eb4 ffff d3 p pp))

Note that the GEN-ACCENT will work with MIDI values.

(gen-accent 50 '(2 3) (gen-cresc 10 24 45))
=> (74 25 79 30 33 86 38 89 43 44)

(velocity-list-plot (gen-cresc 20 12 45)
 :style nil :point-radius 2)
Opusmodus                                        gen-accent   3

(velocity-list-plot
 (gen-accent 0.34 '(4 3) (gen-cresc 20 12 45))
 :style nil :point-radius 2)
