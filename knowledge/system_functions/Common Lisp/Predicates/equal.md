Opusmodus                                                                           equal   1

equal x y
[Function]

Arguments and Values:
x                        an object.
y                        an object.


Description:

Return T if x and y are EQL or if they are structured components whose elements are
EQUAL. Strings and bit-vectors are EQUAL if they are the same length and have identical
components. Other arrays must be EQ to be equal. Pathnames are EQUAL if their
components are. EQUAL is true of two objects if they are symbols that are EQ, if they are
numbers that are EQL, or if they are characters that are EQL.


Examples:
(equal 4 4)
=> t

(equal 'a 'a)
=> t

(equal 4 'a)
=> nil

(equal 3 3)
=> t

(equal 3 3.0)
=> nil
