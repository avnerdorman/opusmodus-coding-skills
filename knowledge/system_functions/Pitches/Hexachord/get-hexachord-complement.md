Opusmodus                                                    get-hexachord-complement   1

get-hexachord-complement hexachord &optional type
[Function]

Arguments and Values:
hexachord              six-pitch classes.
type                   :integer or :pitch. The default is :integer.


Description:

This function collect complement pitch classes of a given hexachord. The combination of
the hexachord and of the result will constitute the makeup of an aggregate (twelve-
tone row).


Example:
(get-hexachord-complement '(0 1 2 6 7 8))
=> (5 4 3 11 10 9)

(get-hexachord-complement '(0 1 2 6 7 8) :pitch)
=> (f4 e4 eb4 b4 bb4 a4)
