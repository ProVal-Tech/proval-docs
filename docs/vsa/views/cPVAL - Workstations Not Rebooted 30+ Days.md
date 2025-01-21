---
id: 'e241665b-e0d2-4af4-af8b-d13f754c9cc1'
title: 'Workstation Reboot Report'
title_meta: 'Workstation Reboot Report'
keywords: ['workstation', 'reboot', 'report', 'view', 'filter']
description: 'This document provides a detailed overview of a view that displays workstations that have not rebooted in the last 30+ days. It includes information on dependencies, applied filters, and an export attachment for further analysis.'
tags: ['database', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

# Summary

This view shows the data of workstations that have not rebooted in the last 30+ days.

# Dependencies

None

# View Filters

Below are the filters applied to this view:

| Filter Name         | Advanced Filter? | Filter Value                                        |
|---------------------|------------------|-----------------------------------------------------|
| OS Type             | No               | All Workstations                                    |
| Operating System     | No               | NOT *MAC* AND NOT *LINUX*                          |
| Machine Status      | No               | Show machines that have not rebooted in the last 30 days |

### Export Attachment

Please attach the content XML VSA Export to this document.
