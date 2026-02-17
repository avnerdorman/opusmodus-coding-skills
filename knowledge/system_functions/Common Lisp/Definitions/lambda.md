Opusmodus                                                                   lambda   1

lambda lambda-list {declaration}* {form}*
[Special Form]

Arguments and Values:
lambda-list            an ordinary lambda list.
declaration            a declare expression.
form                   a form.


Description:

Indicates a function with parameters speci ed by lambda-list and body speci ed by
forms.


Examples:
((lambda (x) (* 2 x)) 5)
=> 10

(setf x 10)

((lambda (x) (* 2 x)) x)
=> 20

(mapcar #'(lambda (x)
           (* 2 x)) '(1 2 3 4 5))
=> (2 4 6 8 10)

(funcall (lambda (x) (+ x 3)) 4)
=> 7
                                  fi
                                                                    fi
