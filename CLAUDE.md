# Opusmodus Coder — Claude Instructions

This repository is a knowledge base and AI skill for Opusmodus, a Common Lisp-based computer-aided composition environment.

## Repository Layout

- `knowledge/system_functions/` — 900+ Markdown files converted from official Opusmodus System Function PDFs
- `knowledge/opusmodus_map.md` — master index mapping functions to categories and example files
- `knowledge/templates/` — Lisp and Markdown templates for new user functions
- `skills/opusmodus_coding/SKILL.md` — full AI instruction file for Opusmodus coding tasks
- `English.lproj/user.omdocset/Opusmodus/User Source/Functions/` — user-defined function source files
- `English.lproj/user.omdocset/Opusmodus/Documents/Functions/` — user function documentation
- `English.lproj/system.omdocset/Documentation/` — system `.opmo` example files

## Finding Functions

Search documentation and examples with:
```bash
python3 skills/opusmodus_coding/scripts/doc_search.py "query"
```
Then read the relevant `knowledge/system_functions/.../<function>.md` file for the official signature.

Check `knowledge/opusmodus_map.md` for `.opmo` example files when documentation alone is insufficient.

## Coding Principles

1. **Clarify data structures first** — confirm whether data is a flat list, nested bar-grouped list, or OMN string before writing code. Do not assume.
2. **Small chunks** — break complex algorithms into helper functions of 15–20 lines, each evaluable in the Opusmodus listener.
3. **State expected I/O** — for each chunk, state the expected input and output (e.g. "Input: `'(c4 d4)`, Output: `'(60 62)`").
4. **Verify arguments** — always check arguments against the retrieved Markdown documentation. Do not guess.

## Writing New Functions

- **Source**: `English.lproj/user.omdocset/Opusmodus/User Source/Functions/` — use `knowledge/templates/new_function_template.lisp`
- **Docs**: `English.lproj/user.omdocset/Opusmodus/Documents/Functions/` — use `knowledge/templates/new_function_doc_template.md`
- Include a docstring, meaningful comments, and copy-pasteable examples.

## Common Pitfalls

### Rests in OMN lists

When negating a length to make a rest, **remove** the associated pitch, velocity, and articulation.

**Wrong**: `'(e c4 -1/8 d4)` — Opusmodus misinterprets `d4` as the next event's pitch.

**Right**: `'(e c4 -1/8)` — the rest replaces the event entirely.

Rule: if length < 0, the event is `(length)` only. Use `single-events` to iterate and strip data cleanly.

## Style

Opusmodus is Common Lisp. Use standard Lisp formatting conventions.
