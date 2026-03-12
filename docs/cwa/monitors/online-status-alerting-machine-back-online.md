---
id: '76fa2909-0cc0-4f76-82a0-c067660d52ac'
slug: /76fa2909-0cc0-4f76-82a0-c067660d52ac
title: 'Online Status Alerting - Machine Back Online'
title_meta: 'Online Status Alerting - Machine Back Online'
keywords: ['monitor', 'alerting', 'ticket', 'email', 'status']
description: 'This document outlines the objectives and dependencies for the Online Status Alerting Autofix script, which triggers updates to tickets and sends emails when a machine comes back online. It details the necessary components and templates required for effective monitoring.'
tags: ['email']
draft: false
unlisted: false
last_update:
  date: 2026-02-17
---

## Summary

The objective of this monitor is to run the script [Online Status Alerting - Autofix - Update Ticket + Email [EDF]](/docs/71b6a39c-0d61-4959-8f1e-69b1cc84d182) once a machine comes back online and has either the Ticket ID filled in the EDF "Online Alert Ticket ID" or the Email ID filled in the EDF "Online Alert E-mail".

## Dependencies

- Alert Template: `△ Custom - Autofix - Online Status Alerting`
- [Solution - Online Status Alerting](/docs/a8e69e42-afde-4300-9665-9c1148c8f85e)


## Target

Global

## Changelog

### 2025-04-10

- Initial version of the document
