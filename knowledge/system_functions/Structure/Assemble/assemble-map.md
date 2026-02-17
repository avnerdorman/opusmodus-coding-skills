Opusmodus                                                                    assemble-map   1

assemble-map list-number position lists
[Function]

Arguments and Values:
list-number              which list to pick from.
position                 position to pick from in the list.
lists                    a series of lists of any type.


Description:

ASSEMBLE-MAP can be used to select single values from a series of lists.


Examples:
(assemble-map '(0 1 0 2)
              '(0 1 2 3)
              '((cs5 ds5 fs5) (c4cs4 d4 ds4) (c4 d4 e4 f4)))
=> (cs5 d4 fs5 f4)

It would be particularly effective when mixing or creating a collage from very diverse
material. Let's imagine a piano piece where different techniques and textures had been
created in separate lists.

(setf line-1 '(c4 cs4 fs4 g4))
(setf line-2 '(c2 f2 fs2 b2))
(setf chord-1 (gen-repeat 4 '(cs5fs5g5)))
(setf chord-2 (gen-repeat 4 '(f3b4c4)))

(assemble-map (rnd-sample 12 '(0 1 2 3))
              (rnd-sample 12 '(1 2 3))
              (list line-1 line-2 chord-1 chord-2))

=> (f3b4c4 cs5fs5g5 fs4 f3b4c4 fs2 cs5fs5g5
    cs4 cs5fs5g5 f3b4c4 g4 f3b4c4 fs4)
Opusmodus                                                                   assemble-map   2

This function might be useful when selecting chords coming from a series of outputs.

(setf clusters
      (gen-loop 8
       (gen-chord
        11 2 4 0 0 '(c4 cs4 d4 ds4 e4 f4 fs4 g4 gs4 a4 as4 b4))
       :seed 45))
=> ((c4cs4d4 eb4e4f4fs4 g4gs4a4 bb4b4)
    (c4cs4d4eb4 e4f4fs4 g4gs4a4 bb4b4)
    (c4cs4d4eb4 e4f4fs4g4 gs4a4bb4b4)
    (c4cs4d4 eb4e4 f4fs4 g4gs4 a4bb4b4)
    (c4cs4d4 eb4e4f4fs4 g4gs4a4bb4 b4)
    (c4cs4d4eb4 e4f4fs4 g4gs4 a4bb4b4)
    (c4cs4 d4eb4 e4f4fs4 g4gs4a4bb4 b4)
    (c4cs4d4eb4 e4f4fs4g4 gs4a4bb4 b4))

(assemble-map '(0 1 4 3 2 5) '(0 1 3 2 2 3) clusters)
=> (c4cs4d4 e4f4fs4 b4 f4fs4 gs4a4bb4b4 a4bb4b4)
