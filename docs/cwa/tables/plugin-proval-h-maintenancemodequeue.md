---
id: 'cbcc97bf-87ec-41a3-b1ed-d39646194186'
slug: /cbcc97bf-87ec-41a3-b1ed-d39646194186
title: 'plugin_proval_h_maintenancemodequeue'
title_meta: 'plugin_proval_h_maintenancemodequeue'
keywords: ['history', 'maintenance', 'queue', 'audit', 'computer']
description: 'This document provides information on how to store historical data about queued maintenance modes, including the structure of the relevant database table and its dependencies.'
tags: ['database', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

This document stores historical information about queued maintenance modes. This data is populated by a trigger called `plugin_proval_t_maintenancemodequeue`.

## Dependencies

- `plugin_proval_t_maintenancemodequeue` (Trigger - See SQL Below)

## Table

### plugin_proval_h_maintenancemodequeue

| Column      | Type    | Explanation                                                             |
|-------------|---------|-------------------------------------------------------------------------|
| QueueID     | INT     | The ID of the audited queue.                                            |
| ComputerID  | INT     | The ID of the computer where the audited queue was targeted.           |
| TimeStart   | DATETIME| The server time when the maintenance mode begins.                      |
| Duration    | INT     | The number of minutes that the maintenance mode will last.             |
| Mode        | INT     | The type of maintenance mode (1 = Alerts, 2 = Scripts, 3 = Alerts & Scripts) |


