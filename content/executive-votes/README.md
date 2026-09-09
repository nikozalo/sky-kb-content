# Executive Votes Repository

This repository stores current and historical executive votes in Sky Protocol

## Structure

The `executive-votes` repository is organized as follows:

```
executive-votes/
├── active/ # Contains a JSON file that determines the executive votes currently under consideration
│ └── proposals.json
├── 2025/ # Contains executive votes posted in 2025
│ └── e.g. executive-vote-2025-01-15-update-oracle.md
├── ... # Additional year directories as needed
├── templates/ # Contains templates for creating new executive vote files
│ └── executive-vote-template.md
├── index.json # (Optional) An index of all executive votes for quick lookup
└── README.md # This file
```

## File Naming Convention

Executive vote files should follow the pattern: `executive-vote-<yyyy-mm-dd>-<description>.md`.

- `<yyyy-mm-dd>`: The date the vote was proposed.
- `<description>`: A brief, hyphenated description of the vote's purpose (e.g., `update-oracle`, `parameter-change`).

## Components

- **`active/`**: Holds a proposals.json file that points to the URL for the current Exec Doc living in the _Year Directories_.
- **Year Directories (`YYYY/`)**: Store current and historical records of executive votes, organized by the year they were concluded or executed.
- **`templates/`**: Contains template files (`.md`) to ensure consistency when drafting new executive votes.
- **`index.json`**: (Optional) A JSON file that could provide a quick index or summary of all executive votes, potentially linking IDs to descriptions or dates.
- **`README.md`**: Provides an overview of this repository's structure and conventions.

## Usage

- Utilize the templates in `templates/` for creating new vote proposals.
- Use the naming convention `executive-vote-<yyyy-mm-dd>-<description>.md` for all vote files.
- Save the Exec Doc under the appropriate _Year Directory_.
- Update the proposals.json file in the `active/` directory to point to the URL of the Exec Doc (raw version).
