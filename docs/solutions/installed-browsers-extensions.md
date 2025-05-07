---
id: 'a76e5cc5-9cc8-4c66-a877-1ab42fed37a3'
slug: /a76e5cc5-9cc8-4c66-a877-1ab42fed37a3
title: 'Installed Browsers Extensions'
title_meta: 'Installed Browsers Extensions'
keywords: ['browsers', 'extensions', 'chrome', 'firefox', 'edge', 'brave', 'user']
description: 'This document provides information on how to retrieve and manage the installed extensions for various browsers including Google Chrome, Brave, Microsoft Edge Chromium, and Mozilla Firefox. It outlines the associated content, implementation steps, and best practices for utilizing the provided scripts and data views.'
tags: ['brave', 'browsers', 'chrome', 'edge', 'extensions', 'firefox']
draft: false
unlisted: false
---

## Purpose

This document returns information relating to the installed extensions for installed browsers for each user.

**Supported Browsers:** Google Chrome, Brave, Microsoft Edge Chromium, and Mozilla Firefox

## Associated Content

| Content                                                                                  | Type         | Function                                                                                                                                                                                                 |
|------------------------------------------------------------------------------------------|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Get Chromium Browsers Extensions](/docs/ff2827dd-bd64-4437-8783-4b576e6cfb81)     | Script       | An Automate implementation of the agnostic script [EPM - Data Collection - Agnostic - Script - Get-ChromiumExtensions](/docs/8828a709-4424-48f9-a5bf-dfc81a40bb97) to fetch the installed extensions for the Chromium-based browsers.                |
| [Get Firefox Browser Extensions](/docs/472a8d13-fd00-4a97-90dd-833a171eac40)       | Script       | An Automate implementation of the agnostic script [EPM - Data Collection - Agnostic - Script - Get-FirefoxExtensions](/docs/e45f0be5-66b2-417a-b900-0a6b3b9994f1) to fetch the installed extensions for the Mozilla Firefox browser.                  |
| [Get Installed Browsers Extensions [DV]](/docs/f0a2db8c-92b6-4584-a70c-209263d46511) | Script       | A wrapper script to execute the [Get Chromium Browsers Extensions](/docs/ff2827dd-bd64-4437-8783-4b576e6cfb81) and [Get Firefox Browser Extensions](/docs/472a8d13-fd00-4a97-90dd-833a171eac40) scripts.                                        |
| [plugin_proval_browsers_extensions](/docs/0a6370b4-7944-4483-86d5-ecbfd58f5376)    | Custom Table | To store the information gathered by the [Get Chromium Browsers Extensions](/docs/ff2827dd-bd64-4437-8783-4b576e6cfb81) and [Get Firefox Browser Extensions](/docs/472a8d13-fd00-4a97-90dd-833a171eac40) scripts.                                   |
| [Installed Browsers Extensions [Script]](/docs/9c095cab-514b-479d-a302-bdb596caefe5) | Dataview     | To display the information on installed browser extensions stored in the [plugin_proval_browsers_extensions](/docs/0a6370b4-7944-4483-86d5-ecbfd58f5376) table.                                                                                       |

## Implementation

1. Import the [Get Installed Browsers Extensions [DV]](/docs/f0a2db8c-92b6-4584-a70c-209263d46511) script.
2. Import the [Installed Browsers Extensions [Script]](/docs/9c095cab-514b-479d-a302-bdb596caefe5) dataview.
3. Debug the script against any online Windows machine to create the [plugin_proval_browsers_extensions](/docs/0a6370b4-7944-4483-86d5-ecbfd58f5376) table.
4. Check the [Installed Browsers Extensions [Script]](/docs/9c095cab-514b-479d-a302-bdb596caefe5) dataview for the data. If it's empty, you can execute the [CWM - Automate - Script - Update User Permissions for ProVal Custom Tables](/docs/7819fc75-aeae-457b-a451-59221396e900) script to grant the table's permissions to all of the Automate users.
