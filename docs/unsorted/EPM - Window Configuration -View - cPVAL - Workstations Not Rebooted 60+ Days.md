---
id: '0f5d99f1-46bb-42f4-8cdd-006f00cbffd9'
title: 'Workstations Not Rebooted in 60 Days'
title_meta: 'Workstations Not Rebooted in 60 Days'
keywords: ['workstations', 'reboot', 'filter', 'policy']
description: 'This document provides a summary of a view that displays workstations that have not been rebooted in the last 60 days. It includes details on dependencies and the specific filters applied to this view, ensuring users can effectively monitor workstation status.'
tags: ['performance', 'report', 'windows']
draft: true
unlisted: false
---

# Summary

This view will show the workstations that have not been rebooted in the last 60 days.

# Dependencies

None

# View Filters

The following filters are applied to this view:

| Filter Name                     | Advanced Filter? | Filter Value                                                  |
|----------------------------------|------------------|--------------------------------------------------------------|
| OS Info                         | Yes              | All Workstations                                             |
| Machine Status                  | Yes              | Machines that have not rebooted in the last 60 days        |
| Operating System                 | Yes              | Not *mac* AND NOT *linux*                                   |
| cPVAL All Policy Removal         | Yes              | NOT *1*                                                    |
