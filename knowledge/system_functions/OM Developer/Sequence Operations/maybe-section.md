Opusmodus                                                                                 maybe-section   1

maybe-section lambda-list sequence &optional section
[Function]

Arguments and Values:
lambda-list              an ordinary lambda list.
sequence                 a sequence.
section                  an integer or list of integers. Selected list or lists to process.


Description:

The function MAYBE-SECTION applies a function process to only the selected list or lists.


Examples:
(maybe-section
 (lambda (x) (pitch-transpose 12 x))
 '((c4) (d4) (e4)) 1)
=> ((c4) (d5) (e4))

(maybe-section
 (lambda (x) (pitch-transpose 12 x))
 '((c4) (d4) (e4)) '(0 1))
=> ((c5) (d5) (e4))

Function with embedded :section:

(defun binary-inversion (binary &key section)
  (do-verbose ("binary-inversion")
    (labels ((binary-invert-l (binary)
               (loop for i in binary
                 collect (if (= i 0) 1 0)))
             (binary-invert* (binary)
               (maybe-map #'binary-invert-l binary)))
      (maybe-section
       (lambda (x) (binary-invert* x)) binary section))))

(binary-inversion '((1 1 0 0 1) (0 0 1 0 1 0 0 1)))
=> ((0 0 1 1 0) (1 1 0 1 0 1 1 0))

(binary-inversion '((1 1 0 0 1) (0 0 1 0 1 0 0 1)) :section 0)
=> ((0 0 1 1 0) (0 0 1 0 1 0 0 1))
