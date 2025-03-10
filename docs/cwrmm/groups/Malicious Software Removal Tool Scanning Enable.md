---
id: 'b497ecf7-c8e2-4b6a-b779-94adfd831c98'
title: 'Malicious Software Removal Tool Scanning Enable'
title_meta: 'Malicious Software Removal Tool Scanning Enable'
keywords: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
description: 'This group includes the endpoint where the MSRT scanning required to be enable.'
tags: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
draft: false
unlisted: false
---

## Summary
This group includes the endpoint where the MSRT scanning required to be enable.

## Dependencies
[MSRT Custom fields](<../custom-fields/MSRT Custom Fields.md>)

[Malicious Software Removal Tool Scanning](<../tasks/Malicious Software Removal Tool Scanning.md>)

## Group Details

![Summary](<../../../static/img/docs/Malicious Software Removal Tool Scanning Enable/image.png>)

**Group Type:** Dynamic  
**Group Name:** Malicious Software Removal Tool Scanning Enable  
**Description:** This group includes the endpoint where the MSRT scanning required to be enable.  

### Criteria

Group Joins

![Group Joins](<../../../static/img/docs/Malicious Software Removal Tool Scanning Enable/image-1.png>)

- `Exclude MSRT Scanning` should be `Equal` to `False`
- `MSRT Scanner Enable` should be `Equal` to `True`
- `MSRT Scanner Result` should be `Does Not Contain any of` to `No Infection Found`
- `Available` should be `Equal` to `True`.
- `OS` should be `Contains any of` to `Microsoft Windows 10, Microsoft Windows 11`

## Group Creation

Once you have added the above criteria, click the Save button to save the group. 

Click Save

![Click Save](<../../../static/img/docs/Malicious Software Removal Tool Scanning Enable/image-2.png>)

Group Created

![Group Created](<../../../static/img/docs/Malicious Software Removal Tool Scanning Enable/image-3.png>)


