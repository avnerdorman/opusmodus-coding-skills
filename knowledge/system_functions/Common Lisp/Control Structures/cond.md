Opusmodus                                                                                cond      1

cond test-form form*
[Macro]

Arguments and Values:
test-form                 a form.
forms                     an implicit progn.


Description:

Consists of a series of clauses which are tested sequentially. If a test is true, COND evaluates
the corresponding forms and returns the last form's value. If the test returns NIL, COND
proceeds to the next test-form clause. If all tests fail, COND returns NIL.


Examples:
(setf x 1)

(cond
 ((equal x 1) 10)
 ((equal x 2) 20))
=> 10

(setf n 5)
=> 5

(cond
 ((< n 1) 1)
 ((> n 1) 10))
=> 10
