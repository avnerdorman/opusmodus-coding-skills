Opusmodus                                                                                 rnd-row   1

rnd-row &key type transpose quantize seed
[Function]

Arguments and Values:
transpose                an integer, pitch or '? (random). The default is 0.
type                     :integer or :pitch. The default is :integer.
quantize                 1/2 (12 tone), 1/4 (24 tone) or 1/8 (48 tone). The default is 1/2.
seed                     NIL or an integer. The default is NIL.


Description:

This simple but valuable function generates an instant and accurate Twelve-Tone row. There
are 9,979,200 truly unique twelve-tone rows possible (rows unrelated to any others through
transposition, inversion, retrograde, and retrograde inversion). See in the nal example below
how RND-ROW creates a template in the KLANGREITHEN.


Examples:
(rnd-row)
=> (0 4 7 11 9 1 2 3 5 10 8 6)

(rnd-row :seed 34)
=> (0 4 7 9 5 11 8 1 3 6 10 2)

(rnd-row :type :pitch :seed 34)
=> (c4 g4 eb4 cs4 e4 b4 fs4 a4 gs4 f4 bb4 d4)

(rnd-row :type :pitch :transpose 'd4 :seed 34)
=> (d4 a4 f4 eb4 fs4 cs4 gs4 b4 bb4 g4 c4 e4)

(rnd-row :type :pitch :transpose '? :seed 34)
=> (eb4 g4 e4 fs4 d4 a4 c4 b4 gs4 cs4 bb4 f4)

(klangreihen 0 '(3 3 3 3) (rnd-row :seed 45))
=> ((c4 f4 gs4 b4) (c4 f4 g4 b4) (c4 f4 g4 bb4)
    (c4 e4 g4 bb4) (d4 e4 g4 bb4) (d4 e4 fs4 bb4)
    (d4 e4 fs4 a4) (d4 e4 fs4 b4) (d4 eb4 fs4 b4)
    (d4 eb4 gs4 b4) (cs4 eb4 gs4 b4) (cs4 f4 gs4 b4))
                                                                        fi
Opusmodus                                                      rnd-row   2

Microtonal 24 tone row: :quantize 1/4 (quarter tone):

(rnd-row :quantize 1/4 :type :pitch)
=> (c4 f4+ bb4 d4+ f4 b4 e4+ fs4 d4 gs4+ b4+ a4+ cs4
    g4+ gs4 eb4 e4 as4+ a4 ds4+ g4 cs4+ c4+ fs4+)

48 tone row: :quantize 1/8 (eight tone):

(rnd-row :quantize 1/8 :type :pitch)
=> (c4 e4+ d4.. cs4+ b4.. gs4. d4+ g4.. cs4.. bb4 d4.
    fs4.. cs4. gs4 g4 f4+ a4+ ds4.. e4 b4. fs4. b4+ gs4+
    d4 fs4 eb4 gs4.. f4.. e4.. ds4+ g4. fs4+ ds4. b4 cs4
    f4. f4 a4.. c4+ c4. as4.. a4. a4 e4. as4. as4+ c4.. g4+)
