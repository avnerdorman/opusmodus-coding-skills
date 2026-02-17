Opusmodus                                                                          cadr     1

cadr list
[Function]

Arguments and Values:
list                     a list.


Description:

Returns second element of a list.


Examples:
(cadr '(a b c))
=> b

(cadr '(1/16 1/8 1/4))
=> 1/8

All of the compositions of up to four CAR and CDR operations are de ned as separate
COMMON LISP functions. The names of these functions begin with c and end with r, and
in between is a sequence of a and d letters corresponding to the composition performed by
the function.

caar list
cadr list
cdar list
cddr list
caaar list
caadr list
cadar list
caddr list
cdaar list
cdadr list
cddar list
cdddr list
caaaar list
caaadr list
caadar list
caaddr list
cadaar list
cadadr list
caddar list
cadddr list
cdaaar list
                                                            fi
Opusmodus      cadr   2

cdaadr list
cdadar list
cdaddr list
cddaar list
cddadr list
cdddar list
cddddr list

or

first list
second list
third list
fourth list
fifth list
sixth list
seventh list
eighth list
ninth list
tenth list
