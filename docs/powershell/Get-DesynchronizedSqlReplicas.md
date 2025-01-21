---
id: ps-get-desynchronizedsqlreplicas
title: 'Get-DesynchronizedSqlReplicas'
title_meta: 'Get-DesynchronizedSqlReplicas Command'
keywords: ['sql', 'replicas', 'desynchronized', 'database']
description: 'Documentation for the Get-DesynchronizedSqlReplicas command to return a list of all desynchronized SQL replicas.'
tags: ['database', 'performance', 'report']
draft: false
unlisted: false
---

## Description
Return a list of all desynchronized SQL replicas.

## Usage
1. Ensure Microsoft SQL is installed.
2. Check the replication status for any instances that are not synced.
3. Return all found items.

Describe how the payload is executed and if it requires any parameters. Delete the parameter block below if not needed. State that this does not use a payload if it doesn’t.

Explanation of the usage of the below example.

```powershell
.\Get-DesynchronizedSqlReplicas.ps1
```
Returns a list of all SQL replication instances that are not synchronized or synchronizing.

## Output
Location of output for log, result, and error files:
- System Object
- .\Get-DesynchronizedSqlReplicas-log.txt
