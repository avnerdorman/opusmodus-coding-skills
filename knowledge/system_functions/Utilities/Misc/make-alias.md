Opusmodus                                                                    make-alias     1

make-alias function-name alias
[Function]

Arguments and Values:
function-name           a function name.


Description:

The function MAKE-ALIAS returns an abbreviated alias for any function name.

(make-alias vector-map vm~)

(vm~ '(c4 d4 e4 g4 a4) (gen-noise 10))
=> (g4 e4 c4 c4 d4 e4 a4 d4 d4 a4)

This can be useful when many different instances of the same function name are being used
in the same score-script or the composer develops a group of functions used regularly and
wants to speed up writing by using abbreviations.

A list of aliases can be collected under the MAKE-ALIAS function.

(make-alias
 gen-integer gi~
 chord-inner-remove cir~
 length-note-condense lnc~
 gen-palindrome gp~
 )
