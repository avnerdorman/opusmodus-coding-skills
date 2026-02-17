Opusmodus                                                             make-dictum    1

make-dictum voices dictums &key sequence span extend methods harmony
                     tonality polyphony leading iterate tempo

[Function]

Arguments and Values:
voices                    an integer (number of voices).
dictums                   an integer (number of dictums).
sequence                  T or NIL. The default is NIL.
span                      T or NIL. The default is NIL.
extend                    T or NIL. The default is NIL.
methods                   T or NIL. The default is NIL.
harmony                   T or NIL. The default is NIL.
tonality                  T or NIL. The default is NIL.
polyphony                 T or NIL. The default is NIL.
leading                   T or NIL. The default is NIL.
iterate                   T or NIL. The default is NIL.
tempo                     T or NIL. The default is NIL.


Description:

The MAKE-DICTUM function generates a counterpoint template with a number of dictum
lists. Every list contains a list of voices and methods ready to be de ned by the
composer. This function is a companion to the COUNTERPOINT function.


Examples:
(make-dictum 4 8 :span t :methods t)

The result in the Listener:

(counterpoint
 patterns
 '(
    #|1|# ((- - - -) :span nil :methods (- - - -))
    #|2|# ((- - - -) :span nil :methods (- - - -))
    #|3|# ((- - - -) :span nil :methods (- - - -))
    #|4|# ((- - - -) :span nil :methods (- - - -))
    #|5|# ((- - - -) :span nil :methods (- - - -))
    #|6|# ((- - - -) :span nil :methods (- - - -))
    #|7|# ((- - - -) :span nil :methods (- - - -))
    #|8|# ((- - - -) :span nil :methods (- - - -))
    )
 :global-methods '(- - - -)
 :global-polyphony nil
 )
                                                            fi
Opusmodus                                                    make-dictum   2

(make-dictum 4 12 :span t :extend t :methods t :harmony t
                  :polyphony t :leading t :iterate t :tempo t)

(counterpoint
 patterns
 '(
    #|1|# ((- - - -) :span nil :extend (- - - -)
                     :methods (- - - -) :harmony nil
                     :polyphony nil :leading nil
                     :iterate nil :tempo nil)
    #|2|# ((- - - -) :span nil :extend (- - - -)
                     :methods (- - - -) :harmony nil
                     :polyphony nil :leading nil
                     :iterate nil :tempo nil)
    #|3|# ((- - - -) :span nil :extend (- - - -)
                     :methods (- - - -) :harmony nil
                     :polyphony nil :leading nil
                     :iterate nil :tempo nil)
    #|4|# ((- - - -) :span nil :extend (- - - -)
                     :methods (- - - -) :harmony nil
                     :polyphony nil :leading nil
                     :iterate nil :tempo nil)
    #|5|# ((- - - -) :span nil :extend (- - - -)
                     :methods (- - - -) :harmony nil
                     :polyphony nil :leading nil
                     :iterate nil :tempo nil)
    #|6|# ((- - - -) :span nil :extend (- - - -)
                     :methods (- - - -) :harmony nil
                     :polyphony nil :leading nil
                     :iterate nil :tempo nil)
    #|7|# ((- - - -) :span nil :extend (- - - -)
                     :methods (- - - -) :harmony nil
                     :polyphony nil :leading nil
                     :iterate nil :tempo nil)
    #|8|# ((- - - -) :span nil :extend (- - - -)
                     :methods (- - - -) :harmony nil
                     :polyphony nil :leading nil
                     :iterate nil :tempo nil)
    )
 :global-methods '(- - - -)
 :global-polyphony nil
 )
Opusmodus                                                                  make-dictum   3

Depending on your rules and methods the de ned counterpoint template could look
something like this:

(setf Sec-A
 (counterpoint
  patterns
  '(
     #|1|# ((2 - 7 4) :span 3/4 :methods (d2 - ? -))
     #|2|# ((4 10 9 10) :span 3/4 :methods (- d6 - (d4 r)))
     #|3|# ((- 4 8 9) :span 4/4 :methods (- d2 - ri))
     #|4|# ((- 13 - 12) :span 3/4 :methods (- i - t6))
     #|5|# ((- - - 13) :span 5/8 :methods (- - - d7))
     #|6|# ((9 12 - -) :span 3/4 :methods (i d8 - -))
     #|7|# ((- 1 7 11) :span 3/4 :methods (- ri r i))
     #|8|# ((10 4 3 1) :span 5/8 :methods (i d - a))
     #|9|# ((8 8 - 8) :span 3/4 :methods (da ad - d3))
     #|10|# ((1 8 - 3) :span 2/4 :methods (? (d6 i) - d3))
     #|11|# ((- 3 9 4) :span 3/4 :methods (- - i -))
     #|12|# ((8 13 9 -) :span 4/4 :methods (d6 d3 d2 -)))
  :global-methods '((dyn fl) (dyn cl) (t-12 dyn hn) (t-12 dyn vc))
  :global-polyphony '(7 p)))



To explore the diverse application of the COUNTERPOINT function and to gain insights into
its practical uses across various musical contexts, please navigate to the “How-to/
Counterpoint” section where you will nd a collection of score examples. These examples
showcase the myriad ways in which the function can be utilised, offering valuable
perspectives on integrating counterpoint techniques into your compositions.



Relevant Functions
---------------------------------------------------------
COUNTERPOINT
ASSEMBLE-VOICES
CP-INSTRUMANTS
CP-TEMPO
DICTUM-TEMPO
GEN-DICTUM

Relevant Examples
---------------------------------------------------------
Documentation/How-to/Counterpoint/
                               fi
                                       fi
