# Opusmodus User Extensions Manual

This manual documents custom functions and extensions developed for the Opusmodus environment.

## Table of Contents

1.  [Block Additive Process](#block-additive-process)
    - [gen-block-additive](#gen-block-additive)
    - [gen-additive-indices](#gen-additive-indices)
    - [apply-process-mask](#apply-process-mask)

2.  [Phasing and Pattern Generation](#phasing-and-pattern-generation)
    - [apply-phasing](#apply-phasing)
    - [gen-phasing](#gen-phasing)
    - [length-to-grid](#length-to-grid)

---

## 1. Block Additive Process

The **Block Additive** technique (inspired by Steve Reich and other minimalists) involves taking a fixed musical object (a "block" of specific length, rhythm, and pitch) and gradually "un-masking" it.

Unlike traditional development which might extend a motif in time, this process keeps the time frame constant. The complete pattern exists from the start, but is initially silent. Over a series of repetitions, notes are revealed one by one (or in groups) until the full pattern is audible.

### gen-block-additive

The primary function for generating block additive structures.

**Signature:**

```lisp
(gen-block-additive sequence &key (type 'linear) (flat nil) seed lengths pitches (start-count 1) (repeat-last 0) (step-repeat 1))
```

**Arguments:**

- **sequence**: (list) Input OMN sequence. If `nil`, provide `lengths` and `pitches` keywords.
- **type**: (symbol) The build pattern: `'linear` (default), `'symmetric`, or `'random`.
- **flat**: (boolean) If `T`, returns a single flattened OMN list. Default: `nil` (returns a list of lists/measures).
- **seed**: (integer) Seed for `rnd-order` if type is `'random`.
- **lengths**: (list) Alternative input if sequence is `nil`.
- **pitches**: (list) Alternative input if sequence is `nil`.
- **start-count**: (integer) The number of active events to start with.
  - `0`: Starts with a fully silent measure.
  - `1`: Starts with 1 note (default).
  - `N`: Starts with N notes already revealed.
- **repeat-last**: (integer) Number of times to repeat the final built measure. Default: 0.
- **step-repeat**: (integer) Number of times to repeat each intermediate step. Default: 1.

**Description:**
Loops through the build process, generating a sequence of measures where the density of the pattern increases according to the chosen `type`.

**Smart Skipping**: The function automatically detects if a step "unmasks" a rest. Such steps are skipped (accumulated internally) so that every measure in the output sequence adds a new _audible_ note. This prevents redundant repetitions where nothing changes visually or sonically.

**Examples:**

_Basic Linear Build:_

```lisp
(gen-block-additive '(e c4 e4 g4 c5))
;; Output:
;; ((e c4 - - -)        ; Step 1
;;  (e c4 e4 - -)       ; Step 2
;;  (e c4 e4 g4 -)      ; Step 3
;;  (e c4 e4 g4 c5))    ; Step 4
```

_Symmetric Build (Outside-In) starting from silence:_

```lisp
(gen-block-additive '(e c4 e4 g4 c5) :type 'symmetric :start-count 0)
;; Output:
;; ((-e -e -e -e)       ; Silence
;;  (e c4 - - -)        ; Index 0
;;  (e c4 - - c5)       ; Index 0, 3
;;  (e c4 e4 - c5)      ; Index 0, 3, 1
;;  (e c4 e4 g4 c5))    ; Full
```

---

### gen-additive-indices

A helper function that calculates the _order_ in which indices are added.

**Signature:**

```lisp
(gen-additive-indices n &key (type 'linear) seed)
```

**Arguments:**

- **n**: (integer) Total number of events.
- **type**: (symbol) `'linear`, `'symmetric`, `'random`.
- **seed**: (integer) Seed for valid random results.

**Description:**
Returns a list of integers representing the order of addition.

- `'linear`: (0 1 2 3 ...)
- `'symmetric`: (0 n 1 n-1 ...)
- `'random`: Shuffled permutation.

---

### apply-process-mask

A low-level helper that masks a sequence based on active indices.

**Signature:**

```lisp
(apply-process-mask active-indices omn-sequence)
```

**Arguments:**

- **active-indices**: (list) Integers representing positions to keep.
- **omn-sequence**: (list) The source material.

**Description:**
Iterates through the sequence. If an event's index is NOT in `active-indices`, it is replaced by a rest of equivalent length.
**Crucial Behavior**: When creating a rest, the function strips all pitch, velocity, and articulation data, returning only the negative length atom (e.g., `-1/8`). This prevents Opusmodus from shifting subsequent pitches onto the rest slots.

---

## Cookbook / Recipes

### 1. The "Clapping Music" Build-Up

Recreate the vibe of Clapping Music by building up a 12-beat pattern randomly.

```lisp
(setf pattern '(e g4 e4 g4 - e4 e4 g4 - e4 - g4 -))
(gen-block-additive pattern
                    :type 'random
                    :seed 42
                    :start-count 1
                    :repeat-last 4)
```

### 2. Symmetric Piano Phase

Use a symmetric build for a piano pattern, then repeat the full pattern.

```lisp
(setf piano-pattern '(s e4 fs4 b4 cs5 d5 fs4 e4 cs5 b4 fs4 d5 cs5))
(gen-block-additive piano-pattern
                    :type 'symmetric
                    :start-count 0)
```

### 3. Algorithmic Input (Euclidean Rhythm)

Generate a 12/16 pattern with 7 hits (Euclidean distribution) and build it up randomly.

```lisp
(gen-block-additive (make-omn
                     :length (binary-map (gen-binary-euclidean 1 12 7 7) 's)
                     :pitch '(g4 d4 e4 g4 d4 e4 g4))
                    :type 'random)
```

### 4. Explicit Rest Handling

Demonstrates that the function correctly handles input patterns that already contain rests.

_Basic Random Build:_

```lisp
(gen-block-additive '(s g4 mf - d4 e4 - g4 - d4 e4 - g4 -) :type 'random)
```

_Advanced Setup (Start with 3 notes, Repeat Final 4 times, Repeat Steps 2 times):_

```lisp
(gen-block-additive '(s g4 mf - d4 e4 - g4 - d4 e4 - g4 -)
                    :start-count 3
                    :type 'random
                    :step-repeat 2
                    :repeat-last 4)
```

---

## 2. Phasing and Pattern Generation

This section covers functions designed to manipulate patterns in time, creating phasing effects (like Steve Reich's _Piano Phase_ or _Clapping Music_) and canons.

### apply-phasing

Creates a two-voice Steve Reich-style phasing structure from a bar-grouped OMN sequence.

**Signature:**

```lisp
(apply-phasing sequence delta &key (step-repeat 1))
```

**Arguments:**

- **sequence**: (list) Bar-grouped OMN input: `((bar1)(bar2)(bar3)...)`. Each sublist is one complete bar.
- **delta**: (ratio) The phasing offset increment per bar (e.g., `1/16`, `1/8`, `1/4`).
- **step-repeat**: (integer) How many bars share the same offset before it increments. Default: `1`.
  - `1` = offset grows by `delta` every bar (fastest drift)
  - `2` = offset grows by `delta` every 2 bars (slower drift)
  - `N` = offset grows every N bars

**Return value:**

```lisp
(list voice-1 voice-2)
```

- **voice-1**: The original sequence, unchanged.
- **voice-2**: The phased version — trimmed to the same total duration as voice-1 and re-barred to the same measure structure using `omn-to-time-signature`.

**Description:**

The offset prepended to bar `i` (0-based) is:

```
offset = floor(i / step-repeat) * |delta|
```

So with `delta = 1/8` and `step-repeat = 1`:

| Bar | Offset in Voice 2 |
|-----|-------------------|
| 1   | none (delta × 0)  |
| 2   | `-1/8` rest       |
| 3   | `-1/4` rest       |
| 4   | `-3/8` rest       |

Voice 2 is assembled as a flat sequence, trimmed to the total duration of Voice 1 with `length-span`, then re-barred with `omn-to-time-signature` to match the original bar lines exactly.

**Native Opusmodus functions used:** `get-time-signature`, `time-signature-length`, `length-span`, `omn-to-time-signature`.

**Examples:**

_Basic phasing, 1/8 delta:_

```lisp
(apply-phasing
  '((q c4 d4 e4 f4)
    (q g4 a4 b4 c5)
    (q d5 e5 f5 g5)
    (q a5 g5 f5 e5))
  1/8)
```

_Slower phasing, delta increments every 2 bars:_

```lisp
(apply-phasing
  '((q c4 d4 e4 f4)
    (q g4 a4 b4 c5)
    (q d5 e5 f5 g5)
    (q a5 g5 f5 e5)
    (q c5 b4 a4 g4)
    (q f4 e4 d4 c4))
  1/16
  :step-repeat 2)
```

_Use in a two-voice score:_

```lisp
(setf phased (apply-phasing source-bars 1/16))

(def-score phasing-example
           (:title "Phasing Example"
            :tempo 120
            :time-signature (get-time-signature (first phased)))
  (voice-1 :omn (first phased)  :channel 1)
  (voice-2 :omn (second phased) :channel 2))
```

_Combined with `gen-block-additive`:_

```lisp
(setf built
  (gen-block-additive '(e c4 d4 e4 f4 g4 a4)
                      :step-repeat 2
                      :repeat-last 2))

(setf phased-built (apply-phasing built 1/16))
;; (first phased-built)  -> original additive sequence
;; (second phased-built) -> phase-shifted, trimmed, re-barred
```

> **RTF documentation:** `knowledge/apply-phasing.rtf`

---

### gen-phasing

The primary function for applying phasing or canon processes to a musical sequence.

**Signature:**

```lisp
(gen-phasing sequence &key (method 'canon) (delay 1/8) (shift 1) (cycles 1) (repetition 1) (voices 2) (merge t))
```

**Arguments:**

- **sequence**: (list) Input OMN sequence.
- **method**: (symbol) The technique to apply.
  - `'canon`: Voices enter after a fixed delay.
  - `'rotation`: Voices play a loop, shifting indices (_Clapping Music_ style).
  - `'rotation-time`: Same as rotation, but shifts by time units instead of indices (uses `delay` as the shift amount).
- **delay**: (length/int)
  - For `'canon`: The time delay (e.g., 1/8) or number of events.
  - For `'rotation-time`: The amount of time to shift per phase step (e.g., 1/8).
- **shift**: (integer) For `'rotation` and `'rotation-time`. The number of steps (indices or time-units) to rotate the pattern each cycle. Default: 1.
- **cycles**: (integer) For `'rotation`. How many times to repeat the pattern before shifting. Default: 1.
- **repetition**: (integer) Total number of times to repeat the base sequence. Default: 1.
- **voices**: (integer) Total number of voices to generate. Default: 2.
- **merge**: (boolean) If `T`, returns a list of voices (polyphonic structure). If `nil`, returns a flat list. Default: `T`.

**Description:**

Generates multiple voices from a single sequence, applying either a simple time delay (canon) or a progressive phase shift (rotation).

- **Canon**: Simply delays subsequent voices.
- **Rotation**: Shifts the pattern cyclically. For `rotation-time`, the function intelligently detects the smallest duration in your sequence (the "grid") and calculates how many grid steps are needed to achieve the desired `delay` shift. This allows you to phase by 1/8th notes even if your pattern contains 16th notes.

**Examples:**

_Clapping Music Style (Index Rotation - shifting by 1 note):_

```lisp
(gen-phasing '(q c4 d4 e4 f4) :method :rotation :shift 1 :cycles 4 :repetition 12)
```

_Time-Based Phasing (Shifting by 1/8th note):_

```lisp
;; Sequence has 1/16 notes, but we shift by 1/8
(gen-phasing '(s c4 d4 e4 f4) :method :rotation-time :delay 1/8 :shift 1 :cycles 4 :repetition 12)
```

---

### length-to-grid

A helper function that quantizes a sequence to a rhythmic grid.

**Signature:**

```lisp
(length-to-grid sequence grid-val)
```

**Arguments:**

- **sequence**: (list) Input OMN sequence.
- **grid-val**: (length) The target grid size (e.g., 1/16).

**Description:**

Converts a sequence of notes into a grid based on `grid-val`. All notes are quantized to the nearest multiple of `grid-val` and longer notes are split into a sequence of `note -rest -rest...`. This prepares a sequence for rhythmic rotation (phasing) where every unit of time is an accessible "slot".

**Example:**

```lisp
;; Convert 1/8 note to 1/16 grid (becomes s -s)
(length-to-grid '(e c4) 1/16)
;; Result: ((s c4 -s))
```
