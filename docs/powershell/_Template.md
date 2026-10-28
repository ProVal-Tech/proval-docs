---
id: 'New-GUID'
slug: /New-GUID
title: 'Verb-Noun'
title_meta: 'Verb-Noun'
keywords: ['keyword-one', 'keyword-two']
description: 'One sentence that says what the script does, in plain language.'
tags: []
draft: true
unlisted: false
last_update:
  date: 2026-10-28
---

## Template Guidelines

Delete this section before publishing.

- Write for the person running the script: short sentences, plain language, no internal details.
- Describe what the script does, not how the code works. Don't include script code other than the commands in [Payload Usage](#payload-usage).
- Link other ProVal content by its document ID, for example `[Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)`, not by download or GitHub links.
- Quote messages exactly as the script writes them, so users can match them to the log.
- Delete optional sections that don't apply. When users have to collect a value before running the script, such as an ID from a portal, add a section for it between [Requirements](#requirements) and [Payload Usage](#payload-usage).
- Before publishing, replace `New-GUID` in `id` and `slug`, choose `tags` from the repository's `tags.yml`, set `draft` to `false` and update `last_update`.

## Overview

Explain in one or two sentences what the script does and the problem it solves. Say whether it only reads information or makes changes.

**Key Features:**

- **Feature name:** One sentence on what this means for the user.
- **Feature name:** One sentence on what this means for the user.

## Requirements

- PowerShell version 5.1 or later.
- Supported Windows versions, for example Windows 10, Windows 11, or Windows Server 2016 or later.
- Administrative privileges (SYSTEM context).
- Network access to **ProVal's File Server** to download the module installer ([Install-PSGalleryModule.ps1](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)).
- Network access to `www.powershellgallery.com` (queried by `Install-PSGalleryModule` to download the Strapper module).
- Any other site, software, license or setting the script needs.

Delete the two network access bullets for scripts that don't use the Strapper module.

## Dependencies

## Payload Usage

Add one example for each distinct way to run the script. Below are usage examples:

### Example 1

One sentence on what this example does.

```powershell
.\Verb-Noun.ps1
```

### Example 2

One sentence on what this example does and how it differs from Example 1.

```powershell
.\Verb-Noun.ps1 -ParameterOne 'Value' -SwitchParameter
```

## What Happens When You Run the Script

1. The script installs or updates the Strapper logging module.
2. Describe each step in the order the script runs it, from the user's point of view.
3. Say where the script stops without changing anything, for example when a check fails or the work is already done.

You'll know it worked when describe something the user can see or check, for example an app in the Start menu.

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| `ParameterOne` | `Value` | Describe the accepted values | True | | String | What the parameter controls. |
| `ParameterTwo` | `30` | `1` to `365` | False | `14` | Int | What the parameter controls. |
| `SwitchParameter` | `-SwitchParameter` | Switch | False | False | Switch | What happens when the switch is used. |

If the script has no parameters, replace the table with: This script has no parameters.

## Good to Know

Optional. List limits, side effects and recommendations users should know before running the script.

- Limit, side effect or recommendation.

:::note

Use a note for important information that doesn't fit the list. Use `:::warning` for anything that can cause data loss.

:::

## Troubleshooting

| Problem | Cause | Solution |
| ------- | ----- | -------- |
| `Message exactly as the script writes it.` | Why it happens. | What to do. |
| A symptom the user sees | Why it happens. | What to do. |

## Output

Describe what the script changes or returns, for example registry values, files, or objects returned to the RMM platform.

Log files (next to the script):

- `.\Verb-Noun-log.txt`
- `.\Verb-Noun-error.txt`

## Changelog

### 2026-10-28

- Initial version of the document
