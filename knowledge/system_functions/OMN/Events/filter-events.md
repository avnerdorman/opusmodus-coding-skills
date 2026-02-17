Opusmodus                                                                             filter-events   1

filter-events element sequence &key remain joined-attributes
                       section exclude

[Function]

Arguments and Values:
element                  a symbol or a list of symbols (length, pitch, velocity and attribute).
sequence                 omn sequence.
remain                   T or NIL. The default is NIL.
joined-attributes        T or NIL. The default is NIL.
section                  an integer or list of integers. Selected list or lists to process.
                         The default is NIL.
exclude                  an integer or list of integers. Excluded list or lists from process.
                         The default is NIL.


Description:

The function FILTER-EVENTS internally brakes-up an omn sequence into single-
events (l p v a)and checks whether an event contains the given element. When an
element is found the event is returned. All other events are transformed into rests. The
option :remain will invert the process.

(filter-events 'd4 '(e c4 mp -e fermata e. d4 -h e. c4 e e4))
=> (-q e. d4 mp -h.s)

(filter-events 'd4 '(e c4 mp -e fermata e. d4 -h e. c4 e e4)
               :remain t)
=> (e c4 mp -e fermata -he. e. c4 e e4)

(filter-events 'fermata '(e c4 mp -e fermata+stacc e. d4 -h e. c4 e e4))
=> (-wq.)

(filter-events 'fermata '(e c4 mp -e fermata+stacc e. d4 -h e. c4 e e4)
               :joined-attributes t)
=> (-q e c4 mp fermata+stacc -w)

These two options are useful for orchestration.


Examples:
(setf mat1 '(e c4 mp arco+ponte -e fermata e. d4 mp tasto
             -h e. c4 p pizz+ponte e e4 p arco+tasto))
Opusmodus                                                  filter-events   2

(filter-events 'arco+ponte mat1)
=> (e c4 mp arco+ponte -we)

(filter-events 'arco+ponte mat1 :remain t)
=> (-e -e fermata e. d4 mp tasto -h
    e. c4 p pizz+ponte e e4 arco+tasto)

(filter-events 'fermata mat1 :remain t)
=> (e c4 mp arco+ponte - e. d4 tasto -h
    e. c4 p pizz+ponte e e4 arco+tasto)

(filter-events 'fermata mat1)
=> (-e -e fermata -w)

(filter-events 'd4 mat1 :remain t)
=> (e c4 mp arco+ponte -e fermata -he.
    e. c4 p pizz+ponte e e4 arco+tasto)

(filter-events '(e d4) mat1)
=> (e c4 mp arco+ponte - e. d4 tasto -he. e e4 p arco+tasto)

(filter-events '(e d4) mat1 :remain t)
=> (-e -e fermata -he. e. c4 p pizz+ponte -e)

(setf mat2 '((e c4 mp arco+ponte -e fermata e. d4 mp tasto -h
              e. c4 p pizz+ponte e e4 p arco+tasto)
             (e c4 f stacc e. d4 -h e. c4 p ord -e fermata e4 stacc)))

(filter-events 'e. mat2 :section 1 :remain t)
=> ((e c4 mp arco+ponte -e fermata e. d4 mp tasto -h
     e. c4 p pizz+ponte e e4 p arco+tasto)
    (e c4 f stacc -h.. -e fermata e4 p stacc))

(filter-events '((e.) (e4 fermata)) mat2)
=> ((-q e. d4 mp tasto -h e. c4 p pizz+ponte -e)
    (-w -e fermata e4 p stacc))

(filter-events '(e4 fermata) mat2 :remain t)
=> ((e c4 mp arco+ponte - e. d4 tasto -h e. c4 p pizz+ponte -e)
    (e c4 f stacc e. d4 -h e. c4 p ord -q))
