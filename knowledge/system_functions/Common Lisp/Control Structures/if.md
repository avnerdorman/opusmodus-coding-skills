Opusmodus                                                                                 if   1

if test then else
[Special Form]

Arguments and Values:
test                     a form.
then                     a form.
else                     a form. The default is NIL.


Description:

If test evaluates to non-null, evaluate then and returns its values, otherwise evaluate
else and return its values.


Examples:
(if (numberp 4) 'yes 'no)
=> yes

(if (numberp 'a) 1 0)
=> 0

(setf x '(1 2 3))

(if (listp x) 'list 'not-a-list)
=> list
