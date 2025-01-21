---
id: '35a03717-5ade-46fb-b396-10a277043788'
title: 'New Domain Admins Alert'
title_meta: 'New Domain Admins Alert'
keywords: ['domain', 'admin', 'alert', 'monitoring', 'security']
description: 'This document outlines a solution to monitor for newly created or promoted domain admins within an Active Directory environment and generate alerts accordingly. It includes associated content and implementation steps to ensure proper setup and functionality.'
tags: ['active-directory', 'security', 'setup']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to monitor for newly created or promoted domain admins and generate alerts.

## Associated Content

| Content | Type | Function |
|---------|------|----------|
| [Machine Group - Domain Controllers](<../cwrmm/groups/Domain Controllers.md>) | Group | Stores the Domain Controllers in a single place. |
| [Custom Field - Is Primary Domain Controller](<../cwrmm/custom-fields/Is Primary Domain Controller.md>) | Custom Field | Used to determine whether a Domain Controller is an infrastructure master or not. |
| [Task - Validate Primary Domain Controller](<../cwrmm/tasks/Validate Primary Domain Controller.md>) | Task | Validates whether a computer is an infrastructure master or not and updates the custom field [Is Primary Domain Controller](<../cwrmm/custom-fields/Is Primary Domain Controller.md>). |
| [Machine Group - Infrastructure Master](<../cwrmm/groups/Infrastructure Master.md>) | Group | Stores all the available infrastructure masters in a single place. |
| [Custom Field - New Domain Admins](https://proval.itglue.com/DOC-5078775-14033362) | Custom Field | Stores the information of the new domain admins returned by the [New Domain Admins](https://proval.itglue.com/DOC-5078775-14033424) task. |
| [Task - New Domain Admins](https://proval.itglue.com/DOC-5078775-14033424) | Task | Checks and returns the newly detected domain admin(s) since the previous execution of the task. |

## Implementation

- Read all the associated documents carefully.
- Create the custom field: [Is Primary Domain Controller](<../cwrmm/custom-fields/Is Primary Domain Controller.md>).
- Create the Machine Group: [Domain Controllers](<../cwrmm/groups/Domain Controllers.md>).
- Create the task: [Validate Primary Domain Controller](<../cwrmm/tasks/Validate Primary Domain Controller.md>).
- Create the deployment schedule as described in this document: [Validate Primary Domain Controller](<../cwrmm/tasks/Validate Primary Domain Controller.md>).
- Create the custom field: [New Domain Admins](https://proval.itglue.com/DOC-5078775-14033362).
- Create the Machine Group: [Infrastructure Master](<../cwrmm/groups/Infrastructure Master.md>).
- Create the task: [New Domain Admins](https://proval.itglue.com/DOC-5078775-14033424).
- Create the deployment schedule as described in this document: [New Domain Admins](https://proval.itglue.com/DOC-5078775-14033424).
