---
id: 'f1ac2b23-59a0-4dcd-86a2-61901dd551b6'
slug: /f1ac2b23-59a0-4dcd-86a2-61901dd551b6
title: 'Patching - Windows 10 Build Upgrades'
title_meta: 'Patching - Windows 10 Build Upgrades'
keywords: ['monitor', 'upgrade', 'windows', 'build', 'machines']
description: 'This document outlines a monitoring solution designed to identify machines running below the latest Windows build and trigger an upgrade script. It is recommended to schedule this monitor daily during off-hours to minimize user productivity loss.'
tags: ['performance', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor will look for machines that are running below the latest build of Windows and trigger the script to upgrade the machine. We recommend scheduling this monitor daily during off-hours to avoid any loss of user productivity.

## Dependencies

- Windows 10 Upgrade Assistant

## Target

Global - Should be run without explicitly defined targets.

## Translated SQL

```sql
SELECT 
    computers.version AS 'testvalue',
    computers.name AS 'identityfield',
    computers.computerid,
    acd.uptimestart,
    acd.uptimeend,
    acd.noalerts
FROM 
    computers
LEFT JOIN 
    agentcomputerdata acd ON acd.computerid = computers.computerid
WHERE 
    computers.lastcontact > NOW() - INTERVAL 15 MINUTE 
    AND computers.os LIKE '%windows 10%' 
    AND computers.version < '10.0.19044' 
    AND computers.computerid IN (SELECT computerid FROM computerpatchpolicies WHERE installpolicy IN (SELECT ID FROM installsoftwarepolicies WHERE updatemode IN (5, 6)))
LIMIT 10
```
