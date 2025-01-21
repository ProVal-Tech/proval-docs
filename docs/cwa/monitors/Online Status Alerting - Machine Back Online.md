---
id: '76fa2909-0cc0-4f76-82a0-c067660d52ac'
title: 'Online Status Alerting - Machine Back Online'
title_meta: 'Online Status Alerting - Machine Back Online'
keywords: ['monitor', 'alerting', 'ticket', 'email', 'status']
description: 'This document outlines the objectives and dependencies for the Online Status Alerting Autofix script, which triggers updates to tickets and sends emails when a machine comes back online. It details the necessary components and templates required for effective monitoring.'
tags: ['email']
draft: false
unlisted: false
---

## Summary

The objective of this monitor is to run the script [Online Status Alerting - Autofix - Update Ticket + Email [EDF]](<../scripts/Online Status Alerting - Autofix - Update Ticket + Email EDF.md>) once a machine comes back online and has either the Ticket ID filled in the EDF "Online Alert Ticket ID" or the Email ID filled in the EDF "Online Alert E-mail".

## Dependencies

- [CWM - Automate - Script - Online Status Alerting - Update EDFs [Param]](<../scripts/Online Status Alerting - Update EDFs Param.md>)
- Alert Template: △ Custom - Autofix - Online Status Alerting

## Target

Global



