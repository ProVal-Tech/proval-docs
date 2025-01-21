---
id: '2d448750-129b-4cff-aaf1-e73d2a296418'
title: 'Cyrisma Custom Fields for Deployment and Audit'
title_meta: 'Cyrisma Custom Fields for Deployment and Audit'
keywords: ['cyrisma', 'deployment', 'audit', 'custom', 'fields']
description: 'This document outlines the custom fields used in the Cyrisma deployment and audit process, detailing their types and descriptions for better understanding and implementation.'
tags: []
draft: false
unlisted: false
---

## Summary

The custom fields listed below are used in the Cyrisma deployment and audit.

## Dependencies

[CW RMM - Task - CRI Agent Deployment](<../tasks/CRI Agent Deployment.md>)

## Details

| Field Name          | Type of Field (Machine or Organization) | Description                                                                 |
|---------------------|-----------------------------------------|-----------------------------------------------------------------------------|
| Cyrisma_Status      | Endpoint                                | It stores the [CW RMM - CRI Agent Deployment](<../tasks/CRI Agent Deployment.md>) task execution status. |
| CyrismaAgent_Key    | Site                                    | This stores the site key for the Cyrisma Deployment.                       |
| CyrismaAgent_URL    | Site                                    | This stores the unique site URL for the Cyrisma Deployment.                |

