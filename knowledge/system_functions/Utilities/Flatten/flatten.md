Opusmodus                                                                             flatten      1

flatten lists
[Function]

Arguments and Values:
lists                         lists of values to atten.


Description:

The function FLATTEN is a valuable tool for simplifying lists and lists-within-lists.

(flatten '((c4 cs4 fs4) (f4 b4 c4)))
=> (c4 cs4 fs4 f4 b4 c4)

One of the essential tools in handling and processing lists of data, it is one of the few a LISP
primitives that every composer using OPUSMODUS needs to know!


Examples:

Deeply nested lists are also attened:

(flatten '((c4 (d4 e4)) (f4 ((g4 a4) b4))))
=> (c4 d4 e4 f4 g4 a4 b4)

Very often a composer will collect different phrases or sequences of material that need to be
combined.

(setf
 rhy-1 '(1/4 1/4 1/8 -1/8 1/16 1/16 1/16 1/16)
 rhy-2 '(1/8 1/8 1/8 1/8 1/16 -1/16))

The LISP primitive append joins both rhythmic phrases together .

(setf rhy-3 (append rhy-1 rhy-2))
=> (1/4 1/4 1/8 -1/8 1/16 1/16 1/16
    1/16 1/8 1/8 1/8 1/8 1/16 -1/16)

But let's suppose the composer now wants to insert rhythmic phrase '(1/2 1/8 1/8)
into rhy-3 whilst retaining the original lists rhy-1. rhy-2 and rhy-3. This would seem to be the
solution, but only the head of the inserted phrase '1/2 has been entered into the list.
                         fl
                                        fl
Opusmodus                                                     flatten   2

(position-insert 2 '(1/2 1/8 1/8) rhy-3)
=> (1/4 1/4 1/2 1/8 -1/8 1/16 1/16 1/16
    1/16 1/8 1/8 1/8 1/8 1/16 -1/16)

The solution is to do this:

(setf rhy-4 (position-insert 2 '((1/2 1/8 1/8)) rhy-3))
=> (1/4 1/4 (1/2 1/8 1/8) 1/8 -1/8 1/16 1/16
    1/16 1/16 1/8 1/8 1/8 1/8 1/16 -1/16)

By using the function FLATTEN a single list can be created.

(flatten rhy-4)
=> (1/4 1/4 1/2 1/8 1/8 1/8 -1/8 1/16 1/16
    1/16 1/16 1/8 1/8 1/8 1/8 1/16 -1/16)
