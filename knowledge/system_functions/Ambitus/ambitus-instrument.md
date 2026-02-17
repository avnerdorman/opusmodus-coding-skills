Opusmodus                                                            ambitus-instrument      1

ambitus-instrument instrument &key type
[Function]

Arguments and Values:
instrument               an instrument-name
type                     :integer, :pitch or :midi. The default is :integer.


Description:

One of the features of the OPUSMODUS approach is its ability to respond to the demands of
composers working with standard acoustic instruments in serial and post-serial strategies
where interval relationships may need to be expressed in a variety of ways. The function
AMBITUS-INSTRUMENT is a valuable tool to support such composition by providing a pre-
set range expression for every standard acoustic / concert instrument in three different
formats :type. Use this function to nd out the range of instruments before using the
instrument designation in the AMBITUS function itself.


Examples:
(ambitus-instrument 'violin)
=> (-5 43)

(ambitus-instrument 'violin :type :midi)
=> (55 103)

Above, the rst example shows the 'violin range expressed as integers beginning -5
(semitones) below the default value 0 (middle c) and ending in the stratosphere of the
violin's range. The second example shows values as MIDI integers on a scale between
0-127. This could be useful when composing music for violin and MIDI synthesised sound.

(ambitus-instrument 'violin :type :pitch)
=> (g3 g7)

In this example, the 'violin range is expressed as a symbol range beginning at g3, 5
symbols below the default value of c4 and extending again into the very highest regions of
the violin's range g7.

(ambitus 'violin '((c4 cs4 d5 e3 fs3) (cs4 c3 d5 e5 fs3)))
=> ((c4 cs4 d5 e4 fs4) (cs4 c4 d5 e5 fs4))
     fi
                              fi
Opusmodus                                                         ambitus-instrument      2

Now see how the AMBITUS function corrects the low and unplayable fs by putting it up an
octave.

(ambitus-instrument 'french-horn :type :pitch)
=> (as1 f5)

(ambitus-instrument 'piano)
=> (-39 48)

List of instruments with assigned ambitus:

piccolo
piccolo-eb
piccolo-db
piccolo-c
flute
concert-flute
concert-flute-d
concert-flute-db
concert-flute-c
alto-flute
alto-flute-g
alto-flute-f
alto-flute-eb
bass-flute
bass-flute-bb
recorder
sopranino-recorder
soprano-recorder
alto-recorder
tenor-recorder
bass-recorder
contrabass-recorder
double-contrabass-recorder
oboe
oboe-c
oboe-damore
oboe-damore-a
cor-anglais
english-horn
english-horn-f
heckelphon
high-clarinet-ab
high-clarinet-eb
high-clarinet-d
high-clarinet
clarinet-c
clarinet-bb
clarinet-a
clarinet
alto-clarinet-f
Opusmodus                 ambitus-instrument   3

alto-clarinet-eb
alto-clarinet
bassett-clarinet-f
bassett-clarinet
bass-clarinet
bass-clarinet-bb
contra-alto-clarinet-eb
contra-alto-clarinet
contrabass-clarinet-bb
contrabass-clarinet
bassoon
bassoon-c
contrabassoon
contrabassoon-c
sopranino-sax-eb
sopranino-sax
soprano-sax-bb
soprano-sax
alto-sax-eb
alto-sax
tenor-sax-bb
tenor-sax
baritone-sax-eb
baritone-sax
bass-sax
bass-sax-bb
french-horn-f
french-horn
baritone-horn
mellophone
mellophone-f
mellophone-eb
piccolo-trumpet
high-trumpet-bb
high-trumpet-f
high-trumpet-eb
bach-trumpet
high-trumpet-d
high-trumpet
soprano-cornet
cornet
cornet-bb
trumpet-c
trumpet-bb
trumpet-a
trumpet-f
trumpet-eb
trumpet
bass-trumpet
flugelhorn
alto-trombone
Opusmodus             ambitus-instrument   4

alto-trombone-f
alto-trombone-eb
tenor-trombone-bb
tenor-trombone
tenor-bass-trombone
bass-trombone
contrabass-trombone
cimbasso
euphonium
tuba-f
tuba
bass-tuba
bass-tuba-f
contrabass-tuba
contrabass-tuba-bb
cymbales
gong
glockenspiel
piano-glockenspiel
celesta
vibraphone
tubular-bells
xylophone
marimba
xylomarimba
kettel-drums-d
kettel-drums-g
kettel-drums-c
kettel-drums-a
kettel-drums
harp
guitar
mandolin
banjo
piano
harpsichord
cymbalum
zither
organ
accordion
violin
viola
viola-damore
cello
violoncello
double-bass
contrabass
5s-contrabass
5s-double-bass
string-quartet
strings
Opusmodus       ambitus-instrument   5

soprano
mezzo-soprano
alto
contralto
contertenor
tenor
baritone
bass
voices
midi
