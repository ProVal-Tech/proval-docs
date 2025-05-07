---
id: 'f83e6218-da9e-451c-b8ec-fd57d32690f6'
slug: /f83e6218-da9e-451c-b8ec-fd57d32690f6
title: 'VSA Drive Monitoring'
title_meta: 'VSA Drive Monitoring'
keywords: ['drive', 'monitoring', 'solution', 'vsa', 'disk']
description: 'This document outlines a comprehensive drive monitoring solution for Kaseya VSA, detailing associated procedures, custom fields, monitor sets, views, and policies necessary for effective implementation and management of disk monitoring on endpoints.'
tags: ['disk']
draft: false
unlisted: false
---

## Purpose

A Complete Drive Monitoring Solution for the VSA

## Associated Content

| Content                                                                                | Type                  | Function                                                                   |
| -------------------------------------------------------------------------------------- | --------------------- | -------------------------------------------------------------------------- |
| [Soji - Disk Cleaner](https://github.com/ProVal-Tech/Soji)                             | Agent Procedure       | Performs a disk cleanup on the endpoint. Configurable.                     |
| [Drive List Collection](/docs/2b8f8910-5e27-4f1e-8921-65bbe93fb09f)                    | Agent Procedure       | Collects all actual physical drive letters for application via view/policy |
| [xPVAL Drive List](/docs/3b56f103-7e5b-4f5b-a44d-92e5d6872c9a)                         | Machine Custom Field  | Stores distinct physical drive letters on the endpoint                     |
| [VSA HDD Monitoring Solution Monitor Sets](/docs/ea55f0eb-9011-436a-bbd9-1795fc206f81) | Multiple Monitor Sets | Monitors the specified drive letter for low capacity                       |
| [VSA HDD Monitoring Solution Views](/docs/958933a9-35b8-4c70-b5fa-8c858f481b39)        | Multiple Views        | Shows all endpoints with the specified Drive Letter                        |
| [VSA HDD Monitoring Solution Policies](/docs/b39fe35b-74b3-442d-a977-daef64294297)     | Multiple Policies     | Assigns monitoring to all endpoints with the specified drive letter.       |

## Implementation

1. Create the Machine Custom Field.
2. Import both Procedures.
3. Import all Views and ensure the advanced filter is properly set on each.
4. Import all Monitor Sets.
5. Import all Policies.
