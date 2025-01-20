---
id: 'db1adf1f-7ff0-4b43-af21-6dc3d64bd3a9'
title: 'Super Admin Audit Information'
title_meta: 'Super Admin Audit Information for Monitoring Changes'
keywords: ['superadmin', 'audit', 'monitoring', 'information', 'comparison']
description: 'This document outlines the purpose and structure of the super admin audit information used to monitor changes in super admin status. It details the dependencies and the database table structure for tracking super admin additions.'
tags: ['database', 'security']
draft: false
unlisted: false
---
## Purpose

Stores information about the existing super admins. This is used as a challenge comparison to determine if a new super admin was added by the script [Automate - New Super Admin Monitoring](<../scripts/Automate - New Super Admin Monitoring.md>).

## Dependencies

[Automate - New Super Admin Monitoring](<../scripts/Automate - New Super Admin Monitoring.md>)

## Table

#### plugin_proval_superadminaudit

| Column    | Type     | Explanation                                   |
|-----------|----------|-----------------------------------------------|
| UserID   | INT      | The UserID of the super admin.               |
| Timestamp | DATETIME | The date and time that the super admin was added. |












