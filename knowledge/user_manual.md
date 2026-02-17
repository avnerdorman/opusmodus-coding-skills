# Opusmodus User Extensions Manual

This manual documents custom functions and extensions developed for the Opusmodus environment.

## Table of Contents

1.  [Block Additive Process](#block-additive-process)
    - [gen-block-additive](#gen-block-additive)
    - [gen-additive-indices](#gen-additive-indices)
    - [apply-process-mask](#apply-process-mask)

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

````lisp
(setf piano-pattern '(s e4 fs4 b4 cs5 d5 fs4 e4 cs5 b4 fs4 d5 cs5))
(gen-block-additive piano-pattern
                    :type 'symmetric
;;; 3. Algorithmic Input (Euclidean Rhythm)
)
Generate a 12/16 pattern with 7 hits (Euclidean distribution) and build it up randomly.

```lisp
(gen-block-additive (make-omn
                     :length (binary-map (gen-binary-euclidean 1 12 7 7) 's)
                     :pitch '(g4 d4 e4 g4 d4 e4 g4))
                    :type 'random)
````

### 4. Explicit Rest Handling

Demonstrates that the function correctly handles input patterns that already contain rests.

_Basic Random Build:_

```lisp
(gen-block-additive '(s g4 mf - d4 e4 - g4 - d4 e4 - g4 -) :type 'random)
```

\__Advanced Setup (Start with 3 notes, Repeat Final 4 times, Repeat Steps 2 times):_

```lisp
(gen-block-additive '(s g4 mf - d4 e4 - g4 - d4 e4 - g4 -)
                    :start-count 3
                    :type 'random
                    :step-repeat 2
                    :repeat-last 4)
```

```

```
