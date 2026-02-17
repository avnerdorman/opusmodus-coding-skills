Opusmodus                                                                      defvar   1

defvar name initial-value &optional documentation
[Macro]

Arguments and Values:
name                    a symbol.
initial-value           a form.
documentation           a string.


Description:

DEFVAR assigns initial-value (if supplied) to the dynamic variable named name only
if name is not already bound. The third argument is an optional documentation string
for the variable. DEFPARAMETER and DEFVAR normally appear as a top level form, but it is
meaningful for them to appear as non-top-level forms. However, the compile-time side
effects described below only take place when they appear as top level forms.


Examples:
(defparameter *p* 1)
=> *p*

(constantp '*p*)
=> nil

(setf *p* 2)
=> 2

(defparameter *p* 3)
=> *p*
=> 3

(defvar *v* 1)
=> *v*
=> 1

(constantp '*v*)
=> nil

(setf *v* 2)
=> 2

(defvar *v* 3)
=> *v*
=> 2
Opusmodus                       defvar   2

(defun foo ()
 (let ((*p* 'p) (*v* 'v))
       (bar)))
=> foo

(defun bar () (list *p* *v*))
=> bar

(foo)
=> (p v)
