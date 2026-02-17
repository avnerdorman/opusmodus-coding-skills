Opusmodus                                                                                  pop      1

pop place
[Macro]

Arguments and Values:
place                      a place.


Description:

The argument is a location holding a list. Pops one item of the front of the list and returns it.


Examples:
(setf x '(a b c d))

x
=> (a b c d)

(pop x)
=> a

and now

x
=> (b c d)
