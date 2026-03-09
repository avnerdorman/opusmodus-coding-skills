# Interleave Mix Function

This document details the `gen-interleave-mix` function, designed for the Opusmodus environment to interleave two lists with automatic cycling (repeating) of the shorter list.

## Function Definition

```lisp
(defun gen-interleave-mix (list-a list-b)
  "Interleaves two lists A and B.
   If one list is shorter, it cycles to match the length of the longer list."
  (let* ((len-a (length list-a))
         (len-b (length list-b))
         (n (max len-a len-b)))
    (loop
       for i from 0 below n
       ;; We use 'head' pointers that reset to the start of the list when exhausted
       for head-a = list-a then (if (rest head-a) (rest head-a) list-a)
       for head-b = list-b then (if (rest head-b) (rest head-b) list-b)
       collect (first head-a)
       collect (first head-b))))
```

## How it Works

1. **Calculate Maximum Length**: The function determines the total count of pairs based on the longer of the two input lists (`n`).
2. **Cursor Pointers (`head-a`, `head-b`)**:
   - It maintains two cursors that step through the lists.
   - Using the `for ... then ...` syntax in the `loop` macro, it checks if `(rest head)` exists.
   - If a list reaches its end, the cursor "cycles" back to the beginning of the original list.
3. **Interleaving**: It collects the `first` element from each current cursor into a flat list.

## Examples

### 1. Repeating a shorter rhythmic pattern

If you have a list of pitches and a shorter list of velocities:

```lisp
(gen-interleave-mix '(c4 d4 e4 f4) '(p mf))
=> (c4 p d4 mf e4 p f4 mf)
```

### 2. Matching a shorter pitch collection to a longer list

```lisp
(gen-interleave-mix '(1 2) '(a b c d))
=> (1 a 2 b 1 c 2 d)
```

### 3. Lists of equal length

```lisp
(gen-interleave-mix '(a1 a2 a3) '(b1 b2 b3))
=> (a1 b1 a2 b2 a3 b3)
```
