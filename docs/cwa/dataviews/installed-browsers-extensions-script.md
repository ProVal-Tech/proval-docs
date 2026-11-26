---
id: '9c095cab-514b-479d-a302-bdb596caefe5'
slug: /9c095cab-514b-479d-a302-bdb596caefe5
title: 'Installed Browsers Extensions Script'
title_meta: 'Installed Browsers Extensions Script'
keywords: ['browsers', 'extensions', 'browser-extensions', 'chrome', 'edge', 'brave', 'firefox', 'audit']
description: 'Displays the extensions installed on Google Chrome, Microsoft Edge, Brave, and Mozilla Firefox for each user profile, as collected by the Get Installed Browsers Extensions [DV] script.'
tags: ['auditing', 'browsers', 'extensions', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-20
---

## Summary

This dataview displays the extensions installed on the Google Chrome, Microsoft Edge, Brave, and Mozilla Firefox browsers for each user profile on a computer. The data is stored in the [Plugin_ProVal_Browsers_Extensions](/docs/0a6370b4-7944-4483-86d5-ecbfd58f5376) custom table by the [Get Installed Browsers Extensions [DV]](/docs/f0a2db8c-92b6-4584-a70c-209263d46511) script. Use it to review which extensions are installed, which users they belong to, and the version and install time of each extension.

## Dependencies

- [Script: Get Installed Browsers Extensions [DV]](/docs/f0a2db8c-92b6-4584-a70c-209263d46511)
- [Script: Get Chromium Browsers Extensions](/docs/ff2827dd-bd64-4437-8783-4b576e6cfb81)
- [Script: Get Firefox Browser Extensions](/docs/472a8d13-fd00-4a97-90dd-833a171eac40)
- [Custom Table: Plugin_ProVal_Browsers_Extensions](/docs/0a6370b4-7944-4483-86d5-ecbfd58f5376)
- [Solution: Installed Browsers Extensions](/docs/a76e5cc5-9cc8-4c66-a877-1ab42fed37a3)

## Columns

| Column | Description |
| ------ | ----------- |
| Client Name | The name of the client the computer belongs to. |
| Location Name | The name of the location the computer belongs to. |
| Computer Name | The name of the computer where the extension is installed. |
| Browser | The browser the extension is installed on, for example `Chrome`, `Edge`, `Brave`, or `Firefox`. |
| User Profile Path | The path of the user profile the extension belongs to, for example `C:\Users\localadmin`. |
| Extension | The name of the extension. |
| Extension ID | The unique identifier of the extension. |
| Extension Version | The installed version of the extension. |
| Extension Install Time | The date and time when the extension was installed. |
| Script Run Time | The date and time when the script last collected the data. |

## Changelog

### 2026-11-20

- Document update only.

### 2025-04-10

- Initial version of the document
