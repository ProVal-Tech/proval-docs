---
id: '4f479c3c-88e1-434c-a66b-5683fe8fbc5f'
title: 'Get Desynchronized SQL Replicas'
title_meta: 'Get Desynchronized SQL Replicas'
keywords: ['sql', 'replication', 'desynchronized', 'database', 'status']
description: 'This document provides a guide on how to return a list of all desynchronized SQL replicas. It includes requirements, process steps, usage, and output details for executing the script on an SQL server.'
tags: ['database', 'report', 'sql', 'windows']
draft: true
unlisted: false
---

## Overview

Return a list of all desynchronized SQL replicas.

## Requirements

This script should be run on an SQL server.

## Process

1. Ensure Microsoft SQL is installed.
2. Check the replication status for any unsynced replicas.
3. Return all found unsynced items.

## Payload Usage

Describe how the payload is executed and if it requires any parameters. If no parameters are needed, delete the parameter block below. State that this does not use a payload if it doesn’t.

Example:
```
Get-DesynchronizedSqlReplicas.ps1
```
This command returns a list of all SQL replication instances that are not synchronized or are synchronizing.

## Output

```
    System Object
    ./Get-DesynchronizedSqlReplicas-log.txt
```

## Locations

| Payload                            | /repo/scripts/Get-DesynchronizedSqlReplicas.ps1 |
|------------------------------------|-------------------------------------------------|
| Automate                           |                                                 |
| ConnectWise RMM                   |                                                 |
| Kaseya                            |                                                 |
| Datto RMM                         |                                                 |
