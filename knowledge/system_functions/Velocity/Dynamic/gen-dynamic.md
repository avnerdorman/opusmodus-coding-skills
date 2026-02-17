Opusmodus                                                               gen-dynamic   1

gen-dynamic step dynamic &key end extend
[Function]

Arguments and Values:
step                   a list of numbers.
dynamic                a list of dynamic symbols.
end                    optional end velocity.
extend                 extends the hairpins.


Description:

This function generate a dynamic (crescendo and diminuendo) over a given number of
steps (count).

(gen-dynamic '(3 3) '(p f))
=> (p< < < f f f)

(gen-dynamic '(3 3) '(p f) :end 'mf)
=> (p< < < f> > mf)

(gen-dynamic '((3 5) (4 4) (5 3)) '((pp f) (p mf) (f p)))
=> ((pp< < < f> > > > >) (p< < < < mf< < < <) (f> > > > > p p p))


Examples:
(gen-dynamic '(3 5 4 4 5) '(pp f ff mf f))
=> (pp< < < f< < < < < ff> > > > mf< < < < f f f f f)

Example with optional :end velocity value:

(gen-dynamic '(3 5 4 4 5) '(pp f ff mf f) :end 'p)
=> (pp< < < f< < < < < ff> > > > mf< < < < f> > > > p)

(gen-dynamic '(3 5 4 4 5) '(pp f ff mf f) :end '>)
=> (pp< < < f< < < < < ff> > > > mf< < < < f> > > > >)

(gen-dynamic '(3 5 4 4 5) '(pp f ff mf f) :end '<)
=> (pp< < < f< < < < < ff> > > > mf< < < < f< < < < <)

(gen-dynamic '((3 5) (4 4) (5 3)) '((pp f) (p mf) (f p)) :end 'f)
=> ((pp< < < f> > > > >) (p< < < < mf< < < <) (f> > > > > p< < f))
Opusmodus                                                                  gen-dynamic   2

Setting the :extend to T will removes intermediate textual dynamic indicators and replace
them with extended hairpins:

(gen-dynamic '(3 5 4 4 5) '(pp f ff mf f) :end 'p :extend t)
=> (pp< < < < < < < < ff> > > > mf< < < < f> > > > p)

(gen-dynamic '(3 5 4 4 5) '(pp f ff mf f) :end '< :extend t)
=> (pp< < < < < < < < ff> > > > mf< < < < < < < < <)

(gen-dynamic '((3 5) (4 4) (5 3)) '((pp f) (p mf) (f p))
 :end 'f :extend t)
=> ((pp< < < f> > > > >) (p< < < < < < < <) (f> > > > > p< < f))
