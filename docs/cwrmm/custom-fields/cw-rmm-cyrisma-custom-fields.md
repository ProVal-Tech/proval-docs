---
id: '2d448750-129b-4cff-aaf1-e73d2a296418'
slug: /2d448750-129b-4cff-aaf1-e73d2a296418
title: 'CW RMM - Cyrisma Custom Fields'
title_meta: 'CW RMM - Cyrisma Custom Fields'
keywords: ['cyrisma', 'deployment', 'audit', 'custom', 'fields']
description: 'This document outlines the custom fields used in the Cyrisma deployment and audit process, detailing their types and descriptions for better understanding and implementation.'
tags: []
draft: false
unlisted: false
---

## Summary

The custom fields listed below are used in the Cyrisma deployment and audit.

## Dependencies

[CW RMM - Task - CRI Agent Deployment](/docs/344a3ab5-d05c-41a5-9303-45fc387ec2e8)

## Details

| Field Name          | Type of Field (Machine or Organization) | Description                                                                 |
|---------------------|-----------------------------------------|-----------------------------------------------------------------------------|
| Cyrisma_Status      | Endpoint                                | It stores the [CW RMM - CRI Agent Deployment](/docs/344a3ab5-d05c-41a5-9303-45fc387ec2e8) task execution status. |
| CyrismaAgent_Key    | Site                                    | This stores the site key for the Cyrisma Deployment.                       |
| CyrismaAgent_URL    | Site                                    | This stores the unique site URL for the Cyrisma Deployment.                |