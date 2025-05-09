---
id: 'b7936e96-423d-4c53-bd95-d10a6c4861f1'
slug: /b7936e96-423d-4c53-bd95-d10a6c4861f1
title: 'Execute Script - Microsoft OneDrive Sync Status'
title_meta: 'Execute Script - Microsoft OneDrive Sync Status'
keywords: ['monitor', 'onedrive', 'script', 'execution', 'workstations']
description: 'This document outlines the implementation of an internal monitor designed to execute a script that checks the Microsoft OneDrive sync status on Windows workstations. The monitor targets machines with active user sessions and limits execution to 200 machines per hour for optimal resource management.'
tags: ['performance', 'windows']
draft: false
unlisted: false
---

## Summary

The primary objective of this internal monitor is to perform a daily execution of the [EPM - Data Collection - Script - Microsoft OneDrive Sync Status [DV]](/docs/11c05d45-a0fb-4cfb-b388-cdc59362d9a1) script on Windows workstations. This execution will exclusively target machines that currently have an active user session. Furthermore, it is essential to note that the process will execute the script on a maximum of 200 machines per hour. This approach ensures efficient and controlled utilization of resources during the execution.

## Dependencies

[EPM - Data Collection - Script - Microsoft OneDrive Sync Status [DV]](/docs/11c05d45-a0fb-4cfb-b388-cdc59362d9a1)

## Target

Global

## Alert Template

**Name:** `△ CUSTOM - Execute Script - Microsoft OneDrive Sync Status`