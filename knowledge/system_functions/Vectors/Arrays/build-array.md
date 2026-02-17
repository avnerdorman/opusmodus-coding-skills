Opusmodus                                               build-array   1

build-array list
[Function]

Arguments and Values:
list                       a list


Description:

Convert a series of lists to an array.

(build-array '((1 2 3) (4 5 6) (7 8 9)))
=> #2A((1 2 3) (4 5 6) (7 8 9))

(setf array (build-array '((1 2 3) (4 5 6) (7 8 9))))

(get-array 0 1 3 array :direction 'down)
=> (2 5 8)
