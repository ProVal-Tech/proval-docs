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

This script gathers all the extensions installed on the Google Chrome, Microsoft Edge, Brave, and Mozilla Firefox browsers. It's a wrapper script that executes the [Get Chromium Browsers Extensions](/docs/ff2827dd-bd64-4437-8783-4b576e6cfb81) and [Get Firefox Browser Extensions](/docs/472a8d13-fd00-4a97-90dd-833a171eac40) scripts.

## Sample Run

![Sample Run](../../../static/img/docs/f0a2db8c-92b6-4584-a70c-209263d46511/image_1.png)

## Dependencies

- [Get Chromium Browsers Extensions](/docs/ff2827dd-bd64-4437-8783-4b576e6cfb81)
- [Get Firefox Browser Extensions](/docs/472a8d13-fd00-4a97-90dd-833a171eac40)
- [CWM - Automate - Dataview - Installed Browsers Extensions [Script]](/docs/9c095cab-514b-479d-a302-bdb596caefe5)

## Variables

| Name    | Description                                        |
|---------|----------------------------------------------------|
| Browser | Used to check the name of the installed browser.   |

## Process

- Refresh software inventory.
- Look for the installed browsers.
- Execute the [Get Chromium Browsers Extensions](/docs/ff2827dd-bd64-4437-8783-4b576e6cfb81) script if any of the `Google Chrome`, `Brave`, or `Microsoft Edge` browsers are installed.
- Execute the [Get Firefox Browser Extensions](/docs/472a8d13-fd00-4a97-90dd-833a171eac40) script if the `Mozilla Firefox` browser is installed.

## Output

- Dataview

