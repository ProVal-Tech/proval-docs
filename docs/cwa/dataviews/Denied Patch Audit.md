---
id: 'cwa-denied-patches-list'
title: 'Denied Patches List'
title_meta: 'Denied Patches List'
keywords: ['patches', 'denied', 'approval', 'hotfix', 'kb', 'devices']
description: 'This document provides a detailed overview of the denied patches within the environment, including relevant approval policies, hotfix IDs, and affected devices.'
tags: ['approval', 'patches', 'hotfix', 'devices', 'thirdparty', 'category']
draft: false
unlisted: false
---
## Summary

This dataview displays the list of denied patches in the environment.

## Columns

| Column            | Description                                                        |
|-------------------|--------------------------------------------------------------------|
| ApprovaPolicyID   | The ID of the approval policies where patch is denied              |
| ApprovalPolicies   | Name of the approval policies where patch is denied                |
| HotfixID          | HotfixID of the patch                                             |
| KBID              | KBID of the patch                                                |
| Title             | Title of the patch                                               |
| Manufacturer      | Manufacturer of the patch                                        |
| Category          | Category of the patch                                            |
| DateAdded         | Date the patch was discovered in the automate                    |
| IsThirdParty      | 1 if it's a third-party patch                                    |
| Affected Devices   | Number of devices on which this patch is denied                  |
| SetBy             | Describes who set the patch to denied state                      |
| Set Time          | Time of the patch denial                                         |



