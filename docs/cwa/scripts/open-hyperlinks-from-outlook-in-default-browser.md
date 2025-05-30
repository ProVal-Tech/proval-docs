---
id: '3cc9953c-254c-4d50-9520-cbdb7e6ef23c'
slug: /3cc9953c-254c-4d50-9520-cbdb7e6ef23c
title: 'Open Hyperlinks From Outlook in Default Browser'
title_meta: 'Open Hyperlinks From Outlook in Default Browser'
keywords: ['outlook', 'hyperlink', 'browser', 'registry', 'windows']
description: 'This document describes a script that updates the Outlook options on a computer to open hyperlinks in the Default Browser. It modifies specific Windows registry values related to Outlook settings to ensure that hyperlinks within Outlook open using the Default Browser instead of Microsoft Edge.'
tags: ['security', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of the script is to update the Outlook options on the computer to open hyperlinks in the **Default Browser**.

To achieve this, the script likely modifies specific values in the Windows registry related to Outlook settings, particularly those pertaining to hyperlink behavior. By setting the appropriate registry keys, the script ensures that when users click on hyperlinks within Outlook, the links will open using the **Default Browser** instead of **Microsoft Edge**.

![Image](../../../static/img/docs/3cc9953c-254c-4d50-9520-cbdb7e6ef23c/image_1.webp)

## Sample Run

![Image](../../../static/img/docs/3cc9953c-254c-4d50-9520-cbdb7e6ef23c/image_2.webp)

## Variables

| Name              | Description                                                                                      |
|-------------------|--------------------------------------------------------------------------------------------------|
| ProjectName       | Set-OutLookHyperLinkBehaviour                                                                    |
| WorkingDirectory   | C:/ProgramData/_automation/script/Set-OutLookHyperLinkBehaviour                                 |
| PS1Log            | C:/ProgramData/_automation/script/Set-OutLookHyperLinkBehaviour/Set-OutLookHyperLinkBehaviour-log.txt |

## Output

- Script Logs