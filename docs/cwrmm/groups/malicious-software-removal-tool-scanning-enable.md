---
id: 'b497ecf7-c8e2-4b6a-b779-94adfd831c98'
slug: /b497ecf7-c8e2-4b6a-b779-94adfd831c98
title: 'Malicious Software Removal Tool Scanning Enable'
title_meta: 'Malicious Software Removal Tool Scanning Enable'
keywords: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
description: 'This group includes the endpoint where the MSRT scanning required to be enable.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Summary
This group includes the endpoint where the MSRT scanning required to be enable.

## Dependencies
[MSRT Custom fields](/docs/c6a36d73-01c8-4ef9-ace2-e9d6a4bc2363)

[Task - Malicious Software Removal Tool Scanning](/docs/ef14e376-ec97-4f0d-8563-1430fb47e97e)

## Group Details

![Summary](<../../../static/img/docs/b497ecf7-c8e2-4b6a-b779-94adfd831c98/image_1.webp>)

**Group Type:** Dynamic  
**Group Name:** Malicious Software Removal Tool Scanning Enable  
**Description:** This group includes the endpoint where the MSRT scanning required to be enable.  

### Criteria

Group Joins

![Group Joins](<../../../static/img/docs/b497ecf7-c8e2-4b6a-b779-94adfd831c98/image-1_1.webp>)

- `Exclude MSRT Scanning` should be `Equal` to `False`
- `MSRT Scanner Enable` should be `Equal` to `True`
- `MSRT Scanner Result` should be `Does Not Contain any of` to `No Infection Found`
- `Available` should be `Equal` to `True`.
- `OS` should be `Contains any of` to `Microsoft Windows 10, Microsoft Windows 11`

## Group Creation

Once you have added the above criteria, click the Save button to save the group. 

Click Save

![Click Save](<../../../static/img/docs/b497ecf7-c8e2-4b6a-b779-94adfd831c98/image-2_1.webp>)

Group Created

![Group Created](<../../../static/img/docs/b497ecf7-c8e2-4b6a-b779-94adfd831c98/image-3_1.webp>)