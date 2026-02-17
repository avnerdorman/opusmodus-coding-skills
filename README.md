# Opusmodus Knowledge Base & AI Skills

This repository contains a comprehensive knowledge base for AI assistance with Opusmodus coding.

## Contents

-   **`knowledge/`**: The core documentation and templates.
    -   `system_functions/`: 900+ Markdown files converted from the official Opusmodus System Function PDFs.
    -   `opusmodus_map.md`: A master index mapping functions to their categories and relevant example files.
    -   `templates/`: Standard Lisp and Markdown templates for creating new user functions.

-   **`skills/`**: AI-consumable instructions.
    -   `opusmodus_coding/`: The "Skill" definition that teaches an AI agent how to use the knowledge base effectively.
    -   `opusmodus_coding/scripts/`: Helper scripts (like `doc_search.py`) for the AI to query the documentation.
    -   `opusmodus_coding/SKILL.md`: The main instruction file for the AI.

## Usage for AI Agents

To use this repository effectively:

1.  **Read the Skill**: Start by reading `skills/opusmodus_coding/SKILL.md`.
2.  **Search**: Use `python3 skills/opusmodus_coding/scripts/doc_search.py "query"` to find relevant functions and examples.
3.  **Read Docs**: Read the specific `.md` file in `knowledge/system_functions/`.
4.  **Read Examples**: Locate and read the corresponding `.opmo` example file in the original Opusmodus `Documentation` folder (referenced by `opusmodus_map.md`).
5.  **Write Code**: Use the templates in `knowledge/templates/` for any new reusable functions.

## Contributing

-   Run `python3 knowledge/update_opusmodus_map.py` if new `.opmo` examples are added.
-   Run `python3 knowledge/convert_docs_to_md.py` if the source PDFs are updated.
