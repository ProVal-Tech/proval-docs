---
id: 'ef644f47-8268-43fd-9e8a-ab32f64ec617'
title: 'Dataview - Save as CSV Custom Location'
title_meta: 'Dataview - Save as CSV Custom Location'
keywords: ['dataview', 'csv', 'copy', 'script', 'connectwise']
description: 'This document describes a script that creates a distinct copy of the Dataview CSV file each time it runs, saving it to a user-defined folder instead of overwriting the existing file. It does not send any emails and includes additional user parameters for customization.'
tags: ['backup', 'setup', 'software']
draft: false
unlisted: false
---

## Summary

This script is a copy of [CWM - Automate - Script - Dataview - Email as CSV [Param]](./Dataview - Email as CSV Param.md) script. Instead of overwriting the existing Dataview CSV file, it saves a distinct copy each time it runs in a custom folder location defined by the user. Additionally, it does not send an email to anyone.

## Sample Run

![Sample Run](../../../static/img/Dataview---Save-as-CSV-Custom-Location/image_1.png)

#### Additional User Parameter

| Parameter        | Example                               | Required | Description                                                                                   |
|------------------|---------------------------------------|----------|-----------------------------------------------------------------------------------------------|
| Folder Location   | C:/ProgramData/_automation/script     | True     | Provide the folder location where you would like to preserve the Dataview file on the machine |

All other parameters are the same as those in [CWM - Automate - Script - Dataview - Email as CSV [Param]](./Dataview - Email as CSV Param.md).



