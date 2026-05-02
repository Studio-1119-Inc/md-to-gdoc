# md-to-gdoc

In this transitional phase, AI tools like Claude write specs and docs in Markdown, but teams read them in shared Google Drive folders. This tool bridges the gap — it uploads `.md` files to Google Drive, automatically converting them to native Google Docs format and preserving cross-file links.

Run it locally or wire it into your GitHub workflows to keep your docs folder in sync with every release.

## Features

- **Markdown to Google Docs** — converts via pandoc, preserving tables, headings, and code blocks
- **Folder paths** — specify a Drive folder path like `"My Company/Products/Docs"` and folders are created automatically
- **Upsert** — if a doc with the same name already exists, it's updated in place (no duplicates)
- **Cross-file links** — links between `.md` files (e.g. `[Setup](SETUP.md)`) are rewritten to point to the corresponding Google Doc
- **Batch upload** — pass multiple files or use wildcards (`*.md`)
- **HTML mode** — `--html` converts to standalone `.html` next to each input (no Drive, no gcloud required)

## Install

```bash
brew tap Studio-1119-Inc/md-to-gdoc
brew install md-to-gdoc
```

### Prerequisites

- **pandoc** — installed automatically by Homebrew
- **gcloud** — [Google Cloud SDK](https://cloud.google.com/sdk/docs/install), authenticated with Drive scope:

```bash
gcloud auth application-default login \
  --scopes=https://www.googleapis.com/auth/drive,https://www.googleapis.com/auth/cloud-platform
```

## Usage

```bash
# Upload a single file
md-to-gdoc README.md "My Company/Products/Docs"

# Upload all markdown files in a directory
md-to-gdoc docs/*.md "My Company/Products/Docs"

# Upload to a specific Drive folder by ID
md-to-gdoc README.md --folder 1a2b3c4d5e6f

# Convert to standalone HTML next to each input (no Drive upload)
md-to-gdoc --html docs/*.md
```

## GitHub Actions

```yaml
- name: Sync docs to Google Drive
  run: md-to-gdoc docs/*.md "My Company/Products/Docs"
  env:
    GOOGLE_APPLICATION_CREDENTIALS: ${{ secrets.GCP_SA_KEY_PATH }}
```

## How it works

1. **Pass 1** — each `.md` file is converted to `.docx` via pandoc, then uploaded to Google Drive with automatic conversion to Google Docs format. If a doc with the same name exists in the target folder, it's updated in place.
2. **Pass 2** — if any files contain links to other files in the batch (e.g. `[API Reference](API.md)`), the markdown is rewritten with Google Doc URLs, re-converted, and re-uploaded.

## License

MIT
