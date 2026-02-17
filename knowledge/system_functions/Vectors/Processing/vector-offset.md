Opusmodus                                                                    vector-offset   1

vector-offset n vector
[Function]

Arguments and Values:
n                         a number.
vector                    a vector array.


Description:

This function adds or subtracts a given value to all values of vector or a list of numbers.
The result is a vector. In lists of vector data such additions can place the material stream in
a better position for use as, for example, velocity data.

(vector-offset 5 '(1 2 3 4 5))
=> (6 7 8 9 10)

(vector-offset 5 #(0.18453279 0.04390727 0.16944319))
=> #(5.1845326 5.043907 5.169443)


Examples:
(setf v-stream
     (vector-round 0 12 (vector-smooth 0.2 (gen-noise 32))))
=> (0 0 3 7 9 9 10 9 9 6 2 2 3 6 9 12
    12 12 9 8 8 6 4 9 10 10 8 5 9 5 9 6)

(setf v-stream-add (vector-offset 55 v-stream))
=> (55 55 58 62 64 64 65 64 64 61 57 57 58 61 64 67
    67 67 64 63 63 61 59 64 65 65 63 60 64 60 64 61)
