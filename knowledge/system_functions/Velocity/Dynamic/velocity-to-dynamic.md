Opusmodus                                                                      velocity-to-dynamic   1

velocity-to-dynamic sequence &key end extend section exclude
[Function]

Arguments and Values:
sequence                a list of velocity symbols.
end                     optional end velocity.
extend                  extends the hairpins.
section                 an integer or list of integers. Selected list or lists to process.
                        The default is NIL.
exclude                 an integer or list of integers. Excluded list or lists from process.
                        The default is NIL.


Description:

This function converts velocity symbols to dynamic values.


Examples:
(velocity-to-dynamic '(p p mp mp f ff mp mp p f))
=> (p< < mp< < f< ff> mp> > p< f)

(velocity-to-dynamic '(p p mp mp f ff mp mp p f) :extend t)
=> (p< < < < < ff> > > p< f)

(velocity-to-dynamic '(p p mp mp f ff mp mp p f) :end 'pp)
=> (p< < mp< < f< ff> mp> > p> pp)

(velocity-to-dynamic
 '((pppp ppp ppp pp ppp p p mp mf mf) (f ff mf mp p ppp pppp)))
=> ((pppp< ppp< < pp> ppp< p< < mp< mf< <) (f< ff> mf> mp> p> ppp>
pppp))

Setting the :extend to T will removes intermediate textual dynamic indicators and replace
them with extended hairpins:

(velocity-to-dynamic '(p p mp mp f ff mp mp p f) :end 'pp :extend t)
=> (p< < < < < ff> > > > pp)

(velocity-to-dynamic
 '((pppp ppp ppp pp ppp p p mp mf mf)
   (f ff mf mp p ppp pppp)) :extend t)
=> ((pppp< < < pp> ppp< < < < < <) (f< ff> > > > > pppp))
Opusmodus                                             velocity-to-dynamic   2

(velocity-to-dynamic '((p p f f f mp mp f ff)
                       (f mp mp f f f)) :section 0)
=> ((p< < f> > > mp< < f< ff) (f mp mp f f f))

OMN:

(setf omn '((e c4 fff leg d4 leg e4 leg f4 leg
               g4 leg a4 leg b4 ppp leg c5)
            (e c4 fff mart d4 mart e4 mart f4 mart
               g4 a4 ppp b4 c5)
            ((leg e c4 fff d4 e4 f4 g4 a4 b4 c5 ppp))))




(velocity-to-dynamic omn)
=> ((e c4 fff> leg d4 > leg e4 > leg f4 > leg
       g4 > leg a4 > leg b4 ppp< leg c5 <)
    (e c4 fff> mart d4 > mart e4 > mart
       f4 > mart g4 > a4 ppp< b4 < c5 <)
    (e c4 fff> leg d4 > leg e4 > leg f4 > leg
       g4 > leg a4 > leg b4 > leg c5 ppp))
