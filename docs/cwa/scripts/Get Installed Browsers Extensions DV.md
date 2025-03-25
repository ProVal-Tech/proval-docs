---
id: 'f0a2db8c-92b6-4584-a70c-209263d46511'
slug: /f0a2db8c-92b6-4584-a70c-209263d46511
title: 'Get Installed Browsers Extensions DV'
title_meta: 'Get Installed Browsers Extensions DV'
keywords: ['extensions', 'chrome', 'edge', 'brave', 'firefox', 'inventory']
description: 'This document outlines a script that collects all installed extensions from Google Chrome, Microsoft Edge, Brave, and Mozilla Firefox browsers. It acts as a wrapper to execute existing scripts for gathering browser extensions and provides a process for refreshing software inventory and checking for installed browsers.'
tags: ['software']
draft: false
unlisted: false
---

## Summary

This script gathers all the extensions installed on the Google Chrome, Microsoft Edge, Brave, and Mozilla Firefox browsers. It's a wrapper script that executes the [Get Chromium Browsers Extensions](<./Get Chromium Browsers Extensions.md>) and [Get Firefox Browser Extensions](<./Get Firefox Browser Extensions.md>) scripts.

## Sample Run

![Sample Run](../../../static/img/Get-Installed-Browsers-Extensions-DV/image_1.png)

## Dependencies

- [Get Chromium Browsers Extensions](<./Get Chromium Browsers Extensions.md>)
- [Get Firefox Browser Extensions](<./Get Firefox Browser Extensions.md>)
- [CWM - Automate - Dataview - Installed Browsers Extensions [Script]](<../dataviews/Installed Browsers Extensions Script.md>)

## Variables

| Name    | Description                                        |
|---------|----------------------------------------------------|
| Browser | Used to check the name of the installed browser.   |

## Process

- Refresh software inventory.
- Look for the installed browsers.
- Execute the [Get Chromium Browsers Extensions](<./Get Chromium Browsers Extensions.md>) script if any of the `Google Chrome`, `Brave`, or `Microsoft Edge` browsers are installed.
- Execute the [Get Firefox Browser Extensions](<./Get Firefox Browser Extensions.md>) script if the `Mozilla Firefox` browser is installed.

## Output

- Dataview


