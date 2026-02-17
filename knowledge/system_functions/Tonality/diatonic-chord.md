Opusmodus                                                                                 diatonic-chord        1

diatonic-chord symbols &key inv drop leading sort
[Function]

Arguments and Values:
symbols                       List. Speci es the chord progression using diatonic chord symbols and key
                              signatures. Format: A list starting with a key (e.g., :c, :am) followed by chord
                              degrees (e.g., i, IV, V7).

inv                           (optional): Integer or List of Integers. Speci es the inversion to apply
                              to the chords.
                              Value: An integer or a list of integers indicating the inversion.
                              0 for root position.
                              1 for rst inversion.
                              2 for second inversion.
                              Negative values can be used for reverse inversions. Can be a single integer
                              or a list if different inversions are needed for multiple chords.

drop                          (optional): Speci es the drop voicing technique to apply to the chords.
                              Value: An integer or a list of integers indicating the drop voicing.
                              1 for drop-2 voicing.
                              2 for drop-3 voicing.
                              Can be a single integer or a list if different voicings are needed for multiple
                              chords. Example: :drop 2, :drop '(1 0 2 1).

leading                       Symbol. Speci es the octave ambitus for voice leading in drop voicing.
                              Values: 'l: Low. 'h: High.

sort                          (optional): A boolean value (NIL or T). When set to T, the function applies an
                              ascending sort to the chord intervals before processing. The default is NIL.


Description:

The DIATONIC-CHORD function generates chord sequences based on diatonic chord
symbols relative to a speci ed key. It allows for exible chord progression creation in both
major and minor keys by interpreting chord degrees (e.g., I, ii, V7) within the context of the
given key signature. The function supports key signature speci cation, inversions, and drop
voicings, enabling composers and music theorists to programmatically generate chords with
varied harmonic textures and smoother voice leading.

This function is ideal for composers and arrangers who wish to streamline the creation of
chord progressions, allowing for rapid experimentation with different harmonic ideas. Music
theorists and educators can use it as a practical tool for demonstrating concepts related to
harmony, chord functions, and voice leading.
             ￼
                    fi
                         fi
                                 fi
                                      fi
                                           fi
                                                  fl
                                                                   fi
                                                                        fi
Opusmodus                                                                  diatonic-chord   2

Chord Progressions and Scale Degrees

Major Key Scale Degrees:

I               Tonic (root) chord
ii              Supertonic (minor)
iii             Mediant (minor)
IV              Subdominant (major)
V               Dominant (major)
vi              Submediant (minor)
vii°            Leading-tone (diminished)

Minor Key Scale Degrees:

i               Tonic minor chord
ii°             Supertonic diminished chord
♭III            Mediant major chord ( attened third degree)
iv              Subdominant (minor)
V               Dominant (major) (often borrowed from harmonic minor)
VI              Submediant (major)
vii°            Leading-tone (diminished) on the seventh degree

Chord Progressions:

A chord progression is a sequence of chords outlining the harmonic structure of a piece.
Common progressions create a sense of movement and resolution, such as:

ii–V–I:               Common in jazz.
I–IV–V:               Found in blues and rock.
I–vi–IV–V:            Classic pop progression.

By specifying chords using scale degrees, you can create progressions relative to the key,
making transposition effortless. The function interprets chord symbols based on the provided
key signature and generates appropriate chords according to diatonic harmony rules.

The list starts with a key symbol followed by chord degrees. Major key: (:c I IV V) for
C major. Minor key: (:am i iv V) for A minor. You can include chords from different
keys by specifying new key symbols within the list: (:c I IV V :fm i v) uses chords
from C major and F minor. Use (=) to repeat the previous chord in the progression: (:c I
= IV = V =).
            ￼
                               fl
Opusmodus                                                                    diatonic-chord   3

The chord symbols you provide (e.g., i, ii, III, IV, v, etc.) do not need to follow any
capitalisation rules. The function is designed to interpret the chord symbols correctly
regardless of their case.


Examples:

Progression in C Major:

