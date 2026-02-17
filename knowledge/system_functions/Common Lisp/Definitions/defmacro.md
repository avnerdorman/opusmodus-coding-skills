Opusmodus                                                                      defmacro   1

defmacro symbol lambda-list [[declaration* | documentation]] form*
[Macro]

Arguments and Values:
symbol                     a symbol.
lambda-list                a macro lambda list.
declaration                a declare expression.
documentation              a string.
form                       a form.


Description:

Constructs a global macro de nition, binds it to symbol, marks symbol as a macro, and
returns symbol. DEFMACRO is the macro equivalent of DEFUN.


Examples:
(defmacro mac1 (a b) "Mac1 multiplies and adds"
          `(+ ,a (* ,b 3)))

(mac1 4 5)
=> 19

(documentation 'mac1 'function)
=> "Mac1 multiplies and adds"

(defmacro mac2 (&optional (a 2 b) (c 3 d) &rest x)
          `'(,a ,b ,c ,d ,x))

(mac2 6)
=> (6 T 3 nil nil)

(mac2 6 3 8)
=> (6 t 3 t (8))

(defmacro mac3 (&whole r a &optional (b 3) &rest x &key c (d a))
          `'(,r ,a ,b ,c ,d ,x))

(mac3 1 6 :d 8 :c 9 :d 10)
=> ((mac3 1 6 :d 8 :c 9 :d 10) 1 6 9 8 (:d 8 :c 9 :d 10))
                      fi
