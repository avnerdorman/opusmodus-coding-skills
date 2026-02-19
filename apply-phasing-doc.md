# Function Documentation

**Function Name:** `apply-phasing`
**Category:** Phasing / Structure
**Description:** Creates a two-voice Steve Reich-style phasing structure from a bar-grouped OMN sequence.

---

### Syntax

```lisp
(apply-phasing sequence delta &key (step-repeat 1))
```

### Arguments

- **`sequence`**: A nested OMN list grouped by bars: `((bar1)(bar2)(bar3)...)`. Each sublist is one bar of OMN notation.
- **`delta`**: A duration ratio representing the phasing offset increment (e.g., `1/16`, `1/8`, `1/4`). Must be a positive ratio.
- **`step-repeat`** *(keyword, default `1`)*: An integer controlling how many bars share the same phasing offset before it increments. `1` = offset grows every bar; `2` = offset grows every 2 bars; `3` = every 3 bars, etc.

### Returns

A list of two bar-grouped OMN voices:

```
(voice-1 voice-2)
```

- **`voice-1`**: The original `sequence`, unchanged.
- **`voice-2`**: The phased version — each bar (or group of bars, per `step-repeat`) has a progressively larger rest prepended. Trimmed to the same total duration as `voice-1` and re-barred using `omn-to-time-signature` to match the original bar structure exactly.

### Description

`apply-phasing` implements a **minimal phasing** technique inspired by Steve Reich's process music. The idea is simple: two voices play the same material, but Voice 2 gradually drifts ahead by introducing a small rest at the start of each bar. Over successive bars the drift accumulates, creating an ever-widening phase shift.

**Offset formula:**

For bar index `i` (0-based):

```
offset = floor(i / step-repeat) * |delta|
```

So with `delta = 1/8` and `step-repeat = 1`:

| Bar | Offset | Bar content in Voice 2          |
|-----|--------|---------------------------------|
| 1   | 0      | `(bar1)`                        |
| 2   | 1/8    | `(-1/8 bar2-events...)`         |
| 3   | 1/4    | `(-1/4 bar3-events...)`         |
| 4   | 3/8    | `(-3/8 bar4-events...)`         |

With `step-repeat = 2` the same pattern applies but the offset increments every 2 bars.

Voice 2 is always trimmed to the same total duration as Voice 1, with `length-span`, so any content pushed beyond the end is cut. It is then re-barred with `omn-to-time-signature` using the exact same time signatures as Voice 1.

**Native OpusModus functions used:**
- `get-time-signature` — extracts the bar structure from the input sequence
- `time-signature-length` — computes the total duration with `:sum t`
- `length-span` — trims (or spans) the phased flat sequence to the exact total duration
- `omn-to-time-signature` — re-bars the flat phased sequence into the original measure structure

### Examples

```lisp
;;---------------------------------------------------------
;; Example 1: Basic phasing, 1/8 delta, 4 bars of 4/4
;;---------------------------------------------------------
(setf seq '((q c4 d4 e4 f4)
            (q g4 a4 b4 c5)
            (q d5 e5 f5 g5)
            (q a5 g5 f5 e5)))

(apply-phasing seq 1/8)
;; => (voice-1  voice-2)
;;    voice-1: ((q c4 d4 e4 f4)(q g4 a4 b4 c5)(q d5 e5 f5 g5)(q a5 g5 f5 e5))
;;    voice-2: Same total beats, re-barred, with progressive 1/8 rest offsets


;;---------------------------------------------------------
;; Example 2: Slower phasing - delta increments every 2 bars
;;---------------------------------------------------------
(setf seq2 '((q c4 d4 e4 f4)
             (q g4 a4 b4 c5)
             (q d5 e5 f5 g5)
             (q a5 g5 f5 e5)
             (q c5 b4 a4 g4)
             (q f4 e4 d4 c4)))

(apply-phasing seq2 1/16 :step-repeat 2)
;; Bars 1-2: no offset (delta*0)
;; Bars 3-4: 1/16 rest offset (delta*1)
;; Bars 5-6: 1/8 rest offset  (delta*2)


;;---------------------------------------------------------
;; Example 3: Mixed time signatures
;;---------------------------------------------------------
(setf mixed '((q c4 d4 e4)          ; 3/4
              (q f4 g4 a4 b4)       ; 4/4
              (q c5 d5 e5)          ; 3/4
              (q f5 g5 a5 b5)))     ; 4/4

(apply-phasing mixed 1/8)
;; Voice 2 respects the original mixed time signatures,
;; re-barred by omn-to-time-signature.


;;---------------------------------------------------------
;; Example 4: Typical use in a def-score (two-staff score)
;;---------------------------------------------------------
(setf source-bars '((e c4 mf d4 e4 f4 g4 a4 b4 c5)
                    (e d5 mf e5 f5 g5 a5 g5 f5 e5)
                    (e d5 mf c5 b4 a4 g4 f4 e4 d4)
                    (e c4 mf d4 e4 f4 g4 a4 b4 c5)))

(setf phased (apply-phasing source-bars 1/16 :step-repeat 1))

(def-score phasing-example
           (:title    "Phasing Example"
            :composer "Reich / OpusModus"
            :tempo    120
            :time-signature (get-time-signature (first phased)))

  (voice-1
    :omn (first phased)
    :channel 1)

  (voice-2
    :omn (second phased)
    :channel 2))
```
