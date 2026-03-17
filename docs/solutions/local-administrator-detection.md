---
id: '7e3f8472-2908-4491-b495-b87bd7ad0fe6'
slug: /7e3f8472-2908-4491-b495-b87bd7ad0fe6
title: 'Local Administrator Detection'
title_meta: 'Local Administrator Detection'
keywords: ['local','administators','localgroup','admins','windows']
description: 'The purpose of this solution is to list all the local administrators on windows machines on CW RMM platform.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-02-03
---

## Purpose

The purpose of this solution is to list all the local administrators on windows machines on the CW RMM platform.

## Associated Content

| Content             | Type          | Function          |
|----------------------------------|-------------------------------|--------------------------------------------------------|
|  [Get Local Administrators](/docs/11f555cc-79ab-464f-87af-b46c324990ee)    | Task | This Script lists the local administrators on windows machine and stores the result in a custom field. |
|  [Local Admins List](/docs/03f2a420-5c70-4078-8b71-dc0fd7f6895d)    | Custom Field | This custom field contains the List of Local Group Admins on the machine fetched by script [Get Local Administrators](/docs/11f555cc-79ab-464f-87af-b46c324990ee)   |
|  [Enable Local Admins Detection  ](/docs/219923f8-62e6-401a-9693-678b44325708)    | Custom Field | Select this custom field at organization level to list all Local Administrator on Windows machines. |
|  [Exclude Local Admin Detection ](/docs/e988aefc-1f5d-4d10-a66b-cf22e084ae72)    | Custom Field | Select this Custom Field to exclude the Site from Local Admin Detection Solution. |
|  [Exclude Local Admin Detection ](/docs/18aa25e5-61cd-429d-ab09-44b7cf6eb10e)    | Custom Field |Select this Custom Field to exclude an endpoint from Local Admin Detection Solution. |
|  [Machines Opted for Local Admin Detection ](/docs/e1cb7e20-f09c-4350-a496-db920efa6530)    | Group |This Group includes Windows machines which are opted for Local Administrator Detection Solution. |

## Implementation

- Create  below custom fields:
    - [Local Admins List](/docs/03f2a420-5c70-4078-8b71-dc0fd7f6895d)
    - [Enable Local Admins Detection  ](/docs/219923f8-62e6-401a-9693-678b44325708) 
    - [Exclude Local Admin Detection ](/docs/e988aefc-1f5d-4d10-a66b-cf22e084ae72)  
    - [Exclude Local Admin Detection ](/docs/18aa25e5-61cd-429d-ab09-44b7cf6eb10e) 
- Create  [Group - Machines Opted for Local Admin Detection ](/docs/e1cb7e20-f09c-4350-a496-db920efa6530) 
- Create  [Task - Get Local Administrators](/docs/11f555cc-79ab-464f-87af-b46c324990ee) and schedule the task as per instructions in the document.

## Changelog

### 2026-02-03

- Initial version of the document
