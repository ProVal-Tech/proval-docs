---
id: 'cb89130a-47ea-4c5a-9d01-86423ccd1477'
slug: /cb89130a-47ea-4c5a-9d01-86423ccd1477
title: 'Remove Adobe Acrobat Products'
title_meta: 'Remove Adobe Acrobat Products'
keywords: ['uninstall','adobe','creative-cloud']
description: 'Removes Adobe Reader, Acrobat (64-bit), Creative Cloud, and runs the Adobe Cleaner tool.'
tags: ['uninstallation','software','application']
draft: false
unlisted: false
last_update:
  date: 2026-03-25
---

## Description

Designed to run from an ImmyBot task which detectes, removes and validates Adobe Products cleanup.

- Method behavior:
  - Get: Detects whether an Adobe installation root exists.
  - Test: Validates whether Adobe Reader, Acrobat, Creative Cloud, or Acrobat remnants remain.
  - Set: Performs Adobe removal using registry-driven uninstall, Creative Cloud uninstaller, and Adobe AcroCleaner.
Returns Boolean results suitable for ImmyBot Test/Set workflow handling.

[Task Configuration](https://github.com/ProVal-Tech/immybot/blob/main/tasks/remove-adobe-acrobat-products.toml)

## Changelog

### 2026-03-25

- Initial version of the document
