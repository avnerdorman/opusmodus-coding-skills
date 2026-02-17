Opusmodus                                                            get-instrument-set

get-instrument-set instrument-set instrument
[Function]

Arguments and Values:
instrument-set         instrument set name.
instrument             instrument name.


Description:

Returns a list of instrument sound set values in the given instrument-set name and in
the given instrument name.

(get-instrument-set 'gm :p)
=> (:layout piano-layout :port nil :channel 1 :sound 'gm
    :program 0 :controllers nil :pan (pan 0) :volume 92)


Examples:
(instrument-set-names)
=> (vsl gm)

(get-instrument-set-groups 'gm)
=> (clefs grand wind brass strings wind-ensemble
    brass-ensemble piano string-ensemble choir)

(get-instrument-set-group 'gm 'wind)
=> (:pic :fl :afl :bfl :ob :eh :oda :cl :acl
    :bcl :bn :cbn :ssax :asax :tsax :bsax)

(get-instrument-set-group 'gm 'string-ensemble)
=> (:s3 :sq)

(get-instrument-set 'gm :sq)
=> (:layout string-quartet-layout :port nil :channel '(13 14 15 16)
    :sound 'gm :program '(violin violin viola cello)
    :controllers nil :pan (pan '(-30 -10 10 30)) :volume 92)
