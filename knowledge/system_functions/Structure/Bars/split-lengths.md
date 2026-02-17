Opusmodus                                                                          split-lengths   1

split-lengths sequence &key type section omn

[Function]

Arguments and Values:
sequence                 lists of lengths or OMN sequence form.
type                     :extend, :denominator or :tuplet. The default is :extend.
section                  an integer or list of integers. Selected list or lists to process.
omn                      NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

The SPLIT-LENGTHS function splits lengths into sequential basic length and tuplet
length groups.

(split-lengths
 '(5/32 1/32 1/4 1/32 5/32 1/20 1/10 1/10 3/32 1/32 5/32))
=> ((5/32 1/32 1/4 1/32 5/32) (1/20 1/10 1/10) (3/32 1/32 5/32))


Examples:

In the following three examples we use the same input to demonstrate the difference in the
results.

(setf lengths '(5/32 1/32 1/4 1/32 5/32 1/20 1/4
                2/20 3/32 1/32 5/32 1/16 1/16))

The :extend (splits basic lengths and tuplets with boundary) type:

(split-lengths lengths :type :extend)
=> ((5/32 1/32 1/4 1/32 5/32) (1/20 1/4 1/10)
    (3/32 1/32 5/32 1/16 1/16))
Opusmodus                                                     split-lengths   2

The :tuplet type:

(split-lengths lengths :type :tuplet)
=> ((5/32 1/32 1/4 1/32 5/32) (1/20) (1/4) (1/10)
    (3/32 1/32 5/32 1/16 1/16))




The :denominator (unique) type:

(split-lengths lengths :type :denominator)
=> ((5/32 1/32) (1/4) (1/32 5/32) (1/20)
    (1/4) (1/10) (3/32 1/32 5/32) (1/16 1/16))




The examples below using the default type :extend.

(split-lengths
'((3/5 1/10 1/20 3/10 1/16 1/8 1/4 2/5 1/2)
  (3/20 9/20 1/8 1/4 1/8 7/20 1/5 11/20)))
=> ((3/5 1/10 1/20 3/10)
    (1/16 1/8 1/4)
    (2/5)
    (1/2)
    (3/20 9/20)
    (1/8 1/4 1/8)
    (7/20 1/5 11/20))

(split-lengths '(et t q t et 5q q 5h s. t et s s) :omn t)
=> ((et t q t et) (5q q 5h) (s. t et s =))

(split-lengths '(3q a4 b4 d4 f4 d4 q a4 b4 5q g3 a4 q - -))
=> ((3q a4 b4 d4 f4 d4 q a4 b4) (5q g3 a4 q - -))
