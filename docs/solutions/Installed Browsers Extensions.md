---
id: 'a76e5cc5-9cc8-4c66-a877-1ab42fed37a3'
title: 'Installed Browsers Extensions'
title_meta: 'Installed Browsers Extensions'
keywords: ['browsers', 'extensions', 'chrome', 'firefox', 'edge', 'brave', 'user']
description: 'This document provides information on how to retrieve and manage the installed extensions for various browsers including Google Chrome, Brave, Microsoft Edge Chromium, and Mozilla Firefox. It outlines the associated content, implementation steps, and best practices for utilizing the provided scripts and data views.'
tags: ['browsers', 'extensions', 'chrome', 'firefox', 'edge', 'brave', 'script', 'dataview', 'custom', 'management']
draft: false
unlisted: false
---
## Purpose

Returns information relating to the installed extensions for installed browsers for each user.

Supported Browsers: Google Chrome, Brave, Microsoft Edge Chromium, and Mozilla Firefox

## Associated Content

| Content                                                                                  | Type         | Function                                                                                                                                                                                                 |
|------------------------------------------------------------------------------------------|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Get Chromium Browsers Extensions](https://proval.itglue.com/DOC-5078775-11896849)     | Script       | An Automate implementation of the agnostic script [EPM - Data Collection - Agnostic - Script - Get-ChromiumExtensions](https://proval.itglue.com/DOC-5078775-11791153) to fetch the installed extensions for the Chromium-based browsers.                |
| [Get Firefox Browser Extensions](https://proval.itglue.com/DOC-5078775-11896863)       | Script       | An Automate implementation of the agnostic script [EPM - Data Collection - Agnostic - Script - Get-FirefoxExtensions](https://proval.itglue.com/DOC-5078775-11791154) to fetch the installed extensions for the Mozilla Firefox browser.                  |
| [Get Installed Browsers Extensions [DV]](https://proval.itglue.com/DOC-5078775-11896860) | script       | A wrapper script to execute the [Get Chromium Browsers Extensions](https://proval.itglue.com/DOC-5078775-11896849) and [Get Firefox Browser Extensions](https://proval.itglue.com/DOC-5078775-11896863) scripts.                                        |
| [plugin_proval_browsers_extensions](https://proval.itglue.com/DOC-5078775-11896865)    | Custom Table | To store the information gathered by the [Get Chromium Browsers Extensions](https://proval.itglue.com/DOC-5078775-11896849) and [Get Firefox Browser Extensions](https://proval.itglue.com/DOC-5078775-11896863) scripts.                                   |
| [Installed Browsers Extensions [Script]](https://proval.itglue.com/DOC-5078775-11896883) | Dataview     | To display the information on installed browser extensions stored in the [plugin_proval_browsers_extensions](https://proval.itglue.com/DOC-5078775-11896865) table.                                                                                       |

## Implementation

- Import the [Get Installed Browsers Extensions [DV]](https://proval.itglue.com/DOC-5078775-11896860) script.
- Import the [Installed Browsers Extensions [Script]](https://proval.itglue.com/DOC-5078775-11896883) dataview.
- Debug the script against any online Windows machine to create the [plugin_proval_browsers_extensions](https://proval.itglue.com/DOC-5078775-11896865) table.
- Check the [Installed Browsers Extensions [Script]](https://proval.itglue.com/DOC-5078775-11896883) dataview for the data and if it's empty then you can execute the [CWM - Automate - Script - Update User Permissions for ProVal Custom Tables](https://proval.itglue.com/DOC-5078775-8056027) script to grant the table's permissions to all of the Automate users.






