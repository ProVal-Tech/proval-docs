---
id: ps-clear-chromiumhomepage
title: 'Clear-ChromiumHomepage'
title_meta: 'Clear-ChromiumHomepage Command'
keywords: ['clear', 'homepage', 'chromium', 'browser']
description: 'Documentation for the Clear-ChromiumHomepage command to clear enforced homepages in Chromium-based browsers.'
tags: ['chrome', 'setup', 'web-browser']
draft: false
unlisted: false
---

## Description
Clears enforced homepages in Chromium-based browsers.

## Usage
1. Reads the `$Target` parameter and prepares a list of registry keys to edit.
2. Removes specific registry keys that enforce homepage selection, new tab page control, and session restoration.
3. Validates that the registry keys either did not exist or were successfully removed.

```powershell
.\\Clear-ChromiumHomepage.ps1 -Target 'Chrome','Edge'
```
Removes enforced homepages in Chrome and Edge. After running, user configuration of browser homepages will be available.

## Parameters
| Parameter | Alias | Required | Default | Type     | Description                                                                           |
| --------- | ----- | -------- | ------- | -------- | ------------------------------------------------------------------------------------- |
| `Target`  |       | False    | All     | String[] | The target type(s) of Chromium-based browser(s) to remove homepage enforcement for.  |

## Output
`.\\Set-ChromiumHomepage-log.txt`
