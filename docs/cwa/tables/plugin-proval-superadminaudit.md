---
id: 'db1adf1f-7ff0-4b43-af21-6dc3d64bd3a9'
slug: /db1adf1f-7ff0-4b43-af21-6dc3d64bd3a9
title: 'plugin_proval_superadminaudit'
title_meta: 'plugin_proval_superadminaudit'
keywords: ['superadmin', 'audit', 'monitoring', 'information', 'comparison']
description: 'This document outlines the purpose and structure of the super admin audit information used to monitor changes in super admin status. It details the dependencies and the database table structure for tracking super admin additions.'
tags: ['database', 'security']
draft: false
unlisted: false
---

## Purpose

This document stores information about the existing super admins. It is used as a challenge comparison to determine if a new super admin was added by the script [Automate - New Super Admin Monitoring](/docs/acc57018-b868-4129-b4a5-0f1052dcc1ae).

## Dependencies

This document relies on the script [Automate - New Super Admin Monitoring](/docs/acc57018-b868-4129-b4a5-0f1052dcc1ae).

## Table

#### plugin_proval_superadminaudit

| Column    | Type     | Explanation                                   |
|-----------|----------|-----------------------------------------------|
| UserID   | INT      | The UserID of the super admin.               |
| Timestamp | DATETIME | The date and time that the super admin was added. |
