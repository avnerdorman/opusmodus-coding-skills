Opusmodus                                                                                     get-pcs    1

get-pcs sequence &key type
[Function]

Arguments and Values:
sequence                  a sequence: pitch, integer, tonality, chord, forte symbol and omn-form list.
type                      :prime-form, :sort and NIL. The default is NIL.


Description:

Allen Forte's unique notation system commonly known as Forte Notation in which he
extrapolates from the serial theory of Milton Babbitt, proposes a musical SET THEORY of
pitch-class-set analysis analogous to mathematical set theory. This has the avowed intention
of providing a method for the analysis of serial or non-serial atonal music. Forte's system is
equally at home describing Ives and Stravinsky as it is Schoenberg and Webern.

In the integer model of pitch, all pitch classes and intervals between pitch classes are
designated using the numbers 0 through 11. It is a common analytical and compositional
tool when working with chromatic music, including twelve tone, serial, or otherwise atonal
music. Such a system able to deal with intervallic relationships from pitch class
extrapolations of material has a potential within Opusmodus to be itself a generator of pitch
series.

Pitch-class, one of the 12 pitch-classes designated by integers 0 11. Pitch-class 0 refers to
all notated pitches C, B-sharp, D-double- at. Pitch-class 1 refers to all notated pitches C-
sharp, D- at, B-double-sharp, and so on.

The GET-PCS function returns a pitch class set from a list of pitches, integers, tonalities,
chords, forte notation and omn-forms.


Examples:
(get-pcs 'major)
=> (0 2 4 5 7 9 11)

(get-pcs '(cs5 m7))
=> (1 4 8 11)

(get-pcs '(cs5 m7) :type :prime-form)
=> (0 3 5 8)
   fl
                                     fl
Opusmodus                                          get-pcs   2

(get-pcs '((cs5 m7) (eb4 m)) :type :prime-form)
=> ((0 3 5 8) (0 3 7))

(get-pcs '(q c4eb4 f4 a5))
=> (0 3 5 9)

(get-pcs '3-4)
=> (0 1 5)

(get-pcs '(3-4 6-7))
=> ((0 1 5) (0 1 2 6 7 8))

(setf mat '(h.. c6 pp ws b4 h.. eb5 we gs5
            ws w gs4 g5 h... b5 we g5 h... gs4))

(get-pcs mat)
=> (0 11 3 8 7)

(get-pcs mat :type :sort)
=> (0 3 7 8 11)

(get-pcs mat :type :prime-form)
=> (0 1 4 5 8)
