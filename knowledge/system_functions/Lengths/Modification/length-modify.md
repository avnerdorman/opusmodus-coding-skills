Opusmodus                                                                         length-modify      1

length-modify value lengths &key type count operator
                      section exclude seed omn flat span

[Function]

Arguments and Values:
value                  ratio or length symbol value.
lengths                lists of lengths or OMN sequence form.
type                   'r (rest) or 'n (note) or '? (at random), if not speci ed random type is used.
count                  an integer, list of integers or 'all.
operator               'sub, 'divide, 'times or 'add.
section                an integer or list of integers. Selected list or lists to process.
                       The default is NIL.
exclude                an integer or list of integers. Excluded list or lists from process.
                       The default is NIL.
seed                   NIL or an integer. The default is NIL.
omn                    NIL or T. If true, the OMN style output is forced. The default is NIL.

OMN:
flat                   NIL or T. If true, the OMN single type lists are atten. The default is NIL.
span                   :length, :pitch or :velocity. The default is :length.


Description:

LENGTH-MODIFY will modify a series of lengths by adding, subtracting, multiplying or
dividing them with a list of duration values. If the :count argument is not given to
LENGTH-MODIFY then the :count is chosen at random.

(length-modify 1/8 '(1/4 1/4 1/4 1/4 1/4 1/4 1/4 1/4)
               :operator 'add :count 'all)
=> (3/8 3/8 3/8 3/8 3/8 3/8 3/8 3/8)

