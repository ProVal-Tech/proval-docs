---
id: 'b084a7f4-6dfa-4ca0-8170-4ab3af73efbd'
title: 'KB Impact Summary'
title_meta: 'KB Impact Summary'
keywords: ['kb', 'patch', 'os', 'approval', 'policy', 'severity', 'category']
description: 'This document provides a detailed dataview of each KB, including its title, the operating system versions it impacts, and various statuses such as when it was added to the patch manager, approval settings, and the number of patch policies affected.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview shows each KB along with the title of the KB and the OS version that it impacts. It also indicates when it was added to the patch manager, when it was set to approved, ignored, or denied, who set it, what the approval status was, and how many patch policies it impacts.

## Dependencies

None

## Columns

| Column          | Description                                               |
|-----------------|-----------------------------------------------------------|
| KBID            | KB number of the patch                                    |
| Title           | The name of the patch                                     |
| OS              | OS version of the patch to which it applies              |
| Category        | The category as reflected in the patch manager            |
| Severity        | The severity as reflected in the patch manager            |
| DateAdded       | Date when it was added to the patch manager               |
| SetTime         | When the patch was set to a status                        |
| SetBy           | The user or 'Auto' that set the patch                    |
| ApprovalSetting | Approved, Denied, Ignored, or Not Set                     |
| Impact          | Number of policies where this patch is being applied      |
