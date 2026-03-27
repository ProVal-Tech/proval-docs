---
id: '35a03717-5ade-46fb-b396-10a277043788'
slug: /35a03717-5ade-46fb-b396-10a277043788
title: 'New Domain Admins'
title_meta: 'New Domain Admins'
keywords: ['domain', 'admin', 'alert', 'monitoring', 'security']
description: 'This document outlines a solution to monitor for newly created or promoted domain admins within an Active Directory environment and generate alerts accordingly. It includes associated content and implementation steps to ensure proper setup and functionality.'
tags: ['active-directory', 'security', 'setup']
draft: false
unlisted: false
last_update:
  date: 2026-03-27
---

## Purpose

The purpose of this solution is to monitor for newly created or promoted domain admins and generate alerts.

## Associated Content

| Content | Type | Function |
|---------|------|----------|
| [Machine Group - Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68) | Group | Stores the Domain Controllers in a single place. |
| [Custom Field - Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae) | Custom Field | Used to determine whether a Domain Controller is an infrastructure master or not. |
| [Task - Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168) | Task | Validates whether a computer is an infrastructure master or not and updates the custom field [Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae). |
| [Machine Group - Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8) | Group | Stores all the available infrastructure masters in a single place. |
| [Monitor - New Domain Admin](/docs/ecdcdcfa-d6b9-45fb-bace-6baf325f6010) | Monitor | The monitor set will generate an alert for the infrastructure master when a new domain admin is detected. |

## Implementation

- Read all the associated documents carefully.
- Create the custom field: [Is Primary Domain Controller](/docs/b6a7c804-693c-4cf5-a60e-61dcb10ddcae).
- Create the Machine Group: [Domain Controllers](/docs/eeeb4ee0-d683-44fd-81cf-7f8872b71c68).
- Create the task: [Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168).
- Create the deployment schedule as described in this document: [Validate Primary Domain Controller](/docs/7bc6ac21-322d-4630-836f-f00e93b94168).
- Create the monitor: [New Domain Admin](/docs/ecdcdcfa-d6b9-45fb-bace-6baf325f6010)
- Create the Machine Group: [Infrastructure Master](/docs/c2c2d22b-f735-4ec5-91a6-a014ab2e84a8).

## Changelog

### 2026-03-27

- Retired the "New Domain Admins" custom field.
- Retired the "New Domain Admins" task.
- Added a new "New Domain Admins" monitor.
- Shifted monitoring from the task to the monitor because the task was creating irrelevant tickets.

### 2025-04-10

- Initial version of the document
