Opusmodus                                                 get-instrument-set-groups   1

get-instrument-set-groups instrument-set
[Function]

Arguments and Values:
instrument-set         instrument set name.


Description:

Returns a list of instrument group names in the given instrument-set.

(get-instrument-set-groups 'gm)
=> (clefs grand wind brass strings wind-ensemble
    brass-ensemble piano string-ensemble choir)


Examples:
(instrument-set-names)
=> (vsl gm)

(get-instrument-set-group 'gm 'wind)
=> (:pic :fl :afl :bfl :ob :eh :oda :cl :acl
    :bcl :bn :cbn :ssax :asax :tsax :bsax)

(get-instrument-set-group 'gm 'string-ensemble)
=> (:s3 :sq)

(get-instrument-set 'gm :p)
=> (:layout piano-layout :port nil :channel 1 :sound 'gm
    :program 0 :controllers nil :pan (pan 0) :volume 92)

(get-instrument-set 'gm :sq)
=> (:layout string-quartet-layout :port nil :channel '(13 14 15 16)
    :sound 'gm :program '(violin violin viola cello)
    :controllers nil :pan (pan '(-30 -10 10 30)) :volume 92)
