---
id: 'c3ad2c46-6bae-4df4-980a-f937faf56dbc'
slug: /c3ad2c46-6bae-4df4-980a-f937faf56dbc
title: 'Uninstall Datto Windows Agent Or Datto Cloud Continuity'
title_meta: 'Uninstall Datto Windows Agent Or Datto Cloud Continuity'
keywords: ['datto', 'cloud', 'continuity']
description: ''
tags: ['datto']
draft: false
unlisted: false
---

## Summary
This script uninstalls the Datto Windows Agent and Datto Cloud Continuity by grabbing the quietuninstallstring from the registry of the installed application.

## Sample Run
![Sample Run](../../../static/img/docs/955123e8-cb90-480c-8de5-8ac81d41bdd6/image4.webp)


## Dependencies

## Process

- It checks if the agent has Datto Windows Agent or Datto Cloud Continuity installed.
- If detected, then it writes a PS1 on the agent with a MD5 file hash "0E00FB0327D5D58A515946BFFA4FEC07".
- The PS1 fetches the quiet uninstall command from the application registry and executes using system account and uninstalls the application.
- It includes proper error handling

## Output

- Script Log