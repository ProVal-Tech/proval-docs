---
id: '5728c22a-c1bb-4494-b300-c1a8c12e7165'
title: 'Get OneDrive Sync Status Script Execution'
title_meta: 'Get OneDrive Sync Status Script Execution'
keywords: ['onedrive', 'sync', 'status', 'windows', 'workstations']
description: 'This document outlines the execution of the Get OneDrive Sync Status script on Windows workstations with the OneDrive process, scheduled to run weekly. It details the dependencies and target for the script execution, ensuring proper monitoring of OneDrive sync status across the organization.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

Executes the [Get OneDrive Sync Status [DV]](<../scripts/Get OneDrive Sync Status DV.md>) script once weekly against the Windows workstations with the OneDrive process.

## Dependencies

[EPM - Data Collection - Script - Get OneDrive Sync Status [DV]](<../scripts/Get OneDrive Sync Status DV.md>)

## Target

Global

## Alert Template

**Name:** `△ Custom - Execute Script - Get OneDrive Sync Status [DV]`

