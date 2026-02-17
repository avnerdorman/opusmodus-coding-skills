Opusmodus                                                            aref   1

aref array &rest subscripts
(setf (aref array &rest subscripts) new-element)

[Function]

Arguments and Values:
array                 an array.
subscripts            a list of valid array indices for the array.
new-element           an object.


Description:

Return the element of the array speci ed by the subscripts.


Examples:
(aref (setf alpha (make-array 4)) 3)
=> 0

(setf (aref alpha 3) 'sirens)
=> sirens

(aref alpha 3)
=> sirens

(aref
 (setf beta
       (make-array '(2 4)
                   :element-type '(unsigned-byte 2)
                   :initial-contents '((0 1 2 3) (3 2 1 0))))
     1 2)
=> 1

(setf gamma '(0 2))
(apply #'aref beta gamma)
=> 2

(setf (apply #'aref beta gamma) 3)
=> 3

(apply #'aref beta gamma)
=> 3

(aref beta 0 2)
=> 3
                               fi
