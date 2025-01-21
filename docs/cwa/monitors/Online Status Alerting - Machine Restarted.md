---
id: 'b2fbe440-9d16-41ae-bd52-14037790697f'
title: 'Online Status Alerting - Autofix'
title_meta: 'Online Status Alerting - Autofix - Update Ticket + Email'
keywords: ['monitor', 'alerting', 'ticket', 'email', 'status']
description: 'This document outlines the procedure for a monitor that triggers the Online Status Alerting - Autofix script when a machine comes back online after a restart, ensuring that the appropriate Ticket ID or Email ID is utilized from the EDF settings for notifications.'
tags: ['email']
draft: false
unlisted: false
---

## Summary

The objective of this monitor is to run the script [Online Status Alerting - Autofix - Update Ticket + Email [EDF]](<../scripts/Online Status Alerting - Autofix - Update Ticket + Email EDF.md>) once a machine comes back online after a restart and has either a Ticket ID filled in the EDF "Online Alert Ticket ID" or an Email ID filled in the EDF "Online Alert E-mail".

## Dependencies

- [CWM - Automate - Script - Online Status Alerting - Update EDFs [Param]](<../scripts/Online Status Alerting - Update EDFs Param.md>)
- Alert Template: △ Custom - Autofix - Online Status Alerting
- [CWM - Internal Monitor - Online Status Alerting - Machine Back Online](<./Online Status Alerting - Machine Back Online.md>)

## Target

Global
