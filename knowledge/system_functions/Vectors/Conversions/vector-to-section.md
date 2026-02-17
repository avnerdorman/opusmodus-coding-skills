Opusmodus                                                                 vector-to-section   1

vector-to-section select low high vector &key remove
[Function]

Arguments and Values:
select                   an integer.
low                      an integer.
high                     an integer.
vector                   a list of vector.
remove                   NIL or a list of integers. The default is NIL.


Description:

VECTOR-TO-SECTION generates a list of numbers useful for functions with :section
(keyword) parameter. This function processes a list of vectors into integers. The function
then organises the resultant list using a random process that remove select ranges of integers
to make the resultant list smaller. In the rst example think of the function selecting a range
of integers between 1 and 3 apart and then removing between 0 and 10 integers. This makes
for an interesting resultant pattern.


Examples:
(vector-to-section '(1 3) 0 10 (gen-noise 112) :remove '(2 20 34))
=> (1 3 6 9 11 15 16 18 25 29 30 31 32 36
    39 46 55 58 72 77 87 93 94 98 99 103 104)

(vector-to-section '(1 3) 0 10 (gen-noise 112) :remove nil)
=> (0 15 18 21 24 29 31 35 37 42 43 49 58 64
    68 69 70 78 84 85 86 97 103 107)

(vector-to-section '(1 3) 0 20 (gen-noise 112) :remove nil)
=> (8 26 32 35 38 48 89 92 109 110)

(vector-to-section '(1 7) 0 20 (gen-noise 112) :remove nil)
=> (0 9 13 16 23 49 51 72 73 77 93)
                                  fi
