---
id: ps-get-desynchronizedsqlreplicas
title: 'Get-DesynchronizedSqlReplicas'
title_meta: 'Get-DesynchronizedSqlReplicas Command'
keywords: ['sql', 'replicas', 'desynchronized', 'database']
description: 'Documentation for the Get-DesynchronizedSqlReplicas command to return a list of all desynchronized SQL replicas.'
tags: ['report', 'database', 'performance']
draft: false
unlisted: false
---
## Description
Return a list of all desynchronized Sql replicas

## Usage
1. Ensures Microsoft Sql is installed
2. Checks the replication status for any not synced
3. Returns all found items


Describe how the payload is executed and if it requires any parameters. Delete the parameter block below if not needed. State that this does not use a payload if it doesn’t.

Explanation of the usage of the below example.

```powershell
.\Get-DesynchronizedSqlReplicas.ps1
```
Returns a list of all Sql replication instances that are not syncronized or synchronizing

## Output
Location of output for log, result, and error files.
    System Object
    .\Get-DesynchronizedSqlReplicas-log.txt
