Opusmodus                                                                       mclist     1

mclist &rest list
[Function]

Arguments and Values:
list                    list of items.


Description:

The function MCLIST is a valuable tool for simplifying (mapcar 'list list). One of
the essential tools in handling and processing list of data, it is one of the few a LISP
primitives that every composer using OPUSMODUS needs to know!


Examples:
(mclist '(c4 d4 e4 f4 g4 a4 b4))
=> ((c4) (d4) (e4) (f4) (g4) (a4) (b4))

(mclist '(c4 d4 e4 f4 g4 a4 b4) '(bb4 as4 gs4 fs4 eb4 ds4 cs4))
=> ((c4 bb4) (d4 as4) (e4 gs4) (f4 fs4) (g4 eb4) (a4 ds4) (b4 cs4))
