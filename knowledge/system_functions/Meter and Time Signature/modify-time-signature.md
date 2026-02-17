Opusmodus                                                                modify-time-signature   1

modify-time-signature sequence &key compress
                                      ignore span numerator

[Function]

Arguments and Values:
sequence                 a sequence of time signature forms.
compress                 T or NIL. The default is NIL.
ignore                   time signature form list. The default is NIL.
span                     a ratio or an integer. The default is 10/4.
numerator                maximum value. The default is 20.


Description:

This function will modify a time-signature list when the :numerator value is 1. For
example a time-signature list (1 4 3) will change to (3 4 1).

(setq bars '((5 4 4) (1 4 2) (1 4 4) (1 4 4) (1 4 4)
             (3 4 2) (1 8 19) (1 32 8) (1 8 5) (1 8 5)))

(modify-time-signature bars)
=> ((5 4 4) (2 4 1) (4 4 1) (4 4 1) (4 4 1)
    (6 4 1) (19 8 1) (8 32 1) (5 8 1) (5 8 1))


Examples:

The compress option will add up all time-signatures of the same values in a sequence, into
a new time-signature list:

(modify-time-signature bars :compress t)
=> ((5 4 4) (14 4 1) (6 4 1) (19 8 1) (8 32 1) (10 8 1))

This option will ignore the given time-signature lists, from processing:

(modify-time-signature bars :ignore '(1 4))
=> ((5 4 4) (1 4 2) (1 4 4) (1 4 4) (1 4 4)
    (6 4 1) (19 8 1) (8 32 1) (5 8 1) (5 8 1))

(modify-time-signature bars :ignore '((1 4) (1 8)) :compress t)
=> ((5 4 4) (1 4 14) (6 4 1) (1 8 19) (8 32 1) (1 8 10))
Opusmodus                                                        modify-time-signature   2

Time-signature values exceeding the :span value won’t be modi ed:

(modify-time-signature bars :span '4/4)
=> ((5 4 4) (2 4 1) (4 4 1) (4 4 1) (4 4 1)
    (6 4 1) (19 8 1) (1 32 8) (5 8 1) (5 8 1))

Time signature lists with a lager numerator than 7 won’t be modi ed:

(modify-time-signature bars :numerator 7)
=> ((5 4 4) (2 4 1) (4 4 1) (4 4 1) (4 4 1)
    (6 4 1) (1 8 19) (1 32 8) (5 8 1) (5 8 1))




                                                       fi
                                                            fi