(diatonic-chord '(:c I IV V))
=> (c4e4g4 f4a4c4 g4b4d4)

Progression in G Major:

(diatonic-chord '(:g I V vi IV))
=> (g4b4d5 d5fs5a4 e5g4b4 c5e5g4)

Andalusian Cadence in A Minor:

(diatonic-chord '(:am i VII VI V))
=> (a4c5e5 gs5b4d5 f5a4c5 e5g5b4)

Progression in E Minor:

(diatonic-chord '(:em i iv V i))
=> (e4g4b4 a4c5e4 b4d5fs4 e4g4b4)

Circle of Fifths Progression in C Major:

(diatonic-chord '(:c I IV viio iii vi ii V I))
=> (c4e4g4 f4a4c4 b4d4f4 e4g4b4 a4c4e4 d4f4a4 g4b4d4 c4e4g4)

Pachelbel’s Canon Progression in D Major:

(diatonic-chord '(:d I V vi iii IV I IV V))
=> (d4fs4a4 a4cs5e4 b4d4fs4 fs4a4cs5 g4b4d4 d4fs4a4 g4b4d4 a4cs5e4)

Modal Mixture Progression in C Major:

(diatonic-chord '(:c I vi7 bVII IV V7 I))
=> (c4e4g4 a4c4e4g4 bb4d4f4 f4a4c4 g4b4d4f4 c4e4g4)
            ￼
    Opusmodus                                                 diatonic-chord          4

    Applying Inversions and Drop Voicings:

    (setf chords '(:c i i i i iv iv v v))

    (list
     (diatonic-chord chords :drop 1 :inv -1)
     (diatonic-chord chords :drop 1 :inv 1)
     (diatonic-chord chords :drop 1 :inv 0)
     (diatonic-chord chords :drop 1 :inv -1)
     )


                              2               3         4



                                                                          Opusmodus




    Randomized Inversions and Voicings:

    (diatonic-chord '(:fs i i ii i iv iv v v)
                    :inv (rnd-sample 8 '(0 -1 -2 -3))
                    :drop 1)




    (diatonic-chord '((:e i = = =)
                      (:e vi7 = = =)
                      (:e imaj7 = = =)
                      (:e v11 = = =))
                    :inv (gen-loop 4 (rnd-sample 4 '(0 -1 -2 -3)))
                    :drop (gen-loop 4 (rnd-sample 4 '(1 0)))
                    :sort t)


                       2                  3       4




                                                                        Opusmodus
￼
￼
￼
                ￼
    Opusmodus                                                               diatonic-chord        5

    Complex Chord Progression for an Entire Song

    (setf intro '(:c I vi IV V))
    (setf verse '(:c I V vi IV ii V7/vi vi IV I V))
    (setf chorus '(:am i iv VI III iv i V7))
    (setf bridge '(:eb IV V7/V V7 I vi ii V7 I))
    (setf outro '(:c vi IV I ii V7 I IV I))

    Combining all sections into a single progression:

    (setf song-progression
          (append intro verse chorus bridge chorus outro))

    Generate the chords with speci ed inversions:

    (setf song-chords
          (diatonic-chord
           song-progression
           :inv '(0 -1 0 -1                             ; Introduction inversions
                   2 0 -1 0 -1 0 -1 0 -1 -2             ; Chorus inversions
                   0 -1 2 0 -1 2 0                      ; Chorus inversions
                   0 0 -1 0 -1 2 0 -1                   ; Bridge inversions
                   0 -1 2 0 -1 2 0                      ; Chorus inversions
                   0 0 0 -1 0 -1 -1 -2)                 ; Outro inversions
           :sort t
           :drop 1))

    Applying lengths with MAKE-OMN:

    (make-omn
     :pitch song-chords
     :length '(q q h q q h q q q q q q h q q q q q q q h
               q h q q h q q h q q q q q q h h h h q q h h w))


                      2               3        4         5              6      7




      8                                   9                   10




      11                         12           13                   14         15




                                                                                      Opusmodus
￼
                ￼
                            fi
    Opusmodus                                                        diatonic-chord   6

    (diatonic-chord '(:gm i i iio i iv7 = = :c iv v v ii iv ii iv v v)
                    :inv '(0 -1 -2 -3 -2) :drop 1 :leading 'l)


                                  2              3             4



                                                                                          Opusmodus




    Major Key Chord Progression Symbols
    I Chords (C Major)
    I               ; C               Major triad on I
    I6              ; C/E             First inversion
    I6/4            ; C/G             Second inversion
    Isus2           ; Csus2           Suspended 2nd chord
    Isus4           ; Csus4           Suspended 4th chord
    I7sus4          ; C7sus4          Dominant 7th suspended 4th
    I6add6          ; C6              Major 6th chord
    I6/9            ; C6/9            Major 6/9 chord
    Iadd9           ; Cadd9           Major triad with added 9th
    IMaj7           ; Cmaj7           Major 7th chord
    I7              ; C7              Dominant 7th chord on I
    IMaj7sus2       ; Cmaj7sus2       Major 7th chord with suspended 2nd
    IMaj7s11        ; Cmaj7♯11        Major 7th with sharp 11th
    IMaj9           ; Cmaj9           Major 9th chord
    I9              ; C9              Dominant 9th chord on I
    IMaj13          ; Cmaj13          Major 13th chord
    I11             ; C11             Dominant 11th chord on I
    I13             ; C13             Dominant 13th chord on I

    ii Chords (D Minor)
    ii              ; Dm              Minor triad on ii
    ii6             ; Dm/F            First inversion
    ii6/4           ; Dm/A            Second inversion
    iisus2          ; Dmsus2          Suspended 2nd chord
    iisus4          ; Dmsus4          Suspended 4th chord
    ii6add6         ; Dm6             Minor 6th chord
    ii6/9           ; Dm6/9           Minor 6/9 chord
    iiadd9          ; Dm(add9)        Minor triad with added 9th
    ii7             ; Dm7             Minor 7th chord
    ii9             ; Dm9             Minor 9th chord
    ii11            ; Dm11            Minor 11th chord
    ii13            ; Dm13            Minor 13th chord

    iii Chords (E Minor)
    iii             ; Em              Minor triad on iii
    iii6            ; Em/G            First inversion
    iii6/4          ; Em/B            Second inversion
￼
                ￼
Opusmodus                                                       diatonic-chord   7

iiisus2         ; Emsus2      Suspended 2nd chord
iiisus4         ; Emsus4      Suspended 4th chord
iii6add6        ; Em6         Minor 6th chord
iii6/9          ; Em6/9       Minor 6/9 chord
iiiadd9         ; Em(add9)    Minor triad with added 9th
iii7            ; Em7         Minor 7th chord
iii9            ; Em9         Minor 9th chord
iii11           ; Em11        Minor 11th chord
iii13           ; Em13        Minor 13th chord

IV Chords (F Major)
IV              ; F           Major triad on IV
IV6             ; F/A         First inversion
IV6/4           ; F/C         Second inversion
IVsus2          ; Fsus2       Suspended 2nd chord
IVsus4          ; Fsus4       Suspended 4th chord
IV7sus4         ; F7sus4      Dominant 7th suspended 4th
IV6add6         ; F6          Major 6th chord
IV6/9           ; F6/9        Major 6/9 chord
IVadd9          ; Fadd9       Major triad with added 9th
IVMaj7          ; Fmaj7       Major 7th chord
IV7             ; F7          Dominant 7th chord on IV
IVMaj7sus2      ; Fmaj7sus2   Major 7th chord with suspended 2nd
IVMaj7s11       ; Fmaj7♯11    Major 7th with sharp 11th
IVMaj9          ; Fmaj9       Major 9th chord
IV9             ; F9          Dominant 9th chord on IV
IV11            ; F11         Dominant 11th chord on IV
IV13            ; F13         Dominant 13th chord on IV
IVMaj13         ; Fmaj13      Major 13th chord

V Chords (G Major)
V               ; G           Major triad on V
V6              ; G/B         First inversion
V6/4            ; G/D         Second inversion
Vsus2           ; Gsus2       Suspended 2nd chord
Vsus4           ; Gsus4       Suspended 4th chord
Vadd6           ; G6          Major triad with added 6th
V6/9            ; G6/9        Major 6/9 chord
Vadd9           ; Gadd9       Major triad with added 9th
V7              ; G7          Dominant 7th chord
V9              ; G9          Dominant 9th chord
V11             ; G11         Dominant 11th chord
V13             ; G13         Dominant 13th chord
V7s5            ; G7♯5        Dominant 7th with augmented 5th
V7b5            ; G7♭5        Dominant 7th with flattened 5th
Vmaj7           ; Gmaj7       Major 7th chord
Vmaj9           ; Gmaj9       Major 9th chord
V7sus4          ; G7sus4      Dominant 7th with suspended 4th
V7add13         ; G7add13     Dominant 7th with added 13th
V9s11           ; G9♯11       Dominant 9th with sharp 11th
V7b5            ; Gø7         Half-diminished 7th chord
            ￼
Opusmodus                                                       diatonic-chord   8

V7b9            ; G7♭9       Dominant 7th with flattened 9th
V7s9            ; G7♯9       Dominant 7th with sharp 9th
V7b13           ; G7♭13      Dominant 7th with flattened 13th
V7s11           ; G7♯11      Dominant 7th with sharp 11th
V13b9           ; G13♭9      Dominant 13th with flattened 9th
V13s11          ; G13♯11     Dominant 13th with sharp 11th
V7alt           ; G7alt      Fully altered dominant 7th chord
Vaug            ; Gaug       Augmented triad on V
Vdim            ; Gdim       Diminished triad on V

vi Chords (A Minor)
vi              ; Am         Minor triad on vi
vi6             ; Am/C       First inversion
vi6/4           ; Am/E       Second inversion
visus2          ; Asus2      Suspended 2nd chord
visus4          ; Asus4      Suspended 4th chord
viadd6          ; Am6        Minor 6th chord
vi6/9           ; Am6/9      Minor 6/9 chord
viadd9          ; Amadd9     Minor triad with added 9th
vi7             ; Am7        Minor 7th chord
vi9             ; Am9        Minor 9th chord
vi11            ; Am11       Minor 11th chord
vi13            ; Am13       Minor 13th chord

vii° Chords (B Diminished)
viio            ; Bdim       Diminished triad on vii°
viio6           ; Bdim/D     First inversion of Bdim7
viio6/4         ; Bdim/F     Second inversion of Bdim7
vii7b5          ; Bm7♭5      Half-diminished 7th chord
viio7           ; Bdim7/Ab   Fully diminished 7th chord
viio9           ; Bdim9      Diminished 9th chord
viio7s5         ; Bdim7♯5    Diminished 7th with sharp 5th
viio7b9         ; Bdim7♭9    Diminished 7th with flat 9th
viio7s9         ; Bdim7♯9    Diminished 7th with sharp 9th

Borrowed Chords from Parallel Minor in C Major
im              ; Cm         Borrowed i chord from C minor
im6             ; Cm/E♭      First inversion of Cm
im6/4           ; Cm/G       Second inversion of Cm
im7             ; Cm7        Borrowed i7 chord from C minor
im9             ; Cm9        Borrowed i9 chord from C minor
ivm             ; Fm         Borrowed iv chord from C minor
ivm6            ; Fm/A       First inversion of Fm
ivm6/4          ; Fm/C       Second inversion of Fm
ivm7            ; Fm7        Borrowed iv7 chord from C minor
bv              ; Gm         Borrowed v chord from C minor
bv6             ; Gm/B♭      First inversion of Gm
bv6/4           ; Gm/D       Second inversion of Gm
bv7             ; Gm7        Borrowed v7 chord from C minor
bviio           ; Bdim7      Borrowed vii°7 chord from C minor
            ￼
Opusmodus                                                   diatonic-chord   9

bviio6          ; Bdim7/D    First inversion of Bdim7
bviio6/4        ; Bdim7/F    Second inversion of Bdim7
bviio7          ; Bdim7/Ab   Third inversion of Bdim7
bIII            ; E♭         Borrowed ♭III chord from C minor
bIII6           ; E♭/G       First inversion of E♭
bIII7           ; E♭7        Borrowed ♭III7 chord from C minor
bIIIMaj7        ; E♭maj7     Borrowed ♭IIImaj7 chord from C minor
bVI             ; A♭         Borrowed ♭VI chord from C minor
bVI6            ; A♭/C       First inversion of A♭
bVI7            ; A♭7        Borrowed ♭VI7 chord from C minor
bVIMaj7         ; A♭maj7     Borrowed ♭VImaj7 chord from C minor
bVII            ; B♭         Borrowed ♭VII chord from C minor
bVII6           ; B♭/D       First inversion of B♭
bVII7           ; B♭7        Borrowed ♭VII7 chord from C minor
bII             ; D♭         Neapolitan triad
bII6            ; D♭/F       First inversion
bII6/4          ; D♭/A♭      Second inversion
bII7            ; D♭7        Neapolitan with dominant 7th
bIIMaj7         ; D♭Maj7     Neapolitan with major 7th
bIIadd9         ; D♭add9     Neapolitan with added 9th
bII7b5          ; D♭7♭5      Neapolitan with flat 5th
bII7s5          ; D♭7♯5      Neapolitan with sharp 5th

Secondary Dominant Chords
V7/V            ; D7         V7/V in C Major
V9/V            ; D9         V9/V in C Major
V13/V           ; D13        V13/V in C Major
V7/ii           ; A7         V7/ii in C Major
V9/ii           ; A9         V9/ii in C Major
V13/ii          ; A13        V13/ii in C Major
V7/iii          ; B7         V7/iii in C Major
V9/iii          ; B9         V9/iii in C Major
V13/iii         ; B13        V13/iii in C Major
V7/IV           ; C7         V7/IV in C Major
V9/IV           ; C9         V9/IV in C Major
V13/IV          ; C13        V13/IV in C Major
V7/vi           ; E7         V7/vi in C Major
V9/vi           ; E9         V9/vi in C Major
V13/vi          ; E13        V13/vi in C Major
V7/viio         ; F♯7♭5      V7/vii° in C Major
V9/viio         ; F♯9♭5      V9/vii° in C Major
V13/viio        ; F♯13♭5     V13/vii° in C Major
V42             ; G7/F       Dominant 7th chord in third inversion
V7/iib5         ; A7♭5       V7/ii♭5 in C Major
V7/viiob9       ; F♯7♭5♭9    V7/vii°♭9 in C Major

Augmented Sixth Chords
It+6            ; A♭ It+6    Italian augmented sixth
Fr+6            ; A♭ Fr+6    French augmented sixth
Ger+6           ; A♭ Ger+6   German augmented sixth
            ￼
Opusmodus                                                      diatonic-chord   10

Tritone Substitution Chords
SubV7/V         ; G♭7          Tritone substitute for V7
SubV9/V         ; G♭9          Tritone substitute with added 9th
SubV13/V        ; G♭13         Tritone substitute with added 13th
SubV7/ii        ; G♭7/ii       Tritone substitute for V7/ii
SubV9/ii        ; G♭9/ii       Tritone substitute for V9/ii
SubV13/ii       ; G♭13/ii      Tritone substitute for V13/ii

Altered Chords on Altered Degrees
sivo7           ; F♯dim7       Diminished 7th on ♯iv
sivm7           ; F♯m7         Minor 7th chord on ♯iv
sivo7s5         ; F♯dim7♯5     Diminished 7th with sharp 5th

Quartal and Quintal Harmony
4tal            ; C F B♭       Quartal triad
4tal6           ; F B♭ C       Quartal triad in first inversion
4tal6/4         ; B♭ C F       Quartal triad in second inversion
4tal7           ; C F B♭ E     Quartal 7th chord
4tal9           ; C F B♭ E A   Quartal 9th chord
4tal11          ; C F B♭ E A D Quartal 11th chord
5tal            ; C G D        Quintal triad
5tal6           ; G D A        Quintal triad in first inversion
5tal6/4         ; D A C        Quintal triad in second inversion
5tal7           ; C G D A      Quintal 7th chord
5tal9           ; C G D A E    Quintal 9th chord
5tal11          ; C G D A E B Quintal 11th chord


Minor Key Chord Progression Symbols
i Chords (C Minor)
i               ; Cm          Minor triad on i
im6             ; Cm6/1       First inversion of Cm6
i6              ; Cm/E♭       First inversion of Cm
i6/4            ; Cm/G        Second inversion of Cm
i7              ; Cm7         Minor 7th chord
i9              ; Cm9         Minor 9th chord
i11             ; Cm11        Minor 11th chord
i13             ; Cm13        Minor 13th chord
i6/9            ; Cm6/9       Minor 6/9 chord
iadd9           ; Cmadd9      Minor triad with added 9th
Isus2           ; Cmsus2      Suspended 2nd chord
Isus4           ; Cmsus4      Suspended 4th chord
iMaj7           ; CmMaj7      Minor major 7th chord (rare)
i7sus2          ; Cm7sus2     Minor 7th chord with suspended 2nd

ii° Chords (D Diminished)
iio             ; Ddim        Diminished triad on ii°
iio6            ; Ddim/F      First inversion of Ddim
iio6/4          ; Ddim/A♭     Second inversion of Ddim
            ￼
Opusmodus                                                   diatonic-chord   11

iio7            ; Ddim7      Fully diminished 7th chord
iio9            ; Dm9♭5      Half-diminished 9th chord
iioadd9         ; Ddimadd9   Diminished triad with added 9th
iiosus2         ; Ddimsus2   Diminished suspended 2nd chord
iiosus4         ; Ddimsus4   Diminished suspended 4th chord
ii7b5           ; Dm7♭5      Half-diminished 7th chord

III Chords (E♭ Augmented)
III             ; E♭         Major triad on ♭III
IIIMaj7         ; E♭maj7     Major 7th chord
III6            ; E♭6        Major 6th chord
III+            ; E♭+        Augmented triad on III+
III+7           ; E♭+7       Augmented 7th chord
III+9           ; E♭+9       Augmented 9th chord

iv Chords (F Minor)
iv              ; Fm         Minor triad on iv (Diatonic)
iv6             ; Fm6/1      First inversion of Fm6
iv7             ; Fm7        Minor 7th chord
iv9             ; Fm9        Minor 9th chord
iv11            ; Fm11       Minor 11th chord
iv13            ; Fm13       Minor 13th chord
iv6/9           ; Fm6/9      Minor 6th and 9th chord
ivadd9          ; Fmadd9     Minor triad with added 9th
IVsus2          ; Fmsus2     Suspended 2nd chord
IVsus4          ; Fmsus4     Suspended 4th chord
iv7sus2         ; Fm7sus2    Minor 7th chord with suspended 2nd
iv7sus4         ; Fm7sus4    Minor 7th chord with suspended 4th
ivMaj7          ; FmMaj7     Minor triad with major 7th
iv+             ; Fm+        Augmented triad on iv
iv+7            ; Fm+7       Augmented 7th chord
iv7s11          ; Fm7♯11     Minor 7th chord with sharp 11th
iv7b5           ; Fm7♭5      Minor 7th chord with flat 5
ivadd11         ; Fmadd11    Minor triad with added 11th
iv7s9           ; Fm7♯9      Minor 7th chord with sharp 9th
iv9sus4         ; Fm9sus4    Minor 9th chord with suspended 4th

v Chords (G Minor)
v               ; Gm         Minor triad on v
v6              ; Gm/B♭      First inversion
v6/4            ; Gm/D       Second inversion
vsus2           ; Gsus2      Suspended 2nd chord
vsus4           ; Gsus4      Suspended 4th chord
vadd6           ; Gm6        Minor triad with added 6th
v6/9            ; Gm6/9      Minor 6/9 chord
vadd9           ; Gmadd9     Minor triad with added 9th
v7              ; Gm7        Minor 7th chord
v7♭5            ; Gm7♭5      Half-diminished 7th chord
v7s5            ; Gm7♯5      Minor 7th with augmented 5th
v9              ; Gm9        Minor 9th chord
            ￼
Opusmodus                                                  diatonic-chord   12

v9b5            ; Gm9♭5      Minor 9th with ♭5
v9s5            ; Gm9♯5      Minor 9th with ♯5
v11             ; Gm11       Minor 11th chord
v11b5           ; Gm11♭5     Minor 11th with ♭5
v13             ; Gm13       Minor 13th chord
v13b5           ; Gm13♭5     Minor 13th with ♭5
vmaj7           ; GmMaj7     Major 7th chord (rare in minor)
vmaj9           ; GmMaj9     Major 9th chord (rare in minor)

VI Chords (A♭ Major)
VI              ; A♭         Major triad on VI
VI6             ; A♭6        First inversion
VI6/4           ; A♭6/4      Second inversion
VI7             ; A♭7        Dominant 7th chord on VI
VI9             ; A♭9        Dominant 9th chord on VI
VI11            ; A♭11       Dominant 11th chord on VI
VI13            ; A♭13       Dominant 13th chord on VI
VI6/9           ; A♭6/9      Dominant 6/9 chord on VI
VIadd9          ; A♭add9     Major triad with added 9th
VIsus2          ; Absus2     Suspended 2nd chord
VIsus4          ; Absus4     Suspended 4th chord
VI7sus2         ; A♭7sus2    Dominant 7th chord with suspended 2nd
VI7sus4         ; A♭7sus4    Dominant 7th chord with suspended 4th

vii° Chords (B Diminished)
vii             ; Bdim       Diminished triad on vii°
vii6            ; Bdim6      First inversion of Bdim
vii6/4          ; Bdim6/4    Second inversion of Bdim
vii7            ; Bdim7      Fully diminished 7th chord on vii°
vii9            ; Bdim9      Fully diminished 9th chord on vii°
vii7s5          ; Bdim7♯5    Diminished 7th with sharp 5th
viiadd9         ; Bdimadd9   Diminished triad with added 9th
vii13           ; Bdim13     Fully diminished 13th chord on vii°
vii7b9          ; Bdim7b9    Diminished 7th with flat 9th

Non-Diatonic Chords (Borrowed and Altered Chords)
bIII            ; E♭         Major triad on ♭III
bIII6           ; E♭6        First inversion of ♭III
bIII6/4         ; E♭6/4      Second inversion of ♭III
bIII7           ; E♭7        Dominant 7th chord on ♭III
bIIIMaj7        ; E♭maj7     Major 7th chord on ♭III
bIII9           ; E♭9        Dominant 9th chord on ♭III
bIII11          ; E♭11       Dominant 11th chord on ♭III
bIII13          ; E♭13       Dominant 13th chord on ♭III
bIII7b5         ; E♭7♭5      Dominant 7th with flat 5th on ♭III
bIII7s5         ; E♭7#5      Dominant 7th with sharp 5th on ♭III
bVII            ; B♭         Major triad on ♭VII
bVII6           ; B♭6        First inversion of ♭VII
bVII6/4         ; B♭6/4      Second inversion of ♭VII
bVII7           ; B♭7        Dominant 7th chord on ♭VII (includes A♭)
            ￼
Opusmodus                                                  diatonic-chord   13

bVIImaj7        ; B♭maj7     Major 7th chord on ♭VII
bVII9           ; B♭9        Dominant 9th chord on ♭VII
bVI             ; A♭         Major triad on ♭VI
bVI6            ; A♭6        First inversion of ♭VI
bVI7            ; A♭7        Dominant 7th chord on ♭VI
bVIMaj7         ; A♭maj7     Major 7th chord on ♭VI
bVI9            ; A♭9        Dominant 9th chord on ♭VI
bII             ; D♭         Neapolitan chord on ♭II
bII6            ; D♭6        First inversion of ♭II
bIIMaj7         ; D♭maj7     Major 7th chord on ♭II
bIIadd9         ; D♭add9     Major triad with added 9th on b♭II
bII7            ; D♭7        Dominant 7th chord on ♭II
bII9            ; D♭9        Dominant 9th chord on ♭II
biv             ; Fm         Subdominant minor
bv              ; Gm         Dominant minor
bviio           ; Bdim7      Fully diminished 7th

Secondary Dominant Chords
V7/V            ; D7         V7/V in C Minor
V9/V            ; D9         V9/V in C Minor
V13/V           ; D13        V13/V in C Minor
V7/ii           ; A7         V7/ii in C Minor
V9/ii           ; A9         V9/ii in C Minor
V13/ii          ; A13        V13/ii in C Minor
V7/iio          ; A7         V7/ii° in C Minor
V9/iio          ; A9         V9/ii° in C Minor
V13/iio         ; A13        V13/ii° in C Minor
V7/III          ; B♭7        V7/III in C Minor
V9/III          ; B♭9        V9/III in C Minor
V13/III         ; B♭13       V13/III in C Minor
V7/i            ; C7         V7/i in C Minor
V7/IV           ; C7         V7/IV in C Minor
V9/IV           ; C9         V9/IV in C Minor
V13/IV          ; C13        V13/IV in C Minor
V9/i            ; C9         V9/i in C Minor
V13/i           ; C13        V13/i in C Minor
V7/vi           ; E7         V7/vi in C Minor
V9/iv           ; G9         V9/iv in C Minor
V13/iv          ; G13        V13/iv in C Minor
V7/VI           ; A♭7        V7/VI in C Minor
V9/VI           ; A♭9        V9/VI in C Minor
V13/VI          ; A♭13       V13/VI in C Minor
V7/viio         ; F♯7♭5      V7/vii° in C Minor
V9/viio         ; F♯9♭5      V9/vii° in C Minor
V13/viio        ; F♯13♭5     V13/vii° in C Minor

Augmented Sixth Chords
It+6            ; A♭ It+6    Italian augmented sixth
Fr+6            ; A♭ Fr+6    French augmented sixth
Ger+6           ; A♭ Ger+6   German augmented sixth
            ￼
Opusmodus                                                      diatonic-chord   14

Tritone Substitution Chords
SubV7/V     ; A♭7       Tritone substitute for V7/V (D7)
SubV9/V     ; A♭9       Tritone substitute added 9th for V9/V (D9)
SubV13/V    ; A♭13      Tritone substitute added 13th for V13/V (D13)
SubV7/ii    ; E♭7       Tritone substitute for V7/ii (A7)
SubV9/ii    ; E♭9       Tritone substitute added 9th for V9/ii (A9)
SubV13/ii   ; E♭13      Tritone substitute added 13th for V13/ii (A13)
SubV9/III   ; E9        Tritone substitute added 9th for V9/III (B♭9)
SubV13/III ; E13        Tritone substitute added 13th for V13/III (B♭13)
SubV7/viio ; C7♭5       Tritone substitute for V7/viio (F♯7♭5)
SubV9/viio ; C9♭5       Tritone substitute added 9th for V9/viio (F♯9♭5)
SubV13/viio ; C13♭5     Tritone substitute added 13th for V13/vii° (F♯13♭5)
SubV7/iv    ; D♭7       Tritone substitute for V7/iv (G7)
SubV9/iv    ; D♭9       Tritone substitute added 9th for V9/iv (G9)
SubV13/iv   ; D♭13      Tritone substitute added 13th for V13/iv (G13)

Altered Chords on Altered Degrees

sivo7           ; F♯dim7       Diminished 7th on ♯iv
sivm7           ; F♯m7         Minor 7th chord on ♯iv
sivo7s5         ; F♯dim7♯5     Diminished 7th with sharp 5th

Quartal and Quintal Harmony
4tal            ; C F B♭       Quartal triad
4tal6           ; F B♭ C       Quartal triad in first inversion
4tal6/4         ; B♭ C F       Quartal triad in second inversion
4tal7           ; C F B♭ E     Quartal 7th chord
4tal9           ; C F B♭ E A   Quartal 9th chord
4tal11          ; C F B♭ E A D Quartal 11th chord
5tal            ; C G D        Quintal triad
5tal6           ; G D A        Quintal triad in first inversion
5tal6/4         ; D A C        Quintal triad in second inversion
5tal7           ; C G D A      Quintal 7th chord
5tal9           ; C G D A E    Quintal 9th chord
5tal11          ; C G D A E B Quintal 11th chord
            ￼
