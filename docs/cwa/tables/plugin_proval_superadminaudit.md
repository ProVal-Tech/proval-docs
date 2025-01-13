---
id: 'cwa-super-admin-audit'
title: 'Super Admin Audit Information'
title_meta: 'Super Admin Audit Information for Monitoring Changes'
keywords: ['superadmin', 'audit', 'monitoring', 'information', 'comparison']
description: 'This document outlines the purpose and structure of the super admin audit information used to monitor changes in super admin status. It details the dependencies and the database table structure for tracking super admin additions.'
tags: ['database', 'configuration', 'security', 'monitoring']
draft: false
unlisted: false
---
## Purpose

Stores information about the existing super admins. This is used as a challenge comparison to determine if a new super admin was added by the script [Automate - New Super Admin Monitoring](https://proval.itglue.com/DOC-5078775-7882704).

## Dependencies

[Automate - New Super Admin Monitoring](https://proval.itglue.com/DOC-5078775-7882704)

## Table

#### plugin_proval_superadminaudit

| Column    | Type     | Explanation                                   |
|-----------|----------|-----------------------------------------------|
| UserID   | INT      | The UserID of the super admin.               |
| Timestamp | DATETIME | The date and time that the super admin was added. |



