---
id: 'e05c7729-ebb0-4818-a3a9-b8f736c46c23'
slug: /e05c7729-ebb0-4818-a3a9-b8f736c46c23
title: 'Windows License Status'
title_meta: 'Windows License Status'
keywords: ['licensing', 'windows']
description: 'This solution contains the Windows License status audit and monitoring in Ninja.'
tags: ['licensing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-08
---

## Purpose

This solution contains the Windows License status audit and monitoring in Ninja.

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [Windows License Status](/docs/5310f4e6-bafe-4107-8f6f-76af541ec3dd)     | Script | This script checks and returns the Windows License Status via CIMInstance. |
| [cPVAL Windows License Status](/docs/db277f08-1c02-4b93-983d-32ab64aadb5c) | Group | This group contains the agents where the Windows License Status script detected the license state. | 
| [cPVAL Windows License Check](/docs/6d9eacd6-a4e1-474c-bdee-02b753001ac3) | Custom Field | This stores the Windows License Status of the Windows machine. | 
| [Windows License Issue Detected - Workstations](/docs/c26e9e39-1e15-44fa-acfe-0deae7c10cdb) | Compound Condition | This compound condition detects the Windows workstations agent where the license status is `Unlicensed` or `NonGenuineGrace`. |
| [Windows License Issue Detected - Server](/docs/898da82d-b3db-4402-b15d-d62a72dab942) | Compound Condition | This compound condition detects the Windows server agent where the license status is `Unlicensed` or `NonGenuineGrace`. |

## Implementation

- Create the [Custom field - cpval Windows License Check](/docs/6d9eacd6-a4e1-474c-bdee-02b753001ac3)
- Create the [Script - Windows License Status](/docs/5310f4e6-bafe-4107-8f6f-76af541ec3dd)
- Create the [Group - cPVAL Windows License Status](/docs/db277f08-1c02-4b93-983d-32ab64aadb5c)
- Create the [Compound Condition - Windows License Issue Detected](/docs/c26e9e39-1e15-44fa-acfe-0deae7c10cdb)
- Create the [Compound Condition - Windows License Issue Detected](/docs/898da82d-b3db-4402-b15d-d62a72dab942)


## Changelog

### 2026-05-08

- Initial version of the document