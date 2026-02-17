Opusmodus                                                             length-rational-quantize    1

length-rational-quantize sequence &key round type
                                            section exclude omn

[Function]

Arguments and Values:
sequence                 lists of lengths or OMN sequence form.
round                    lists of lengths or OMN sequence form. The default is 1/4.
type                     :extend, :denominator or :tuplet. The default is :extend.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.
omn                      NIL or T. If true, the OMN style output is forced. The default is NIL.


Description:

The LENGTH-RATIONAL-QUANTIZE function splits lengths into sequential basic
length and tuplet length groups. Should the sum of a group not add up to a round value or
its multiplication, a length-rest will be added at the end of the group.

(length-rational-quantize '(1/4 -1/16 1/16 5/7 1/5 3/10 3/20 5/16))
=> (1/4 -1/16 1/16 -1/8
    5/7 -1/28
    1/5 3/10 3/20 -1/10
    5/16 -3/16)
Opusmodus                                                     length-rational-quantize   2

Examples:

The extend (splits basic lengths and tuplets with boundary) type:

(length-rational-quantize
 '(5/32 1/32 1/4 1/32 5/32 1/20 1/4 2/20 3/32 1/32 5/32 1/16 1/16)
 :type :extend)
=> (5/32 1/32 1/4 1/32 5/32 -1/8
    1/20 1/4 1/10 -1/10
    3/32 1/32 5/32 1/16 1/16 -3/32)




The denominator (unique) type:

(length-rational-quantize
 '(5/32 1/32 1/4 1/32 5/32 1/20 1/4 2/20 3/32 1/32 5/32 1/16 1/16)
 :type :denominator)
=> (5/32 1/32 -1/16 1/4 1/32 5/32 -1/16 1/20 -1/5
    1/4 1/10 -3/20 3/32 1/32 5/32 -7/32 1/16 1/16 -1/8)




The tuplet type:

(length-rational-quantize
 '(5/32 1/32 1/4 1/32 5/32 1/20 1/4 2/20 3/32 1/32 5/32 1/16 1/16)
 :type :tuplet)
=> (5/32 1/32 1/4 1/32 5/32 -1/8 1/20 -1/5 1/4
    1/10 -3/20 3/32 1/32 5/32 1/16 1/16 -3/32)
Opusmodus                                            length-rational-quantize   3

The examples below using the default type :extend.

(length-rational-quantize
 '(5/32 1/32 1/4 1/32 5/32 1/20 1/4 2/20 3/32 1/32 5/32 1/16 1/16)
 :round 1/8)
=> (5/32 1/32 1/4 1/32 5/32 1/20 1/4 1/10
    -1/10 3/32 1/32 5/32 1/16 1/16 -3/32)




(length-rational-quantize
 '((1/16 -1/16 2/32 5/7) (4/20 6/20 3/20 5/16)) :round 1/8)
=> ((1/16 -1/16 1/16 -1/16 5/7 -1/28)
    (1/5 3/10 3/20 -1/10 5/16 -1/16))




Each sublist with its own round value:

(length-rational-quantize
 '((1/16 -1/16 2/32 5/7) (4/20 6/20 3/20 5/16)) :round '(1/8 1/4))
=> ((1/16 -1/16 1/16 -1/16 5/7 -1/28)
    (1/5 3/10 3/20 -1/10 5/16 -3/16))
