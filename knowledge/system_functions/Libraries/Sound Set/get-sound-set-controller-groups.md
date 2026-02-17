Opusmodus                                           get-sound-set-controller-groups   1

get-sound-set-controller-groups sound-set group
[Function]

Arguments and Values:
sound-set              sound-set name.
group                  group name.


Description:

Returns all the controller group names in the given sound-set.

(get-sound-set-program-groups 'gm)
=> (piano percussion organ guitar bass strings ensemble brass reed pipe
    synth-lead synth-pad synth-effects ethnic percussive sound-effects)


Examples:
(sound-set-names)
=> (xce-solo-woodwinds-generic vsl-clarinet-bb vsl-cello
    sgmo-acoustic-grand-piano k2500r s80 se-1 sgmo-bassoon
    sgmo-strings-1 zr vsl-altoflute vsl-prepared-piano
    supernova-ii sy55 reaktor sgmo-vibraphone vsl-imperial
    vsl-cello-solo trinity ms2000 pr micro-q k1 vsl-cembalo-ks
    sgmo-piccolo pianoteq vsl-cembalo vsl-violin vsl-viola-solo
    micro-piano gm2 vsl-contrabass trinity-rack sgmo-celesta
    sgmo-trombone nord-lead-3 gm sgmo-harp sgmo-glock
    karma sgmo-trumpet xv-5080 sgmo-flute sgmo-oboe
    vsl-violin-solo sgmo-horn sgmo-timpani k2600 sgmo-marimba
    vsl-hornvienna vsl-prepared-piano-ks sgmo-tuba jv-1080
    vsl-harmonium-ks vsl-harmonium sgmo jv-2080 sy22 k2500
    sgmo-violin virus-b sgmo-cello sgmo-clarinet k2000r k2000
    vsl-bassclarinet vsl-upright xce-solo-strings-generic
    motif sgmo-viola)

(get-sound-set-program-group 'gm 'Brass)
=> (trumpet trombone tuba muted-trumpet french-horn
    brass-section synth-brass-1 synth-brass-2)

(get-sound-set-program 'gm 'trombone)
=> 57

(get-sound-set-controller-groups 'gm)
=> (general lsb pedal)
Opusmodus                                    get-sound-set-controller-groups   2

(get-sound-set-controller-group 'gm 'general)
=> (bank-select modulation breath-control foot-control portamento-time
    data-entry volume balance pan expression effects-controller1
    effects-controller2 gen-purpose1 gen-purpose2 gen-purpose3
    gen-purpose4)

(get-sound-set-controller 'gm 'expression)
=> 11
