---
id: 'a76e5cc5-9cc8-4c66-a877-1ab42fed37a3'
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
| [Get Chromium Browsers Extensions](<../cwa/scripts/Get Chromium Browsers Extensions.md>)     | Script       | An Automate implementation of the agnostic script [EPM - Data Collection - Agnostic - Script - Get-ChromiumExtensions](<../powershell/Get-ChromiumExtensions.md>) to fetch the installed extensions for the Chromium-based browsers.                |
| [Get Firefox Browser Extensions](<../cwa/scripts/Get Firefox Browser Extensions.md>)       | Script       | An Automate implementation of the agnostic script [EPM - Data Collection - Agnostic - Script - Get-FirefoxExtensions](<../powershell/Get-FirefoxExtensions.md>) to fetch the installed extensions for the Mozilla Firefox browser.                  |
| [Get Installed Browsers Extensions [DV]](<../cwa/scripts/Get Installed Browsers Extensions DV.md>) | Script       | A wrapper script to execute the [Get Chromium Browsers Extensions](<../cwa/scripts/Get Chromium Browsers Extensions.md>) and [Get Firefox Browser Extensions](<../cwa/scripts/Get Firefox Browser Extensions.md>) scripts.                                        |
| [plugin_proval_browsers_extensions](<../cwa/tables/Plugin_ProVal_Browsers_Extensions.md>)    | Custom Table | To store the information gathered by the [Get Chromium Browsers Extensions](<../cwa/scripts/Get Chromium Browsers Extensions.md>) and [Get Firefox Browser Extensions](<../cwa/scripts/Get Firefox Browser Extensions.md>) scripts.                                   |
| [Installed Browsers Extensions [Script]](<../cwa/dataviews/Installed Browsers Extensions Script.md>) | Dataview     | To display the information on installed browser extensions stored in the [plugin_proval_browsers_extensions](<../cwa/tables/Plugin_ProVal_Browsers_Extensions.md>) table.                                                                                       |

## Implementation

1. Import the [Get Installed Browsers Extensions [DV]](<../cwa/scripts/Get Installed Browsers Extensions DV.md>) script.
2. Import the [Installed Browsers Extensions [Script]](<../cwa/dataviews/Installed Browsers Extensions Script.md>) dataview.
3. Debug the script against any online Windows machine to create the [plugin_proval_browsers_extensions](<../cwa/tables/Plugin_ProVal_Browsers_Extensions.md>) table.
4. Check the [Installed Browsers Extensions [Script]](<../cwa/dataviews/Installed Browsers Extensions Script.md>) dataview for the data. If it's empty, you can execute the [CWM - Automate - Script - Update User Permissions for ProVal Custom Tables](<../cwa/scripts/MySQL - Permission - Set Custom Table Permissions.md>) script to grant the table's permissions to all of the Automate users.
