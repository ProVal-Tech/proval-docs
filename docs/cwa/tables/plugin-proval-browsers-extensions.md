---
id: '0a6370b4-7944-4483-86d5-ecbfd58f5376'
slug: /0a6370b4-7944-4483-86d5-ecbfd58f5376
title: 'Plugin_ProVal_Browsers_Extensions'
title_meta: 'Plugin_ProVal_Browsers_Extensions'
keywords: ['browsers', 'extensions', 'chromium', 'firefox', 'data', 'automation']
description: 'This document outlines the custom table for storing information about installed browser extensions gathered by specific scripts. It details the dependencies, table structure, and the data captured for extensions in various browsers, including Chromium and Firefox.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

This Automate custom table stores the information gathered by the [Get Chromium Browsers Extensions](/docs/ff2827dd-bd64-4437-8783-4b576e6cfb81) and [Get Firefox Browser Extensions](/docs/472a8d13-fd00-4a97-90dd-833a171eac40) scripts and is used by the [Installed Browsers Extensions [Script]](/docs/9c095cab-514b-479d-a302-bdb596caefe5) dataview.

## Dependencies

- [Get Chromium Browsers Extensions](/docs/ff2827dd-bd64-4437-8783-4b576e6cfb81)
- [Get Firefox Browser Extensions](/docs/472a8d13-fd00-4a97-90dd-833a171eac40)

## Tables

#### Plugin_ProVal_Browsers_Extensions

| Column                | Type        | Explanation                                                       |
|----------------------|-------------|-------------------------------------------------------------------|
| Computerid           | int(10)    | Computer ID                                                       |
| Browser              | varchar(10) | Name of the Browser (Edge|Chrome|Firefox)                        |
| UserProfilePath      | varchar(128)| User Profile Path of the user to whom the extension belongs      |
| ExtensionName        | varchar(128)| Name of the Extension                                            |
| ExtensionID          | varchar(128)| ID of the Extension                                             |
| ExtensionVersion     | varchar(32) | Version of the Extension                                        |
| ExtensionInstallTime  | datetime    | Installation time of the Extension                               |
| ScriptRunTime        | datetime    | Time when the data was fetched in Automate                      |