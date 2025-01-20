---
id: '0a6370b4-7944-4483-86d5-ecbfd58f5376'
title: 'Installed Browsers Extensions'
title_meta: 'Installed Browsers Extensions'
keywords: ['browsers', 'extensions', 'chromium', 'firefox', 'data', 'automation']
description: 'This document outlines the custom table for storing information about installed browser extensions gathered by specific scripts. It details the dependencies, table structure, and the data captured for extensions in various browsers, including Chromium and Firefox.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---
## Purpose

This Automate custom table stores the information gathered by the [Get Chromium Browsers Extensions](<../scripts/Get Chromium Browsers Extensions.md>) and [Get Chromium Browsers Extensions](<../scripts/Get Chromium Browsers Extensions.md>) scripts and is used by the [Installed Browsers Extensions [Script]](<../dataviews/Installed Browsers Extensions Script.md>) dataview.

## Dependencies

- [Get Chromium Browsers Extensions](<../scripts/Get Chromium Browsers Extensions.md>)
- [Get Firefox Browser Extensions](<../scripts/Get Firefox Browser Extensions.md>)

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












