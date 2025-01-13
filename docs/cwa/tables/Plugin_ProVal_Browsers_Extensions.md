---
id: 'cwa-installed-browsers-extensions'
title: 'Installed Browsers Extensions'
title_meta: 'Installed Browsers Extensions'
keywords: ['browsers', 'extensions', 'chromium', 'firefox', 'data', 'automation']
description: 'This document outlines the custom table for storing information about installed browser extensions gathered by specific scripts. It details the dependencies, table structure, and the data captured for extensions in various browsers, including Chromium and Firefox.'
tags: ['configuration', 'software', 'windows', 'setup', 'notification']
draft: false
unlisted: false
---
## Purpose

This Automate custom table stores the information gathered by the [Get Chromium Browsers Extensions](https://proval.itglue.com/DOC-5078775-11896849) and [Get Chromium Browsers Extensions](https://proval.itglue.com/DOC-5078775-11896849) scripts and is used by the [Installed Browsers Extensions [Script]](https://proval.itglue.com/DOC-5078775-11896883) dataview.

## Dependencies

- [Get Chromium Browsers Extensions](https://proval.itglue.com/DOC-5078775-11896849)
- [Get Firefox Browser Extensions](https://proval.itglue.com/DOC-5078775-11896863)

## Tables

#### Plugin_ProVal_Browsers_Extensions

| Column                | Type        | Explanation                                                       |
|----------------------|-------------|-------------------------------------------------------------------|
| Computerid           | int(10)    | Computerid                                                       |
| Browser              | varchar(10) | Name of the Browser (Edge|Chrome|Edge|Firefox)                  |
| UserProfilePath      | varchar(128)| User Profile Path of the user to whom the extension belongs      |
| ExtensionName        | varchar(128)| Name of the Extension                                            |
| ExtensionID          | varchar(128)| ID of the Extension                                             |
| ExtensionVersion     | varchar(32) | Version of the Extension                                        |
| ExtensionInstallTime  | datetime    | Installation time of the Extension                               |
| ScriptRunTime        | datetime    | Time when the data was fetched in Automate                      |


