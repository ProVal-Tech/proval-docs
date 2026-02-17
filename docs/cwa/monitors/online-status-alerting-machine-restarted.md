---
id: 'b2fbe440-9d16-41ae-bd52-14037790697f'
slug: /b2fbe440-9d16-41ae-bd52-14037790697f
title: 'Online Status Alerting - Machine Restarted'
title_meta: 'Online Status Alerting - Machine Restarted'
keywords: ['monitor', 'alerting', 'ticket', 'email', 'status']
description: 'This document outlines the procedure for a monitor that triggers the Online Status Alerting - Autofix script when a machine comes back online after a restart, ensuring that the appropriate Ticket ID or Email ID is utilized from the EDF settings for notifications.'
tags: ['email']
draft: false
unlisted: false
---

## Summary

The objective of this monitor is to run the script [Online Status Alerting - Autofix - Update Ticket + Email [EDF]](/docs/71b6a39c-0d61-4959-8f1e-69b1cc84d182) once a machine comes back online after a restart and has either a Ticket ID filled in the EDF "Online Alert Ticket ID" or an Email ID filled in the EDF "Online Alert E-mail".

## Dependencies

- Alert Template: `△ Custom - Autofix - Online Status Alerting`
- [Solution - Online Status Alerting](/docs/a8e69e42-afde-4300-9665-9c1148c8f85e)


## Target

Global