---
id: '5b31977a-2e6d-4647-8c4b-5b1055b31ff4'
slug: /5b31977a-2e6d-4647-8c4b-5b1055b31ff4
title: 'Malicious Software Removal Tool Uninstall/Disable'
title_meta: 'Malicious Software Removal Tool Uninstall/Disable'
keywords: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
description: 'This group includes the endpoint where the MSRT needed to be uninstalled and disabled.'
tags: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
draft: false
unlisted: false
---

## Summary
This group includes the endpoint where the MSRT needed to be uninstalled and disabled.

## Dependencies
[MSRT Custom fields](/docs/c6a36d73-01c8-4ef9-ace2-e9d6a4bc2363)

[Task - Malicious Software Removal Tool Disable/Uninstall](/docs/89e1f1cd-9b80-4874-96c6-f1e8b067298e)

## Group Details

![Summary](<../../../static/img/docs/Malicious Software Removal Tool Uninstall-Disable/image.png>)

**Group Type:** Dynamic  
**Group Name:** Malicious Software Removal Tool Uninstall/Disable  
**Description:** This group includes the endpoint where the MSRT needed to be uninstalled and disabled.  

### Criteria

Group Joins

![Group Joins](<../../../static/img/docs/Malicious Software Removal Tool Uninstall-Disable/image-1.png>)

- `MSRT Disable Uninstall` should be `Equal` to `True`
- `Exclude MSRT Disable Uninstall` should be `Equal` to `False`
- `MSRT Scanner Result` should `Does Not Contain any of` to `MSRT Disabled`
- `Available` should be `Equal` to `True`.
- `OS` should `Contains any of` to `Microsoft Windows 10, Microsoft Windows 11`

## Group Creation

Once you have added the above criteria, click the Save button to save the group. 

Click Save

![Click Save](<../../../static/img/docs/Malicious Software Removal Tool Uninstall-Disable/image-2.png>)

Group Created

![Group Created](<../../../static/img/docs/Malicious Software Removal Tool Uninstall-Disable/{A9C86F38-129F-4A35-93A7-3F187EF8AE7E}.png>)

