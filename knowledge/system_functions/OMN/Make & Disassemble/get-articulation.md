Opusmodus                                                          get-articulation   1

get-articulation sequence
[Function]

Arguments and Values:
sequence               omn sequence.


Description:

The function GET-ARTICULATION allows you to extract all articulation parameters
including numeric formats into one sequence.


Examples:
(setf sequence
 '((s eb6 p< leg f5 < leg c5 < leg f5 <)
   (s bb3 stacc a3 mp ped g3 ped a3 f pedc4 ped f4 ped a4)))

(get-articulation sequence)
=> ((leg leg leg -) (stacc ped ped ped ped ped -))

Example using OMN function:

(omn :articulation sequence)
=> ((- - - -) (stacc - - - - - -))

(omn :ped sequence)
=> ((-) (-1 5 -1))

(omn :leg sequence)
=> ((3 -1) (-))
