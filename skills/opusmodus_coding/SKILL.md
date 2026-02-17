---
name: opusmodus_coding
description: Expert guidance on writing Opusmodus code, finding system functions, and using examples.
---

# Opusmodus Coding Skill

This skill helps you write high-quality Opusmodus code by leveraging the system documentation and example files.

## 0. Core Operational Principles (MANDATORY)

These principles must be followed for **all** coding tasks.

1.  **Mandatory Clarification Phase**:
    -   Before generating code, you **MUST** ask clarifying questions about input/output data structures.
    -   Confirm if the data is a flat list, nested bar-grouped list, or OMN string.
    -   **Rule**: Do not assume the schema of the musical data.

2.  **Incremental 'Small Chunk' Development**:
    -   Break complex algorithms into small, testable helper functions.
    -   Limit code chunks to **15-20 lines** where possible.
    -   Goal: Ensure each segment can be evaluated and debugged in the Opusmodus listener immediately.

3.  **Validation-First Logic**:
    -   For each code chunk, explicitly state the **Expected Input** and **Expected Output**.
    -   Example: "Input: `'(c4 d4)`, Output: `'(60 62)`"

## 1. Finding Functions

You have a dedicated search script to find documentation and examples.

### usage
Run the following command to search for functions or topics:
```bash
python3 skills/opusmodus_coding/scripts/doc_search.py "query"
```

Example:
```bash
python3 skills/opusmodus_coding/scripts/doc_search.py "twelve-tone"
```

The script searches:
1.  **System Functions Documentation**: Markdown files in `knowledge/system_functions/`.
2.  **Function Map**: The index in `knowledge/opusmodus_map.md`.

## 2. Using Documentation

Once you identify a relevant function or file from the search results:

1.  **Read the Documentation**: Use `view_file` on the markdown file returned by the search.
    - Path: `knowledge/system_functions/.../<function>.md`
    - This gives you the *official signature* and description.

2.  **Find Examples**: If the documentation is abstract, look for `.opmo` usage examples.
    - Check `knowledge/opusmodus_map.md` (or the search results) for `.opmo` files with similar names.
    - Example: `view_file English.lproj/system.omdocset/Documentation/How-to/Analysis/Analysis.opmo`.

## 3. Writing Code

- **Templates**: Can be found in `English.lproj/system.omdocset/Templates Descriptions.lisp`.
- **Style**: Opusmodus is Common Lisp. Use standard Lisp formatting.
- **Verification**: Always double-check your arguments against the Markdown documentation you retrieved.

## 4. Creating New Functions

When creating new helper functions, always follow the Opusmodus structure.

1.  **Source Code**:
    -   Location: `English.lproj/user.omdocset/Opusmodus/User Source/Functions/`
    -   Template: `knowledge/templates/new_function_template.lisp`
    -   Requirement: Include a docstring and meaningful comments.

2.  **Documentation**:
    -   Location: `English.lproj/user.omdocset/Opusmodus/Documents/Functions/`
    -   Template: `knowledge/templates/new_function_doc_template.md` (or `.rtf` if requested)
    -   Requirement: Provide copy-pasteable examples.

## 5. Troubleshooting

If you are unsure about an argument:
1.  Do NOT guess.
2.  Search for the function name in `knowledge/system_functions/`.
3.  Read the Markdown file.