(length-modify 1/8 '(1/4 1/4 1/4 1/4 1/4 1/4 1/4 1/4)
               :operator 'add :count 1)
=> (1/4 1/4 1/4 1/4 1/4 3/8 1/4 1/4)

(length-modify 1/8 '(1/4 1/4 1/4 1/4 1/4 1/4 1/4 1/4)
               :operator 'add :count 2)
=> (3/8 3/8 1/4 1/4 1/4 1/4 1/4 1/4)

(length-modify 1/8 '(1/4 1/4 1/4 1/4 1/4 1/4 1/4 1/4)
               :operator 'add :count 3)
=> (1/4 1/4 1/4 1/4 3/8 3/8 1/4 3/8)
                                                                 fl
                                                                      fi
Opusmodus                                                                    length-modify   2

For example, to subtract a random number of 1/8 values from a simple list of quarter notes:

(length-modify 1/8 '(1/4 1/4 1/4 -1/4) :operator 'sub)
=> (1/8 1/4 1/8 -1/4)

We might apply the subtraction only to actual note lengths:

(length-modify 1/8 '(1/4 1/4 1/4 -1/4) :operator 'sub :type 'n)
=> (1/8 1/8 1/4 -1/4)

Or only to the rest:

(length-modify 1/8 '(1/4 1/4 1/4 -1/4) :operator 'sub :type 'r)
=> (1/4 1/4 1/4 -1/8)

We could also add 1/8 to the values in the phrase:

(length-modify 1/8 '(1/4 1/4 1/4 -1/4) :operator 'add)
=> (3/8 3/8 1/4 -1/4)

Or divide:

(length-modify 2 '(1/4 1/4 1/4 -1/4) :operator 'divide)
=> (1/8 1/4 1/4 -1/8)

Or multiply:

(length-modify 2 '(1/4 1/4 1/4 -1/4) :operator 'times)
=> (1/4 1/4 1/4 -1/2)

Note that when using note values in multiply and divide integers may be preferred, since
1/2 (for example) would naturally multiply by a half: in effect dividing the values:

(length-modify 1/2 '(1/4 1/4 1/4 -1/4) :operator 'times)
=> (1/4 1/8 1/8 -1/4)

Multiple values can be speci ed. Here, the values will be used as a list: the rst value
subtracted will be 1/8, then 1/16 and so on:

(length-modify '(1/8 1/16) '(1/4 1/4 1/4 -1/4) :operator 'sub)
=> (1/8 1/4 3/16 -1/8)

We might also use sublists of lengths. Here, the rst sublist will have 1/8 values taken from
the lengths, and the second sublist will have 1/16 values subtracted:

(length-modify '(1/8 1/16) '((1/4 1/4 1/4 -1/4) (1/4 1/4 1/4 -1/4))
               :operator 'sub)
=> ((1/4 1/4 1/8 -1/4) (1/4 1/4 1/4 -3/16))
                       fi
                                          fi
                                                                      fi
Opusmodus                                                  length-modify   3

Or we could use sublists for both values and lengths:

(length-modify '((1/8 1/16) (1/16 1/32))
               '((1/4 1/4 1/4 -1/4) (1/4 1/4 1/4 -1/4))
               :operator 'sub)
=> ((1/4 1/4 1/4 -1/8) (3/16 7/32 1/4 -1/4))

(setf mel-1 (gen-divide '(2 5 7) (rnd-sample 20 '(c4 cs4 fs4 g4 c5))))
=> ((fs4 c5)
    (cs4 c5 g4 g4 cs4)
    (g4 c4 cs4 g4 c5 g4 c4)
    (cs4 fs4)
    (g4 c5 c5 cs4))

(setf len-1
      (gen-length-cartesian 1 1 'm 'n 4 '(2 3) '(2 5 7 2 4) '(1 2 4)))
=> ((1/4 1/4)
    (1/8 1/8 1/8 1/8 1/4)
    (1/16 1/16 1/16 1/16 1/8 1/8 1/4)
    (1/4 1/4)
    (1/8 1/8 1/8 1/8))

(length-modify '(1/8) len-1 :operator 'add)
=> ((3/8 1/4)
    (1/8 1/8 1/8 1/4 3/8)
    (3/16 3/16 3/16 3/16 1/4 1/4 1/4)
    (3/8 3/8)
    (1/8 1/8 1/8 1/4))


Examples:

Add 1/8 to only a random number of values in a list:

(length-modify 1/8 '(1/8 -1/8 1/8 -1/8) :operator 'add)
=> (1/8 -1/4 1/8 -1/4)

Add 1/8 to two values in a list:

(length-modify 1/8 '(1/8 -1/8 1/8 -1/8) :operator 'add :count 2)
=> (1/8 -1/4 1/8 -1/4)

Add 1/16 to all values in a list:

(length-modify 1/16 '(1/8 1/8 1/8 1/8 -1/8 1/8 1/8 -1/8)
               :operator 'add :type 'n :count 'all)
=> (3/16 3/16 3/16 3/16 -1/8 3/16 3/16 -1/8)
Opusmodus                                                                 length-modify   4

Add 1/8 to only one of the note length values:

(length-modify 1/8 '(1/8 -1/8 1/8 -1/8)
               :operator 'add :type 'n :count 1)
=> (1/8 -1/8 1/4 -1/8)

Add 1/8 to only one of the rest values:

(length-modify 1/8 '(1/8 -1/8 1/8 -1/8)
               :operator 'add :type 'r :count 1)
=> (1/8 -1/4 1/8 -1/8)

Add 1/8 to one value in the rst list and two values in the second list:

(length-modify 1/8 '((1/8 -1/8 1/8 -1/8) (1/8 -1/8 1/8 -1/8))
               :operator 'add :count '(1 2))
=> ((1/4 -1/8 1/8 -1/8) (1/4 -1/8 1/4 -1/8))

Add varying values to each list:

(length-modify '((1/8 1/4) (1/16 1/8))
               '((1/8 -1/8 1/8 -1/8) (1/8 -1/8 1/8 -1/8))
               :operator 'add :count '(3 2))
=> ((1/4 -1/8 3/8 -1/8) (3/16 -1/8 1/4 -1/8))

OMN:

Divide a random number of values by two:

(length-modify 2 '(q c4 d4 e4 f4 g4 a4 b4 c5)
               :operator 'divide)
=> (q c4 d4 e e4 q f4 g4 e a4 q b4 c5)

Divide only two values by two:

(length-modify 2 '(q c4 d4 e4 f4 g4 a4 b4 c5)
               :operator 'divide :count 2)
=> (q c4 d4 e e4 q f4 e g4 q a4 b4 c5)

Divide only two rests by two:

(length-modify 2 '(q c4 - e4 - g4 - b4 -)
              :operator 'divide :type 'r :count 2)
=> (q c4 - e4 -e q g4 -e q b4 -)
                       fi
Opusmodus                                                                    length-modify   5

Divide only two note lengths by two:

(length-modify 2 '(q c4 - e4 - g4 - b4 -)
               :operator 'divide :type 'n :count 2)
=> (q c4 - e4 - e g4 -q e b4 -q)

Divide one value by two in the rst list, and divide two values in the second list:

(length-modify 2 '((q c4 - e4 - g4 - b4 -)
                   (q b4 - g4 - e4 - c4 -))
               :operator 'divide :count '(1 2))
=> ((q c4 -e q e4 - g4 - b4 -)
    (q b4 - e g4 -q e e4 -q c4 -))
                         fi
