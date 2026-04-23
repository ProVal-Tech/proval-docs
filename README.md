# ProVal Tech Content Documentation

The source repository for [content.provaltech.com](https://content.provaltech.com) — a Docusaurus-powered documentation site covering ProVal Tech's scripts, automations, apps, and platform integrations.

## Prerequisites

- [Node.js](https://nodejs.org/) v18+
- [Yarn](https://yarnpkg.com/) (classic or berry)

## Local Development

Install dependencies and start a local dev server with hot reload:

```bash
yarn install
yarn start
```

The site is served at `http://localhost:3000` by default.

## Build

Compile the site to static files in the `build/` directory:

```bash
yarn build
```

Preview the production build locally:

```bash
yarn serve
```

## Deploy

Deploys to the `gh-pages` branch via GitHub Pages:

```bash
cmd /C "set GIT_USER=<your-github-username> && yarn deploy"
```

The live site publishes to `https://content.provaltech.com`.

## Repository Structure

```
docs/               # All documentation content
  apps/             # ProVal-built applications
  cwa/              # ConnectWise Automate content
  cwrmm/            # ConnectWise RMM content
  dattormm/         # Datto RMM content
  general/          # General guides and references
  immybot/          # ImmyBot software/task docs
  ninjaone/         # NinjaOne automations and tasks
  powershell/       # PowerShell scripts
  rewst/            # Rewst workflows
  solutions/        # Solution-level documentation
  vsa/              # Kaseya VSA content
  vsax/             # Kaseya VSA X content
  tags.yml          # Controlled tag vocabulary
helper_scripts/     # Local tooling for doc maintenance
src/                # Docusaurus theme customizations
static/             # Static assets (images, attachments)
_template.md        # Root-level front matter template
```

## Writing a Document

1. Clone the repo and create a new branch.
2. Copy `_template.md` into the appropriate `docs/` subfolder. Use lowercase, hyphen-separated filenames (e.g., `my-new-doc.md`).
3. Fill in the front matter:

   | Field | Description |
   |---|---|
   | `id` | New GUID (required) |
   | `title` | Display title |
   | `title_meta` | SEO title (usually same as `title`) |
   | `keywords` | Array of search keywords |
   | `description` | One-sentence summary |
   | `tags` | Tags from `docs/tags.yml` (max 5) |
   | `draft` | `true` hides the doc from production |
   | `unlisted` | `true` excludes it from the sidebar index |

4. Write content following the [Documentation Standards](.github/copilot-instructions.md).
5. Add a `## Changelog` section at the bottom. Format:

   ```markdown
   ## Changelog

   ### YYYY-MM-DD

   - Description of change
   ```

   Entries go newest-first. New documents must include an initial entry (e.g., "Initial release").

6. Open a pull request to `main`. The doc goes live after merge.

## Helper Scripts

The `helper_scripts/` folder contains PowerShell utilities for doc maintenance. Key scripts:

| Script | Purpose |
|---|---|
| `Invoke-AIProofread.ps1` | Proofreads a doc via OpenAI GPT |
| `Add-Changelog.ps1` | Adds a changelog entry to a doc |
| `LinkFix.ps1` | Fixes broken internal links |
| `UpdateFrontMatter.ps1` | Bulk-updates front matter fields |
| `Remove-UnusedStaticFiles.ps1` | Cleans up orphaned static assets |

## Tags

All tags are defined in `docs/tags.yml`. Only tags from this file may be used — inline tags throw a build error (`onInlineTags: throw`). Choose up to 5 tags per document.

## Search

The site uses Algolia DocSearch with AI assistant support. No configuration is needed for contributors.

## Contributing

Only ProVal Tech members may contribute content. Issues are open to everyone.

## License

All rights reserved. © ProVal Tech
